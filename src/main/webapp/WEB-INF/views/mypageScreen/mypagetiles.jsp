<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

<div align="center">

<table style="width: 1000px; height: 600px;" >

<!-- header -->
<tr>
	<td colspan="3" style="height: 10%">
		<tiles:insertAttribute name="header"/>
	</td>
</tr>

<!-- main -->

<tr>
	<td>
		<tiles:insertAttribute name="content"/>
	</td>
<tr>
<%-- <tr>
	<td>
		<tiles:insertAttribute name="mypageAf"/>
	</td>
<tr> --%>
<!-- footer -->
<tr>
	<td colspan="3" style="height: 10%">
		<tiles:insertAttribute name="footer"/>
	</td>
</tr>


</table>

</div>

</body>
</html>






