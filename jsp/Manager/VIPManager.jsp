<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<title>菜品管理页面</title>
<link href="<%= path%>/css/Abootstrap.css" rel='stylesheet'
	type='text/css' />
<script src="<%=path%>/js/Ajquery-2.2.2.min.js"></script>
<link href="<%= path%>/css/Adashboard.css" rel="stylesheet">
<link href="<%= path%>/css/Astyle.css" rel='stylesheet' type='text/css' />
</head>
<body>
	<!-- header -->

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="adminmanage">
			<p>欢迎您,管理员</p>
		</div>
		<div class="adminManage">
			<table border=2>
				<tr>
					<th>会员ID</th>
					<th>会员名</th>
					<th>邮箱</th>
					<th>性别</th>
					<th>电话</th>
					<th>地址</th>
				</tr>
				<c:forEach var="users" items="${usersAll}" varStatus="i">
					<tr>
						<td>${users.userid}</td>
						<td>${users.username}</td>
						<td>${users.email}</td>
						<td>${users.sex}</td>
						<td>${users.phone}</td>
						<td>${users.address}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<!----->
	</div>
	<div class="clearfix"></div>
	<!---->

	<!---->
</body>
</html>