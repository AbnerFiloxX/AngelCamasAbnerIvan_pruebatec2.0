<%-- 
    Document   : turnosFiltrados
    Created on : 23 ene. 2025, 20:26:52
    Author     : satel
--%>

<%@ page import="com.hackaboss.logica.ControladoraLogica" %>
<%@ page import="com.hackaboss.logica.Turno" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Filtrar Turnos</title>
</head>
<body>
    <h1>Filtrar Turnos</h1>
    <form action="filtrarTurnosSv" method="GET">
        <label for="estado">Seleccionar Estado:</label>
        <select name="estado" required>
            <option value="En espera">En espera</option>
            <option value="Ya atendido">Ya atendido</option>
        </select>
        <button type="submit">Filtrar</button>
    </form>

    <h1>Turnos Filtrados</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Fecha</th>
                <th>Estado</th>
                <th>Ciudadano</th>
                <th>Trámite</th>
                <th>Usuario</th>
            </tr>
        </thead>
        <tbody>
            <%
                ControladoraLogica control = new ControladoraLogica();
                String estadoFiltro = request.getParameter("estado");
                List<Turno> turnos;
                
                if (estadoFiltro != null) {
                    turnos = control.listarTurnosPorEstado(estadoFiltro);
                } else {
                    turnos = control.listarTurnos();
                }
                for (Turno turno : turnos) {
            %>
            <tr>
                <td><%= turno.getId() %></td>
                <td><%= turno.getFecha() %></td>
                <td><%= turno.getEstado() %></td>
                <td><%= turno.getCiudadano().getNombre() + " " + turno.getCiudadano().getApellido() %></td>
                <td><%= turno.getTramite().getNombre() %></td>
                <td><%= turno.getUsuario().getNombre() %></td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>

