<%-- 
    Document   : index
    Created on : 23 ene. 2025, 20:46:19
    Author     : satel
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Turnero - Gestión de Turnos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="my-4">Gestión de Turnos</h2>

        <!-- Formulario para agregar un nuevo turno -->
        <h3>Agregar Nuevo Turno</h3>
        <form action="AgregarTurnoSv" method="POST">
            <div class="form-group">
                <label for="fecha">Fecha y Hora:</label>
                <input type="datetime-local" class="form-control" id="fecha" name="fecha" required>
            </div>
            <div class="form-group">
                <label for="estado">Estado:</label>
                <select class="form-control" id="estado" name="estado" required>
                    <option value="En espera">En espera</option>
                    <option value="Ya atendido">Ya atendido</option>
                </select>
            </div>
            <div class="form-group">
                <label for="ciudadano">Ciudadano:</label>
                <select class="form-control" id="ciudadano" name="ciudadano_id" required>
                    <c:forEach var="ciudadano" items="${listaCiudadanos}">
                        <option value="${ciudadano.id}">${ciudadano.nombre} ${ciudadano.apellido}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="tramite">Trámite:</label>
                <select class="form-control" id="tramite" name="tramite_id" required>
                    <c:forEach var="tramite" items="${listaTramites}">
                        <option value="${tramite.id}">${tramite.nombre}</option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Agregar Turno</button>
        </form>

        <!-- Filtro de turnos por estado -->
        <h3 class="my-4">Filtrar Turnos</h3>
        <form action="FiltrarTurnoSv" method="GET">
            <div class="form-group">
                <label for="estadoFiltro">Seleccionar Estado:</label>
                <select class="form-control" id="estadoFiltro" name="estado" required>
                    <option value="En espera">En espera</option>
                    <option value="Ya atendido">Ya atendido</option>
                </select>
            </div>
            <button type="submit" class="btn btn-secondary">Filtrar</button>
        </form>

        <!-- Mostrar la lista de turnos -->
        <h3 class="my-4">Lista de Turnos</h3>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Fecha</th>
                    <th>Estado</th>
                    <th>Ciudadano</th>
                    <th>Trámite</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="turno" items="${listaTurnos}">
                    <tr>
                        <td>${turno.id}</td>
                        <td>${turno.fecha}</td>
                        <td>${turno.estado}</td>
                        <td>${turno.ciudadano.nombre} ${turno.ciudadano.apellido}</td>
                        <td>${turno.tramite.nombre}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
