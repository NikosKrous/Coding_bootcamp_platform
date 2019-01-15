/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import entities.Company;

public class CompanyDataValidation {

    public static boolean checkPassword(Company company) {
        if (company.getPassword().length() < 6 || company.getPassword().length() > 30) {
            System.out.println("Password length problem!");
            return false;
        }
        boolean hasUppercase = !company.getPassword().equals(company.getPassword().toLowerCase());
        boolean hasNumber = company.getPassword().matches(".*\\d.*");
        boolean specialChar = !company.getPassword().matches("[a-zA-Z0-9 ]*");
        if (hasUppercase == false || specialChar == false || hasNumber == false) {
            return false;
        }
        return true;
    }

    public static boolean checkPasswords(String password, String confirmPassword) {
        if (password.equals(confirmPassword)) {
            return true;
        } else {
            return false;
        }
    }
}
