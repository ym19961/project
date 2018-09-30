<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
        + request.getServerName() + ":" + request.getServerPort()
        + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>文档管理</title>
<link href="<%=path%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link href="<%=path%>/css/styleInner.css" rel="stylesheet" type="text/css" media="all"/>
<link href="<%=path%>/css/style_.css" rel="stylesheet" type="text/css" media="all"/>
<script src="<%=path%>/js/xaja.js"></script>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> 
	addEventListener("load", function() { 
		setTimeout(hideURLbar, 0); 
		}, false); 
	function hideURLbar(){ 
		window.scrollTo(0,1); 
	} 
</script>
<!--Google Fonts-->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="<%=path%>/js/move-top.js"></script>
<script type="text/javascript" src="<%=path%>/js/easing.js"></script>
<script type="text/javascript" src="<%=path%>/js/xaja.js"></script>
	<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
	</script>
<style type="text/css">
	.advance-bottom a{
		color: white;
		text-decoration: none;
	}
	.advance-bottom a:hover{
		color: orange;
	}
</style>
<!-- //end-smoth-scrolling -->
<script src="<%=path%>/js/menu_jquery.js"></script>
</head>
<body>
	<!--header start here-->
	<div class="header1">
		<div class="container">
			<div class="header-main">
				<div class="top-menu">
					<ul>
						<li>
							<div class="btn-group">
								<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
									信息管理
									<span class="caret"></span>
									<span class="sr-only"></span>
								</button>
								<ul class="dropdown-menu" role="menu" style="background-color: #111;">
									<li><a href="tea_main">教师主页</a></li>
									<li><a href="tea_info">信息修改</a></li>
								</ul>
							</div>
						</li>
						<li>
							<div class="btn-group">
								<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
									导师双选
									<span class="caret"></span>
									<span class="sr-only"></span>
								</button>
								<ul class="dropdown-menu" role="menu" style="background-color: #111;">
									<li><a href="tea_both_choices">导师双选</a></li>
								</ul>
							</div>
						</li>
						<li>
							<div class="btn-group">
								<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
									论文管理
									<span class="caret"></span>
									<span class="sr-only"></span>
								</button>
								<ul class="dropdown-menu" role="menu" style="background-color: #111;">
									<li><a href="tea_set_topics">论文出题</a></li>
									<li><a href="tea_topics">文档管理</a></li>
								</ul>
							</div>
						</li>
						<li>
							<a href="tmain"> 
								<img src="<%=path%>/images/lo1.png" alt="">
							</a>
						</li>
						<li>
							<div class="btn-group">
								<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
									日程管理
									<span class="caret"></span>
									<span class="sr-only"></span>
								</button>
								<ul class="dropdown-menu" role="menu" style="background-color: #111;">
									<li><a href="tea_agenda">日程管理</a></li>
								</ul>
							</div>
						</li>
						<li>
							<div class="btn-group">
								<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
									格式下载
									<span class="caret"></span>
									<span class="sr-only"></span>
								</button>
								<ul class="dropdown-menu" role="menu" style="background-color: #111;">
									<li><a href="tea_template">格式下载</a></li>
								</ul>
							</div>
						</li>
						<li>
							<div class="btn-group">
								<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
									${teacher.tname}
									<span class="caret"></span>
									<span class="sr-only"></span>
								</button>
								<ul class="dropdown-menu" role="menu" style="background-color: #111;">
									<li><a href="javascript:;" onclick="updateTeacherPassword();">密码修改</a></li>
									<li><a href="../Logout/logout">注销登录</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<div class="header-logo">
					<div class="logo">
					<a href="tmain"><img src="<%=path%>/images/lo1.png" alt="" ></a>
					</div>
					<div class="top-nav">
						<span class="icon"><img src="<%=path%>/images/menu.png" alt=""> </span>
						<ul>
							<li><a href="tea_main">教师主页</a></li>
							<li><a href="tea_info">信息修改</a> </li>
							<li><a href="tea_both_choices">导师双选</a></li>
							<li><a href="tea_set_topics">论文出题</a></li>
							<li><a href="tea_topics">文档管理</a></li>
							<li><a href="tea_agenda">日程管理</a></li>
							<li><a href="tea_template">格式下载</a></li>
							<li><a href="javascript:;" onclick="updateTeacherPassword();">密码修改</a></li>
							<li><a href="../Logout/logout">注销登录</a></li>
						</ul>
						<!--script-->
					<script>
						$("span.icon").click(function(){
							$(".top-nav ul").slideToggle(500, function(){
							});
						});
					</script>				
					</div>
					<div class="clearfix"> </div>
				</div>
				<!--script-->
			</div>
		</div>
	</div>
	<!--header end here-->
	<div class="main">
		<div class="tea_manage">
			<div id="right_div table-responsive">
				<div id="right_div2">
					<table id="right_table2" class="table table-bordered">
						<caption>论文文档提交情况</caption>
						<tr>
							<th>学号</th>
							<th>学生姓名</th>
							<th>班级</th>
							<th>题目</th>
							<th>详细文档</th>
						</tr>
						<c:choose>
							<c:when test="${studentAll == null}">
								<tr>
									<td>暂无提交</td>
									<td>暂无提交</td>
									<td>暂无提交</td>
									<td>暂无提交</td>
									<td>暂无提交</td>
								</tr>
							</c:when>
							<c:otherwise>
							<c:forEach var="student" items="${studentAll}" varStatus="i">
							<tr>
								<td>${student.sno }</td>
								<td>${student.sname }</td>
								<td>${student.sclass }</td>
								<c:choose>
									<c:when test="${student.title == null}">
										<td><font color="red">暂未提交论文题目</font></td>
									</c:when>
									<c:otherwise>
										<td>${student.title }</td>
									</c:otherwise>
								</c:choose>
								<td>
									<input type="button"
									onclick="openTTD(this,'${i.index+1 }','${student.sno }')"
									value="详细">
								</td>
							</tr>
						</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
		</div>
		<!---->
		<div class="team-mem">
			 <h1>我们的团队</h1>
			<div class="col-md-3 team-grid">
				<img src="<%=path%>/images/team1.jpeg"  alt="" class="img-responsive">
				    <ul class="img-social-stags">
							<li><a class="twitter" href="#"><span> </span></a><li>
							<li><a class="facebook" href="#"><span> </span></a><li>
							<div class="clearfix"> </div>
					</ul>
			</div>
			<div class="col-md-3 team-grid">
				<img src="<%=path%>/images/team2.jpg"  alt="" class="img-responsive">
				    <ul class="img-social-stags">
							<li><a class="twitter" href="#"><span> </span></a><li>
							<li><a class="facebook" href="#"><span> </span></a><li>
							<div class="clearfix"> </div>
					</ul>
			</div>
			<div class="col-md-3 team-grid">
				<img src="<%=path%>/images/team3.jpg"  alt="" class="img-responsive">
				    <ul class="img-social-stags">
							<li><a class="twitter" href="#"><span> </span></a><li>
							<li><a class="facebook" href="#"><span> </span></a><li>
							<div class="clearfix"> </div>
					</ul>
			</div>
			<div class="col-md-3 team-grid">
				<img src="<%=path%>/images/team4.jpg"  alt="" class="img-responsive">
				     <ul class="img-social-stags">
							<li><a class="twitter" href="#"><span> </span></a><li>
							<li><a class="facebook" href="#"><span> </span></a><li>
							<div class="clearfix"> </div>
					</ul>
			</div>
		   <div class="clearfix"> </div>
		</div>
	</div>
			<div class="advantages">
			<div class="container">
				<div class="advantage-main">
					<div class="advance-top">
						<h3>友情链接</h3>
					</div>
					<div class="advance-bottom">
					   <div class="col-md-6 advantage-left">
					   	<div class="advanc-grid">
					   	  <div class="col-md-3 advanc-icons">
					   		<img src="<%=path%>/images/a1.png" alt="">
					   	  </div>
					   	  <div class="col-md-9 advanc-text">
					   		<h4><a href="https://github.com" target="windows">GitHub</a></h4>
					   		<p>一个面向开源及私有软件项目的托管平台</p>
					   	  </div>
					   	  <div class="clearfix"> </div>
					   	</div>
					   	<div class="advanc-grid">
					   	  <div class="col-md-3 advanc-icons">
					   		<img src="<%=path%>/images/a2.png" alt="">
					   	  </div>
					   	  <div class="col-md-9 advanc-text">
					   		<h4><a href="https://blog.csdn.net" target="windows">CSDN</a></h4>
					   		<p>中国最大的IT社区和服务平台</p>
					   	  </div>
					   	  <div class="clearfix"> </div>
					   	</div>
					   </div>
					   <div class="col-md-6 advantage-right">
					   	<div class="advanc-grid">
					   	  <div class="col-md-3 advanc-icons">
					   		 <img src="<%=path%>/images/a3.png" alt="">
					   	  </div>
					   	  <div class="col-md-9 advanc-text">
					   		<h4><a href="https://www.icourse163.org/" target="windows">中国大学MOOC</a></h4>
					   		<p>网易联手高教社推出的云端在线教育平台</p>
					   	  </div>
					   	  <div class="clearfix"> </div>
					   	</div>
					   	<div class="advanc-grid">
					   	  <div class="col-md-3 advanc-icons">
					   		 <img src="<%=path%>/images/a4.png" alt="">
					   	  </div>
					   	  <div class="col-md-9 advanc-text">
					   		<h4><a href="http://www.cs-sut.com" target="windows">沈工大作业管理平台</a></h4>
					   		<p>服务全校师生的作业管理系统</p>
					   	  </div>
					   	  <div class="clearfix"> </div>
					   	</div>
					   </div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
	</div>
<!--about end here-->
<!--footer start here-->
<div class="footer">
	<div class="container">
		<div class="footer-main">
			 <div class="col-md-4 ftr-grid">
			 	<div class="ftr-grid-left">
			 	    <img src="<%=path%>/images/location.png" alt="">
			 	</div>
			 	<div class="ftr-grid-right">
			 		<p>7556 gt globel Place <span class="local">CD-road,M 07 435.</span></p>
			 	</div>
			   <div class="clearfix"> </div>
			 </div>
			 <div class="col-md-4 ftr-grid">
			 	 <div class="ftr-grid-left">
			 	    <img src="<%=path%>/images/email.png" alt="">
			 	</div>
			 	<div class="ftr-grid-right">
			 		<p><a href="#">mail@user.com</a><span class="local">saepe eveniet</span></p>
			 	</div>
			   <div class="clearfix"> </div>
			 </div>
			 <div class="col-md-4 ftr-grid">
			 	 <div class="ftr-grid-left">
			 	    <img src="<%=path%>/images/phone.png" alt="">
			 	</div>
			 	<div class="ftr-grid-right">
			 		<p>+1234 567 9871 <span class="local">+1204 859 6598</span></p>
			 	</div>
			   <div class="clearfix"> </div>
			 </div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--footer end here-->
<!--copyright start here-->
<div class="copyright">
	<div class="container">
		<div class="copyright-main">
			   <p>Copyright &copy; shenyang university of technology.<a target="_blank" href="http://www.sut.edu.cn">沈阳工业大学</a></p>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--copyright end here-->
</body>
</html>
	