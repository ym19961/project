<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员主页</title>
<script src="<%= path%>/js/Ajquery.min.js"></script>
<link href="<%=path%>/css/Abootstrap.css" rel='stylesheet' type='text/css' />
<link href="<%=path%>/css/Adashboard.css" rel="stylesheet" type='text/css'/>
<link href="<%=path%>/css/Astyle.css" rel='stylesheet' type='text/css' />
<script LANGUAGE="JavaScript">
<!-- 弹出窗口-->
function update(input,index,dishid) {
	var url='Manager?dishid='+dishid; //转向网页的地址;    	
	var l=(screen.availWidth-900)/2;
	var t=(screen.availHeight-450)/2;        
	window.open(url,'newwindow','width=1040,height=450,top='+t+',left='+l+',toolbar=no,menubar=no,location=no,status=yes');
}
function del(userid){
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
</script>
</head>

<body>
	<div class="col-md-2 sidebar">
		<div class="sidebar_top">
			<h1>
				<a href="admin_index">功能<span>列表</span></a>
			</h1>
		</div>
		<div class="top-navigation">
			<div class="t-img">
				<img src="<%= path%>/images/lines.png" alt="" />
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="drop-navigation">
			<div class="top-menu">
				<ul>
					<li><a href="../AdminManager" target="mainFrame">管理员管理</a></li>
					<li><a href="../dishManager" target="mainFrame">菜肴管理</a></li>
					<li><a href="../VIPManager" target="mainFrame">会员管理</a></li>
					<li><a href="../commentManager" target="mainFrame">评论管理</a></li>
					<li><a href="../orderManager" target="mainFrame">订单管理</a></li>
					<li><a href="../ManagerLogin/managerLogin">注销登录</a></li>
				</ul>
			</div>
			<!-- script-for-menu -->
			<script>
					$( ".top-navigation" ).click(function() {
					$( ".drop-navigation" ).slideToggle( 300, function() {
					// Animation complete.
					});
					});
			</script>

			<div class="side-btm">
				<!--<div class="social-icons">
					<ul>
						<li><a href="#"><span class="fa"> </span></a></li>
						<li><a href="#"><span class="tw"> </span></a></li>
						<li><a href="#"><span class="g"> </span></a></li>
						<li><a href="#"><span class="in"> </span></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>-->
				<div class="copyright">
					<p style="margin: auto 20px;">
						©2016 SUT.版权所有 &copy;<br>由 <a href="http://www.sut.edu.cn/"
							style="text-decoration: underline;" target="new">SUT</a>设计
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- iframe -->
	<div>
		<iframe id="mainFrame" name="mainFrame"
			src="../orderManager" scrolling="auto"
			frameborder="0" height="630" width="100%"> </iframe>
	</div>
	<div class="clearfix"></div>
</body>
</html>
