const mongoose = require("mongoose");

const usuarioSchema = new mongoose.Schema(
  {
    nombre: String,
    edad: Number,
    correo: String,
    carrera: String,
  },
  { collection: "users" }
);

module.exports = mongoose.model("Usuario", usuarioSchema);
