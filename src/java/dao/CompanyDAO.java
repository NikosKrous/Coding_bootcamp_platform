/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Company;
import entities.Student;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDAO {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insertCompany(Company com) {

        em.persist(com);
    }

    public List<Company> checkCompanyLogin(String namecheck, String passcheck) {
        Query q = em.createQuery("SELECT c FROM Company c WHERE c.name like :name", Company.class);
        q.setParameter("name", namecheck);
        List<Company> comp = q.getResultList();
        return comp;
    }

    public List<Company> allCompanies() {

        TypedQuery<Company> query = em.createNamedQuery("Company.findAll", Company.class);
        List<Company> companyList = query.getResultList();
        return companyList;
    }

    @Transactional
    public List<Company> deleteCompany(int id) {
        Company company = em.find(Company.class, id);
        em.remove(company);
        em.flush();
        List<Company> companies = allCompanies();
        return companies;
    }

    @Transactional
    public void updateCompany(Company comp) {
        em.merge(comp);

    }

    @Transactional
    public Company searchCompany(int id) {
        Company company = em.find(Company.class, id);
        return company;
    }

    @Transactional
    public Student showStudents(int id) {
        Student student = em.find(Student.class, id);
        return student;
    }

}
