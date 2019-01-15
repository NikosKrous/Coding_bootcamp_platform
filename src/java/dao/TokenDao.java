/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.VerificationToken;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class TokenDao {

    @PersistenceContext
    private EntityManager em;

    @Transactional

    public void addToken(VerificationToken t) {
        em.persist(t);
    }

    public VerificationToken findTokenByT(String token) {
        TypedQuery<VerificationToken> query = em.createNamedQuery("VerificationToken.findByToken", VerificationToken.class);
        VerificationToken t = query.setParameter("token", token).getSingleResult();
        return t;
    }

}
