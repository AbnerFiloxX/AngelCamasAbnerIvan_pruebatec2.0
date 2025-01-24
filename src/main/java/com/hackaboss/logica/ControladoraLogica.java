/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hackaboss.logica;

import com.hackaboss.persistencia.ControladoraPersistencia;
import com.hackaboss.persistencia.TurnoJpaController;
import java.util.List;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author satel
 */
public class ControladoraLogica {
    private ControladoraPersistencia persistencia = new ControladoraPersistencia();
    
    private TurnoJpaController turnoController;
    
    public ControladoraLogica() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("TurneroPU");
        this.turnoController = new TurnoJpaController(emf);
    }
    
    // Método para agregar un nuevo ciudadano
    public void agregarCiudadano(String nombre, String apellido, String dni) {
        Ciudadano ciudadano = new Ciudadano();
        ciudadano.setNombre(nombre);
        ciudadano.setApellido(apellido);
        ciudadano.setDni(dni);
        persistencia.create(ciudadano);
    }

    // Método para listar todos los ciudadanos
    public List<Ciudadano> listarCiudadanos() {
        // Verifica que esta función retorne datos
    List<Ciudadano> ciudadanos = persistencia.readAll(Ciudadano.class);
    if (ciudadanos == null || ciudadanos.isEmpty()) {
        System.out.println("No se encontraron ciudadanos.");
    }
    return ciudadanos;
    }

    // Método para agregar un nuevo trámite
    public void agregarTramite(String nombre) {
        Tramite tramite = new Tramite();
        tramite.setNombre(nombre);
        persistencia.create(tramite);
    }

    // Método para listar todos los trámites
    public List<Tramite> listarTramites() {
        return persistencia.readAll(Tramite.class);
    }

    // Método para agregar un nuevo turno
    public void agregarTurno(String estado, int ciudadanoId, int tramiteId, int usuarioId) {
        Turno turno = new Turno();
        turno.setEstado(Estado.valueOf(estado.toUpperCase()));  // Convierte el string estado a enum
        turno.setCiudadano(persistencia.read(Ciudadano.class, ciudadanoId));
        turno.setTramite(persistencia.read(Tramite.class, tramiteId));
        turno.setUsuario(persistencia.read(Usuario.class, usuarioId));
        persistencia.create(turno);
    }

    // Método para listar todos los turnos
    public List<Turno> listarTurnos() {
        return persistencia.readAll(Turno.class);
    }

    // Método para listar turnos por estado
    public List<Turno> listarTurnosPorEstado(String estado) {
        try {
            return turnoController.findTurnoEntitiesByEstado(estado);  // Suponiendo que ya tienes este método en TurnoJpaController
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Método para modificar el estado de un turno
    public void modificarEstadoTurno(int turnoId, String nuevoEstado) {
        Turno turno = persistencia.read(Turno.class, turnoId);
        turno.setEstado(Estado.valueOf(nuevoEstado.toUpperCase()));
        persistencia.update(turno);
    }

    // Método para eliminar un turno
    public void eliminarTurno(int turnoId) {
        Turno turno = persistencia.read(Turno.class, turnoId);
        persistencia.delete(turno);
    }

    // Método para cerrar la conexión con la base de datos
    public void cerrarConexion() {
        persistencia.close();
    }
}
