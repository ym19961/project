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
    }
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			if($("#state").val()=='0'){
				$("#orderstate").html("<strong>未付款</strong>");
			}else if($("#state").val()=='1'){
				$("#orderstate").html("<strong>正在配送</strong>");
			}else{
				$("#orderstate").html("<strong>已完成 </strong>");
			}
		});
		
		
	</script>
<title>订单明细</title>
</head>
<body>
	<%-- <p>${sessionScope } </p> --%>
	<input type="hidden" id="state" value="${sessionScope.state }"/>
	<input type="hidden" id="userid" value="${sessionScope.orderinfo.userid }"/>
	<div>当前订单状态：<span class="text-danger" id="orderstate"></span></div><br><br>
	<div>
		<fieldset>
	    <legend align="left">订单信息</legend>
	    	<div>
				<table class="table table-striped">
					<tbody>
						<tr >
							<th width="100" style="text-align: center;">订单编号</th>
							<th width="100" >用户名</th>
							<th width="100" >下单时间</th>
							<th width="100" >送餐地址</th>
							<th width="100" >电话</th>
						</tr>
						<tr >
							<th id="orderid">${sessionScope.detailinfo.orderid }</th>
							<th id="username">${sessionScope.user.username }</th>
							<th id="orderdate">${sessionScope.detailinfo.orderdate }</th>
							<th id="address">${sessionScope.user.address }</th>
							<th id="phone">${sessionScope.user.phone }</th>
						</tr>
					</tbody>
				</table>
			
			</div>
			
	    </fieldset>
		
		<fieldset>
		<legend align="left">菜品信息</legend>
			<div>
				<table class="table table-striped">
					<tbody>
						<tr class="text-center">
							<th width="100" >菜品名称</th>
							<th width="50" >单价</th>
							<th width="10" ></th>
							<th width="50" >数量</th>
							<th width="10" ></th>
							<th width="50" >优惠</th>
							<th width="10" ></th>
							<th width="54" >支付金额</th>
						</tr>
						<c:forEach  var="item" items="${sessionScope.detailinfo.dishlist}" varStatus="i">
						<input type="hidden" class="dishid" value="${item.dishid }"/>
						<input type="hidden" class="num" value="${item.num }"/>
						<tr class="text-center">
							<th >${item.dname }</th>
							<th >${item.dvalue }</th>
							<th >×</th>
							<th >${item.num }</th>
							<th >-</th>
							<th >0</th>
							<th >=</th>
							<th >${item.onekindprice }</th>
						</tr>
						</c:forEach>
						<tr class="text-center">
							<th ></th>
							<th ></th>
							<th ></th>
							<th ></th>
							<th ></th>
							<th ></th>
							<th >总计</th>
							<th id="totalprice">${sessionScope.detailinfo.totalprice }</th>
						</tr>
					</tbody>
				</table>
			</div>
	    </fieldset>
	</div>
	<div>
		<a type="button" id="queren" class="btn btn-primary" href='javascript:history.back(-1)'>确认</a>
	</div>
</body>
</html>