/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;
import java.sql.Date;
import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "exprerience")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Exprerience.findAll", query = "SELECT e FROM Exprerience e")
    , @NamedQuery(name = "Exprerience.findById", query = "SELECT e FROM Exprerience e WHERE e.id = :id")
    , @NamedQuery(name = "Exprerience.findByTitle", query = "SELECT e FROM Exprerience e WHERE e.title = :title")
    , @NamedQuery(name = "Exprerience.findByStartDate", query = "SELECT e FROM Exprerience e WHERE e.startDate = :startDate")
    , @NamedQuery(name = "Exprerience.findByEndDate", query = "SELECT e FROM Exprerience e WHERE e.endDate = :endDate")
    , @NamedQuery(name = "Exprerience.findByLocation", query = "SELECT e FROM Exprerience e WHERE e.location = :location")})
public class Exprerience implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer id;
    @Column(name = "title")
    private String title;
    @Lob
    @Column(name = "summary")
    private String summary;
    @Column(name = "start_date")
    private Date startDate;
    @Column(name = "end_date")
    private Date endDate;
    @Column(name = "location")
    private String location;
    @OneToOne(fetch = FetchType.EAGER,cascade = CascadeType.ALL, mappedBy = "exprerience")
    private StudentExperience studentExperience;

    public Exprerience() {
    }

    public Exprerience(Integer id) {
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

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public StudentExperience getStudentExperience() {
        return studentExperience;
    }

    public void setStudentExperience(StudentExperience studentExperience) {
        this.studentExperience = studentExperience;
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
        if (!(object instanceof Exprerience)) {
            return false;
        }
        Exprerience other = (Exprerience) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Exprerience[ id=" + id + " ]";
    }
    
}
