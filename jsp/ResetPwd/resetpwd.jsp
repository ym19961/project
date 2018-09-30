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
<title>Tasty重置密码</title>
<style type="text/css">
	#errinfo{
		color:red;
	}
</style>
<script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#errinfo").hide();
		$("#toreset").click(function(){
			var newpassword = $("#newpassword").val();
			var repassword = $("#repassword").val();
			var userid=$("#userid").text();
			
			if(newpassword!=repassword){
				$("#errinfo").show();
			}else{
				$("#errinfo").hide();
				$.post("../ResetPwd/toresetpwd",{"newpassword":newpassword,"userid":userid},function(data){
					if(data==1){
						alert("修改密码成功！");
						location.href="../Login/login";
					}else{
						alert("密码重置失败！ ");
						location.reload();
					}
				});
			}
		});
	});
</script>
<body>
	<h2>重置您的密码</h2>
	<form  id="reset">
			<span id="userid">${param.userid }</span>
			请输入您的新密码：<input type="password" name="newpassword" id="newpassword"/>
			请确认您的新密码：<input type="password" name="repassword" id="repassword"/><br/>
			<span id="errinfo">两次密码不一致，请重新输入</span><br/>
		<a href="#" id="toreset">重置</a>
	</form>
</body>
</html>