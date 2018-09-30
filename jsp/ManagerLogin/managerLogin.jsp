<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login In</title>
<!-- Custom Theme files -->
<link href="<%=path %>/css/loginstyle.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
	<style type="text/css">
		span{
			color:red;
		}
	</style>
</head>
<body>
<div class="login">
	<h2>Accessed Form</h2>
	<div class="login-top">
		<h1>LOGIN FORM</h1>
		<form action="../ManagerLogin/managerLogin" method="post">
			<input type="text" name="userid" id="userid" placeholder="User Id"/>
			<input type="password" name="password" id="password" placeholder="Password"/>
			<span>${requestScope.errinfo}</span>
			<div class="forgot">
		    	<input type="submit" value="Login" id="checkUser" />
		    </div>
		</form>
	</div>
</div>	
</body>
</html>