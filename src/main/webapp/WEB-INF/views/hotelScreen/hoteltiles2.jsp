<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!--  타일즈 레이아웃 구성 페이지2 -->
<!DOCTYPE html>

	 
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>

	</style>
	</head>
	<body>
	
	<div align="center" class="container">
	
	<table style="width: 100%; height: 100%; border-color: gray;" >
	
<!-- header -->

	<tr align="center">
		<td colspan="3" style="height: 10%">
			<tiles:insertAttribute name="header"/>
		</td>
	</tr>
	
<table style="width:100%">
	<tr>	
			
		<td colspan="2" style="background-image:url('hotelimage/airback2.png'); height: 300px; background-size: 
		100% auto; background-position: center center;">
		<a href="./hotel.do" style="text-decoration:none;">

			
		</td>
	</tr>
</table>	

	
<!-- content : hotel.jsp, hoteldetail.jsp에 적용됨-->
		<td style="height: 400px; width: 80%;">
			<tiles:insertAttribute name="content"/>
		</td>
		
		
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

 