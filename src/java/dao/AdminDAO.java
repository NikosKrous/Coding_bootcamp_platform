/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Admin;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

    @PersistenceContext
    private EntityManager em;

    public List<Admin> checkAdminLogin(String usercheck, String passcheck) {
        Query q = em.createQuery("SELECT a FROM Admin a WHERE a.username like :username AND a.password like :password", Admin.class);
        q.setParameter("username", usercheck);
        q.setParameter("password", passcheck);
        List<Admin> admin = q.getResultList();
        return admin;
    }
}
