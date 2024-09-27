package com.green.connect.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.green.connect.dto.Email;

@Mapper
public interface EmailDao {
	
	void insertVerification(Email email);
    Email getVerificationByEmail(String email);
    void updateVerification(Email email);
    List<Email> getEmailsByUsername(String username);

}
