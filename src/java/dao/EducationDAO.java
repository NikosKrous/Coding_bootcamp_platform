/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Education;
import entities.Student;
import entities.StudentEducation;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class EducationDAO {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insertEducation(Education education) {
        em.persist(education);
    }

    public List<StudentEducation> getStudentExperience(Student student) {

        Integer id = student.getId();
        TypedQuery<StudentEducation> query = em.createNamedQuery("StudentEducation.findByStudentId", StudentEducation.class);
        query.setParameter("id", id);
        List<StudentEducation> studentEducation = query.getResultList();
        return studentEducation;
    }

    @Transactional
    public Education findEducationById(int id) {

        TypedQuery<Education> query = em.createNamedQuery("Education.findById", Education.class);
        Education education = query.setParameter("id", id).getSingleResult();
        return education;
    }

}
