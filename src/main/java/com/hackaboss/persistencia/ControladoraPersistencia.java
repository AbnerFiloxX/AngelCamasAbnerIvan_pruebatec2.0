/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.hackaboss.persistencia;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author satel
 */
public class ControladoraPersistencia {
     private EntityManagerFactory emf = Persistence.createEntityManagerFactory("turneroPU");
    private EntityManager em = emf.createEntityManager();

    
    
    public void create(Object obj) {
        em.getTransaction().begin();
        em.persist(obj);
        em.getTransaction().commit();
    }

    public <T> T read(Class<T> clazz, int id) {
        return em.find(clazz, id);
    }

    public <T> List<T> readAll(Class<T> clazz) {
        return em.createQuery("SELECT e FROM " + clazz.getSimpleName() + " e", clazz).getResultList();
    }

    public void update(Object obj) {
        em.getTransaction().begin();
        em.merge(obj);
        em.getTransaction().commit();
    }

    public void delete(Object obj) {
        em.getTransaction().begin();
        em.remove(em.merge(obj));
        em.getTransaction().commit();
    }

    public void close() {
        em.close();
        emf.close();
    }
}
