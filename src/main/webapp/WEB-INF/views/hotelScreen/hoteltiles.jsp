<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    
 <!-- 
 부트스트랩 5버전
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
     -->
     
     
    <!-- BootStrap v4.6.2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!--   
     ajax
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>     
	pagination  -->
 	<script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script> 
   

 	
<style type="text/css">
	.navbar { 
		margin: 0 auto;
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
<table style="width:100%">
	<tr>	
			<!-- EL 표현식 : controller에서 보낸것. 아래 형태로 받을 수 있음(속성값 출력) -->
		<td colspan="2" style="background-image:url('hotelimage/airback.png'); height: 300px; background-size: 
		100% auto; background-position: center center;">
 <%-- 			<h2 class="hotel-page-title" >${pageTitle}</h2></a>		<!--  제목 -->
			<p class="hotel-page-desc" >${pageDescription}</p>	<!--  부제목 -->  --%>
		</td>
	</tr>
</table>	
    
    
  
<!-- content -->
		<td style="height: 400px; width: 80%;">
			<tiles:insertAttribute name="content"/>
		</td>



<%-- <tiles:insertAttribute name="hotelcontent"/> --%>


<!-- footer -->
<tiles:insertAttribute name="footer"/>

</body>
</html>





<%-- 그전꺼 백업
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
	
	/* 제목 css */ 
	h2.hotel-page-title {		
	    text-align: left;
	    padding-left: 200px;
	    font-size: 22pt;
	    font-weight: 500;
	}
	/* 부제목 css */ 
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
		<td colspan="2" style="background-image:url('hotelimage/airback.png'); height: 300px; background-size: 
		100% auto; background-position: center center;">
		<a href="./hotel.do" style="text-decoration:none;">
			<h2 class="hotel-page-title" >${pageTitle}</h2></a>		<!--  제목 -->
			<p class="hotel-page-desc" >${pageDescription}</p>	<!--  부제목 -->
			
		</td>
	</tr>
	
	
	
	
<!-- menu : hotelmenu.jsp 에 적용됨-->
	<tr>
	<td align="left" valign="top" style="width: 20%;border-right: 1px solid #ccc;padding: 0 20px;">
			<tiles:insertAttribute name="menu"/>
	</td>
	
<!-- content : hotel.jsp, hoteldetail.jsp에 적용됨-->
		<td style="height: 400px; width: 80%;">
			<tiles:insertAttribute name="content"/>
		</td>
		
		
		<td align="center" style="width: 15%">
			<tiles:insertAttribute name="empty"/>
		</td>
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
 --%>
 