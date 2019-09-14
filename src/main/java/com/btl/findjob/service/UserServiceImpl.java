package com.btl.findjob.service;

import org.apache.ibatis.annotations.Param;
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


	@Override
	public void join_insert(@Param("user_email") String user_email,@Param("user_password") String user_password,@Param("key") String key,@Param("authorization") int authorization) {
		
		
		 mapper.join_insert(user_email,user_password,key,authorization);
		
	}


	@Override
	public int keychk (@Param ("user_email") String user_email,@Param("key") String key) {

		return mapper.keychk(user_email, key);
	}


	@Override
	public void auth_ok(String user_email) {
		 
		mapper.auth_ok(user_email);
		
	}


	@Override
	public int login(@Param("user_email") String user_email,@Param("user_password") String user_password) {
		
		return mapper.login(user_email,user_password);
	}

}
