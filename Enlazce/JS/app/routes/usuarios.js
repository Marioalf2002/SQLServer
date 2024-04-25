const express = require("express");
const router = express.Router();
const Usuario = require("../models/usuario");
const pool = require("../db");

// Ruta para obtener todos los usuarios de MongoDB
router.get("/", async (req, res) => {
  try {
    const usuarios = await Usuario.find();
    res.json(usuarios);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

// Ruta para crear un nuevo usuario en MongoDB
router.post("/", async (req, res) => {
  const usuario = new Usuario({
    nombre: req.body.nombre,
    edad: req.body.edad,
    correo: req.body.correo,
    carrera: req.body.carrera,
  });

  try {
    const nuevoUsuario = await usuario.save();
    res.status(201).json(nuevoUsuario);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

// Ruta para obtener todos los usuarios de PostgreSQL
router.get("/postgres", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM users");
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;
