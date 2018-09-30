<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<script type="text/javascript">

	
</script>
</head>
<body>
<div class="login">
	<h2>Accessed Form</h2>
	<div class="login-top">
		<h1>LOGIN FORM</h1>
		<form action="../Login/checkUser" method="post">
			<input type="text" name="userid" id="userid" placeholder="User Id"/>
			<input type="password" name="password" id="password" placeholder="Password"/>
			<span>${requestScope.errinfo}</span>
			<div class="forgot">
		    	<a href="../ResetPwd/sendmail">forgot Password</a>
		    	<input type="submit" value="Login" id="checkUser" />
		    </div>
		</form>
	</div>
	<div class ="login-bottom">
		<h3>New User &nbsp;<a href="../Register/register">Register</a>&nbsp Here</h3>
		<%-- <span>${requestScope.errinfo }</span> --%>
	</div>
</div>	




</body>
</html>