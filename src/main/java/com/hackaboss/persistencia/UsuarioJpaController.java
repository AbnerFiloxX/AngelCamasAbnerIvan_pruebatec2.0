package com.hab.persistencia;

import com.hab.logica.Usuario;
import java.io.Serializable;
import javax.persistence.*;

public class UsuarioJpaController implements Serializable {

    private EntityManagerFactory emf = null;

    public UsuarioJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public Usuario findUsuarioByUsername(String username) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Usuario> query = em.createQuery("SELECT u FROM Usuario u WHERE u.usuario = :usuario", Usuario.class);
            query.setParameter("usuario", username);
            return query.getResultList().stream().findFirst().orElse(null);
        } finally {
            em.close();
        }
    }
}

