/* global use, db */
// MongoDB Playground
// To disable this template go to Settings | MongoDB | Use Default Template For Playground.
// Make sure you are connected to enable completions and to be able to run a playground.
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.
// The result of the last command run in a playground is shown on the results panel.
// By default the first 20 documents will be returned with a cursor.
// Use 'console.log()' to print to the debug output.
// For more documentation on playgrounds please refer to
// https://www.mongodb.com/docs/mongodb-vscode/playgrounds/

// Select the database to use.
use('restaurantes');

// Run a find command to view items sold on April 4th, 2014.
/*const salesOnApril4th = db.getCollection('sales').find({
  date: { $gte: new Date('2014-04-04'), $lt: new Date('2014-04-05') }
}).count();*/

// Print a message to the output window.
console.log('hola');




//1.Escriu una consulta per mostrar tots els 
//documents en la col·lecció Restaurants."
//db.sales.find()

//2.Escriu una consulta per mostrar el restaurant_id, name, borough i 
//cuisine de tots els documents en la col·lecció Restaurants.
// db.sales.find({},{
//   restaurant_id: true,
//   name: true,
//   borough: true,
//   cuisine: true
// })

// 3.Escriu una consulta per mostrar el restaurant_id, name, 
//borough i cuisine, però excloent el camp _id per 
//tots els documents en la col·lecció Restaurants.
//  db.sales.find({},{
//   _id: false, 
//   restaurant_id: true,
//    name: true,
//    borough: true,
//    cuisine: true
//  })

// 4.Escriu una consulta per mostrar restaurant_id, name, 
//borough i zip code, però excloent el camp _id per 
//tots els documents en la col·lecció Restaurants.
// db.sales.find({},{
//   _id: false, 
//   restaurant_id: true,
//    name: true,
//    borough: true,
//    zip: true
//  })

// 5.Escriu una consulta per mostrar tots els restaurants 
//que estan en el Bronx.
// db.sales.find({
//   borough: "Bronx"
//  })

// 6.Escriu una consulta per mostrar els primers 5 restaurants 
//que estan en el Bronx.
//  db.sales.find({
//    borough: "Bronx"
//   }).limit(5)

// 7.Escriu una consulta per mostrar els 5 restaurants 
//després de saltar els primers 5 que siguin del Bronx.
// db.sales.find({
//   borough: "Bronx"
//  }).skip(5).limit(5)

// 8.Escriu una consulta per trobar els restaurants que 
//tenen algun score més gran de 90.
//  db.sales.find(
//    { "grades.score": { $gte: 90 }}
//  )

// 9.Escriu una consulta per trobar els 
//restaurants que tenen un score més gran que 80 però menys que 100.
// db.sales.find({
//   "$and": [{"grades.score": { $gt: 80}}, {"grades.score": { $lt: 100}}]
// })

// Escriu una consulta per trobar els restaurants que 
//estan situats en una longitud inferior a -95.754168.
// db.sales.find({
//   "address.coord": { $gt: -95.754168}
// })

// 10.Escriu una consulta de MongoDB per a trobar els restaurants 
//que no cuinen menjar 'American ' i tenen algun score superior 
//a 70 i longitud inferior a -65.754168.
// db.sales.find({
//   "$and": [
//     {"cuisine": {$eq: "American"}},
//     {"grades.score": { $gt: 70}}, 
//     {"address.coord": { $gt: -65.754168}}
//   ]
// })

// 11.Escriu una consulta per trobar els restaurants 
//que no preparen menjar 'American' i tenen algun score 
//superior a 70 i que, a més, es localitzen en longituds
// inferiors a -65.754168. Nota: Fes aquesta consulta 
//sense utilitzar operador $and.
// db.sales.find(
//   { "cuisine": "American", 
//     "grades.score": { $gt: 70 },
//     "address.coord": { $lt: -65.754168}  
//   }
// )

// 12.Escriu una consulta per trobar els 
//restaurants que no preparen menjar 'American ', 
//tenen alguna nota 'A' i no pertanyen a Brooklyn. 
//S'ha de mostrar el document segons la cuisine en ordre descendent.
// db.sales.find({ 
//   "cuisine": { $not: { $regex: "^American.*" }},
//   "grades.grade": { $regex: "A" },
//   "borough": { $not: { $regex: "^Brooklyn.*" }},
// })

// 13.Escriu una consulta per trobar el restaurant_id, 
//name, borough i cuisine per a aquells restaurants 
//que contenen 'Wil' en les tres primeres lletres en el seu nom.
// db.sales.find({ 
//  "name":  { $regex: "^Wil.*" }
// },{
//   "restaurant_id": true,
//   "name": true,
//   "borough": true,
//   "cuisine": true,
// })

// 14.Escriu una consulta per trobar el restaurant_id, 
//name, borough i cuisine per a aquells restaurants 
//que contenen 'ces' en les últimes tres lletres en el seu nom.
// db.sales.find({ 
//  "name":  { $regex: "ces$" }
// },{
//   "restaurant_id": true,
//   "name": true,
//   "borough": true,
//   "cuisine": true,
// })

// 15.Escriu una consulta per trobar el restaurant_id, 
//name, borough i cuisine per a aquells restaurants 
//que contenen 'Reg' en qualsevol lloc del seu nom.
// db.sales.find({ 
//   "name":  { $regex: "Reg" }
//  },{
//    "restaurant_id": true,
//    "name": true,
//    "borough": true,
//    "cuisine": true,
//  })

// 16.Escriu una consulta per trobar els restaurants 
//que pertanyen al Bronx i preparen plats Americans o xinesos.
// db.sales.find({ 
//    $or: [ { cuisine: "American" }, { cuisine: "Chinese" }],
//    "borough": "Bronx"
// })

// 17.Escriu una consulta per trobar el restaurant_id, 
//name, borough i cuisine per aquells restaurants 
//que pertanyen a Staten Island, Queens, Bronx o Brooklyn.
// db.sales.find({ 
//   $or: [{ borough: "Staten Island" }, 
//   { borough: "Queens" }, 
//   { borough: "Bronx" }, 
//   { borough: "Brooklyn" }]
//  },{
//    "_id": false,
//    "restaurant_id": true,
//    "name": true,
//    "borough": true,
//    "cuisine": true,
//  })

// 18.Escriu una consulta per trobar el restaurant_id, 
//name, borough i cuisine per a aquells restaurants 
//que NO pertanyen a Staten Island, Queens, Bronx o Brooklyn.
// db.sales.find({ 
//   $and: [{"borough": { $not: { $regex: "Staten Island" }}},
//   {"borough": { $not: { $regex: "Queens" }}}, 
//   {"borough": { $not: { $regex: "Bronx" }}}, 
//   {"borough": { $not: { $regex: "Brooklyn" }}}]
//  },{
//    "_id": false,
//    "restaurant_id": true,
//    "name": true,
//    "borough": true,
//    "cuisine": true,
//  })

// 19.Escriu una consulta per trobar el restaurant_id, 
//name, borough i cuisine per a aquells restaurants 
//que aconsegueixin una nota menor que 10.
// db.sales.find({ 
//   "grades.score": { $lt: 10 }
//  },{
//    "_id": false,
//    "restaurant_id": true,
//    "name": true,
//    "borough": true,
//    "cuisine": true,
//  })

// 20.Escriu una consulta per trobar el restaurant_id, 
//name, borough i cuisine per a aquells restaurants 
//que preparen marisc ('seafood') excepte si 
//són 'American ', 'Chinese' o el name del restaurant 
//comença amb lletres 'Wil'.
// db.sales.find({ 
//   $or: [
//     { cuisine: "Seafood" }, 
//     { cuisine: "American" }, 
//     { cuisine: "Chinese" },
//     { name: { $regex: "^Wil.*" }}
//   ]
//  },{
//    "_id": false,
//    "restaurant_id": true,
//    "name": true,
//    "borough": true,
//    "cuisine": true,
//  })

// 21.Escriu una consulta per trobar el restaurant_id, 
//name i grades per a aquells restaurants que aconsegueixin 
//un grade de "A" i un score d'11 amb un ISODate "2014-08-11T00:00:00Z".
db.sales.find({
  "grades": {
    "$elemMatch": {
      "grades.date": {"$eq": ISODate("2014-08-11T00:00:00.000Z")}
    }
  }
 },{
   "_id": false,
   "restaurant_id": true,
   "name": true,
   "grades": true
 })

// Escriu una consulta per trobar el restaurant_id, name i grades per a aquells restaurants on el 2n element de l'array de graus conté un grade de "A" i un score 9 amb un ISODate "2014-08-11T00:00:00Z".
// Escriu una consulta per trobar el restaurant_id, name, adreça i ubicació geogràfica per a aquells restaurants on el segon element de l'array coord conté un valor entre 42 i 52.
// Escriu una consulta per organitzar els restaurants per nom en ordre ascendent.
// Escriu una consulta per organitzar els restaurants per nom en ordre descendent.
// Escriu una consulta per organitzar els restaurants pel nom de la cuisine en ordre ascendent i pel barri en ordre descendent.
// Escriu una consulta per saber si les direccions contenen el carrer.
// Escriu una consulta que seleccioni tots els documents en la col·lecció de restaurants on els valors del camp coord és de tipus Double.
// Escriu una consulta que seleccioni el restaurant_id, name i grade per a aquells restaurants que retornen 0 com a residu després de dividir algun dels seus score per 7.
// Escriu una consulta per trobar el name de restaurant, borough, longitud, latitud i cuisine per a aquells restaurants que contenen 'mon' en algun lloc del seu name.
// Escriu una consulta per trobar el name de restaurant, borough, longitud, latitud i cuisine per a aquells restaurants que contenen 'Mad' com a primeres tres lletres del seu name.

