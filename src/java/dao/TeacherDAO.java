/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Teacher;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class TeacherDAO {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insert(Teacher teacher) {
        em.persist(teacher);
    }

    public List<Teacher> checkTeacherLogin(String usercheck, String passcheck) {
        Query q = em.createQuery("SELECT t FROM Teacher t WHERE t.username like :username", Teacher.class);
        q.setParameter("username", usercheck);
        List<Teacher> teach = q.getResultList();
        return teach;
    }

    public List<Teacher> searchUser(String username) {
        Query q = em.createQuery("SELECT t FROM Teacher t WHERE t.username = :name", Teacher.class);
        q.setParameter("name", username);
        List<Teacher> teachers = q.getResultList();
        return teachers;
    }

    public List<Teacher> allTeachers() {
        TypedQuery<Teacher> query = em.createNamedQuery("Teacher.findAll", Teacher.class);
        List<Teacher> teacherList = query.getResultList();
        return teacherList;
    }

    @Transactional
    public List<Teacher> deleteTeacher(int id) {
        Teacher teacher = em.find(Teacher.class, id);
        em.remove(teacher);
        em.flush();
        List<Teacher> teachers = allTeachers();
        return teachers;
    }

    @Transactional
    public Teacher findTeacherById(int id) {
        TypedQuery<Teacher> query
                = em.createNamedQuery("Teacher.findById", Teacher.class);
        Teacher teacher = query.setParameter("id", id).getSingleResult();
        return teacher;
    }

    @Transactional
    public Teacher findTeacher(int id) {
        Teacher teach = em.find(Teacher.class, id);
        return teach;
    }
    
         @Transactional                         
    public void updateTeacher(Teacher teacher) {
        em.merge(teacher);
    }

}
