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
<script type="text/javascript">
function del(commentid){
	var r=confirm("确定删除？");
	if(r==false){
		return false;
	 }else{
		$.post("deletecommentById",{commentid:commentid},function(text){
				if(text=="1"){
					alert("删除成功！");
					window.location.reload(); 
				}else{
					alert("删除失败！");
					window.location.reload();
				}
			}); 
	   }
} 
</script>
<body>
	<!-- header -->

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="adminmanage">
			<p>欢迎您,管理员</p>
		</div>
		<div class="adminManage">
			<table border=2>
				<tr>
					<th>用户名</th>
					<th>菜品名</th>
					<th>内容</th>
					<th>时间</th>
					<th>删除</th>
				</tr>
				<c:forEach var="comment" items="${commentAll}" varStatus="i">
					<tr>
						<td>${comment.username}</td>
						<td>${comment.dname}</td>
						<td>${comment.commentary}</td>
						<td>${comment.cdate}</td>
						<td><input type="button" id="sub2" name="sub2"
							onclick="del(${comment.commentid});" value="删除" /></td>
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