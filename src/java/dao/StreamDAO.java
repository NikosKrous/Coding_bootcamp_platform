/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Stream;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class StreamDAO {

    @PersistenceContext
    private EntityManager em;

    public List<Stream> getAllStreams() {
        Query q = em.createNamedQuery("Stream.findAll", Stream.class);
        List<Stream> streams = q.getResultList();
        return streams;
    }

    @Transactional
    public Stream findStream(int id) {
        TypedQuery<Stream> query
                = em.createNamedQuery("Stream.findById", Stream.class);
        Stream stream = query.setParameter("id", id).getSingleResult();
        return stream;
    }

}
