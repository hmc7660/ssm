<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录失败</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
	a{
		display: block;
		text-align: center;
	}
	h2{
		color: red;
	}
</style>
</head>
<body>
<br/>
<br/>
<br/>
<h2 align="center">${message}</h2>
<br/>

    <a text-align="center" href="${APP_PATH }/index">
        <button type="button" class="btn btn-default btn-lg">返回登录</button>
    </a>

</body>
</html>