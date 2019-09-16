package com.btl.findjob.service;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;



@Service
public class MailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	


public void mailSendWithUserKey(@Param("user_email") String user_email,@Param("user_emailauthkey") String user_emailauthkey,HttpServletRequest request) {
			
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 BTL 취업지원 사이트 입니다.</h2><br><br>" 
				+ "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다  : " 
				+ "<a href='http://localhost:8282" + request.getContextPath() + "/key_alter?user_email="+user_email+"&user_emailauthkey="+user_emailauthkey+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[인증] BTL 취업지원 사이트의 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(user_email));
			mailSender.send(mail);	
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		

	}
}