package com.btl.findjob.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.btl.findjob.mapper.UserMapper;
import com.btl.findjob.model.UserDTO;

@Service
public class UserServiceImpl implements UserService {

@Autowired
UserMapper mapper;
	
	
	@Override
	public int emailchk(String user_email) {
		
		return mapper.emailchk(user_email);
	}


	@Override
	public void join_insert(@Param("user_email") String user_email,@Param("user_password") String user_password,@Param("key") String key,@Param("authorization") int authorization,@Param("salt") String salt) {
		
		
		 mapper.join_insert(user_email,user_password,key,authorization,salt);
		
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


	@Override
	public void snsjoin_insert(@Param("user_email") String user_email,@Param("user_password") String user_password,@Param("authorization") int authorization) {
		
		mapper.snsjoin_insert(user_email, user_password, authorization);
		
	}


	@Override
	public String getsalt(String user_email) {

		return mapper.getsalt(user_email);
	}


	@Override
	public void snsinfo(@Param("sns_id") String sns_id,@Param("sns_type") String sns_type,@Param("sns_name") String sns_name,@Param("sns_profile") String sns_profile) {
			mapper.snsinfo(sns_id, sns_type, sns_name, sns_profile);
	}


	@Override
	public void snsupdate(@Param("sns_id") String sns_id,@Param("sns_type") String sns_type,@Param("sns_name") String sns_name,@Param("sns_profile") String sns_profile,@Param("user_email") String user_email) {
		 
		mapper.snsupdate(sns_id, sns_type, sns_name, sns_profile, user_email);
		
	}


	@Override
	public int snschk(String user_email) {
		
		return mapper.snschk(user_email);
	}


	@Override
	public String snstype(String user_email) {
		return mapper.snstype(user_email);
	}



}
