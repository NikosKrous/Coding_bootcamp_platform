/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.SendMsg;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class SendMessageDAO {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insert(SendMsg sndmsg) {
        em.persist(sndmsg);
    }

    public List<SendMsg> allMessages(int studid, int teachid) {
        Query query = em.createQuery("SELECT s FROM SendMsg s where ((s.receiverId = '" + studid + "' AND s.senderId = '" + teachid + "') OR (s.receiverId = '" + teachid + "' AND s.senderId = '" + studid + "'))order by s.msgId", SendMsg.class);
        List<SendMsg> msgsList = query.getResultList();
        return msgsList;
    }

}
