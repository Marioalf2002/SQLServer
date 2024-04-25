const express = require("express");
const bodyParser = require("body-parser");
const db = require("./connection");
const cors = require("cors");
const usuariosRouter = require("./routes/usuarios");
const sincronizarRouter = require("./routes/sincronizar");

const app = express();

app.use(cors());

app.use(bodyParser.json());

app.use("/usuarios", usuariosRouter);

app.use("/sincronizar", sincronizarRouter);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor iniciado en el puerto ${PORT}`);
});
