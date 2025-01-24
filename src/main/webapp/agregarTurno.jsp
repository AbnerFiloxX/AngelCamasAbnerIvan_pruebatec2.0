<%-- 
    Document   : agregarTurno
    Created on : 23 ene. 2025, 20:23:34
    Author     : satel
--%>

<%@page import="java.util.List"%>
<%@ page import="com.hackaboss.logica.ControladoraLogica" %>
<%@ page import="com.hackaboss.logica.Ciudadano" %>
<%@ page import="com.hackaboss.logica.Tramite" %>
<%@ page import="com.hackaboss.logica.Usuario" %>
<%@ page import="com.hackaboss.logica.Estado" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar Turno</title>
</head>
<body>
    <h1>Agregar Nuevo Turno</h1>
    <form action="agregarTurnoServlet" method="POST">
        
        <label for="ciudadanoId">Ciudadano:</label>
        <select name="ciudadanoId" required>
            <%
                ControladoraLogica control = new ControladoraLogica();
                List<Ciudadano> ciudadanos = control.listarCiudadanos();  // Asegúrate de que esta función existe en tu controlador
                if (ciudadanos != null && !ciudadanos.isEmpty()) {
                    for (Ciudadano ciudadano : ciudadanos) {
            %>
                <option value="<%= ciudadano.getId() %>">
                    <%= ciudadano.getNombre() + " " + ciudadano.getApellido() %>
                </option>
            <%
                    }
                } else {
            %>
                <option>No hay ciudadanos disponibles</option>
            <%
                }
            %>
        </select><br>

        <label for="tramiteId">Trámite:</label>
        <select name="tramiteId" required>
            <%
                List<Tramite> tramites = control.listarTramites();  // Asegúrate de que esta función exista en tu controlador
                if (tramites != null && !tramites.isEmpty()) {
                    for (Tramite tramite : tramites) {
            %>
                <option value="<%= tramite.getId() %>">
                    <%= tramite.getNombre() %>
                </option>
            <%
                    }
                } else {
            %>
                <option>No hay trámites disponibles</option>
            <%
                }
            %>
        </select><br>

        <label for="usuarioId">Usuario:</label>
        <select name="usuarioId" required>
            <%
                // Listar usuarios si lo necesitas
                List<Usuario> usuarios = control.listarUsuarios(); 
                if (usuarios != null && !usuarios.isEmpty()) {
                    for (Usuario usuario : usuarios) {
            %>
                <option value="<%= usuario.getId() %>">
                    <%= usuario.getNombre() %>
                </option>
            <%
                    }
                } else {
            %>
                <option>No hay usuarios disponibles</option>
            <%
                }
            %>
        </select><br>

        <label for="estado">Estado:</label>
        <select name="estado" required>
            <option value="EN_ESPERA">En Espera</option>
            <option value="YA_ATENDIDO">Ya Atendido</option>
        </select><br>

        <input type="submit" value="Agregar Turno">
    </form>
</body>
</html>

