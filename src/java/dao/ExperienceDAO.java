/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Exprerience;
import entities.Student;
import entities.StudentExperience;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class ExperienceDAO {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insertExp(Exprerience exp) {
        em.persist(exp);
    }

    public List<StudentExperience> getStudentExperience(Student student) {

        Integer id = student.getId();
        TypedQuery<StudentExperience> query = em.createNamedQuery("StudentExperience.findByStudentId", StudentExperience.class);
        query.setParameter("id", id);
        List<StudentExperience> studentExperience = query.getResultList();
        return studentExperience;
    }

    @Transactional
    public Exprerience findEducationById(int id) {

        TypedQuery<Exprerience> query = em.createNamedQuery("Exprerience.findById", Exprerience.class);
        Exprerience experience = query.setParameter("id", id).getSingleResult();
        return experience;
    }
}
