<%-- 
    Document   : turnos
    Created on : 23 ene. 2025, 19:30:52
    Author     : satel
--%>

<%@page import="com.hackaboss.logica.Turno"%>
<%@ page import="com.hackaboss.logica.ControladoraLogica" %>
<%@ page import="com.hackaboss.logica.Turno" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Turnos</title>
</head>
<body>
    <h1>Turnos</h1>
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
                List<Turno> turnos = control.listarTurnos();
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
