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
<title>Single</title>
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
<!-- //font-awesome icons -->
<!-- font -->
<link href='http://fonts.googleapis.com/css?family=Francois+One' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Cinzel+Decorative:400,700,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>

<!-- //font -->
<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
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
	$("#errinfo").hide();
	$("#haschild").hover(
		function(){
			$("#list").show();
		},
		function(){
			$("#list").hide();
		}
	);
	$("#plus").click(function(){
		var num=parseInt($("#num").val());
		$("#num").val(num+1);
		if(num<=0){
			$("#num").val(1);
		}
	});
	$("#minus").click(function(){
		var num=parseInt($("#num").val());
		if(num<=0){
			$("#num").val(1);
		}
		if(num>1){
			$("#num").val(num-1);
		}else{
			$("#num").val(1);
		}
	});
	
	$("#putCart").click(function(){
		var dishid = $("#dishid").val();
		var num = parseInt($("#num").val());
		$.post("../ShoppingCart/putCart",{dishid:dishid,num:num},function(data){
			//location.href();
		});
	});
	
	$("#sendcomment").click(function(){
		if($("#user").val()==''){
			alert("您还未登陆，要评论请先登陆~");
			return false;
		}
		var userid = $("#userid").val();
		var dishid = $("#dishid").val();
		var commentary = $("#commentary").val();
		if(commentary==''){
			$("#errinfo").show();
			return false;
		}else{
			$("#errinfo").hide();
			$.post("../Menu/addComment",{userid:userid,dishid:dishid,commentary:commentary},function(data){
				
			location.reload();
			});
		}
	});
	$("a[title='deleteMyComment']").click(function(){
		var commentid = $(this).attr("class");
		$(this).parents(".onecomment").remove();
		$.post("../Menu/deleteMyComment",{commentid:commentid},function(data){
			
		});
	});
});
</script>
</head>
<body>
	<input type="hidden" id="user" value="${sessionScope.user }">
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
									<li><a href="../Menu/menu">Menu</a></li>
									<li>
										<c:choose>
											<c:when test="${ user.userid==NULL}">
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
	<!-- single -->
	<div class="blog">
				<!-- container -->
				<div class="container">
					<div class="col-md-8 blog-top-left-grid">
						<div class="left-blog left-single">
							<div class="blog-left">
								<div class="single-left-left">
									<!-- <p>Posted By <a href="#">Admin</a> &nbsp;&nbsp; on June 2, 2016 &nbsp;&nbsp; <a href="#">Comments (10)</a></p> -->
									<img src="../img/${param.dname }.jpg" alt="">
								</div>
								<!-- <div class="blog-left-bottom">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed blandit massa vel mauris sollicitudin 
										dignissim. Phasellus ultrices tellus eget ipsum ornare molestie scelerisque eros dignissim. Phasellus 
										fringilla hendrerit lectus nec vehicula. ultrices tellus eget ipsum ornare consectetur adipiscing elit.Sed blandit .
									</p>
								</div>
								<div class="blog-left-bottom left-bottom">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed blandit massa vel mauris sollicitudin 
										dignissim. Phasellus ultrices tellus eget ipsum ornare molestie scelerisque eros dignissim. Phasellus 
										fringilla hendrerit lectus nec vehicula. ultrices tellus eget ipsum ornare consectetur adipiscing elit.Sed blandit .
									</p>
								</div>
								<div class="blog-left-bottom left-bottom">
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.Sed blandit massa vel mauris sollicitudin 
										dignissim. Phasellus ultrices tellus eget ipsum ornare molestie scelerisque eros dignissim. Phasellus 
										fringilla hendrerit lectus nec vehicula. ultrices tellus eget ipsum ornare consectetur adipiscing elit.Sed blandit .
									</p>
								</div> -->
							</div>
							<div class="response">
								<h3>用户评论</h3>
								<div class="media response-info">
									<c:forEach var="item" items="${sessionScope.comments}" varStatus="i">
										<div class="media response-info onecomment">
											<div class="media-left response-text-left">
												<a href="#">${item.commentername }</a>
											</div>
											<div class="media-body response-text-right">
												<p>${item.commentary }</p>
												<ul>
													<li>${item.cdate }</li>
													<c:choose>
														<c:when test="${ user.userid==item.userid}">
															<li><a href="" title="deleteMyComment" style="color:red;" class="${item.commentid }">删除</a></li>
														</c:when>
													</c:choose>
												</ul>		
											</div>
											<div class="clearfix"> </div>
										</div>
									</c:forEach>
									<div class="clearfix"> </div>
								</div>
								<div class="media response-info">
									<div class="media-left response-text-left">
										<a href="#">
											<img class="media-object" src="../images/t3.jpg" alt="">
										</a>
										<h5><a href="#">Admin</a></h5>
									</div>
									<div class="media-body response-text-right">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
											sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
										<ul>
											<li>June 21, 2016</li>
										</ul>		
									</div>
									<div class="clearfix"> </div>
								</div>
							</div>
							
							<div class="opinion">
								<h2>对该菜进行评论</h2>
								<input type="hidden" id="userid" value="${sessionScope.user.userid }">
								<input type="hidden" id="dishid" value="${param.dishid }">
								<form action="#" method="post">
								<!-- <input type="text" name="Name" placeholder="Name" required="">
								<input type="text" name="Email" placeholder="Email" required=""> -->
								<textarea id="commentary" name="Message" placeholder="Message" required=""></textarea>
								<div id="errinfo" style="color:red;"> 评论内容不能为空</div>
								<input id="sendcomment" type="submit" value="SEND">
								</form>
							</div>
						</div>
					</div>
					 <div class="col-md-4 blog-top-right-grid">
						<div class="categories">
							<h3>菜品信息</h3><br>
							<input type="hidden" id="dishid" value=${param.dishid }>
								<p>${param.dname }</p>
								<p>价格：${param.dvalue }</p>
								<p>菜系：${param.dinfo }</p>
								<p>销量：${param.xiaoliang }</p>
						</div>
						<div class="categories">
							<div class="row">
							 <div class="col-lg-6">
							   <div class="input-group">
							     <span class="input-group-btn">
							       <button class="btn btn-default" type="button" id="minus">-</button>
							     </span>
							     <input type="text" class="form-control" value="1" id="num">
							     <span class="input-group-btn">
							       <button class="btn btn-default" type="button" id="plus">+</button>
							     </span>
							   </div><!-- /input-group -->
							 </div><!-- /.col-lg-6 -->
							</div>
							<h3><a href="" id="putCart" style="text-decoration:none;">放入购物车</a></h3><br>
							<h3><a href="../ShoppingCart/shoppingcart"  style="text-decoration:none;">查看购物车</a></h3><br>
							
						</div>
					</div> 
					<div class="clearfix"> </div>
				</div>
				<!-- //container -->
	</div>
	<!-- //single -->
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
				<p>Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			</div>
		</div>
	</div>
	<!-- //copyright -->
</body>	
</html>