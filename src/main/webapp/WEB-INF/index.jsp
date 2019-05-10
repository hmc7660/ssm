<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录页面</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
	<style>
		body{
			padding:240px;
			background-image: url(${APP_PATH }/static/images/1.jpg);
			background-repeat: no-repeat;
		}
	</style>
</head>
<body>
<!--  <h2 class="text-center">客户信息管理系统登录界面</h2> -->
<div class="row">
  <div class="col-md-2">
  </div>
  <div class="col-md-8">
  	<h2 class="text-center">客户信息管理登录界面</h2>
  </div>
  <div class="col-md-2"></div>
</div>

<hr/>
<form action="${APP_PATH }/login" method="post" class="form-inline text-center">
    <label>username:</label>
    <input type="text" class="form-control" name="username"/>
    <br/>
    <br/>
    <label>password:</label>
    <input type="password" class="form-control" name="password"/>
    <br/>
    <br/>
    <input type="submit" value="登录" class="btn btn-default"/>
</form>
</body>
</html>