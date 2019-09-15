package com.btl.findjob.service;

import org.apache.ibatis.annotations.Param;

public interface UserService {

	 public int emailchk(String user_email);

	public void join_insert(@Param("user_email") String user_email,@Param("user_password") String user_password,@Param("key") String key,@Param("authorization") int authorization);

	public void snsjoin_insert(@Param("user_email") String user_email,@Param("user_password") String user_password,@Param("authorization") int authorization);
	
	public int keychk(@Param("user_email") String user_email,@Param("key") String key);
	
	public void auth_ok(String user_email);
	
	public int login(@Param("user_email") String user_email,@Param("user_password") String user_password);
}
