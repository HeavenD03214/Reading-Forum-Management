package com.nt.nothing.service.impl;

import com.nt.nothing.mapper.EmailMapper;
import com.nt.nothing.pojo.Email;
import com.nt.nothing.service.EmailService;
import jakarta.mail.Message;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @Description TODO
 * @Author HeavenDirt
 * @Date 2024/7/11 10:09
 */
@Service
public class EmailServiceImpl implements EmailService {
    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private EmailMapper emailMapper;

    public String sendMail(String email) {
        // 验证邮箱格式
        if (!isValidEmail(email)) {
            //邮箱格式错误返回--1
            return "1";
        }
        String code = Double.toString(Math.random()).substring(2, 8);     // 生成随机验证码
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
                mimeMessage.setRecipient(Message.RecipientType.TO,
                        new InternetAddress(email));
                mimeMessage.setFrom(new InternetAddress("1989375151@qq.com"));
                mimeMessage.setText("Dear " + "Your code number is " + code + ".");
            }
        };
        try {
            this.mailSender.send(preparator);
            Date time= new Date();
            Email email0 = new Email(email,code,time);
            emailMapper.inser(email0);
            return code; // 返回生成的验证码
        } catch (MailException ex) {
            System.err.println(ex.getMessage());
            return null;
        }

    }
    //判断email格式问题
    public boolean isValidEmail(String email) {
        String EMAIL_PATTERN = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@" +
                "(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        Pattern pattern = Pattern.compile(EMAIL_PATTERN);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    //验证码验证方法
    public boolean verifyCode(String email, String code) {
        long timeStamp = new Date().getTime() - 10 * 60 * 1000; // 10分钟
        Date time = new Date(timeStamp);
        Email email0 = new Email(email,code,time);
        Email emailObject = emailMapper.findByEmailAndCodeAndExpiryTime(email0);
        if (emailObject != null && !emailObject.getCode().isEmpty()) {
            // 验证码有效且在有效期内
            emailMapper.delete(emailObject); // 验证成功后删除验证码
            return true;
        }
        return false;
    }

}
