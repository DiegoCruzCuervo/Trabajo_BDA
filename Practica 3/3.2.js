// 1 -------------------------------------------------------------------

db.listing.insertMany([{
      "_id" : "100824220",
      "listing_url" : "https://www.airbnb.com/rooms/100824220",
      "name" : "Nice room in Madrid Center",
      "summary" : "Hi!  Cozy double bed room in amazing flat next to Plaza Mayor Joan and to metro stop Sol. Flat located in the center of the city.",
      "space" : "Nice flat in the central neighboorhood of Madrid.",
      "description" : "Cozy double bed room in amazing flat next to Plaza Mayor Joan and to metro stop Sol. Flat located in the center of the city.",
      "neighborhood_overview" : "Centro",
      "notes" : "",
      "transit" : "",
      "access" : "Ideal couple or 2 friends.",
      "interaction" : "",
      "house_rules" : "",
      "property_type" : "Apartment",
      "room_type" : "Private room",
      "bed_type" : "Real Bed",
      "minimum_nights" : "1",
      "maximum_nights" : "9",
      "cancellation_policy" : "flexible",
      "last_scraped" : ISODate("2022-03-08T05:00:00.000Z"),
      "calendar_last_scraped" : ISODate("2022-03-08T05:00:00.000Z"),
      "accommodates" : 2,
      "bedrooms" : 1,
      "beds" : 2,
      "number_of_reviews" : 0,
      "bathrooms" : NumberDecimal("1.0"),
      "amenities" : [
          "Internet",
          "Wifi",
          "Kitchen",
          "Elevator",
          "Heating",
          "Washer",
          "Shampoo",
          "Hair dryer",
          "Iron",
          "Laptop friendly workspace"
      ],
      "price" : NumberDecimal("50.00"),
      "security_deposit" : NumberDecimal("100.00"),
      "cleaning_fee" : NumberDecimal("10.00"),
      "extra_people" : NumberDecimal("0.00"),
      "guests_included" : NumberDecimal("1"),
      "images" : {
          "thumbnail_url" : "",
          "medium_url" : "",
          "picture_url" : "",
          "xl_picture_url" : ""
      },
      "host" : {
          "host_id" : "30393403",
          "host_url" : "https://www.airbnb.com/users/show/30393403",
          "host_name" : "Ana",
          "host_location" : "Barcelona, Catalonia, Spain",
          "host_about" : "I'm Anna, italian. I'm 28, friendly and easygoing.  I love travelling, reading, dancing tango. Can wait to meet new people! :)",
          "host_thumbnail_url" : "https://a0.muscache.com/im/users/30393403/profile_pic/1427876639/original.jpg?aki_policy=profile_small",
          "host_picture_url" : "https://a0.muscache.com/im/users/30393403/profile_pic/1427876639/original.jpg?aki_policy=profile_x_medium",
          "host_neighbourhood" : "Dreta de l'Eixample",
          "host_is_superhost" : false,
          "host_has_profile_pic" : true,
          "host_identity_verified" : false,
          "host_listings_count" : 1,
          "host_total_listings_count" : 1,
          "host_verifications" : [
              "phone",
              "facebook"
          ]
      },
      "address" : {
          "street" : "Madrid, Madrid, Spain",
          "suburb" : "Centro",
          "government_area" : "Distrito Centro",
          "market" : "Madrid",
          "country" : "Spain",
          "country_code" : "ES",
          "location" : {
              "type" : "Point",
              "coordinates" : [
                  -3.703889,
                  40.416667
              ],
              "is_location_exact" : false
          }
      },
      "availability" : {
          "availability_30" : 0,
          "availability_60" : 0,
          "availability_90" : 0,
          "availability_365" : 0
      },
      "review_scores" : {},
      "reviews" : []
  }, {
      "_id" : "111111111",
      "listing_url" : "https://www.airbnb.com/rooms/100824220",
      "name" : "Nice room in Madrid Center",
      "room_type" : "Private room",
      "bed_type" : "Real Bed",
      "minimum_nights" : "1",
      "maximum_nights" : "9",
      "beds" : NumberDecimal("2.00"),
      "price" : NumberDecimal("50.00"),
      "review_scores" : {},
      "reviews" : []
  }
])

db.listing.find({ "_id": "111111111" })

// 2 -------------------------------------------------------------------

// 2.1
db.createCollection("paciente", {
    "bsonType": "object",
    "validator": {
        $jsonSchema: {
            "title": "Pacientes",
            "required": [ "nombre", "edad", "especialidad", "diagnostico" ]
        }
    }    
})

// 2.2
db.paciente.insert({ "nombre": "test", "edad": 2, "especialidad": "general" })

// 2.3
db.paciente.insert({ "nombre": "test", "edad": 2, "especialidad": "general", "diagnostico": "test" })

// 2.4

//db.paciente.find()
db.paciente.runCommand({
    "collMod": "paciente",
    "validator": {
        $jsonSchema: {
            "bsonType": "object",
            "title": "Pacientes",
            "required": [ "nombre", "edad", "especialidad", "diagnostico" ],
            "properties": {
                "nombre": {
                    "bsonType": "string",
                    "minLength": 1,
                    "description": "No puede ser nulo y es un string"
                },
                "edad": {
                    "bsonType": "int",
                    "minimum": 0,
                    "maximum": 120,
                    "description": "Integer entre 0 y 120"
                },
                "especialidad": {
                    "bsonType": "string",
                    "enum": ["general", "pediatria", "neurologia"],
                    "description": "Puede ser o general o pediatria o neurologia"
                },
                "nif": {
                    "bsonType": "string",
                    "pattern": "^\\d{8}[A-Z]$"
                }
            }
        }
    }    
})

// 2.5
db.paciente.insert({ "nombre": "test 2", "edad": 220, "especialidad": "general", "diagnostico": "idk seems fine" })

// 2.6
db.paciente.insert({ "nombre": "test 2", "edad": 20, "especialidad": "general", "diagnostico": "idk seems fine", "nif": "01234567A" })


// 3 -------------------------------------------------------------------

db.createCollection("calidadAire", {
    "timeseries": {
        "timeField": "time",
        "metaField": "stationName",
        "granularity": "hours"
    }
})

db.calidadAire.insertMany([{
    "id": "BEI001",
    "cityName": "Beijing",
    "stationName": "Dongcheng",
    "localName": "东城东四",
    "latitude": 39.929,
    "longitude": 116.417,
    "time": ISODate("2023-05-03T23:00:00.000Z"),
    "pollutants": [
      {
        "pol": "PM2.5",
        "unit": "mg/m3",
        "value": 18.7,
        "averaging": "1 hour"
      },
      {
        "pol": "Ozone",
        "unit": "ppb",
        "value": 12.1,
        "averaging": "1 hour"
      }
    ]
  },
  {
    "id": "BEI002",
    "cityName": "Beijing",
    "stationName": "WestPark",
    "localName": "西城官园",
    "latitude": 39.929,
    "longitude": 116.417,
    "time": ISODate("2023-05-03T18:00:00.000Z"),
    "pollutants": [
      {
        "pol": "PM10",
        "unit": "mg/m3",
        "value": 18.7,
        "averaging": "1 hour"
      },
      {
        "pol": "Humidity",
        "unit": "%",
        "value": 88.8,
        "averaging": "1 hour"
      }
    ]
  }
])

db.calidadAire.aggregate([{
    $match: {
        "time": ISODate("2023-05-03T18:00:00.000Z"),
        "pollutants.pol": "Humidity"
    }}, {
    $project: {
        "stationName": 1,
        "cityName"   : 1,
        "localName"  : 1,
        "id"         : 1,
        "latitude"   : 1,
        "longitude"  : 1,
        "time"       : 1,
        "pollutants": {
            $filter: {
                "input": "$pollutants",
                "as": "pollutants",
                "cond": { $eq: [ "$$pollutants.pol", "Humidity" ] }
            }
        }
    }
}])
