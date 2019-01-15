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
@Table(name = "student")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Student.findAll", query = "SELECT s FROM Student s")
    , @NamedQuery(name = "Student.findById", query = "SELECT s FROM Student s WHERE s.id = :id")
    , @NamedQuery(name = "Student.findByUsername", query = "SELECT s FROM Student s WHERE s.username = :username")
    , @NamedQuery(name = "Student.findByPassword", query = "SELECT s FROM Student s WHERE s.password = :password")
    , @NamedQuery(name = "Student.findByEmail", query = "SELECT s FROM Student s WHERE s.email = :email")
    , @NamedQuery(name = "Student.findByFirstname", query = "SELECT s FROM Student s WHERE s.firstname = :firstname")
    , @NamedQuery(name = "Student.findByLastname", query = "SELECT s FROM Student s WHERE s.lastname = :lastname")
    , @NamedQuery(name = "Student.findByPhone", query = "SELECT s FROM Student s WHERE s.phone = :phone")
    , @NamedQuery(name = "Student.findByDob", query = "SELECT s FROM Student s WHERE s.dob = :dob")
    , @NamedQuery(name = "Student.findByVerifiedAccount", query = "SELECT s FROM Student s WHERE s.verifiedAccount = :verifiedAccount")
    , @NamedQuery(name = "Student.findByTitle", query = "SELECT s FROM Student s WHERE s.title = :title")
    , @NamedQuery(name = "Student.findByLinkedin", query = "SELECT s FROM Student s WHERE s.linkedin = :linkedin")
    , @NamedQuery(name = "Student.findByGithub", query = "SELECT s FROM Student s WHERE s.github = :github")
    , @NamedQuery(name = "Student.findByStatus", query = "SELECT s FROM Student s WHERE s.status = :status")
    , @NamedQuery(name = "Student.findByProfilepic", query = "SELECT s FROM Student s WHERE s.profilepic = :profilepic")
    , @NamedQuery(name = "Student.findByCoverpic", query = "SELECT s FROM Student s WHERE s.coverpic = :coverpic")})
public class Student implements Serializable {

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
    @Transient
    private String oldPassword;
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
    @Basic(optional = false)
    @Column(name = "verified_account")
    private boolean verifiedAccount;
    @Column(name = "title")
    private String title;
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
    @OneToMany(fetch = FetchType.EAGER,mappedBy = "studentId")
    private Collection<StudentEducation> studentEducationCollection;
    @OneToMany(mappedBy = "studentid")
    private Collection<PersonalProject> personalProjectCollection;
    @JoinColumn(name = "streamid", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Stream streamid;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "studentId")
    private Collection<StudentSkill> studentSkillCollection;
    @OneToMany(mappedBy = "studentId")
    private Collection<ProjectsApply> projectsApplyCollection;
    @OneToMany(mappedBy = "studentId")
    private Collection<JobApply> jobApplyCollection;
    @OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL, mappedBy = "studentId")
    private Collection<StudentExperience> studentExperienceCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "studentId")
    private Collection<VerificationToken> verificationTokenCollection;

    public Student() {
    }

    public Student(Integer id) {
        this.id = id;
    }

    public Student(Integer id, String username, String password, String email, String firstname, String lastname, String phone, Date dob, boolean verifiedAccount, boolean status) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.firstname = firstname;
        this.lastname = lastname;
        this.phone = phone;
        this.dob = dob;
        this.verifiedAccount = verifiedAccount;
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public String getPasswordValidation() {
        return passwordValidation;
    }

    public void setPasswordValidation(String passwordValidation) {
        this.passwordValidation = passwordValidation;
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

    public boolean getVerifiedAccount() {
        return verifiedAccount;
    }

    public void setVerifiedAccount(boolean verifiedAccount) {
        this.verifiedAccount = verifiedAccount;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
    public Collection<StudentEducation> getStudentEducationCollection() {
        return studentEducationCollection;
    }

    public void setStudentEducationCollection(Collection<StudentEducation> studentEducationCollection) {
        this.studentEducationCollection = studentEducationCollection;
    }

    @XmlTransient
    public Collection<PersonalProject> getPersonalProjectCollection() {
        return personalProjectCollection;
    }

    public void setPersonalProjectCollection(Collection<PersonalProject> personalProjectCollection) {
        this.personalProjectCollection = personalProjectCollection;
    }

    public Stream getStreamid() {
        return streamid;
    }

    public void setStreamid(Stream streamid) {
        this.streamid = streamid;
    }

    @XmlTransient
    public Collection<StudentSkill> getStudentSkillCollection() {
        return studentSkillCollection;
    }

    public void setStudentSkillCollection(Collection<StudentSkill> studentSkillCollection) {
        this.studentSkillCollection = studentSkillCollection;
    }

    @XmlTransient
    public Collection<ProjectsApply> getProjectsApplyCollection() {
        return projectsApplyCollection;
    }

    public void setProjectsApplyCollection(Collection<ProjectsApply> projectsApplyCollection) {
        this.projectsApplyCollection = projectsApplyCollection;
    }

    @XmlTransient
    public Collection<JobApply> getJobApplyCollection() {
        return jobApplyCollection;
    }

    public void setJobApplyCollection(Collection<JobApply> jobApplyCollection) {
        this.jobApplyCollection = jobApplyCollection;
    }

    @XmlTransient
    public Collection<StudentExperience> getStudentExperienceCollection() {
        return studentExperienceCollection;
    }

    public void setStudentExperienceCollection(Collection<StudentExperience> studentExperienceCollection) {
        this.studentExperienceCollection = studentExperienceCollection;
    }

    @XmlTransient
    public Collection<VerificationToken> getVerificationTokenCollection() {
        return verificationTokenCollection;
    }

    public void setVerificationTokenCollection(Collection<VerificationToken> verificationTokenCollection) {
        this.verificationTokenCollection = verificationTokenCollection;
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
        if (!(object instanceof Student)) {
            return false;
        }
        Student other = (Student) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.Student[ id=" + id + " ]";
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }
    
    

}
