package com.btl.findjob.mapper;

import org.apache.ibatis.annotations.Param;

import com.btl.findjob.model.UserDTO;

public interface UserMapper {
	
	public int emailchk(String user_email);

	public void join_insert(@Param("user_email") String user_email,@Param("user_password") String user_password,@Param("key") String key,@Param("authorization") int authorization,@Param("salt") String salt);

	public void snsjoin_insert(@Param("user_email") String user_email,@Param("user_password") String user_password,@Param("authorization") int authorization);

	public void snsinfo(@Param("sns_id") String sns_id,@Param("sns_type") String sns_type,@Param("sns_name") String sns_name,@Param("sns_profile") String sns_profile);
	
	public void snsupdate(@Param("sns_id") String sns_id,@Param("sns_type") String sns_type,@Param("sns_name") String sns_name,@Param("sns_profile") String sns_profile,@Param("user_email") String user_email);
	
	public int snschk(String user_email);
	
	public String snstype(String user_email);
	
	public int keychk(@Param("user_email") String user_email,@Param("key") String key);
	
	public void auth_ok(String user_email);
	
	public int login(@Param("user_email") String user_email,@Param("user_password") String user_password);
	
	public String getsalt(String user_email);
}
