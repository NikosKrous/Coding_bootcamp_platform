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
@Table(name = "student_education")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "StudentEducation.findAll", query = "SELECT s FROM StudentEducation s")
    , @NamedQuery(name = "StudentEducation.findByEducationId", query = "SELECT s FROM StudentEducation s WHERE s.educationId = :educationId")})
public class StudentEducation implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "educationId")
    private Integer educationId;
    @JoinColumn(name = "educationId", referencedColumnName = "id", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Education education;
    @JoinColumn(name = "studentId", referencedColumnName = "id")
    @ManyToOne
    private Student studentId;

    public StudentEducation() {
    }

    public StudentEducation(Integer educationId) {
        this.educationId = educationId;
    }

    public Integer getEducationId() {
        return educationId;
    }

    public void setEducationId(Integer educationId) {
        this.educationId = educationId;
    }

    public Education getEducation() {
        return education;
    }

    public void setEducation(Education education) {
        this.education = education;
    }

    public Student getStudentId() {
        return studentId;
    }

    public void setStudentId(Student studentId) {
        this.studentId = studentId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (educationId != null ? educationId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof StudentEducation)) {
            return false;
        }
        StudentEducation other = (StudentEducation) object;
        if ((this.educationId == null && other.educationId != null) || (this.educationId != null && !this.educationId.equals(other.educationId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.StudentEducation[ educationId=" + educationId + " studentId=" + studentId + " ]";
    }

}
