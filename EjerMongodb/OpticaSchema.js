// Para incorporar los schemas en collection con Mongosh

// schema customers
db.createCollection("customers", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["name", "telephone"], // campos obligatorios a rellenar
      properties: {
        // _id: { bsonType: "objectId"},  // NO se pone porque mongoDB lo genera automaticamente
        name: { bsonType: "string" },
        address: { bsonType: "string" },
        telephone: { bsonType: "string" },
        email: { bsonType: "string" },
        Register_date: { bsonType: "date" },
      },
    },
  },
});

// schema glasses
db.createCollection("glasses", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [
        "brand",
        "graduacion_L",
        "graduacion_R",
        "montura",
        "precio",
        "provider",
      ],
      properties: {
        brand: { bsonType: "string" },
        graduation_L: { bsonType: "string" },
        graduation_R: { bsonType: "string" },
        glass_color_L: { bsonType: "string" },
        glass_color_R: { bsonType: "string" },
        frame_type: { bsonType: "string" },
        provider: { bsonType: "string" },
        price: { bsonType: "number" },
      },
    },
  },
});


// schema providers
db.createCollection("providers", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["name", "nif"],
      properties: {
        name: { bsonType: "string" },
        adress: {
          bsonType: "object",
          properties: {
            street: { bsonType: "string" },
            num: { bsonType: "string" },
            floor: { bsonType: "string" },
            door: { bsonType: "string" },
            city: { bsonType: "string" },
            cp: { bsonType: "string" },
            country: { bsonType: "string" },
          },
        },
        telephone: { bsonType: "string" },
        email: { bsonType: "string" },
        nif: { bsonType: "string" },
      },
    },
  },
});

db.createCollection("employee", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["name", "nif"],
      properties: {
        name: { bsonType: "string" },
        nif: { bsonType: "string" },
      },
    },
  },
});

db.createCollection("sales", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["id_customer", "id_glasses", "register_date"],
      properties: {
        id_customer: { bsonType: "objectId" },
        id_glasses: { bsonType: "objectId" },
        id_employee: { bsonType: "objectId" },
        register_date: { bsonType: "date" },
      },
    },
  },
});