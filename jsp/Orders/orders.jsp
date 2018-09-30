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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看我的订单</title>
<script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
	<link href="<%=path %>/css/bootstrap.css" media="screen" rel="stylesheet" type="text/css" />
	<style type="text/css">
		th {
		text-align: center;
		}
		#queren{
        right: 5px;
        position:fixed;
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			 $(".state").each(function(){
				 
				if($(this).val()=='0'){
					$(this).next().find(".text-danger").html("<strong>未付款</strong>");
				}
			 	else if($(this).val()=='1'){
					$(this).next().find(".text-danger").html("<strong>正在配送</strong>");
				}else{
					$(this).find(".text-danger").html("<strong>已完成</strong>");
				}
			});
			 
			 $(".deleteorder").each(function(){
				 $(this).click(function(){
					var orderid=$(this).parents(".orderid");
					alert(orderid);
					$(this).parents("table").remove();
					$.post("../Orders/deleteorder",{orderid:orderid},function(data){
						if(data=='1'){
						}else{
							alert("操作失败了哦");
						}
					});
				 });
			 });
			
			$("#orderdetail").click(function(){
				var orderid = $("#orderid").text();
				var state = $("#state").val();
				var orderdate = $(this).parent().prev().prev().text();
				$.post("../Orders/getdetailinfo",{orderid:orderid,state:state,orderdate:orderdate},function(data){
					location.href="../Orders/orderdetail";
				});
			});
			
		});
		function deleteorder(data){
			
			var $data = $(data);
			var orderid=data.parents(".orderid");
			alert(orderid);
			data.parents("table").remove();
			$.post("../Orders/deleteorder",{orderid:orderid},function(data){
				if(data=='1'){
				}else{
					alert("操作失败了哦");
				}
	 		});
		}
	</script>
</head>
<body>
<%-- 	<p>${sessionScope }</p>  --%>
	<c:forEach var="item" items="${sessionScope.orderlist}" varStatus="i">
	<div>
		<input type="hidden" class="state" value="${item.state }">
		<table class="table table-striped">
			<tbody>
				<tr >
					<th width="200">订单编号</th>
					<th width="200">用户id</th>
					<th width="200">下单时间</th>
					<th width="200">订单状态</th>
					<th width="200">操作</th>
					
				</tr>
				<tr >
					<th class="orderid">${item.orderid }</th>
					<th >${item.userid }</th>
					<th class="orderdate">${item.orderdate }</th>
					<th class="text-danger" id="orderstate"></th>
					<th >
						<button type="button" class="btn btn-success" class="orderdetail" onclick="">查看</button>
						<button type="button" class="btn btn-success" class="deleteorder" onclick="deleteorder(this)">删除</button>
					</th>
				</tr>
			</tbody>
		</table>
	</div>
	</c:forEach>
	<div>
		<a type="button" id="queren" class="btn btn-primary" href='javascript:history.back(-1)'>确认</a>
	</div>
</body>
</html>