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
@Table(name = "teacher_skill")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "TeacherSkill.findAll", query = "SELECT t FROM TeacherSkill t")
    , @NamedQuery(name = "TeacherSkill.findBySkillId", query = "SELECT t FROM TeacherSkill t WHERE t.skillId = :skillId")})
public class TeacherSkill implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "skillId")
    private Integer skillId;
    @JoinColumn(name = "skillId", referencedColumnName = "id", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Skill skill;
    @JoinColumn(name = "teacherId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Teacher teacherId;

    public TeacherSkill() {
    }

    public TeacherSkill(Integer skillId) {
        this.skillId = skillId;
    }

    public Integer getSkillId() {
        return skillId;
    }

    public void setSkillId(Integer skillId) {
        this.skillId = skillId;
    }

    public Skill getSkill() {
        return skill;
    }

    public void setSkill(Skill skill) {
        this.skill = skill;
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
        hash += (skillId != null ? skillId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof TeacherSkill)) {
            return false;
        }
        TeacherSkill other = (TeacherSkill) object;
        if ((this.skillId == null && other.skillId != null) || (this.skillId != null && !this.skillId.equals(other.skillId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.TeacherSkill[ skillId=" + skillId + " ]";
    }
    
}
