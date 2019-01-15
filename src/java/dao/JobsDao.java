/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Company;
import entities.Jobs;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class JobsDao {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insert(Jobs jobs) {
        em.persist(jobs);
    }

    public List<Jobs> allJobs(Company comp) {
        Query query = em.createQuery("SELECT j FROM Jobs j WHERE j.companyid = :id ORDER BY j.id DESC", Jobs.class);
        query.setParameter("id", comp);
        List<Jobs> jobsList = query.getResultList();
        return jobsList;
    }

    @Transactional
    public void deleteJobs(int id) {
        Jobs jobs = em.find(Jobs.class, id);
        em.remove(jobs);
        em.flush();
    }

    @Transactional
    public Jobs searchJobs(int id) {
        Jobs jobs = em.find(Jobs.class, id);
        return jobs;
    }

}
