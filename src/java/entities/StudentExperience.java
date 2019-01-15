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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "student_experience")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StudentExperience.findAll", query = "SELECT s FROM StudentExperience s")
    , @NamedQuery(name = "StudentExperience.findByExperienceId", query = "SELECT s FROM StudentExperience s WHERE s.experienceId = :experienceId")
    , @NamedQuery(name = "StudentExperience.findByStudentId", query = "SELECT s FROM StudentExperience s WHERE s.studentId = :experienceId")
})
public class StudentExperience implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "experienceId")
    private Integer experienceId;
    @JoinColumn(name = "studentId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Student studentId;
    @JoinColumn(name = "experienceId", referencedColumnName = "id", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Exprerience exprerience;

    public StudentExperience() {
    }

    public StudentExperience(Integer experienceId) {
        this.experienceId = experienceId;
    }

    public Integer getExperienceId() {
        return experienceId;
    }

    public void setExperienceId(Integer experienceId) {
        this.experienceId = experienceId;
    }

    public Student getStudentId() {
        return studentId;
    }

    public void setStudentId(Student studentId) {
        this.studentId = studentId;
    }

    public Exprerience getExprerience() {
        return exprerience;
    }

    public void setExprerience(Exprerience exprerience) {
        this.exprerience = exprerience;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (experienceId != null ? experienceId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StudentExperience)) {
            return false;
        }
        StudentExperience other = (StudentExperience) object;
        if ((this.experienceId == null && other.experienceId != null) || (this.experienceId != null && !this.experienceId.equals(other.experienceId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.StudentExperience[ experienceId=" + experienceId + " ]";
    }

}
