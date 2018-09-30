<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<script src="<%=path%>/js/jquery-2.2.2.min.js"></script>
<script src="<%=path%>/js/JsonTools.js"></script>
<head>

</head>
<body>
	<div class="adminadd">
		<form action="add_Dish" method="post" enctype="multipart/form-data">
		<table border="1" id="right_table1" align="center">
			<tr>
					<th>菜品名</th>
					<th>菜品类</th>
					<th>单价</th>
			</tr>
			<tr>
				<td><input type="text" name="dname" id="dname"
					placeholder="菜品名" required="true" /></td>
				<td><input type="text" name="dinfo" id="dinfo"
					placeholder="菜品类" required="true" /></td>
				<td><input type="text" name="dvalue" id="dvalue"
					placeholder="单价" required="true" /></td>
			</tr>
			<tr>
					<th>上传日期</th>
					<th>上传图片</th>
			</tr>
			<tr>
				<td for="birthday"><input type="date" name="ddate" id="ddate"
					placeholder="上传日期" required="true" /></td>
				<td>
				<input type="file" name="image" id="image" class="inputfile inputfile-4" data-multiple-caption="{count} files selected" multiple />
					<label for="image"><figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure> <span id="mms">上传图片文件</span></label>
				</td>
			</tr>
		</table>
		<br />
		<div class="button" align="center">
			<input  type="submit" value="新增"
				style="font-size: 18px;" />
		</div>
		</form>
	</div>
</body>
<style type="text/css">
#adminadd {
	width: 100%;
	overflow: hidden;
	height: 580px;
	overflow: auto;
}

#right_table1 {
	width: 880px;
	height: 100px;
}

#right_table1 th {
	background: #eee;
	text-align: center;
	width: 290px;
}

#right_table1 td {
	width: 290px;
	text-align: center;
	height: 100px;
	background-color: #E9F8FF;
}

#right_table1 td input {
	font-family: "楷体";
	font-size: 18px;
}

input[type=text] ,input[type=password]{
	text-align: center;
}

input[type=button] {
	font-size: 18px;
	font-family: "楷体";
}

div:first-child {
	margin-top: 40px;
}
</style>
</html>