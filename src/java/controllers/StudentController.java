/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.CompanyDAO;
import dao.EducationDAO;
import dao.ExperienceDAO;
import dao.JobsDao;
import dao.MessageDAO;
import dao.PostDAO;
import dao.ProjectsDAO;
import dao.SendMessageDAO;
import dao.StudentDAO;
import dao.TeacherDAO;
import entities.Company;
import entities.Education;
import entities.Exprerience;
import entities.Jobs;
import entities.Message;
import entities.Post;
import entities.Projects;
import entities.SendMsg;
import entities.Skill;
import entities.Student;
import entities.StudentEducation;
import entities.StudentExperience;
import entities.Teacher;
import helper.BCrypt;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import validators.StudentValidator;

/**
 *
 * @author nikos
 */
@Controller
@RequestMapping(value = "/student")
public class StudentController {

    @Autowired
    private StudentDAO studentDao;

    @Autowired
    private TeacherDAO teacherDao;

    @Autowired
    private SendMessageDAO sendMessageDao;

    @Autowired
    ServletContext servletContext;

    @Autowired
    private MessageDAO messageDao;

    @Autowired
    private CompanyDAO companyDao;

    @Autowired
    private JobsDao jobsDao;

    @Autowired
    StudentValidator studentValidator;

    @Autowired
    private ExperienceDAO expDao;

    @Autowired
    private EducationDAO eduDao;

    @Autowired
    private PostDAO postDao;

    @Autowired
    ProjectsDAO projectsDao;

    @RequestMapping(value = "/CoverPhotoUpload.htm", method = RequestMethod.POST)
    public String CoverPhotoUpload(ModelMap model, @RequestParam("file") MultipartFile file, HttpSession session) {
        if (!file.getOriginalFilename().isEmpty()) {
            try {
                BufferedOutputStream outputStream = null;
                outputStream = new BufferedOutputStream(new FileOutputStream(new File("C:\\tomcat\\webapps\\images\\", file.getOriginalFilename())));
                outputStream.write(file.getBytes());
                outputStream.flush();
                outputStream.close();
            } catch (FileNotFoundException ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            model.addAttribute("covererrormsg", "Something wrong happen please try again");

            return "studentindex";
        }
        Student student = (Student) session.getAttribute("user");
        student.setCoverpic(file.getOriginalFilename());
        studentDao.updateUser(student);
        model.addAttribute("student", new Student());
        model.addAttribute("experience", new Exprerience());
        model.addAttribute("education", new Education());
        model.addAttribute("skill", new Skill());
        session.removeAttribute("student");
        session.setAttribute("user", student);
        return "studentindex";
    }

    @RequestMapping(value = "/updateStudent.htm", method = RequestMethod.POST)
    public String udpateInfo(ModelMap model, @ModelAttribute Student student, HttpSession session) {
        String overview = student.getOverview();
        Student st = (Student) session.getAttribute("user");
        st.setOverview(overview);
        studentDao.updateUser(st);
        session.setAttribute("user", st);
        model.addAttribute("student", new Student());
        model.addAttribute("experience", new Exprerience());
        model.addAttribute("education", new Education());
        model.addAttribute("skill", new Skill());
        session.removeAttribute("user");
        session.setAttribute("student", student);
        return "studentindex";
    }

    @RequestMapping(value = "/updateEducation.htm", method = RequestMethod.POST)
    public String insertEducation(ModelMap model, @ModelAttribute Education education, HttpSession session) {
        eduDao.insertEducation(education);
        Student student = (Student) session.getAttribute("user");
        StudentEducation stuEdu = new StudentEducation();
        stuEdu.setEducationId(education.getId());
        stuEdu.setEducation(education);
        stuEdu.setStudentId(student);
        studentDao.insertStudentEdu(stuEdu);
        model.addAttribute("student", student);
        model.addAttribute("experience", new Exprerience());
        model.addAttribute("education", new Education());
        model.addAttribute("skill", new Skill());
        session.removeAttribute("user");
        session.setAttribute("user", student);
        return "studentindex";
    }

    @RequestMapping(value = "/updateExperience.htm", method = RequestMethod.POST)
    public String insertExperience(ModelMap model, @ModelAttribute Exprerience experience, HttpSession session) {

        expDao.insertExp(experience);
        Student student = (Student) session.getAttribute("user");
        StudentExperience stuExp = new StudentExperience();
        stuExp.setExperienceId(experience.getId());
        stuExp.setExprerience(experience);
        stuExp.setStudentId(student);
        studentDao.insertStudentExp(stuExp);
        model.addAttribute("student", student);
        model.addAttribute("experience", new Exprerience());
        model.addAttribute("education", new Education());
        model.addAttribute("skill", new Skill());
        session.removeAttribute("user");
        session.setAttribute("user", student);
        return "studentindex";
    }

    @RequestMapping(value = "/ProfilePhotoUpload.htm", method = RequestMethod.POST)
    public String profilePhotoUpload(ModelMap model, @RequestParam("file") MultipartFile file, HttpSession session) {
        if (!file.getOriginalFilename().isEmpty()) {
            BufferedOutputStream outputStream = null;
            try {
                outputStream = new BufferedOutputStream(new FileOutputStream(new File("C:\\tomcat\\webapps\\images\\", file.getOriginalFilename())));
                outputStream.write(file.getBytes());
                outputStream.flush();
                outputStream.close();
            } catch (FileNotFoundException ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    outputStream.close();
                } catch (IOException ex) {
                    Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else {
            model.addAttribute("profileerrormsg", "Something wrong happen please try again");
            return "studentindex";
        }
        Student student = (Student) session.getAttribute("user");
        student.setProfilepic(file.getOriginalFilename());
        studentDao.updateUser(student);
//        session.invalidate();
        model.addAttribute("student", new Student());
        model.addAttribute("experience", new Exprerience());
        model.addAttribute("education", new Education());
        model.addAttribute("skill", new Skill());
        session.removeAttribute("student");
        session.setAttribute("user", student);
        return "studentindex";
    }

    @RequestMapping(value = "/createEmptyMessageForTeacher.htm", method = RequestMethod.GET)
    public String createEmptyMessage(ModelMap model, @RequestParam("teachid") int teachid, HttpSession session) {
        Teacher teach = teacherDao.findTeacher(teachid);
        int studid = ((Student) session.getAttribute("user")).getId();
        Message m = new Message();
        m.setToId(teachid);
        List<SendMsg> msgs = sendMessageDao.allMessages(teachid, studid);
        model.addAttribute("messages", msgs);
        model.addAttribute("userTo", teach);
        model.addAttribute("message", m);
        return "studentMessageTeacher";
    }

    @RequestMapping(value = "/teachers.htm", method = RequestMethod.GET)
    public String teachers(ModelMap model) {
        List<Teacher> teachers = teacherDao.allTeachers();
        servletContext.setAttribute("teachersList", teachers);
        return "studentTeachersList";
    }

    @RequestMapping(value = "/students.htm", method = RequestMethod.GET)
    public String students(ModelMap model) {
        List<Student> students = studentDao.allStudents();
        servletContext.setAttribute("studentsList", students);
        return "studentStudentsList";
    }

    @RequestMapping(value = "/sendMessageToTeacher.htm", method = RequestMethod.POST)
    public String sendMessage(ModelMap model, @ModelAttribute Message msg, HttpSession session) {
        Student st = (Student) session.getAttribute("user");
        Timestamp datetime = new Timestamp(System.currentTimeMillis());
        msg.setDate(datetime);
        messageDao.insert(msg);
        SendMsg sendMsg = new SendMsg();
        sendMsg.setMessage(msg);
        sendMsg.setMsgId(msg.getId());
        sendMsg.setReceiverId(msg.getToId());
        sendMsg.setSenderId(st.getId());
        sendMessageDao.insert(sendMsg);
        return "redirect:/student/createEmptyMessageForTeacher.htm?teachid=" + sendMsg.getReceiverId();
    }

    @RequestMapping(value = "/createEmptyMessageForStudent.htm", method = RequestMethod.GET)
    public String createEmptyMessageForStudent(ModelMap model, @RequestParam("studid") int studid, HttpSession session) {
        Student st = studentDao.findStudent(studid);
        int studSessionId = ((Student) session.getAttribute("user")).getId();
        Message m = new Message();
        m.setToId(studid);
        List<SendMsg> msgs = sendMessageDao.allMessages(studid, studSessionId);
        model.addAttribute("messages", msgs);
        model.addAttribute("userTo", st);
        model.addAttribute("message", m);
        return "studentMessageStudent";
    }

    @RequestMapping(value = "/sendMessageToStudent.htm", method = RequestMethod.POST)
    public String sendMessageToStudent(ModelMap model, @ModelAttribute Message msg, HttpSession session) {
        Student st = (Student) session.getAttribute("user");
        Timestamp datetime = new Timestamp(System.currentTimeMillis());
        msg.setDate(datetime);
        messageDao.insert(msg);
        SendMsg sendMsg = new SendMsg();
        sendMsg.setMessage(msg);
        sendMsg.setMsgId(msg.getId());
        sendMsg.setReceiverId(msg.getToId());
        sendMsg.setSenderId(st.getId());
        sendMessageDao.insert(sendMsg);
        return "redirect:/student/createEmptyMessageForStudent.htm?studid=" + sendMsg.getReceiverId();
    }

    @RequestMapping(value = "/settings.htm", method = RequestMethod.GET)
    public String settings(ModelMap model) {
        model.addAttribute("updatepass", new Student());
        return "studentSettings";
    }

    @RequestMapping(value = "/updatePassword.htm", method = RequestMethod.POST)
    public String updatePassword(ModelMap model, Student studentForUpdate, HttpSession session) {
        Student student = (Student) session.getAttribute("user");
        student.setPassword(studentForUpdate.getPassword());
        String hashed = BCrypt.hashpw(student.getPassword(), BCrypt.gensalt());
        student.setPassword(hashed);
        studentDao.updateUser(student);
        model.addAttribute("msg", "Password replaced successfully!!");
        model.addAttribute("updatepass", new Student());
        return "studentSettings";

    }

    @RequestMapping(value = "/homeSt.htm", method = RequestMethod.GET)
    public String homeSt(ModelMap model, HttpSession session) {
        Student student = (Student) session.getAttribute("user");
        model.addAttribute("student", student);
        model.addAttribute("experience", new Exprerience());
        model.addAttribute("education", new Education());
        model.addAttribute("skill", new Skill());
        return "studentindex";
    }

    @RequestMapping(value = "/viewProfile.htm", method = RequestMethod.GET)
    public String viewProfile(ModelMap model, @RequestParam("studid") int studid, HttpSession session) {
        Student st = studentDao.findStudent(studid);
        model.addAttribute("st", st);
        return "studentViewProfileStudent";
    }

    @RequestMapping(value = "/companies.htm", method = RequestMethod.GET)
    public String companies(ModelMap model) {
        List<Company> companies = companyDao.allCompanies();
        servletContext.setAttribute("companiesList", companies);
        return "studentCompaniesList";
    }

    @RequestMapping(value = "/showCompany.htm", method = RequestMethod.GET)
    public String showCompany(ModelMap model, @RequestParam("comid") int comid) {
        Company company = companyDao.searchCompany(comid);
        model.addAttribute("companyView", company);
        Jobs job = new Jobs();
        model.addAttribute("job", job);
        List<Jobs> jobs = jobsDao.allJobs(company);
        servletContext.setAttribute("jobsList", jobs);
        return "companyProfileForUsers";
    }

    @RequestMapping(value = "/posts.htm", method = RequestMethod.GET)
    public String posts(ModelMap model) {
        Post mypost = new Post();
        model.addAttribute("mypost", mypost);
        List<Post> post = postDao.AllPost();
        servletContext.setAttribute("postList", post);
        return "studentPosts";
    }

    @RequestMapping(value = "/projects.htm", method = RequestMethod.GET)
    public String projects(ModelMap model) {
        Projects project = new Projects();
        List<Projects> projects = projectsDao.AllProjects();
        servletContext.setAttribute("projectsList", projects);
        return "studentViewProjects";
    }
}
