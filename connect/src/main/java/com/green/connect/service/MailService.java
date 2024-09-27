package com.green.connect.service;

import java.time.LocalDateTime;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.connect.dao.EmailDao;
import com.green.connect.dto.Email;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MailService {

	 @Autowired
	    private JavaMailSender mailSender;

	    @Autowired
	    private EmailDao emailDao;

	    @Transactional
	    public String sendVerificationEmail(String email, String username) {
	        String verificationCode = generateVerificationCode();
	        SimpleMailMessage message = new SimpleMailMessage();
	        message.setTo(email);
	        message.setSubject("이메일 인증 코드");
	        message.setText("귀하의 인증 코드는 " + verificationCode + " 입니다.");
	        mailSender.send(message);

	        Email existingVerification = emailDao.getVerificationByEmail(email);
	        if (existingVerification != null) {
	            existingVerification.setVerificationCode(verificationCode);
	            existingVerification.setExpirationTime(LocalDateTime.now().plusMinutes(30));
	            existingVerification.setVerified(false);
	            emailDao.updateVerification(existingVerification);
	        } else {
	            Email verification = new Email();
	            verification.setEmail(email);
	            verification.setUsername(username);
	            verification.setVerificationCode(verificationCode);
	            verification.setExpirationTime(LocalDateTime.now().plusMinutes(30));
	            verification.setVerified(false);
	            emailDao.insertVerification(verification);
	        }

	        return verificationCode;
	    }

	    @Transactional
	    public boolean verifyEmail(String email, String code) {
	        log.info("Verifying email: {} with code: {}", email, code);
	        Email verification = emailDao.getVerificationByEmail(email);
	        log.info("Retrieved verification: {}", verification);
	        
	        if (verification == null) {
	            log.warn("Verification not found for email: {}", email);
	            return false;
	        }
	        
	        if (verification.getVerificationCode() == null) {
	            log.warn("Verification code is null for email: {}", email);
	            return false;
	        }
	        
	        if (verification.getVerificationCode().equals(code) &&
	            verification.getExpirationTime().isAfter(LocalDateTime.now())) {
	            verification.setVerified(true);
	            emailDao.updateVerification(verification);
	            log.info("Email verified successfully: {}", email);
	            return true;
	        }
	        
	        log.warn("Email verification failed for: {}. Reason: {}", email, 
	            verification.getVerificationCode().equals(code) ? "Expired" : "Invalid code");
	        return false;
	    }

	    public boolean isEmailVerified(String email) {
	        Email verification = emailDao.getVerificationByEmail(email);
	        return verification != null && verification.isVerified();
	    }

	    private String generateVerificationCode() {
	        Random random = new Random();
	        return String.format("%06d", random.nextInt(999999));
	    }

}
