/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.sql.Date;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "teacher")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Teacher.findAll", query = "SELECT t FROM Teacher t")
    , @NamedQuery(name = "Teacher.findById", query = "SELECT t FROM Teacher t WHERE t.id = :id")
    , @NamedQuery(name = "Teacher.findByUsername", query = "SELECT t FROM Teacher t WHERE t.username = :username")
    , @NamedQuery(name = "Teacher.findByPassword", query = "SELECT t FROM Teacher t WHERE t.password = :password")
    , @NamedQuery(name = "Teacher.findByEmail", query = "SELECT t FROM Teacher t WHERE t.email = :email")
    , @NamedQuery(name = "Teacher.findByFirstname", query = "SELECT t FROM Teacher t WHERE t.firstname = :firstname")
    , @NamedQuery(name = "Teacher.findByLastname", query = "SELECT t FROM Teacher t WHERE t.lastname = :lastname")
    , @NamedQuery(name = "Teacher.findByPhone", query = "SELECT t FROM Teacher t WHERE t.phone = :phone")
    , @NamedQuery(name = "Teacher.findByDob", query = "SELECT t FROM Teacher t WHERE t.dob = :dob")
    , @NamedQuery(name = "Teacher.findByLinkedin", query = "SELECT t FROM Teacher t WHERE t.linkedin = :linkedin")
    , @NamedQuery(name = "Teacher.findByGithub", query = "SELECT t FROM Teacher t WHERE t.github = :github")
    , @NamedQuery(name = "Teacher.findByStatus", query = "SELECT t FROM Teacher t WHERE t.status = :status")
    , @NamedQuery(name = "Teacher.findByProfilepic", query = "SELECT t FROM Teacher t WHERE t.profilepic = :profilepic")
    , @NamedQuery(name = "Teacher.findByCoverpic", query = "SELECT t FROM Teacher t WHERE t.coverpic = :coverpic")})
public class Teacher implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "username")
    private String username;
    @Basic(optional = false)
    @Column(name = "password")
    private String password;
    @Transient
    private String passwordValidation;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "firstname")
    private String firstname;
    @Basic(optional = false)
    @Column(name = "lastname")
    private String lastname;
    @Basic(optional = false)
    @Column(name = "phone")
    private String phone;
    @Basic(optional = false)
    @Column(name = "dob")
    private Date dob;
    @Lob
    @Column(name = "overview")
    private String overview;
    @Column(name = "linkedin")
    private String linkedin;
    @Column(name = "github")
    private String github;
    @Basic(optional = false)
    @Column(name = "status")
    private boolean status;
    @Column(name = "profilepic")
    private String profilepic;
    @Column(name = "coverpic")
    private String coverpic;
    @OneToMany(mappedBy = "teacherId")
    private Collection<Projects> projectsCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "teacherId")
    private Collection<TeacherSkill> teacherSkillCollection;
    @OneToMany(mappedBy = "teacherId")
    private Collection<ProjectsApply> projectsApplyCollection;
    @JoinColumn(name = "streamId", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Stream streamId;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "teacherId")
    private Collection<Post> postCollection;

    public Teacher() {
    }

    public Teacher(Integer id) {
        this.id = id;
    }

    public Teacher(Integer id, String username, String password, String email, String firstname, String lastname, String phone, Date dob, boolean status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.dob = dob;
        this.status = status;
    }

    public String getPasswordValidation() {
        return passwordValidation;
    }

    public void setPasswordValidation(String passwordValidation) {
        this.passwordValidation = passwordValidation;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getOverview() {
        return overview;
    }

    public void setOverview(String overview) {
        this.overview = overview;
    }

    public String getLinkedin() {
        return linkedin;
    }

    public void setLinkedin(String linkedin) {
        this.linkedin = linkedin;
    }

    public String getGithub() {
        return github;
    }

    public void setGithub(String github) {
        this.github = github;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getProfilepic() {
        return profilepic;
    }

    public void setProfilepic(String profilepic) {
        this.profilepic = profilepic;
    }

    public String getCoverpic() {
        return coverpic;
    }

    public void setCoverpic(String coverpic) {
        this.coverpic = coverpic;
    }

    @XmlTransient
    public Collection<Projects> getProjectsCollection() {
        return projectsCollection;
    }

    public void setProjectsCollection(Collection<Projects> projectsCollection) {
        this.projectsCollection = projectsCollection;
    }

    @XmlTransient
    public Collection<TeacherSkill> getTeacherSkillCollection() {
        return teacherSkillCollection;
    }

    public void setTeacherSkillCollection(Collection<TeacherSkill> teacherSkillCollection) {
        this.teacherSkillCollection = teacherSkillCollection;
    }

    @XmlTransient
    public Collection<ProjectsApply> getProjectsApplyCollection() {
        return projectsApplyCollection;
    }

    public void setProjectsApplyCollection(Collection<ProjectsApply> projectsApplyCollection) {
        this.projectsApplyCollection = projectsApplyCollection;
    }

    public Stream getStreamId() {
        return streamId;
    }

    public void setStreamId(Stream streamId) {
        this.streamId = streamId;
    }

    @XmlTransient
    public Collection<Post> getPostCollection() {
        return postCollection;
    }

    public void setPostCollection(Collection<Post> postCollection) {
        this.postCollection = postCollection;
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
        if (!(object instanceof Teacher)) {
            return false;
        }
        Teacher other = (Teacher) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Teacher[ id=" + id + " ]";
    }
}
