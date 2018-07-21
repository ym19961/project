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
<script type="text/javascript" src="<%=path %>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path %>/js/bootstrap.js"></script>
<script src="<%=path %>/js/SmoothScroll.min.js"></script>
<script src="<%=path %>/js/distpicker.js"></script>
<script src="<%=path %>/js/userinfoScripts.js"></script>
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
	.weak {background-color: #FF0000 !important;}
	.medium {background-color: #FF9900 !important;}
	.strong {background-color: #33CC00 !important;}
	#pwdpower > span {display: inline-block;width: 70px;height: 30px;line-height: 30px;background: #ddd;text-align: center;margin: 4px 2px;}
	#pwd-errinfo1, #pwd-errinfo2, #address-errinfo1, #address-errinfo2, #address-errinfo3{
		color:red;
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
});
</script>

</head>
<body>
<%-- <p>${sessionScope }</p> --%>
	<script src="<%=path %>/js/jquery.vide.min.js"></script>
	<div style="background-image:url(<%=path %>/video/banner.jpg)">
	<input type="hidden" id="userid" value="${sessionScope.user.userid }"/>
	<input type="hidden" id="imageinfo" value="${sessionScope.user.picture }">
	<input type="hidden" id="password" value="${sessionScope.user.password }">
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
									<li><a href="../User/usermain">Home</a></li>
									<li><a href="../Menu/menu">Menu</a></li>
									<li>
										<c:choose>
											<c:when test="${sessionScope.user.userid==NULL}">
												<a href="../Login/login">Log In</a>
											</c:when>
											<c:otherwise>
											 	<div class="dropdown" id="haschild">
												  <a href="#" id="dLabel" style="color:#111" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                                      	${sessionScope.user.userid }
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
				</div>
			</div>
	<!-- //features -->
	<!-- customer -->
	
	<!-- //customer -->
	<!-- footer -->
		<div class="container">
			<div class="footer-grids">
    <table class="table table-bordered">
      <tbody style="background:#fff">
        <tr>
          <th style="width:150px"><h3>账户设置</h3></th>
          <td></td>
          <td style="width:150px"></td>
        </tr>
        <tr>
          <td><h4>头像</small></h4></td>
          <td>
				<c:choose>
					<c:when test="${sessionScope.user.picture == null}">
						<!-- 图片 --> <img src="<%=path%>/images/head.jpg" id="preview-end"
					style="width: 50px; height: 50px;" />
					</c:when>
					<c:otherwise>
						<!-- 图片 --> <img src="${sessionScope.user.picture}" id="preview-end"
						style="width: 50px; height: 50px;" />
					</c:otherwise>
				</c:choose>
			</td>
          <td>
          	<input type="file" name="file" id="imageFile" onchange="imgPreview(this)" style="display: none;"/>
          	<button onclick="$('#imageFile').click();" class="btn btn-default"  
          	>修改</button>
          </td>
          
        </tr>
        <tr>
          <td><h4>昵称</h4></td>
          <td><h5>${user.username}</h5></td>
          <td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#uname-change">修改</button></td>
        </tr>
        <tr>
          <td><h4>地址</h4></td>
          <td><h5>${user.address}</h5></td>
          <td><button class="btn btn-default" data-toggle="modal" data-target="#address-change">修改</button></td>
        </tr>
        <tr>
          <td><h4>手机</h4></td>
          <td><h5>${user.phone}</h5></td>
          <td><button class="btn btn-default" data-toggle="modal" data-target="#phone-change">修改</button></td>
        </tr>
        <tr>
          <td><h4>密码</h4></td>
          <td><h5>安全强度：${user.pwdpower}</h5></td>
          <td><button class="btn btn-default" data-toggle="modal" data-target="#password-change">修改</button></td>
        </tr>
      </tbody>
    </table>
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
</div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="uname-change" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改昵称
				</h4>
			</div>
			<div class="modal-body">
				<div>当前昵称：${user.username }</div>
				<div>新昵称：<input type="text" class="form-control" id="newusername"/></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="updatename">
					确认修改
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal fade" id="phone-change" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改电话
				</h4>
			</div>
			<div class="modal-body">
				<div>当前电话：${user.phone }</div>
				<div>新电话：<input type="text" class="form-control" id="newphone"/></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="updatephone">
					确认修改
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal fade" id="password-change" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改密码
				</h4>
			</div>
			<div class="modal-body">
				<div>当前密码：<input type="password" class="form-control" id="oldpassword"/></div>
				<div id="pwd-errinfo2">密码输入错误</div><br/>
				<div>新密码：<input type="password" class="form-control" id="newpassword"/></div>
				<div id="pwdpower"> 
                    <span>弱</span><span>中</span><span>强</span>
                </div>
				<div>确认密码：<input type="password" class="form-control" id="repassword"/></div>
				<div id="pwd-errinfo1">两次密码不一致</div><br/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="updatepassword">
					确认修改
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal fade" id="address-change" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改地址
				</h4>
			</div>
			<div class="modal-body">
				<div data-toggle="distpicker"><!-- container -->
				  <select id="province" data-province="---- 选择省 ----"></select><div id="address-errinfo1">请选择省份</div>
				  <select id="city" data-city="---- 选择市 ----"></select><div id="address-errinfo2">请选择市</div>
				  <select id="district" data-district="---- 选择区 ----"></select>
				  <input type="text" class="form-control" placeholder="填写详细地址" id="detail"><div id="address-errinfo3">请填写详细地址</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="updateAddress">
					确认修改
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal fade" id="picture-change" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改头像
				</h4>
			</div>
			<div class="modal-body">
				 <c:choose>
					<c:when test="${sessionScope.user.picture == null}">
						<!-- 图片 --> <img src="<%=path%>/images/head.jpg" id="preview"
					style="width: 150px; height: 150px;" />
					</c:when>
					<c:otherwise>
						<!-- 图片 --> <img src="${sesssionScope.user.picture}" id="preview"
						style="width: 150px; height: 150px;" />
					</c:otherwise>
				</c:choose>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="updatepicture" >
					确认修改
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>	
</html>