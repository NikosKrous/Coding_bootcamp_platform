/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.AdminDAO;
import dao.CompanyDAO;
import dao.StreamDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import dao.StudentDAO;
import dao.TeacherDAO;
import dao.TokenDao;
import entities.Admin;
import entities.Company;
import entities.Education;
import entities.Exprerience;
import entities.Skill;
import entities.Stream;
import entities.Student;
import entities.Teacher;
import entities.VerificationToken;
import helper.BCrypt;
import helper.MailService;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import validators.StudentValidator;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private StudentDAO studentDao;

    @Autowired
    private CompanyDAO companyDao;

    @Autowired
    private TeacherDAO teacherDao;

    @Autowired
    private AdminDAO adminDao;

    @Autowired
    private StreamDAO streamDao;

    @Autowired
    StudentValidator studentValidator;

    @Autowired
    ServletContext servletContext;

    @Autowired
    private TokenDao tokenDao;

    @RequestMapping(value = "/register.htm", method = RequestMethod.GET)
    public String registerUser(ModelMap model) {
        Student student = new Student();
        List<Stream> streams = streamDao.getAllStreams();
        servletContext.setAttribute("streams", streams);
        model.addAttribute("student", student);
        return "registertest";
    }

    @RequestMapping(value = "/checkregistration.htm", method = RequestMethod.POST)

    public String receiveRegistrationForm(HttpServletRequest request, ModelMap model, Student student, BindingResult bindingResult) {
        List<Student> students = studentDao.searchUser(student.getUsername());
        List<Teacher> teachers = teacherDao.checkTeacherLogin(student.getUsername(), student.getPassword());
        studentValidator.validate(student, bindingResult);
        if (bindingResult.hasErrors()) {;
            return "registertabactive";
        } else {
            String hashed = BCrypt.hashpw(student.getPassword(), BCrypt.gensalt());
            student.setPassword(hashed);
            student.setFirstname(student.getFirstname().substring(0, 1).toUpperCase() + student.getFirstname().substring(1).toLowerCase());
            student.setLastname(student.getLastname().substring(0, 1).toUpperCase() + student.getLastname().substring(1).toLowerCase());
            student.setProfilepic("profileDefault.png");
            student.setCoverpic("coverDefault.png");
            studentDao.insertUser(student);
            MailService verificationMail = new MailService();
            VerificationToken token = new VerificationToken();
            String appUrl = request.getContextPath();
            token.setStudentId(student);
            tokenDao.addToken(token);
            String confirmationUrl = appUrl + "/user/registrationConfirm.htm?token=" + token.getToken();
            verificationMail.setReceiver(student.getEmail());
            verificationMail.setSubject("Activate your Account");
            verificationMail.setMessage("http://localhost:8080" + confirmationUrl);
            verificationMail.sendmail();
            model.addAttribute("message", "User registered successfully!! Please verify your mail to log in...");
            model.addAttribute("student", new Student());
            return "registertest";
        }
    }

    @RequestMapping(value = "/userSignIn.htm", method = RequestMethod.POST)
    public String userSignIn(ModelMap model, @RequestParam("username") String username, @RequestParam("password") String password, HttpSession session) {
        List<Student> studList = studentDao.checkStudentLogin(username, password);
        List<Teacher> teachList = teacherDao.checkTeacherLogin(username, password);
        List<Admin> adminList = adminDao.checkAdminLogin(username, password);
        if (!(adminList.isEmpty())) {
            Admin admin = adminList.get(0);
            session.setAttribute("user", admin);
            return "redirect:/admin/home.htm";
        }
        if (!(teachList.isEmpty())) {
            Teacher teach = teachList.get(0);
            if (BCrypt.checkpw(password, teach.getPassword())) {
                session.setAttribute("user", teach);
                return "redirect:/teacher/home.htm";
            }
        }
        if (!(studList.isEmpty())) {
            Student stud = studList.get(0);
            if (!stud.getVerifiedAccount()) {
                model.addAttribute("message", "User is not verified yet");
                model.addAttribute("student", new Student());
                return "registertest";
            }
            if (BCrypt.checkpw(password, stud.getPassword())) {
                session.setAttribute("user", stud);
                model.addAttribute("student", stud);
                model.addAttribute("experience", new Exprerience());
                model.addAttribute("education", new Education());
                model.addAttribute("skill", new Skill());
                return "studentindex";
            }
        }
        model.addAttribute("message", "Incorrect Username or Password.");
        model.addAttribute("student", new Student());
        return "registertest";
    }

    @RequestMapping(value = "/registrationConfirm.htm")
    public String confirmRegistration(WebRequest request, Model model, @RequestParam("token") String token) {
        VerificationToken verificationToken = tokenDao.findTokenByT(token);
        if (verificationToken == null) {
            String message = "auth.message.invalidToken";
            model.addAttribute("message", message);
            return "token";
        }
        Student s = verificationToken.getStudentId();
        s.setVerifiedAccount(true);
        studentDao.activateStudent(s);
        String message = s.getEmail();
        model.addAttribute("message", "Email was verified successfully!!!");
        model.addAttribute("student", new Student());
        return "registertest";
    }

    @RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        httpSession.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value = "/companySignIn.htm", method = RequestMethod.POST)
    public String companySignIn(ModelMap model, @RequestParam("name") String name, @RequestParam("password") String password, HttpSession session) {
        List<Company> compList = companyDao.checkCompanyLogin(name, password);
        if (compList.isEmpty()) {
            model.addAttribute("student", new Student());
            model.addAttribute("message", "Incorrect Name or Password.");
            return "registertest";
        } else {
            Company comp = compList.get(0);
            if (BCrypt.checkpw(password, comp.getPassword())) {
                session.setAttribute("company", comp);
                return "redirect:/company/companyHome.htm";
            } else {
                model.addAttribute("message", "Incorrect Name or Password.");
                model.addAttribute("student", new Student());
                return "registertest";
            }
        }
    }

}
