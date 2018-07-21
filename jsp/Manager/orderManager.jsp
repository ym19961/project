<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script LANGUAGE="JavaScript">
<!-- 弹出窗口-->
function accept1(orderid) {
	var url='accept?orderid='+orderid; //转向网页的地址;    	        
	location.href=url;
}
function del(orderid) {
	var url='refuse?orderid='+orderid; //转向网页的地址;    	       
	location.href=url;
}
function queryDishinfo(orderid) {
	var url = 'queryDishinfo?orderid='+orderid;
	var l=(screen.availWidth-1000)/2;
	var t=(screen.availHeight-600)/2;        
	window.open(url,'newwindow','width=1040,height=500,top='+t+',left='+l+',toolbar=no,menubar=no,location=no,status=yes');
}
</script>

<body>
	<!-- header -->

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="adminmanage">
			<p>欢迎您</p>
		</div>
		<div class="adminManage">
			<table border=2>
				<tr>
					<th>订单号</th>
					<th>用户名</th>
					<th>查看</th>
					<th>地址</th>
					<th>phone</th>
					<th>状态</th>
					<th>拒绝</th>
					<th>接受</th>
				</tr>
				<c:forEach var="order" items="${orderAll}" varStatus="i">
					<tr>
						<td>${order.orderid}</td>
						<td>${order.username}</td>
						<td>
							<a href="#" onclick="queryDishinfo('${order.orderid}','order');" style="text-decoration: underline;">点击查看</a>
						</td>
						<td>${order.address}</td>
						<td>${order.phone}</td>
						<td>${order.state}</td>
						<td><input type="button"
							onclick="del('${order.orderid}');" value="拒绝">
						</td>
						<td><input type="button" id="sub2" name="sub2"
							onclick="accept1('${order.orderid}');" value="接受" /></td>
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