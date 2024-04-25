async function cargarUsuarios() {
  const response = await fetch("http://localhost:3000/usuarios");
  const usuarios = await response.json();

  const cuerpoTablaUsuarios = document.getElementById("cuerpoTablaUsuarios");
  cuerpoTablaUsuarios.innerHTML = "";

  usuarios.forEach((usuario) => {
    const fila = document.createElement("tr");
    fila.innerHTML = `
            <td>${usuario._id}</td>
            <td>${usuario.nombre}</td>
            <td>${usuario.edad}</td>
            <td>${usuario.correo}</td>
            <td>${usuario.carrera}</td>
          `;
    cuerpoTablaUsuarios.appendChild(fila);
  });
}

document
  .getElementById("formulario")
  .addEventListener("submit", async function (event) {
    event.preventDefault();
    const nombre = document.getElementById("nombre").value;
    const edad = document.getElementById("edad").value;
    const correo = document.getElementById("correo").value;
    const carrera = document.getElementById("carrera").value;

    const response = await fetch("http://localhost:3000/usuarios", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ nombre, edad, correo, carrera }),
    });

    const data = await response.json();
    console.log("Usuario creado:", data);

    // Limpiar el formulario después de la creación exitosa
    document.getElementById("formulario").reset();

    // Cargar usuarios automáticamente después de agregar uno nuevo
    await cargarUsuarios();
  });

// Cargar usuarios automáticamente al cargar la página
cargarUsuarios();

// Cargar usuarios de PostgreSQL
async function cargarUsuariosPostgres() {
  try {
    const response = await fetch("http://localhost:3000/usuarios/postgres");
    const usuarios = await response.json();

    const cuerpoTablaUsuariosPostgres = document.getElementById(
      "cuerpoTablaUsuariosPostgres"
    );
    cuerpoTablaUsuariosPostgres.innerHTML = "";

    usuarios.forEach((usuario) => {
      const fila = document.createElement("tr");
      fila.innerHTML = `
          <td>${usuario.id}</td>
          <td>${usuario.nombre}</td>
          <td>${usuario.edad}</td>
          <td>${usuario.correo}</td>
          <td>${usuario.carrera}</td>
        `;
      cuerpoTablaUsuariosPostgres.appendChild(fila);
    });
  } catch (err) {
    console.error("Error al cargar usuarios de PostgreSQL:", err);
  }
}

// Llamar a la función para cargar usuarios de PostgreSQL automáticamente al cargar la página
cargarUsuariosPostgres();

document
  .getElementById("btnSincronizar")
  .addEventListener("click", async function () {
    try {
      const response = await fetch("http://localhost:3000/sincronizar", {
        method: "POST",
      });
      const data = await response.json();
      console.log(data.message); // Mensaje de éxito de sincronización
      // Volver a cargar los usuarios de PostgreSQL después de la sincronización
      await cargarUsuariosPostgres();
    } catch (error) {
      console.error("Error al sincronizar usuarios:", error);
    }
  });
