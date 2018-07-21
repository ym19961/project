<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<title>评论管理页面</title>
<link href="<%= path%>/css/Abootstrap.css" rel='stylesheet'
	type='text/css' />
<script src="<%=path%>/js/Ajquery-2.2.2.min.js"></script>
<link href="<%= path%>/css/Adashboard.css" rel="stylesheet">
<link href="<%= path%>/css/Astyle.css" rel='stylesheet' type='text/css' />
</head>
<script LANGUAGE="JavaScript">
<!-- 弹出窗口-->
function update(input,index,dishid) {
	var url='updateDish?dishid='+dishid; //转向网页的地址;    	
	var l=(screen.availWidth-900)/2;
	var t=(screen.availHeight-450)/2;        
	window.open(url,'newwindow','width=1040,height=450,top='+t+',left='+l+',toolbar=no,menubar=no,location=no,status=yes');
}

 function add(input,index,dishid) {
	var url='addDish'; //转向网页的地址;    	
	var l=(screen.availWidth-900)/2;
	var t=(screen.availHeight-450)/2;        
	location.href=url;
}
</script>
<script type="text/javascript">
function del(dishid){
	var r=confirm("确定删除？");
	if(r==false){
		return false;
	 }else{
		$.post("deletedishById",{dishid:dishid},function(text){
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

function queryAndUpdatePicture(dishid) {
	var url = 'queryPicture?dishid='+dishid;
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
		<div class="newadd">
			<input type="button"
				onclick="add(this,'${i.index+1 }','${admin.adminno }')" value="新增菜品">
		</div>
		<div class="adminManage">
			<table border=2>
				<tr>
					<th>菜品号</th>
					<th>菜品名</th>
					<th>菜品类</th>
					<th>单价</th>
					<th>点击查看</th>
					<th>修改</th>
					<th>删除</th>
				</tr>
				<c:forEach var="dish" items="${dishAll}" varStatus="i">
					<tr>
						<td>${dish.dishid}</td>
						<td>${dish.dname}</td>
						<td>${dish.dinfo}</td>
						<td>${dish.dvalue}</td>
						<td>
							<a href="#" onclick="queryAndUpdatePicture('${dish.dishid}','dish');" style="text-decoration: underline;">点击查看</a>
						</td>
						<%-- <td><img src="${dish.picture}"
							style="width: 60px; height: 100px;" alt="暂未上传图片" /></td> --%>
						<td><input type="button"
							onclick="update(this,'${i.index+1}','${dish.dishid}')" value="修改">
						</td>
						<td><input type="button" id="sub2" name="sub2"
							onclick="del(${dish.dishid});" value="删除" /></td>
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