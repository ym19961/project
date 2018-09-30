<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>管理员管理页面</title>
<link href="<%= path%>/css/Abootstrap.css" rel='stylesheet'
	type='text/css' />
<script src="<%=path%>/js/Ajquery-2.2.2.min.js"></script>
<link href="<%= path%>/css/Adashboard.css" rel="stylesheet">
<link href="<%= path%>/css/Astyle.css" rel='stylesheet' type='text/css' />
</head>
<script type="text/javascript">
<!-- 弹出窗口-->
function add(input,index,userid) {
	var url='addManager'; //转向网页的地址;    	
	var l=(screen.availWidth-800)/2;
	var t=(screen.availHeight-450)/2;        
	window.open(url,'newwindow','width=900,height=400,top='+t+',left='+l+',toolbar=no,menubar=no,location=no,status=yes');
}
function update(input,index,userid) {
	var url='updateManager?userid='+userid; //转向网页的地址;    	
	var l=(screen.availWidth-800)/2;
	var t=(screen.availHeight-450)/2;        
	window.open(url,'newwindow','width=900,height=400,top='+t+',left='+l+',toolbar=no,menubar=no,location=no,status=yes');
	
}
</script>
<script type="text/javascript">
function del(userid){
	var r=confirm("确定删除？");
	 if(r==false){
		 alert("取消删除！");
	 }else{
		$.post("deleteManagerById",{userid:userid},function(text){
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
			<p>欢迎您,${admin.username}</p>
		</div>
		<div class="newadd">
			<c:if test="${admin.userid=='manager'}">
				<input type="button"
					onclick="add(this,'${i.index+1 }','${admin.userid }')"
					value="新增管理员">
			</c:if>
		</div>
		<div class="adminManage">
			<table border=2 >
				<tr>
					<th>管理员编号</th>
					<th>管理员姓名</th>
					<th>修改</th>
					<c:if test="${admin.userid=='manager'}">
						<th>删除</th>
					</c:if>
				</tr>
			<c:if test="${admin.userid != 'manager'}">
				<td>${admin.userid }</td>
				<td>${admin.username }</td>
				<td><input type="button" 
						onclick="update(this,'${i.index+1 }','${F_admin.userid }')"
								value="修改">
				</td>
			</c:if>
			<c:if test="${admin.userid == 'manager'}">
				<c:forEach var="F_admin" items="${adminAll}" varStatus="i">
					<tr>
						<td>${F_admin.userid }</td>
						<td>${F_admin.username }</td>
						<c:if test="${admin.userid == 'manager'}">
							<td><input type="button"
								onclick="update(this,'${i.index+1 }','${F_admin.userid }')"
								value="修改">
							</td>
						</c:if>
						<c:if test="${admin.userid == 'manager'}">
							<c:if test="${F_admin.userid != 'manager'}">
								<td><input type="button" id="sub2" name="sub2"
								onclick="del(${F_admin.userid});" value="删除" />
								</td>
							</c:if>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
			</table>
		</div>
		<!----->
	</div>
	<div class="clearfix"></div>
	<!---->

	<!---->
</body>
</html>