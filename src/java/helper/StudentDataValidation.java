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
public class StudentDataValidation {

    @Autowired
    private StudentDAO studentDao;

    @Autowired
    private TeacherDAO teacherDao;

    public boolean checkUsername(Student st) {
        if (st.getUsername().length() < 6 || st.getUsername().length() > 20) {
            return false;
        }
        for (char c : st.getUsername().toCharArray()) {
            if (!Character.isLetterOrDigit(c)) {
                return false;
            }
        }
        return true;
    }

    public boolean checkUsernameUnique(Student st) {
        List<Student> students = studentDao.checkStudentLogin(st.getUsername(), st.getPassword());
        List<Teacher> teachers = teacherDao.searchUser(st.getUsername());
        if (!students.isEmpty() || !teachers.isEmpty()) {
            return false;
        }
        return true;
    }

    public boolean checkFirstname(Student st) {
        if (st.getFirstname().length() < 2 || st.getFirstname().length() > 30) {
            return false;
        }
        for (char c : st.getFirstname().toCharArray()) {
            if (!Character.isLetter(c)) {
                return false;
            }
        }
        return true;
    }

    public boolean checkLastname(Student st) {
        if (st.getLastname().length() < 2 || st.getLastname().length() > 30) {
            return false;
        }
        for (char c : st.getLastname().toCharArray()) {
            if (!Character.isLetter(c)) {
                return false;
            }
        }
        return true;
    }

    public boolean checkPassword(Student st) {
        if (st.getPassword().length() < 6 || st.getPassword().length() > 30) {
            System.out.println("Password length problem!");
            return false;
        }
        boolean hasUppercase = !st.getPassword().equals(st.getPassword().toLowerCase());
        boolean hasNumber = st.getPassword().matches(".*\\d.*");
        boolean specialChar = !st.getPassword().matches("[a-zA-Z0-9 ]*");
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
