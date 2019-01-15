
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helper;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailService {

    static Properties mailserverproperties;

    static Session mailsession;

    static MimeMessage mymailmessage;

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    private String receiver;
    private String subject;
    private String message;

    public void sendmail() {

        try {

            System.out.println("\n 1st ===> setup Mail Server Properties..");

            // current system properties.
            mailserverproperties = System.getProperties();
            mailserverproperties.put("mail.smtp.port", "587");
            mailserverproperties.put("mail.smtp.auth", "true");
            mailserverproperties.put("mail.smtp.starttls.enable", "true");
            mailsession = Session.getInstance(mailserverproperties, null);
            mymailmessage = new MimeMessage(mailsession);
            try {
                mymailmessage.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
                mymailmessage.setSubject(subject);
            } catch (MessagingException ex) {
                Logger.getLogger(MailService.class.getName()).log(Level.SEVERE, null, ex);
            }

            Multipart multipart = new MimeMultipart();
            MimeBodyPart mimeBodyPartforBody = new MimeBodyPart();
            multipart.addBodyPart(mimeBodyPartforBody);
            String emailBody = "You are in our newssletter!!";
            mimeBodyPartforBody.setText(message);
            mymailmessage.setContent(multipart);
            Transport transport = mailsession.getTransport("smtp");
            transport.connect("smtp.gmail.com", "mnkn.project@gmail.com", "jqzluqdktacrvriu");
            transport.sendMessage(mymailmessage, mymailmessage.getAllRecipients());
            transport.close();

        } catch (AddressException ex) {

            Logger.getLogger(MailService.class.getName()).log(Level.SEVERE, null, ex);

        } catch (MessagingException ex) {
            Logger.getLogger(MailService.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
