package com.green.connect.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.green.connect.dao.EmailDao;
import com.green.connect.dao.JoinDao;
import com.green.connect.dto.Email;
import com.green.connect.dto.User;

@Service
public class UserService {

	@Autowired
    private JoinDao joinDao;

    @Autowired
    private EmailDao emailDao;
    
    @Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;

    @Transactional
    public void registerUser(User user, String email) {
        if (isEmailExists(email)) {
            throw new RuntimeException("Email already exists");
        }

        user.setRole("ROLE_USER");
        user.setPassword(bcryptPasswordEncoder.encode(user.getPassword()));
        joinDao.insertUser(user);
        
        Email emailVerification = emailDao.getVerificationByEmail(email);
        if (emailVerification != null && emailVerification.isVerified()) {
            emailVerification.setUsername(user.getUsername());
            emailDao.updateVerification(emailVerification);
        } else {
            throw new RuntimeException("Email not verified");
        }
    }

    public boolean isEmailExists(String email) {
        return joinDao.countByEmail(email) > 0;
    }
	
}
