<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러다 에러~~~~~</title>
</head>
<body>
	<h2>${exception.getMessage() }</h2>
	<img src="resources/img/error.gif">
</body>
</html>