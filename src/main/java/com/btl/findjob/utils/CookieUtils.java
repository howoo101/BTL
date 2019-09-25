package com.btl.findjob.utils;

import javax.servlet.http.Cookie;

public class CookieUtils {
	
	public static Cookie getCookie(Cookie[] cookies,String name) {
		Cookie cookie = null;
		for(int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals(name)) {
				cookie = cookies[i];
			}
		}
		return cookie;
	}
	
	public static String getValue(Cookie[] cookies,String name) {
		Cookie cookie = getCookie(cookies,name);
		return cookie.getValue();
	}
	
	public static String[] getValues(Cookie[] cookies, String name) {
		String[] arr = null;
		for(int i = 0; i < cookies.length; i++) {
			if(cookies[i].getName().equals(name)) {
				arr = cookies[i].getValue().split("/");
			}
		}
		
		return arr;
	}
}
