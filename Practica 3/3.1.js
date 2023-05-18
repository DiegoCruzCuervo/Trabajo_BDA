// a) Mostrar el id, nombre, descripción y número de camas de todos los alojamientos con más de 2 baños.

db.listing.find({
    "bathrooms": { $lt: 2 }
}, {
    "name"       : 1,
    "description": 1,
    "bedrooms"   : 1
})

// b) Mostrar el nombre, descripción y precio de todos los alojamientos con un precio entre 500 y 1000 ordenados por precio ascendente.

db.listing.find({
    "price": { $gt: 500, $lt: 1000 }
}, {
    "_id"        : 0,
    "name"       : 1,
    "description": 1,
    "price"      : 1
}).sort({
    "price": 1
});

// c) Mostrar los 10 últimos alojamientos que han recibido una reseña.

db.listing.find().sort({
    "last_review": -1
}).limit(10);

// d) Mostrar todos los alojamientos de tipo 'Earth house' o 'Treehouse'

db.listing.find({
    $or: [
        { "property_type": "Treehouse" },
        { "property_type": "Earth house" }
    ]
});

// e) Mostrar la calle, precio y el número de habitaciones de todos los alojamientos de España

db.listing.aggregate([{
    $match: {
        "address.country": "Spain"
    }}, {
    $group: {
        "_id"      : "$_id",
        "street"   : { $first: "$address.street" },
        "price"    : { $first: "$price" },
        "bathrooms": { $first: "$bathrooms" },
    }}, {
    $project: {
        "_id"      : 0,
        "street"   : 1,
        "price"    : 1,
        "bathrooms": 1
    }
}])

// f) Mostrar todos los alojamientos que entre sus comodidades (amenities) tengan Wifi y permitan mascotas

db.listing.find({
    $and: [
        { "amenities": "Wifi" },
        { "amenities": "Pets allowed" }
    ]
})

// g) Mostrar todos los alojamientos que hayan recibido al menos una reseña del usuario 20775242 durante el año 201 (6?)

db.listing.find({
    $and: [
        { "reviews.reviewer_id": "20775242" },
        { $and: [
            { "reviews.date": { $gt: new Date(2016, 1, 1) } },
            { "reviews.date": { $lt: new Date(2017, 1, 1) } }
        ]}
    ]
})

// h) Mostrar todos los alojamientos que en su descripción contengan la palabra “luminous” (tener en cuenta que puede estar en mayúscula o minúscula)

db.listing.find({
    "description": { $regex: /luminous/, $options: 'i' }
})


// i) Mostrar todos los alojamientos en los que el tipo de cama no sea ni 'Pull‐out Sofa' ni 'Futon'

db.listing.find({
    $nor: [
        { "bed_type": "Pull-out Sofa" },
        { "bed_type": "Futon" },
    ]
})

// j) Mostrar todos los alojamientos en los que el número de huéspedes que pueden alojarse sea par

db.listing.find({
    "accommodates": {
        $mod: [ 2, 0 ]
    }
})

// k) Mostrar todos los alojamientos que estén a una distancia máxima de 200m de la Sagrada familia (coordenadas 2.1743558, 41.4036299)

db.listing.createIndex({ "address.location.coordinates" : "2dsphere" })

db.listing.find({
    "address.location.coordinates": {
        $near: {
            $geometry: { "type": "Point", "coordinates": [2.1743558, 41.4036299] },
            $maxDistance: 200
        }
    }
})
 
