/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validators;

import entities.Teacher;
import helper.EmailConfirm;
import helper.TeacherDataValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class TeacherValidator implements Validator {

    @Autowired
    private TeacherDataValidation stv;

    @Override
    public boolean supports(Class<?> type) {
        return Teacher.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Teacher teacher = (Teacher) o;
        boolean checkValidationPassword = stv.checkPasswords(teacher.getPassword(), teacher.getPasswordValidation());
        boolean checkUsername = stv.checkUsername(teacher);
        boolean checkUsernameUnique = stv.checkUsernameUnique(teacher);
        boolean checkFirstname = stv.checkFirstname(teacher);
        boolean checkLastname = stv.checkLastname(teacher);
        boolean checkPassword = stv.checkPassword(teacher);
        EmailConfirm ec = new EmailConfirm();
        boolean checkEmail = ec.validateEmail(teacher.getEmail());
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
