<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href='http://fonts.googleapis.com/css?family=Francois+One' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Cinzel+Decorative:400,700,900' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
<!-- //font -->
<script type="text/javascript" src="js/jquery-2.2.2.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/SmoothScroll.min.js"></script>

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
	console.log($("#login").val());
	
});
</script>
</head>
<body>
<script src="js/jquery.vide.min.js"></script>
<%-- <p>${sessionScope }</p> --%>
	<div style="background-image:url(video/cook.jpg)">
		<!-- banner -->
		<div class="banner">
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
									<li><a class="active" href="index.jsp">Home</a></li>
									<li><a href="Menu/menu">Menu</a></li>
									<li>
										<c:choose>
											<c:when test="${user.userid == NULL}">
												<a href="Login/login" id="login">Log In</a>
											</c:when>
											<c:otherwise>
											 	<div class="dropdown" id="haschild">
												  <a href="Order/order" id="dLabel" style="color:#111" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                      	${user.userid }
												    <span class="caret"></span>
												  </a>
												  <ul id="list" class="dropdown-menu" aria-labelledby="dLabel" style="background-color:#111">
												    <li><a href="#">我的订单</a></li>	
												    <li><a href="User/userinfo">账户设置</a></li>											    		
													<li><a href="Logout/logout">注销登录</a></li>
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
				<div class="banner-info">
					<h2>店长推荐</h2>
					<p>根据销量信息为您推送本店最受欢迎的菜品</p>
				</div>
				
				<div class="banner-grads">
				<c:forEach var="item" items="${sessionScope.top3List}" varStatus="i">
					<div class="col-md-4 banner-grad">
						<div class="banner-grad-img">
							<a href="Menu/SinglePage?dishid=${item.dishid }&dname=${item.dname}
											&dvalue=${item.dvalue }&dtype=${ item.dtype}&dinfo=${dishes.dinfo}
											&dimg=${item.dimg }&xiaoliang=${item.xiaoliang }"><img src="img/${item.dname }.jpg" alt="" /></a>
							<h4>${item.dname }</h4>
						</div>
					</div>
				</c:forEach>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!-- //banner -->
	</div>
	<!-- special -->
	<div class="special">
		<div class="container">
			<div class="special-heading">
				<h3>Today Specials</h3>
			</div>
			<div class="special-grids">
				<div class="col-md-4 w3l-special-grid">
					<div class="col-md-6 w3ls-special-img">
						<div class="w3ls-special-text effect-1">
							<h4>Aliquam</h4>
						</div>
					</div>
					<div class="col-md-6 agileits-special-info">
						<h4>Aliquam</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-4 w3l-special-grid">
					<div class="col-md-6 w3ls-special-img wthree-img">
						<div class="w3ls-special-text effect-1">
							<h4>Nullam</h4>
						</div>
					</div>
					<div class="col-md-6 agileits-special-info">
						<h4>Nullam</h4>
						<p>Maecenas ac hendrerit purus. Lorem ipsum dolor sit amet</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-4 w3l-special-grid">
					<div class="col-md-6 w3ls-special-img wthree-img1">
						<div class="w3ls-special-text effect-1">
							<h4>Maecenas</h4>
						</div>
					</div>
					<div class="col-md-6 agileits-special-info">
						<h4>Maecenas</h4>
						<p>Donec nibh enim, cursus sodales laoreet sit amet, tincidunt</p>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-4 w3l-special-grid">
					<div class="col-md-6 agileits-special-info">
						<h4>Aliquam</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
					</div>
					<div class="col-md-6 w3ls-special-img wthree-img2">
						<div class="w3ls-special-text effect-1">
							<h4>Aliquam</h4>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-4 w3l-special-grid">
					<div class="col-md-6 agileits-special-info">
						<h4>Nullam</h4>
						<p>Maecenas ac hendrerit purus. Lorem ipsum dolor sit amet</p>
					</div>
					<div class="col-md-6 w3ls-special-img wthree-img3">
						<div class="w3ls-special-text effect-1">
							<h4>Nullam</h4>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col-md-4 w3l-special-grid">
					<div class="col-md-6 agileits-special-info">
						<h4>Maecenas</h4>
						<p>Donec nibh enim, cursus sodales laoreet sit amet, tincidunt</p>
					</div>
					<div class="col-md-6 w3ls-special-img wthree-img4">
						<div class="w3ls-special-text effect-1">
							<h4>Maecenas</h4>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //special -->
	<!-- features -->
	<div class="features">
		<div class="container">
			<div class="features-heading">
				<h3>Our Features</h3>
			</div>
			<div class="features-grids">
				<div class="col-md-4 features-left">
					<div class="features-left-info">
					</div>
				</div>
				<div class="col-md-8 features-right">
					<div class="features-right-info">
						<h4>Quisque scelerisque mollis lacus, nec commodo lacus posuere quis. Aliquam erat volutpat. Sed laoreet, felis vitae viverra aliquet, magna nulla tincidunt odio, at laoreet nisi nisl sit amet risus. Suspendisse ullamcorper tempus eros, eget aliquam eros tincidunt in.</h3>
					</div>
					<div class="features-right-grids">
						<div class="features-right-left">
							<div class="features-right-icon effect-2">
								<i class="fa fa-users" aria-hidden="true"></i>
							</div>
						</div>
						<div class="features-right-right">
							<p>Nulla auctor vel ex a suscipit. Integer scelerisque nec dui et ullamcorper. Aenean vitae urna non est luctus venenatis. </p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="features-right-grids">
						<div class="features-right-left">
							<div class="features-right-icon effect-2">
								<i class="fa fa-asterisk" aria-hidden="true"></i>
							</div>
						</div>
						<div class="features-right-right">
							<p>Nulla auctor vel ex a suscipit. Integer scelerisque nec dui et ullamcorper. Aenean vitae urna non est luctus venenatis. </p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="features-right-grids">
						<div class="features-right-left">
							<div class="features-right-icon effect-2">
								<i class="fa fa-money" aria-hidden="true"></i>
							</div>
						</div>
						<div class="features-right-right">
							<p>Nulla auctor vel ex a suscipit. Integer scelerisque nec dui et ullamcorper. Aenean vitae urna non est luctus venenatis. </p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="features-right-grids">
						<div class="features-right-left">
							<div class="features-right-icon effect-2">
								<i class="fa fa-cog" aria-hidden="true"></i>
							</div>
						</div>
						<div class="features-right-right">
							<p>Nulla auctor vel ex a suscipit. Integer scelerisque nec dui et ullamcorper. Aenean vitae urna non est luctus venenatis. </p>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //features -->
	<!-- customer -->
	<div class="customer">
		<div class="container">
			<div class="customer-heading">
				<h3>What Our Customers are Saying</h3>
			</div>
			<div class="customer-heading-grids">
				<div class="col-md-4 customer-grid">
					<div class="customer-info">
						<p>Etiam euismod leo in felis imperdiet, non interdum diam egestas. Aliquam non ex eget lorem vulputate auctor. Etiam sit amet nibh non tortor posuere mollis non vel velit. Praesent porttitor elit nec dapibus bibendum.</p>
					</div>
					<div class="customer-img">
						<img src="images/c1.jpg" alt="" />
						<h5>Dapibus</h5>
					</div>
				</div>
				<div class="col-md-4 customer-grid">
					<div class="customer-info">
						<p>Etiam euismod leo in felis imperdiet, non interdum diam egestas. Aliquam non ex eget lorem vulputate auctor. Etiam sit amet nibh non tortor posuere mollis non vel velit. Praesent porttitor elit nec dapibus bibendum.</p>
					</div>
					<div class="customer-img">
						<img src="images/c2.jpg" alt="" />
						<h5>Vulputate</h5>
					</div>
				</div>
				<div class="col-md-4 customer-grid">
					<div class="customer-info">
						<p>Etiam euismod leo in felis imperdiet, non interdum diam egestas. Aliquam non ex eget lorem vulputate auctor. Etiam sit amet nibh non tortor posuere mollis non vel velit. Praesent porttitor elit nec dapibus bibendum.</p>
					</div>
					<div class="customer-img">
						<img src="images/c3.jpg" alt="" />
						<h5>Interdum</h5>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //customer -->
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
	<div class="copyright">
		<div class="container">
			<div class="w3agile-list">
				<ul>
					<li><a href="about.jsp">About</a></li>
					<li><a href="menu.jsp">Menu</a></li>
					<li><a href="codes.jsp">Codes</a></li>
					<li><a href="news.jsp">News & Events</a></li>
					<li><a href="contact.jsp">Contact</a></li>
					<li><a href="Login/login">Log In</a></li>
				</ul>
			</div>
			<div class="agileinfo">
			</div>
		</div>
	</div>
</body>	
</html>