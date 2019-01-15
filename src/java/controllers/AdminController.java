/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.AdminDAO;
import dao.CompanyDAO;
import dao.PostDAO;
import dao.StreamDAO;
import dao.StudentDAO;
import dao.TeacherDAO;
import entities.Company;
import entities.Post;
import entities.Stream;
import entities.Student;
import entities.Teacher;
import helper.BCrypt;
import java.util.List;
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
import validators.CompanyValidator;
import validators.TeacherValidator;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private AdminDAO adminDao;

    @Autowired
    private CompanyDAO companyDao;

    @Autowired
    private TeacherDAO teacherDao;

    @Autowired
    private StudentDAO studentDao;

    @Autowired
    private StreamDAO streamDao;

    @Autowired
    TeacherValidator teacherValidator;

    @Autowired
    CompanyValidator companyValidator;

    @Autowired
    ServletContext servletContext;

    @Autowired
    private PostDAO postDao;

    @RequestMapping(value = "/addEmptyCompany.htm", method = RequestMethod.GET)
    public String registerCompany(ModelMap model) {
        Company com = new Company();
        model.addAttribute("company", com);
        return "registercompany";
    }

    @RequestMapping(value = "/checkCompanyRegistration.htm", method = RequestMethod.POST)
    public String checkCompanyRegistration(ModelMap model, Company company, BindingResult bindingResult) {
        companyValidator.validate(company, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registercompany";
        } else {
            String hashed = BCrypt.hashpw(company.getPassword(), BCrypt.gensalt());
            company.setPassword(hashed);
            company.setProfilepic("profileDefault.png");
            company.setCoverpic("coverDefault.png");
            companyDao.insertCompany(company);
            model.addAttribute("infos", "Company " + company.getName() + " was added successfully!!!");
            List<Company> companies = companyDao.allCompanies();
            servletContext.setAttribute("companiesList", companies);
            return "adminCompaniesList";
        }
    }

    @RequestMapping(value = "/companies.htm", method = RequestMethod.GET)
    public String companies(ModelMap model) {
        List<Company> companies = companyDao.allCompanies();
        servletContext.setAttribute("companiesList", companies);
        return "adminCompaniesList";
    }

    @RequestMapping(value = "/addEmptyTeacher.htm", method = RequestMethod.GET)
    public String registerTeacher(ModelMap model) {
        Teacher teacher = new Teacher();
        model.addAttribute("teacher", teacher);
        return "registerteacher";
    }

    @RequestMapping(value = "/checkTeacherRegistration.htm", method = RequestMethod.POST)
    public String checkTeacherRegistration(ModelMap model, @ModelAttribute Teacher teacher, BindingResult bindingResult) {
        teacherValidator.validate(teacher, bindingResult);
        if (bindingResult.hasErrors()) {
            return "registerteacher";
        } else {
            String hashed = BCrypt.hashpw(teacher.getPassword(), BCrypt.gensalt());
            teacher.setPassword(hashed);
            teacher.setProfilepic("profileDefault.png");
            teacher.setCoverpic("coverDefault.png");
            teacherDao.insert(teacher);
            model.addAttribute("infos", "Teacher " + teacher.getUsername() + " was added successfully!!!");
            List<Teacher> teachers = teacherDao.allTeachers();
            servletContext.setAttribute("teachersList", teachers);
            List<Stream> streams = streamDao.getAllStreams();
            servletContext.setAttribute("streams", streams);
            return "adminTeachersList";
        }
    }

    @RequestMapping(value = "/home.htm", method = RequestMethod.GET)
    public String home(ModelMap model) {
        Post mypost = new Post();
        model.addAttribute("mypost", mypost);
        List<Post> post = postDao.AllPost();
        servletContext.setAttribute("postList", post);
        return "adminindex";
    }

    @RequestMapping(value = "/students.htm", method = RequestMethod.GET)
    public String students(ModelMap model) {
        List<Student> students = studentDao.allStudents();
        servletContext.setAttribute("studentsList", students);
        return "adminStudentsList";
    }

    @RequestMapping(value = "/deleteCompany.htm", method = RequestMethod.GET)
    public String deleteCompany(ModelMap model, @RequestParam("comid") int comid) {
        List<Company> companies = companyDao.deleteCompany(comid);
        servletContext.setAttribute("companiesList", companies);
        model.addAttribute("infos", "Company deleted successfully!!!");
        return "adminCompaniesList";
    }

    @RequestMapping(value = "/deleteStudent.htm", method = RequestMethod.GET)
    public String deleteStudent(ModelMap model, @RequestParam("studid") int studid) {
        List<Student> students = studentDao.deleteStudent(studid);
        servletContext.setAttribute("studentsList", students);
        model.addAttribute("infos", "Student deleted successfully!!!");
        return "adminStudentsList";
    }

    @RequestMapping(value = "/deleteTeacher.htm", method = RequestMethod.GET)
    public String deleteTeacher(ModelMap model, @RequestParam("teachid") int teachid) {
        List<Teacher> teachers = teacherDao.deleteTeacher(teachid);
        servletContext.setAttribute("teachersList", teachers);
        model.addAttribute("infos", "Teacher deleted successfully!!!");
        return "adminTeachersList";
    }

    @RequestMapping(value = "/teachers.htm", method = RequestMethod.GET)
    public String teachers(ModelMap model) {
        List<Teacher> teachers = teacherDao.allTeachers();
        servletContext.setAttribute("teachersList", teachers);
        return "adminTeachersList";
    }

    @RequestMapping(value = "/viewProfile.htm", method = RequestMethod.GET)
    public String viewProfile(ModelMap model, @RequestParam("studid") int studid, HttpSession session) {
        Student st = studentDao.findStudent(studid);
        model.addAttribute("st", st);
        return "adminViewProfileStudent";
    }

    @RequestMapping(value = "/viewProfileCompany.htm", method = RequestMethod.GET)
    public String viewProfileComp(ModelMap model, @RequestParam("comid") int comid, HttpSession session) {
        Company comp = companyDao.searchCompany(comid);
        model.addAttribute("companyView", comp);
        return "adminViewProfileCompany";
    }

}
