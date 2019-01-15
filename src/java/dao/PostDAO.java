/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Post;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class PostDAO {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insert(Post post) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Timestamp datetime = new Timestamp(System.currentTimeMillis());
        post.setDatetime(datetime);
        em.persist(post);
    }

    public List<Post> AllPost() {
        Query query = em.createQuery("SELECT p FROM Post p order by p.datetime desc", Post.class);
        List<Post> postList = query.getResultList();
        return postList;
    }

    @Transactional
    public List<Post> deletePost(int id) {
        Post post = em.find(Post.class, id);
        em.remove(post);
        em.flush();
        List<Post> postList = AllPost();
        return postList;
    }

}
