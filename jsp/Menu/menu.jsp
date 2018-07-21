<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Menu</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="<%=path %>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="<%=path %>/css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link href="<%=path %>/css/font-awesome.css" rel="stylesheet"> 
<script src="<%=path %>/js/bootstrap.js"></script>
<!-- //font-awesome icons -->
<!-- font -->
<link href='http://fonts.googleapis.com/css?family=Francois+One' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Cinzel+Decorative:400,700,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>
<script src="<%=path %>/js/SmoothScroll.min.js"></script>
<style type="text/css">
	.dropdown-menu > li > a:hover,
	.dropdown-menu > li > a:focus {
	  color: #262626;
	  text-decoration: none;
	  background-color:black;
	  }
	.nav .open > a,
	.nav .open > a:hover,
	.nav .open > a:focus {
	  background-color: #111;
	  border-color: #337ab7;
	}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#haschild").hover(
		function(){
			$("#list").show();
		},
		function(){
			$("#list").hide();
		}
	);
	$("#search").click(function(){
		var dishtext = $("#dishtext").val();
		$.post("../Menu/menusearch",{dishtext:dishtext},function(data){
			location.reload();
		});
	});
	$("#valueAscOrder").click(function(){
		$.post("../Menu/valueAscOrder",{},function(data){
			location.reload();
		});
	});
	$("#xiaoliangDescOrder").click(function(){
		$.post("../Menu/xiaoliangDescOrder",{},function(data){
			location.reload();
		});
	});
});
</script>
</head>
<body>
	<div class="bg-img">
		<!-- banner -->
		<div class="banner code-banner">
			<div class="container">
				<div class="header">
					<div class="logo">
						<h1><a href="index.jsp">Tasty</a></h1>
					</div>
					<div class="top-nav">
						<nav class="navbar navbar-default">
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu						
								</button>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav">
									<li><a href="../User/usermain">Home</a></li>
									<li><a class="active" href="../Menu/menu">Menu</a></li>
									<li>
										<c:choose>
											<c:when test="${user.userid == '' || user.userid==NULL}">
												<a href="../Login/login">Log In</a>
											</c:when>
											<c:otherwise>
											 	<div class="dropdown" id="haschild">
												  <a href="#" id="dLabel" style="color:#111" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                      	${user.userid }
												    <span class="caret"></span>
												  </a>
												  <ul id="list" class="dropdown-menu" aria-labelledby="dLabel" style="background-color:#111">
												    <li><a href="../Orders/orders">我的订单</a></li>	
												    <li><a href="../User/userinfo">账户设置</a></li>											    		
													<li><a href="../Logout/logout">注销登录</a></li>
												  </ul>
												</div>
											</c:otherwise>
										</c:choose>
									</li>
									<div class="clearfix"> </div>
								</ul>	
							</div>	
						</nav>		
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!-- //banner -->
	</div>
	<!-- menu -->
	<div class="menu">
		<div class="container">
			<div class="input-group" style="width:300px;">
		      <input type="text" class="form-control" id="dishtext" placeholder="Search for..." value="${sessionScope.dishtext }" >
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="button" id="search">搜索菜名</button>
		      </span>
		    </div><!-- /input-group -->
		    <a href="#" id="valueAscOrder">按价格升序</a>
		    <a href="#" id="xiaoliangDescOrder">按销量降序</a>
		    <%-- <p>${sessionScope }</p> --%>
			<div class="menu-heading">
				<h2>Our Menu</h2>
			</div>
			<c:set var="totalDishes" value="${requestScope.totalDishes}"/>
		    <c:set var="dishesPerPage" value="${requestScope.dishesPerPage}"/>
		    <c:set var="totalPages" value="${requestScope.totalPages}"/>
		    <c:set var="beginIndex" value="${requestScope.beginIndex}"/>
		    <c:set var="endIndex" value="${requestScope.endIndex}"/>
		    <c:set var="page" value="${requestScope.page}"/>
		    <c:set var="currentPageDishes" value="${requestScope.dishes.subList(beginIndex,endIndex)}"/>
			<div class="menu-top-grids">
				<c:forEach var="dishes" items="${currentPageDishes}" varStatus="i">
					<div class="col-md-3 menu-grid">
						<div class="agile-menu-grid">
							<a href="../Menu/SinglePage?dishid=${dishes.dishid }&dname=${dishes.dname}
											&dvalue=${dishes.dvalue }&dtype=${dishes.dtype}&dinfo=${dishes.dinfo}
											&dimg=${dishes.dimg }&xiaoliang=${dishes.xiaoliang }">
								<img src="../img/${dishes.dname }.jpg" alt="" />
								<div class="agileits-caption">
									<h4>${dishes.dname }</h4>
									<p>${dishes.dvalue }</p>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
				<div class="clearfix"> </div>
				<!-- 分页条 -->
					<div style="margin:0px auto; width:500px;" >
					<nav aria-label="...">
					  <ul class="pagination pagination-lg">
					    <li><a href="<c:url value="../Menu/menu?page=1"/>">首页</a></li>
	                	<li><a href="<c:url value="../Menu/menu?page=${page-1>1?page-1:1}"/>">上一页</a></li>
	
	                	<c:forEach begin="1" end="${totalPages}" varStatus="loop">
	                    	<c:set var="active" value="${loop.index==page?'active':''}"/>
	                    	<li class="${active}">
	                    		<a href="<c:url value="../Menu/menu?page=${loop.index}"/>">${loop.index}</a>
	                    	</li>
	                	</c:forEach>
	              		 <li>
	                   		<a href="<c:url value="../Menu/menu?page=${page+1<totalPages?page+1:totalPages}"/>">下一页</a>
	               		</li>
	               		<li><a href="<c:url value="../Menu/menu?page=${totalPages}"/>">尾页</a></li>
					  </ul>
					</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //menu -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="footer-heading">
					<h3>Get in touch with us</h3>
				</div>
				<div class="footer-icons">
					<ul>
						<li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a><span>Twitter</span></li>
						<li><a href="#" class="twitter facebook"><i class="fa fa-facebook"></i></a><span>Facebook</span></li>
						<li><a href="#" class="twitter chrome"><i class="fa fa-google-plus"></i></a><span>Google +</span></li>
						<li><a href="#" class="twitter dribbble"><i class="fa fa-dribbble" aria-hidden="true"></i></a><span>Dribbble</span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //footer -->
	<!-- copyright -->
	<div class="copyright">
		<div class="container">
			<div class="w3agile-list">
				<ul>
					<li><a href="about.jsp">About</a></li>
					<li><a href="menu.jsp">Menu</a></li>
					<li><a href="codes.jsp">Codes</a></li>
					<li><a href="news.jsp">News & Events</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
			</div>
			<div class="agileinfo">
			</div>
		</div>
	</div>
	<!-- //copyright -->
</body>	
</html>