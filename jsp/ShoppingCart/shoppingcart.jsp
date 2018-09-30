<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>Shopping Cart</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/etao.js"></script>
	<script type="text/javascript" src="<%=path %>/js/cart.js"></script>
	<link href="<%=path %>/css/cart.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/bootstrap.min.css" media="screen" rel="stylesheet" type="text/css" />
</head>
<body class="container">
	<div class="row hidden-print">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<ol class="breadcrumb">
				<li><a href="<%=path%>/top3">首页</a></li>
                <li class="active">查看购物车</li>
			</ol>
		</div>
	</div>
    <div class="cart-wrap">
		<table id="cartTable" class="cart table table-condensed">
			<thead>
				<tr>
					<th class="t-checkbox"><label><input class="check-all check" type="checkbox" />全选</label></th>
					<th class="t-goods text-center"><label>菜品名称</label></th>
					<th class="t-goods text-center"><label>菜品详细信息</label></th>
					<th class="t-selling-price text-center"><label>销售单价</label></th>
					<th class="t-qty text-center"><label>购买数量</label></th>
					<th class="t-subtotal text-center"><label>金额小计</label></th>
					<th class="t-action"><label>操作</label></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${sessionScope.cart}" varStatus="i">
				<input type="hidden" id="userid" value="${sessionScope.user.userid }">
				<tr>
					<td colspan="2" class="goods" id="${item.dishid }"><label > <input type="checkbox" class="check-one check" />${item.dname }</label></td>
					<td><input type="hidden" id="dishid" value="${item.dishid }"></td>
				    <td><input type="hidden" id="num" value="${item.num }"></td>
					<td id="dinfo"><label >${item.dinfo }</label></td>
					<td id="${item.dvalue }" class="selling-price number small-bold-red text-right" style="padding-top: 1.1rem;"data-bind="${item.dvalue }" >${item.dvalue }</td>
					<td id="${item.num }"> 
						<div class="input-group input-group-sm">
							<span class="input-group-addon minus">-</span> <input
										type="text" class="number form-control input-sm" value="${item.num }" />
							<span class="input-group-addon plus">+</span>
							
						</div>
					</td>
					<td class="subtotal number small-bold-red text-right" style="padding-top: 1.1rem;"></td>
					<td class="action" style="padding-top: 1.1rem;" ><input type="hidden" class="dishid" value="${item.dishid }"><span class="delete btn btn-xs btn-warning" id="${item.dishid }">删除</span></td>
				</tr>
				</c:forEach>
				
			</tbody>
		</table>

		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12">
				<div class="cart-summary">
					
					<div style="margin-left: 2rem;" class="pull-right">
						<button id="btn_settlement" type="button" class="btn btn-primary" disabled>去结算</button>
					</div>
					<div style="margin-left: 1rem; margin-top: 0.4rem;" class="pull-right total">
						<label>金额合计:<span id="priceTotal" class="price-total large-bold-red">0.00</span></label>
					</div>
					<div style="margin-top: 4px;" class="pull-right">
						<label>您选择了<span id="itemCount" class="large-bold-red" style="margin: 0 4px;"></span>种菜品，共计<span id="qtyCount" class="large-bold-red" style="margin: 0 4px;"></span>道
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>