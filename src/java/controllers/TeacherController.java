/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.CompanyDAO;
import dao.JobsDao;
import dao.MessageDAO;
import dao.PostDAO;
import dao.ProjectsApplyDAO;
import dao.ProjectsDAO;
import dao.SendMessageDAO;
import dao.StudentDAO;
import dao.TeacherDAO;
import entities.Company;
import entities.Jobs;
import entities.Message;
import entities.Post;
import entities.Projects;
import entities.ProjectsApply;
import entities.SendMsg;
import entities.Skill;
import entities.Student;
import entities.Teacher;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Bella
 */
@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {

    @Autowired
    ServletContext servletContext;

    @Autowired
    CompanyDAO companyDao;

    @Autowired
    private JobsDao jobsDao;

    @Autowired
    StudentDAO studentDao;

    @Autowired
    PostDAO postDao;

    @Autowired
    ProjectsDAO projectsDao;

    @Autowired
    MessageDAO messageDao;

    @Autowired
    TeacherDAO teacherDao;

    @Autowired
    ProjectsApplyDAO projectsApplyDao;

    @Autowired
    SendMessageDAO sendMessageDao;

    @RequestMapping(value = "/home.htm", method = RequestMethod.GET)
    public String home(ModelMap model) {
        Post mypost = new Post();
        model.addAttribute("mypost", mypost);
        List<Post> post = postDao.AllPost();
        servletContext.setAttribute("postList", post);
        return "teacherindex";
    }

    @RequestMapping(value = "/companies.htm", method = RequestMethod.GET)
    public String companies(ModelMap model) {
        List<Company> companies = companyDao.allCompanies();
        servletContext.setAttribute("companiesList", companies);
        return "teacherCompaniesList";
    }

    @RequestMapping(value = "/addPost.htm", method = RequestMethod.POST)
    public String addPost(ModelMap model, @ModelAttribute Post post, BindingResult bindingResult, HttpSession session) {
        post.setTeacherId((Teacher) session.getAttribute("user"));
        postDao.insert(post);
        return "redirect:/teacher/home.htm";
    }

    @RequestMapping(value = "/students.htm", method = RequestMethod.GET)
    public String students(ModelMap model) {
        List<Student> students = studentDao.allStudents();
        servletContext.setAttribute("studentsList", students);
        return "teacherStudentList";
    }

    @RequestMapping(value = "/deletePost.htm", method = RequestMethod.GET)
    public String deletePost(ModelMap model, @RequestParam("postId") int postId) {
        List<Post> postList = postDao.deletePost(postId);
        return "redirect:/teacher/home.htm";
    }

    @RequestMapping(value = "/addEmptyProject.htm", method = RequestMethod.GET)
    public String addProject(ModelMap model) {
        Projects project = new Projects();
        List<Projects> projects = projectsDao.AllProjects();
        servletContext.setAttribute("projectsList", projects);
        model.addAttribute("myproject", project);
        return "teacherprojectstest";
    }

    @RequestMapping(value = "/projectUpload.htm", method = RequestMethod.POST)
    public String projectUpload(ModelMap model, @RequestParam("description") String description, @RequestParam("title") String title, @RequestParam("file") MultipartFile file, HttpSession session) throws IOException {
        System.out.println("Title: " + title);
        System.out.println("Descr: " + description);
        if (!file.getOriginalFilename().isEmpty()) {
            BufferedOutputStream outputStream = null;
            try {
                outputStream = new BufferedOutputStream(new FileOutputStream(new File("C:\\tomcat\\webapps\\projects", file.getOriginalFilename())));
                outputStream.write(file.getBytes());
                outputStream.flush();
            } catch (FileNotFoundException ex) {
                Logger.getLogger(TeacherController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(TeacherController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    outputStream.close();
                } catch (IOException ex) {
                    Logger.getLogger(TeacherController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else {
            Projects project = new Projects();
            model.addAttribute("project", project);
            model.addAttribute("error", "Could not upload file, please try again.");
            return "teacherprojectstest";
        }
        Projects myproject = new Projects();
        myproject.setFilename(file.getOriginalFilename());
        myproject.setTitle(title);
        myproject.setProject(file.getBytes());
        myproject.setDescription(description);
        myproject.setTeacherId((Teacher) session.getAttribute("user"));
        projectsDao.insert(myproject);
        return "teacherprojectstest";
    }

    @RequestMapping(value = "/projects.htm", method = RequestMethod.GET)
    public String projects(ModelMap model) {
        return "redirect:/teacher/addEmptyProject.htm";
    }

    @RequestMapping(value = "/deleteProject.htm", method = RequestMethod.GET)
    public String deleteProject(ModelMap model, @RequestParam("projectId") int projectId) {
        List<Projects> pprojectList = projectsDao.deleteProject(projectId);
        return "redirect:/teacher/addEmptyProject.htm";
    }

    @RequestMapping(value = "/teacherProfileEdit.htm", method = RequestMethod.GET)
    public String teacherProfileEdit(ModelMap model, HttpSession session) {
        Teacher teach = (Teacher) session.getAttribute("user");
        model.addAttribute("tea", teach);
        return "teacherprofilefeed";
    }

    @RequestMapping(value = "/updateOverview.htm", method = RequestMethod.POST)
    public String udpateOverview(ModelMap model, @ModelAttribute Teacher teacher, HttpSession session) {
        String overview = teacher.getOverview();
        System.out.println(overview);
        Teacher teach = (Teacher) session.getAttribute("user");
        teach.setOverview(overview);
        teacherDao.updateTeacher(teach);
        session.setAttribute("user", teach);
        model.addAttribute("teach", teach);
        return "redirect:/teacher/teacherProfileEdit.htm";
    }

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
                Logger.getLogger(TeacherController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(TeacherController.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            model.addAttribute("covererrormsg", "Something wrong happen please try again");

            return "redirect:/teacher/teacherProfileEdit.htm";
        }
        Teacher teacher = (Teacher) session.getAttribute("user");
        teacher.setCoverpic(file.getOriginalFilename());
        teacherDao.updateTeacher(teacher);
        model.addAttribute("teacher", new Teacher());
        model.addAttribute("skill", new Skill());
        session.removeAttribute("teacher");
        session.setAttribute("user", teacher);
        return "redirect:/teacher/teacherProfileEdit.htm";
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
                Logger.getLogger(TeacherController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(TeacherController.class.getName()).log(Level.SEVERE, null, ex);
            } finally {
                try {
                    outputStream.close();
                } catch (IOException ex) {
                    Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else {
            model.addAttribute("profileerrormsg", "Something wrong happen please try again");
            return "redirect:/teacher/teacherProfileEdit.htm";
        }
        Teacher teacher = (Teacher) session.getAttribute("user");
        teacher.setProfilepic(file.getOriginalFilename());
        teacherDao.updateTeacher(teacher);
        model.addAttribute("teacher", new Teacher());
        model.addAttribute("skill", new Skill());
        session.removeAttribute("teacher");
        session.setAttribute("user", teacher);
        return "redirect:/teacher/teacherProfileEdit.htm";
    }

    @RequestMapping(value = "/createEmptyMessage.htm", method = RequestMethod.GET)
    public String createEmptyMessage(ModelMap model, @RequestParam("studid") int studid, HttpSession session) {
        Student st = studentDao.findStudent(studid);
        int teachid = ((Teacher) session.getAttribute("user")).getId();
        Message m = new Message();
        m.setToId(studid);
        List<SendMsg> msgs = sendMessageDao.allMessages(studid, teachid);
        model.addAttribute("messages", msgs);
        model.addAttribute("student", st);
        model.addAttribute("message", m);
        return "teacherCreateMessage";
    }

    @RequestMapping(value = "/sendMessage.htm", method = RequestMethod.POST)
    public String sendMessage(ModelMap model, @ModelAttribute Message msg, HttpSession session) {
        Teacher tea = (Teacher) session.getAttribute("user");
        Timestamp datetime = new Timestamp(System.currentTimeMillis());
        msg.setDate(datetime);
        messageDao.insert(msg);
        SendMsg sendMsg = new SendMsg();
        sendMsg.setMessage(msg);
        sendMsg.setMsgId(msg.getId());
        sendMsg.setReceiverId(msg.getToId());
        sendMsg.setSenderId(tea.getId());
        sendMessageDao.insert(sendMsg);
        return "redirect:/teacher/createEmptyMessage.htm?studid=" + sendMsg.getReceiverId();
    }

    @RequestMapping(value = "/set.htm", method = RequestMethod.GET)
    public String sendMessage(ModelMap model) {
        return "teacherSettings";
    }

    @RequestMapping(value = "/showCompany.htm", method = RequestMethod.GET)
    public String showCompany(ModelMap model, @RequestParam("comid") int comid) {
        Company company = companyDao.searchCompany(comid);
        model.addAttribute("companyView", company);
        Jobs job = new Jobs();
        model.addAttribute("job", job);
        List<Jobs> jobs = jobsDao.allJobs(company);
        servletContext.setAttribute("jobsList", jobs);
        return "companyProfileForTeachers";
    }

    @RequestMapping(value = "/viewProfile.htm", method = RequestMethod.GET)
    public String viewProfile(ModelMap model, @RequestParam("studid") int studid, HttpSession session) {
        Student st = studentDao.findStudent(studid);
        model.addAttribute("st", st);
        return "teacherViewStudent";
    }

}
