/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package converters;

import dao.StreamDAO;
import entities.Stream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

/**
 *
 * @author krocos
 */
@Component
public class StreamConverter implements Converter<String, Stream> {

    @Autowired
    StreamDAO streamDao;

    @Override
    public Stream convert(String str) {
        return streamDao.findStream(Integer.parseInt(str));
    }

}
