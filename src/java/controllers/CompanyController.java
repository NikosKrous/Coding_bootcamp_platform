/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.CompanyDAO;
import dao.JobsDao;
import dao.StudentDAO;
import entities.Company;
import entities.Jobs;
import entities.Student;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
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

@Controller
@RequestMapping(value = "/company")
public class CompanyController {

    @Autowired
    private StudentDAO studentDao;

    @Autowired
    private CompanyDAO companyDao;

    @Autowired
    StudentValidator studentValidator;

    @Autowired
    ServletContext servletContext;

    @Autowired
    private JobsDao jobsDao;

    @RequestMapping(value = "/companyHome.htm", method = RequestMethod.GET)
    public String companyHome(ModelMap model, HttpSession session) {
        Company comp = ((Company) (session.getAttribute("company")));
        session.setAttribute("company", comp);
        model.addAttribute("companyForUpdate", comp);
        Jobs job = new Jobs();
        model.addAttribute("job", job);
        List<Jobs> jobs = jobsDao.allJobs(comp);
        servletContext.setAttribute("jobsList", jobs);
        return "companyProfile";
    }

    @RequestMapping(value = "/companySettings.htm", method = RequestMethod.GET)
    public String companySettings(ModelMap model) {
        return "companySettings";
    }

    @RequestMapping(value = "/students.htm", method = RequestMethod.GET)
    public String students(ModelMap model) {
        List<Student> student = studentDao.allStudents();
        servletContext.setAttribute("studentList", student);
        return "studentProfilesForCompany";
    }

    @RequestMapping(value = "/companyProfileView.htm", method = RequestMethod.POST)
    public String companyProfileView(@RequestParam String action, ModelMap model, @RequestParam("comid") int comid) {

        return "companyProfileView";
    }

    @RequestMapping(value = "/updateCompanyEstablished.htm", method = RequestMethod.POST)
    public String updateCompanyEstablished(@ModelAttribute Company company, ModelMap model, HttpSession session) {
        Date established = (Date) company.getEstablished();
        Calendar cal = Calendar.getInstance();
        cal.setTime(established);
        cal.add(Calendar.DATE, 1);
        Company comp = ((Company) (session.getAttribute("company")));
        comp.setEstablished(company.getEstablished());
        companyDao.updateCompany(comp);
        return "redirect:/company/companyHome.htm";
    }

    @RequestMapping(value = "/updateCompanyDescription.htm", method = RequestMethod.POST)
    public String udpateInfo(ModelMap model, @ModelAttribute Company company, HttpSession session) {
        String description = company.getDescription();
        Company comp = (Company) session.getAttribute("company");
        comp.setDescription(description);
        model.addAttribute("companyForUpdate", comp);
        companyDao.updateCompany(comp);
        return "redirect:/company/companyHome.htm";
    }

    @RequestMapping(value = "/addJobs.htm", method = RequestMethod.POST)
    public String addJobs(ModelMap model, @ModelAttribute Jobs jobs, BindingResult bindingResult, HttpSession session) {
        jobs.setCompanyid((Company) session.getAttribute("company"));
        jobsDao.insert(jobs);
        return "redirect:/company/companyHome.htm";
    }

    @RequestMapping(value = "/deleteJobs.htm", method = RequestMethod.GET)
    public String deleteJobs(ModelMap model, @RequestParam("jobsId") int jobsId) {
        jobsDao.deleteJobs(jobsId);
        return "redirect:/company/companyHome.htm";
    }

    @RequestMapping(value = "/showStudent.htm", method = RequestMethod.GET)
    public String showStudent(ModelMap model, @RequestParam("studentid") int studentid) {
        Student student = studentDao.showStudents(studentid);
        model.addAttribute("st", student);
        return "companyViewStudent";
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
            model.addAttribute("covererrormsg", "Something wrong happen please try again");
            return "redirect:/company/companyHome.htm";
        }
        Company company = (Company) session.getAttribute("company");
        company.setProfilepic(file.getOriginalFilename());
        companyDao.updateCompany(company);
        return "redirect:/company/companyHome.htm";
    }

    @RequestMapping(value = "/CoverPhotoUpload.htm", method = RequestMethod.POST)
    public String coverPhotoUpload(ModelMap model, @RequestParam("file") MultipartFile file, HttpSession session) {
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
            model.addAttribute("covererrormsg", "Something wrong happen please try again");
            return "redirect:/company/companyHome.htm";
        }
        Company company = (Company) session.getAttribute("company");
        company.setCoverpic(file.getOriginalFilename());
        companyDao.updateCompany(company);
        return "redirect:/company/companyHome.htm";
    }

}
