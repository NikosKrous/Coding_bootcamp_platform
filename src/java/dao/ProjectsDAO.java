/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Projects;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectsDAO {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void insert(Projects project) {

        em.persist(project);
    }

    public List<Projects> AllProjects() {
        Query query = em.createQuery("SELECT p FROM Projects p order by p.id desc", Projects.class);
        List<Projects> projectList = query.getResultList();
        return projectList;
    }

    @Transactional
    public List<Projects> deleteProject(int id) {
        Projects project = em.find(Projects.class, id);
        em.remove(project);
        em.flush();
        List<Projects> projectList = AllProjects();
        return projectList;
    }

    @Transactional
    public Projects getProjectById(int id) {
        Projects pro = em.find(Projects.class, id);
        return pro;
    }
}
