<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reset Your Password</title>
<script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	
</script>

</head>
<body>
	<h2>发送邮件页</h2>
	<form action="../ResetPwd/tosendmail" method="post">
		请输入您的用户id：
		<input type="text" name="userid" id="userid" />
		<input type="submit" id="tosendmail" value="发送邮件到您的电子邮箱" />
	</form>
</body>
</html>