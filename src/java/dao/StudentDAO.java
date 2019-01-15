/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Student;
import entities.StudentEducation;
import entities.StudentExperience;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDAO {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insertUser(Student st) {
        em.persist(st);
    }

    public List<Student> allStudents() {
        TypedQuery<Student> query = em.createNamedQuery("Student.findAll", Student.class);
        List<Student> studentsList = query.getResultList();
        return studentsList;
    }

    public List<Student> searchUser(String username) {
        Query q = em.createQuery("SELECT u FROM Student u WHERE u.username = :name", Student.class);
        q.setParameter("name", username);
        List<Student> students = q.getResultList();
        return students;
    }

    public List<Student> checkStudentLogin(String usercheck, String passcheck) {
        Query q = em.createQuery("SELECT s FROM Student s WHERE s.username like :username", Student.class);
        q.setParameter("username", usercheck);
        List<Student> stud = q.getResultList();
        return stud;
    }

    @Transactional
    public void activateStudent(Student s) {
        Integer id = s.getId();
        Query update = em.createQuery("UPDATE Student s SET s.verifiedAccount=true WHERE s.id=:id");
        update.setParameter("id", id);
        int result = update.executeUpdate();
    }

    @Transactional
    public void updateUser(Student st) {
        em.merge(st);
    }

    @Transactional
    public List<Student> deleteStudent(int id) {
        Student student = em.find(Student.class, id);
        em.remove(student);
        em.flush();
        List<Student> students = allStudents();
        return students;
    }

    @Transactional
    public Student findStudent(int id) {
        Student st = em.find(Student.class, id);
        return st;
    }

    public List<Student> searchUserById(String oldPass) {
        TypedQuery<Student> query = em.createNamedQuery("Student.findByPassword", Student.class);
        List<Student> studentsList = query.setParameter("password", oldPass).getResultList();
        return studentsList;
    }

    @Transactional
    public Student showStudents(int id) {
        Student student = em.find(Student.class, id);
        return student;
    }

    @Transactional
    public void insertStudentExp(StudentExperience stuExp) {
        em.persist(stuExp);
    }

    @Transactional
    public void insertStudentEdu(StudentEducation stuEdu) {
        em.persist(stuEdu);
    }
}
