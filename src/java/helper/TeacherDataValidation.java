/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import dao.StudentDAO;
import dao.TeacherDAO;
import entities.Student;
import entities.Teacher;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TeacherDataValidation {

    @Autowired
    private StudentDAO studentDao;

    @Autowired
    private TeacherDAO teacherDao;

    public boolean checkUsername(Teacher teacher) {
        if (teacher.getUsername().length() < 6 || teacher.getUsername().length() > 20) {
            return false;
        }
        for (char c : teacher.getUsername().toCharArray()) {
            if (!Character.isLetterOrDigit(c)) {
                return false;
            }
        }
        return true;
    }

    public boolean checkUsernameUnique(Teacher teacher) {
        List<Student> students = studentDao.checkStudentLogin(teacher.getUsername(), teacher.getPassword());
        List<Teacher> teachers = teacherDao.searchUser(teacher.getUsername());
        if (!students.isEmpty() || !teachers.isEmpty()) {
            return false;
        }
        return true;
    }

    public boolean checkFirstname(Teacher teacher) {
        if (teacher.getFirstname().length() < 2 || teacher.getFirstname().length() > 30) {
            return false;
        }
        for (char c : teacher.getFirstname().toCharArray()) {
            if (!Character.isLetter(c)) {
                return false;
            }
        }
        return true;
    }

    public boolean checkLastname(Teacher teacher) {
        if (teacher.getLastname().length() < 2 || teacher.getLastname().length() > 30) {
            return false;
        }
        for (char c : teacher.getLastname().toCharArray()) {
            if (!Character.isLetter(c)) {
                return false;
            }
        }
        return true;
    }

    public boolean checkPassword(Teacher teacher) {
        if (teacher.getPassword().length() < 6 || teacher.getPassword().length() > 30) {
            return false;
        }
        boolean hasUppercase = !teacher.getPassword().equals(teacher.getPassword().toLowerCase());
        boolean hasNumber = teacher.getPassword().matches(".*\\d.*");
        boolean specialChar = !teacher.getPassword().matches("[a-zA-Z0-9 ]*");
        if (hasUppercase == false || specialChar == false || hasNumber == false) {
            return false;
        }
        return true;
    }

    public boolean checkPasswords(String password, String confirmPassword) {
        if (password.equals(confirmPassword)) {
            return true;
        } else {
            return false;
        }
    }

}
