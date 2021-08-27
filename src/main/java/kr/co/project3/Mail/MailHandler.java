// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MailHandler.java

package kr.co.project3.Mail;

import java.io.UnsupportedEncodingException;
import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler
{

    public MailHandler(JavaMailSender mailSender)
        throws MessagingException
    {
        this.mailSender = mailSender;
        message = this.mailSender.createMimeMessage();
        messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    }

    public void setSubject(String subject)
        throws MessagingException
    {
        messageHelper.setSubject(subject);
    }

    public void setText(String htmlContent)
        throws MessagingException
    {
        messageHelper.setText(htmlContent, true);
    }

    public void setFrom(String email, String name)
        throws UnsupportedEncodingException, MessagingException
    {
        messageHelper.setFrom(email, name);
    }

    public void setTo(String email)
        throws MessagingException
    {
        messageHelper.setTo(email);
    }

    public void addInline(String contentId, DataSource dataSource)
        throws MessagingException
    {
        messageHelper.addInline(contentId, dataSource);
    }

    public void send()
    {
        try
        {
            mailSender.send(message);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    private JavaMailSender mailSender;
    private MimeMessage message;
    private MimeMessageHelper messageHelper;
}
