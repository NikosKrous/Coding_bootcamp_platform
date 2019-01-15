/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
@Entity
@Table(name = "skill")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Skill.findAll", query = "SELECT s FROM Skill s")
    , @NamedQuery(name = "Skill.findById", query = "SELECT s FROM Skill s WHERE s.id = :id")
    , @NamedQuery(name = "Skill.findBySkill", query = "SELECT s FROM Skill s WHERE s.skill = :skill")})
public class Skill implements Serializable {


    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "skill")
    private String skill;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "skill")
    private TeacherSkill teacherSkill;
    @OneToMany(mappedBy = "skillid")
    private Collection<Jobs> jobsCollection;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "skill")
    private StudentSkill studentSkill;

    public Skill() {
    }

    public Skill(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public TeacherSkill getTeacherSkill() {
        return teacherSkill;
    }

    public void setTeacherSkill(TeacherSkill teacherSkill) {
        this.teacherSkill = teacherSkill;
    }

    @XmlTransient
    public Collection<Jobs> getJobsCollection() {
        return jobsCollection;
    }

    public void setJobsCollection(Collection<Jobs> jobsCollection) {
        this.jobsCollection = jobsCollection;
    }

    public StudentSkill getStudentSkill() {
        return studentSkill;
    }

    public void setStudentSkill(StudentSkill studentSkill) {
        this.studentSkill = studentSkill;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Skill)) {
            return false;
        }
        Skill other = (Skill) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Skill[ id=" + id + " ]";
    }

}
