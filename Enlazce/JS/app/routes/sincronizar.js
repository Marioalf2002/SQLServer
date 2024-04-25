const express = require("express");
const router = express.Router();
const { Pool } = require("pg");
const mongoose = require("mongoose");
const Usuario = require("../models/usuario");
const pool = require("../db");

// Validar que el usuario no exista en PostgreSQL
async function insertarUsuario(client, usuario) {
  const query = "SELECT id FROM users WHERE id = $1";
  const { rows } = await client.query(query, [usuario._id.toString()]);
  if (rows.length === 0) {
    await client.query(
      "INSERT INTO users (id, nombre, edad, correo, carrera) VALUES ($1, $2, $3, $4, $5)",
      [
        usuario._id.toString(),
        usuario.nombre,
        usuario.edad,
        usuario.correo,
        usuario.carrera,
      ]
    );
  }
}

// Ruta para sincronizar usuarios de MongoDB a PostgreSQL
router.post("/", async (req, res) => {
  try {
    // Obtener usuarios de MongoDB
    const usuariosMongo = await Usuario.find();

    // Insertar usuarios en PostgreSQL
    await pool.connect(async (err, client, done) => {
      if (err) {
        return console.error("Error adquiriendo cliente de pool", err);
      }
      try {
        await client.query("BEGIN");
        for (const usuario of usuariosMongo) {
          await insertarUsuario(client, usuario);
        }
        await client.query("COMMIT");
        res.status(200).json({ message: "Sincronización completada" });
      } catch (e) {
        await client.query("ROLLBACK");
        throw e;
      } finally {
        done();
      }
    });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;
