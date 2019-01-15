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
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "personal_project")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PersonalProject.findAll", query = "SELECT p FROM PersonalProject p")
    , @NamedQuery(name = "PersonalProject.findById", query = "SELECT p FROM PersonalProject p WHERE p.id = :id")
    , @NamedQuery(name = "PersonalProject.findByTitle", query = "SELECT p FROM PersonalProject p WHERE p.title = :title")
    , @NamedQuery(name = "PersonalProject.findByLink", query = "SELECT p FROM PersonalProject p WHERE p.link = :link")})
public class PersonalProject implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "title")
    private String title;
    @Lob
    @Column(name = "description")
    private String description;
    @Column(name = "link")
    private String link;
    @JoinColumn(name = "studentid", referencedColumnName = "id")
    @ManyToOne
    private Student studentid;

    public PersonalProject() {
    }

    public PersonalProject(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Student getStudentid() {
        return studentid;
    }

    public void setStudentid(Student studentid) {
        this.studentid = studentid;
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
        if (!(object instanceof PersonalProject)) {
            return false;
        }
        PersonalProject other = (PersonalProject) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.PersonalProject[ id=" + id + " ]";
    }
    
}
