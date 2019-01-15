/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Bella
 */
@Entity
@Table(name = "projects_apply")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProjectsApply.findAll", query = "SELECT p FROM ProjectsApply p")
    , @NamedQuery(name = "ProjectsApply.findByProjectId", query = "SELECT p FROM ProjectsApply p WHERE p.projectId = :projectId")
    , @NamedQuery(name = "ProjectsApply.findByFilename", query = "SELECT p FROM ProjectsApply p WHERE p.filename = :filename")
    , @NamedQuery(name = "ProjectsApply.findByGrade", query = "SELECT p FROM ProjectsApply p WHERE p.grade = :grade")})
public class ProjectsApply implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "projectId")
    private Integer projectId;
    @Column(name = "filename")
    private String filename;
    @Lob
    @Column(name = "project")
    private byte[] project;
    @Column(name = "grade")
    private String grade;
    @JoinColumn(name = "projectId", referencedColumnName = "id", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Projects projects;
    @JoinColumn(name = "studentId", referencedColumnName = "id")
    @ManyToOne
    private Student studentId;
    @JoinColumn(name = "teacherId", referencedColumnName = "id")
    @ManyToOne
    private Teacher teacherId;

    public ProjectsApply() {
    }

    public ProjectsApply(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public byte[] getProject() {
        return project;
    }

    public void setProject(byte[] project) {
        this.project = project;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Projects getProjects() {
        return projects;
    }

    public void setProjects(Projects projects) {
        this.projects = projects;
    }

    public Student getStudentId() {
        return studentId;
    }

    public void setStudentId(Student studentId) {
        this.studentId = studentId;
    }

    public Teacher getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Teacher teacherId) {
        this.teacherId = teacherId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (projectId != null ? projectId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProjectsApply)) {
            return false;
        }
        ProjectsApply other = (ProjectsApply) object;
        if ((this.projectId == null && other.projectId != null) || (this.projectId != null && !this.projectId.equals(other.projectId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.ProjectsApply[ projectId=" + projectId + " ]";
    }
    
}
