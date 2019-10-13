package com.btl.findjob.service;

import java.util.List;

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
    public int keychk(@Param("user_email") String user_email, @Param("key") String key) {

        return mapper.keychk(user_email, key);
    }

    @Override
    public void auth_ok(String user_email) {

        mapper.auth_ok(user_email);

    }

    @Override
    public int login(@Param("user_email") String user_email, @Param("user_password") String user_password) {

        return mapper.login(user_email, user_password);
    }


    @Override
    public void snsjoin_insert(@Param("user_email") String user_email, @Param("user_name") String user_name, @Param("user_password") String user_password, @Param("authorization") int authorization, @Param("sns_key") String sns_key, @Param("sns_type") String sns_type) {
        mapper.snsjoin_insert(user_email, user_name, user_password, authorization, sns_key, sns_type);
    }

    @Override
    public String getsalt(String user_email) {

        return mapper.getsalt(user_email);
    }

    @Override
    public int snschk(String user_email) {

        return mapper.snschk(user_email);
    }

    @Override
    public String snstype(String user_email) {
        return mapper.snstype(user_email);
    }

    @Override
    public int gradechk(String user_email) {

        return mapper.gradechk(user_email);
    }

    @Override
    public void upkey(@Param("user_email") String user_email, @Param("key") String key) {

        mapper.upkey(user_email, key);

    }

    @Override
    public void auth_null(String user_email) {

        mapper.auth_null(user_email);
    }

    @Override
    public void pw_modify(@Param("user_password") String user_password, @Param("salt") String salt, @Param("user_email") String user_email) {
        mapper.pw_modify(user_password, salt, user_email);

    }

    @Override
    public String getname(String user_email) {

        return mapper.getname(user_email);
    }

    @Override
    public void join_insert(@Param("user_email") String user_email, @Param("user_password") String user_password, @Param("user_name") String user_name, @Param("authorization") int authorization, @Param("salt") String salt) {

        mapper.join_insert(user_email, user_password, user_name, authorization, salt);
    }

    @Override
    public List<UserDTO> user_info(String user_email) {

        return mapper.user_info(user_email);
    }

    @Override
    public void name_modify(@Param("user_email") String user_email, @Param("user_name") String user_name) {
        mapper.name_modify(user_email, user_name);
    }

    @Override
    public String get_userid(String user_email) {

        return mapper.get_userid(user_email);
    }

	@Override
	public int namechk(String user_name) {
	
		return mapper.namechk(user_name);
	}
}
