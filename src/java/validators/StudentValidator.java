/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validators;

import entities.Student;
import helper.EmailConfirm;
import helper.StudentDataValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class StudentValidator implements Validator {

    @Autowired
    private StudentDataValidation stv;

    @Override
    public boolean supports(Class<?> type) {
        return Student.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Student student = (Student) o;
        boolean checkValidationPassword = stv.checkPasswords(student.getPassword(), student.getPasswordValidation());
        boolean checkUsername = stv.checkUsername(student);
        boolean checkUsernameUnique = stv.checkUsernameUnique(student);
        boolean checkFirstname = stv.checkFirstname(student);
        boolean checkLastname = stv.checkLastname(student);
        boolean checkPassword = stv.checkPassword(student);
        EmailConfirm ec = new EmailConfirm();
        boolean checkEmail = ec.validateEmail(student.getEmail());
        if (checkUsername == false) {
            errors.rejectValue("username", "Username");
        }
        if (checkUsernameUnique == false) {
            errors.rejectValue("username", "UsernameUnique");
        }
        if (checkFirstname == false) {
            errors.rejectValue("firstname", "Firstname");
        }
        if (checkLastname == false) {
            errors.rejectValue("lastname", "Lastname");
        }
        if (checkPassword == false) {
            errors.rejectValue("password", "Password");
        }
        if (checkEmail == false) {
            errors.rejectValue("email", "Email");
        }
        if (checkValidationPassword == false) {
            errors.rejectValue("passwordValidation", "PasswordValidation");
        }
    }

}
