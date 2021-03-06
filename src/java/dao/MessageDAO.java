/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Message;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insert(Message msg) {
        em.persist(msg);
    }

}
