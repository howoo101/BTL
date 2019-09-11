package com.btl.findjob.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.UserMapper;

@Service
@Component("emailchk")
public class UserServiceImpl implements UserService {

@Autowired
UserMapper mapper;
	
	
	@Override
	public int emailchk(String user_email) {
		
		return mapper.emailchk(user_email);
	}

}
