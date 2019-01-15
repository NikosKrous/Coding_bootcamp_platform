/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package validators;

import entities.Company;
import helper.CompanyDataValidation;
import helper.EmailConfirm;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class CompanyValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Company.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Company company = (Company) o;
        boolean checkValidationPassword = CompanyDataValidation.checkPasswords(company.getPassword(), company.getPasswordValidation());
        boolean checkPassword = CompanyDataValidation.checkPassword(company);
        EmailConfirm ec = new EmailConfirm();
        boolean checkEmail = ec.validateEmail(company.getEmail());
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
