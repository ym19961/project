<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>	
<head>
<title>订单管理页面</title>
<link href="<%= path%>/css/Abootstrap.css" rel='stylesheet'
	type='text/css' />
<script src="<%=path%>/js/Ajquery-2.2.2.min.js"></script>
<link href="<%= path%>/css/Adashboard.css" rel="stylesheet">
<link href="<%= path%>/css/Astyle.css" rel='stylesheet' type='text/css' />
</head>
<!-- header -->

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
<div class="adminManage">
			<table border=2>
				<tr>
					<th>菜品名</th>
					<th>数量</th>
				</tr>
				<c:forEach var="dish" items="${dishids}" varStatus="i">
					<tr>
						<td>${dish.dname}</td>
						<td>${dish.num}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
			<div class="clearfix"></div>
	<!---->
</div>
	<!---->
</body>
</html>