// 1 ---------------------------------------------------------------------
// La plataforma Airbnb ha decidido notificar a los propietarios con más de 5 casas de abrir
// una actividad comercial turística. Para ellos en necesario una comprobación de todas las bases de
// datos de la plataforma (en nuestro caso solo la collection listing). Guardar el resultado en otra
// colección.


// 1.a Implementar una función map Reduce que devuelva la suma de las casas que tiene cada
//     propietario

db.listing.mapReduce(
    function() { print(1); emit(this.host.host_id, 1); },
    function(key, values) { return Array.sum(values); },
    {
        out: "houseN"
    }
)

db.houseN.find()

// 1.b Implementar la misma búsqueda con aggregate pipeline

db.listing.aggregate(
    { $group: { _id: "$host.host_id", "houseN": { $sum: 1 } } }
)

// 2 ---------------------------------------------------------------------

// 2.c Buscar casas que tengan más de 5 revisiones utilizando aggregate

db.listing.aggregate(
    { $match: { "number_of_reviews": { $gt: 5 } } }
)

// 2.d Buscar casas que tengan más de 5 revisiones utilizando $expr

db.listing.find({
    $expr: { $gt: ["$number_of_reviews", 5] }
})

// 2.e Buscar casas que tengan más de 5 revisiones utilizando $where

db.listing.find({
    $where: "this.number_of_reviews > 5"
})

db.listing.find()

// 3 ---------------------------------------------------------------------

// 3.f Mostrar el número medio de camas que hay en cada market (campo address.market) de los
//     Estados Unidos (US). Ignorar aquellos alojamientos cuyo market sea vacio

db.listing.aggregate([
    { $match: { "address.country_code": "US", "address.market": { $ne: "" } } },
    { $group: { _id: "$address.market", "avg_beds": { $avg: "$beds" } } }
])

// 3.g Mostrar el precio medio de un alojamiento por pais y market. Ignorar aquellos alojamientos
//     cuyo market sea vacio y mostrar los resultados ordenados por pais y market de manera
//     alfabética

db.listing.aggregate([
    { $match: {
        "address.market": { $ne: "" }
    }},
    { $group: {
        _id: { "market": "$address.market", "country": "$address.country_code" },
        "avg_beds": { $avg: "$beds" }
    }},
    { $project: {
        "_id": 0,
        "market": "$_id.market",
        "country_code": "$_id.country",
        "avg_beds": 1
    }},
    { $sort: {
        "country_code": 1,
        "market": 1
    }}
])

// 3.h Mostrar el precio medio por país de alquilar un alojamiento que permita mascotas (debe
//     contener el amenity "Pets allowed"). Mostrar los resultados ordenados del país más caro al
//     más barato

db.listing.aggregate([
    { $match: {
        "amenities": "Pets allowed"
    }},
    { $group: {
        _id: "$address.country_code",
        "avg_price": { $avg: "$price" } }
    },
    { $sort: {
        "avg_price": 1,
    }}
])
