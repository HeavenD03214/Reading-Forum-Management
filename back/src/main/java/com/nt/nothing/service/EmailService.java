package com.nt.nothing.service;

public interface EmailService {
    String sendMail(String email);

    boolean verifyCode(String email, String code);

    boolean isValidEmail(String email);
}
