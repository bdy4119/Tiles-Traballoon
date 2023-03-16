<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div align="center">

<table style="width: 100%; height: 100%; border-color: gray;" >

<!-- header -->
<tr align="center">
	<td colspan="3" style="height: 10%">
		<tiles:insertAttribute name="header"/>
	</td>
</tr>

<!-- main(여기서는 header, footer 제외한 가운데 전체를 뜻함) -->
<tr>
<%-- 	<td align="left" align="top" style="background-color: rgb(204,204,204); width: 20%">
		<tiles:insertAttribute name="menu"/>
	</td> --%>
	<td style="height: 400px">
		<tiles:insertAttribute name="content"/>
	</td>
<%-- 	<td align="center" style="width: 15%">
		<tiles:insertAttribute name="empty"/>
	</td> --%>
</tr>

<!-- footer -->
<tr align="center">
	<td colspan="3" style="height: 10%">
		<tiles:insertAttribute name="footer"/>
	</td>
</tr>

 
</table>

</div>

</body>
</html>