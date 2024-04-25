const mongoose = require("mongoose");

mongoose.connect("mongodb://localhost:27017/Usuarios", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const db = mongoose.connection;

db.on("error", console.error.bind(console, "Error de conexión a MongoDB:"));
db.once("open", function () {
  console.log("Conectado a Exitosa");
});

module.exports = db;
