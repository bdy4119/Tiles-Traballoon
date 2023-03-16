<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!--  타일즈 레이아웃 구성 페이지 -->
<!DOCTYPE html>

	 
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
	h2.hotel-page-title {
	    text-align: left;
	    padding-left: 200px;
	    font-size: 22pt;
	    font-weight: 500;
	}
	
	p.hotel-page-desc {
	    text-align: left;
	    padding-left: 200px;
	    color: #333;
	    font-size: 11pt;
	}
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
	<tr>	
			<!-- EL 표현식 : controller에서 보낸것. 아래 형태로 받을 수 있음(속성값 출력) -->
		<td colspan="2" style="background-image:url('hotelimage/air.jpg'); height: 250px; background-size: 
		100% auto; background-position: center center; border-radius : 30px;">
			<h2 class="hotel-page-title">${pageTitle}</h2>		<!--  제목 -->
			<p class="hotel-page-desc">${pageDescription}</p>	<!--  부제목 -->
		</td>
	</tr>
	
	
<!-- menu : hotelmenu.jsp를 불러옴-->
	<tr>
	<td align="left" valign="top" style="width: 20%;border-right: 1px solid #ccc;padding: 0 20px;">
			<tiles:insertAttribute name="menu"/>
	</td>
	
<!-- content : hotel.jsp 를 불러옴-->
		<td style="height: 400px; width: 80%;">
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

 