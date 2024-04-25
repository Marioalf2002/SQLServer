const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres", // Cambia por tu usuario en PostgreSQL
  host: "localhost", // Cambia por el host de tu base de datos en PostgreSQL
  database: "Usuarios", // Nombre de tu base de datos en PostgreSQL
  password: "*******", // Contraseña de tu usuario en PostgreSQL
  port: 5432,
});

module.exports = pool;
