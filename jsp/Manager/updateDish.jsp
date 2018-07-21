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
	.weak {background: #FF0000 !important;}
	.medium {background: #FF9900 !important;}
	.strong {background: #33CC00 !important;}
	#pwdpower > span {display: inline-block;width: 70px;height: 30px;line-height: 30px;background: #ddd;text-align: center;margin: 4px 2px;}
	#pwd-errinfo1, #pwd-errinfo2, #address-errinfo1, #address-errinfo2, #address-errinfo3, #address-errinfo4{
		color:red;
	}
</style>

<script type="text/javascript">

$(document).ready(function(){
	$("#updatename").click(function(){
		var dishid = $("#dishid").val();
		var dname = $("#dname").val();
		$.post("updateDname",{dishid:dishid,dname:dname},function(data){
				location.reload();
				opener.location.reload();
		});
	});
	$("#updatedinfo").click(function(){
		var dishid = $("#dishid").val();
		var dinfo = $("#dinfo").val();
		$.post("updateDinfo",{dishid:dishid,dinfo:dinfo},function(data){
				location.reload();
				opener.location.reload();
		});
	});
	$("#updatedvalue").click(function(){
		var dishid = $("#dishid").val();
		var dvalue = $("#dvalue").val();
		$.post("updateDvalue",{dishid:dishid,dvalue:dvalue},function(data){
				location.reload();
				opener.location.reload();
		});
	});
	});
</script>
</head>
<body>
	<script src="<%=path %>/js/jquery.vide.min.js"></script>
	<div style="background-image:url(<%=path %>/video/banner.jpg)">
	<input type="hidden" id="dishid" value="${dishs.dishid }"/>
		<!-- banner -->
		<!-- 模态框（Modal） -->
<div class="modal fade" id="uname-change" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改菜品名
				</h4>
			</div>
			<div class="modal-body">
				<div>当前菜品名：${dishs.dname }</div>
				<div>新菜品名：<input type="text" class="form-control" id="dname"/></div>
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
<div class="modal fade" id="dinfo-change" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改菜品类
				</h4>
			</div>
			<div class="modal-body">
				<div>当前菜品类：${dishs.dinfo }</div>
				<div>新菜品类：<input type="text" class="form-control" id="dinfo"/></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="updatedinfo">
					确认修改
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<div class="modal fade" id="dvalue-change" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改单价
				</h4>
			</div>
			<div class="modal-body">
				<div>当前单价：${dishs.dvalue }</div>
				<div>新单价：<input type="text" class="form-control" id="dvalue"/></div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="updatedvalue">
					确认修改
				</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">取消
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
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
									<li >
									 	<div class="dropdown" id="haschild">
										  <a href="#" id="dLabel" style="color:#111" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                                      	${user.userid }
										  </a>
										</div>
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
          <td><h4>菜品名</h4></td>
          <td><h5>${dishs.username}</h5></td>
          <td><button type="button" class="btn btn-default" data-toggle="modal" data-target="#uname-change">修改</button></td>
        </tr>
        <tr>
          <td><h4>菜品类</h4></td>
          <td><h5></h5></td>
          <td><button class="btn btn-default" data-toggle="modal" data-target="#dinfo-change">修改</button></td>
        </tr>
         <tr>
          <td><h4>单价</h4></td>
          <td><h5></h5></td>
          <td><button class="btn btn-default" data-toggle="modal" data-target="#dvalue-change">修改</button></td>
        </tr>
      </tbody>
    </table>
			</div>
		</div>
			<div class="agileinfo">
			</div>
	</div>
</div>
</body>	
</html>