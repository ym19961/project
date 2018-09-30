<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<script src="<%=path%>/js/Ajquery-2.2.2.min.js"></script>
<script src="<%=path%>/js/AJsonTools.js"></script>
<script type="text/javascript">
function onSubmit(){
	var userid = $('#userid').val();
	var password = $('#password').val();
	var username = $('#username').val();
	if(userid.trim()==""){
		   alert("管理员编号不能为空！");
		   return false;
	   }else if(username.trim()==""){
		   alert("姓名不能为空！");
		   return false;
	   }else if(password.trim()==""){
		   alert("密码不能为空！");
		   return false;
	   }else{
		   var r = confirm("确认添加？");
		   if(r == true){
			$.post("add_Manager",{userid:userid,password:password,username:username},function(text){
					if(text=="1"){
						alert("新增成功！");
						window.close();
						window.opener.location.reload();
						window.location.reload(); 		
					}else if(text=="-1"){
						alert("新增失败，管理员账号或管理员姓名可能存在重复，请重新填写！");
						window.location.reload(); 		
					}else{
						alert("新增失败！"); 
						window.location.reload(); 		
					}
				}); 
		   	}else {
				return false;
		   	}
	   }
	
}
</script>
<head>

</head>
<body>
	<div class="adminadd">
		<table border="1" id="right_table1" align="center">
			<tr>
				<th>管理员编号</th>
				<th>管理员姓名</th>
				<th>管理员密码</th>
			</tr>
			<tr>
				<td><input type="text" name="userid" id="userid"
					placeholder="您的编号" required="true" /></td>
				<td><input type="text" name="username" id="username" placeholder="您的姓名"
					required="true" /></td>
				<td><input type="password" name="password" id="password"
					placeholder="您的密码" required="true" /></td>
			</tr>
		</table>
		<br/>
		<div class="button" align="center">
			<input type="button" id="sub1" onclick="onSubmit()" value="新增"
				style="font-size: 18px;" />
		</div>
	</div>
</body>
<style type="text/css">
#adminadd {
	width: 100%;
	overflow: hidden;
	height: 580px;
	overflow: auto;
}

#right_table1 {
	width: 880px;
	height: 100px;
}

#right_table1 th {
	background: #eee;
	text-align: center;
	width: 290px;
}

#right_table1 td {
	width: 290px;
	text-align: center;
	height: 100px;
	background-color: #E9F8FF;
}

#right_table1 td input {
	font-family: "楷体";
	font-size: 18px;
}

input[type=text] ,input[type=password]{
	text-align: center;
}

input[type=button] {
	font-size: 18px;
	font-family: "楷体";
}

div:first-child {
	margin-top: 40px;
}
</style>
</html>