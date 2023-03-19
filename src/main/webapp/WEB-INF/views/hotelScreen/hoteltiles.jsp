<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!--  타일즈 레이아웃 구성 페이지1 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
     
    <!-- BootStrap v4.6.2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

 	<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script> 
   

<style type="text/css">
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
	
	<!-- header에 비행기 배경사진 + 제목, 부제목 넣기  -->
<table style="width:100%">
	<tr>	
			
		<td colspan="2" style="background-image:url('hotelimage/airback.png'); height: 300px; background-size: 
		100% auto; background-position: center center;">
		<a href="./hotel.do" style="text-decoration:none;">
	
		</td>
	</tr>
</table>
    
  
<!-- content -->
		<td style="height: 400px; width: 80%;">
			<tiles:insertAttribute name="content"/>
		</td>



<!-- footer -->
<tiles:insertAttribute name="footer"/>

</body>
</html>
