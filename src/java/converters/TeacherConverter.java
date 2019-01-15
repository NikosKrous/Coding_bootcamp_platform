/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package converters;

import dao.TeacherDAO;
import entities.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

/**
 *
 * @author Bella
 */
@Component
public class TeacherConverter implements Converter<String, Teacher> {

    @Autowired
    TeacherDAO teacherDao;

    @Override
    public Teacher convert(String s) {
        return teacherDao.findTeacherById(Integer.parseInt(s));
    }

}
