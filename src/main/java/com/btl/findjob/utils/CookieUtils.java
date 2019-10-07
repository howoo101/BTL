package com.btl.findjob.utils;

import javax.servlet.http.Cookie;

public class CookieUtils {

    public static Cookie getCookie(Cookie[] cookies, String name) {
        Cookie cookie = null;
		for (Cookie value : cookies) {
			if (value.getName().equals(name)) {
				cookie = value;
			}
		}
        return cookie;
    }

    public static String getValue(Cookie[] cookies, String name) {
        Cookie cookie = getCookie(cookies, name);
        return cookie.getValue();
    }

    public static String[] getValues(Cookie[] cookies, String name) {
        String[] arr = null;
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals(name)) {
				arr = cookie.getValue().split("/");
			}
		}
        return arr;
    }
}
