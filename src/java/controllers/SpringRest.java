/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import dao.StudentDAO;
import dao.TeacherDAO;
import entities.Student;
import entities.Teacher;
import helper.BCrypt;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SpringRest {

    @Autowired
    private StudentDAO userDao;

    @Autowired
    private TeacherDAO teacherDao;

    @RequestMapping(value = "/ajax.htm", method = RequestMethod.GET, headers = "Accept=*/*",
            produces = "application/json")
    public @ResponseBody
    String getAllGuestsByRest(@RequestParam("userInput") String userInput) throws JsonProcessingException {
        List<Student> students = userDao.searchUser(userInput);
        List<Teacher> teachers = teacherDao.searchUser(userInput);
        if (students.size() == 1 || teachers.size() == 1) {
            String json = "[{\"message\":\"username already exists!\"}]";
            return json;
        } else {
            String json = "[{\"message\":\"komple!\"}]";
            return json;
        }
    }

    @RequestMapping(value = "/passCheckStudent.htm", method = RequestMethod.GET, headers = "Accept=*/*",
            produces = "application/json")
    public @ResponseBody
    String passCheckStudent(@RequestParam("oldPass") String oldPass, @RequestParam("id") int id) throws JsonProcessingException {
        Student student = userDao.findStudent(id);
        if (BCrypt.checkpw(oldPass, student.getPassword())) {
            String json = "[{\"message\":\"passwords match!\"}]";
            return json;
        } else {
            String json = "[{\"message\":\"wrong old password!!!\"}]";
            return json;
        }
    }

}
