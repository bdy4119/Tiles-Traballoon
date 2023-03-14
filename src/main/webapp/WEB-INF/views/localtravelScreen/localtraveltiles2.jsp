<%@page import="mul.cam.a.dto.LocalDto"%>
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
<%	
	LocalDto dto = (LocalDto)request.getAttribute("localdto");
%>
<%-- <%=dto.getSeq() %>
<%=dto.getRegionname() %> --%>
<div class="container">		
	<div><tiles:insertAttribute name="header"/></div>
	<div><tiles:insertAttribute name="weather"/></div>
	
	<!-- 일단 막 만들어 뒀고 여기는 지역별 여행지 채울 곳 -->
	<div><tiles:insertAttribute name="eachregion"/></div>
	<!-- <div class="d-flex justify-content-center">
		<div id="Rpic"> 서울 페이지로
		<button type="button" onclick="location.href='gyeonggi.do'">서울/경기</button>
		</div>
		
		
		<div id="Rpic"> 경기 페이지로
		<button type="button" onclick="location.href='main.do'">제주</button>
		</div>
		
		<div id="Rpic"> 제주 페이지로
		<button type="button" onclick="location.href='main.do'">강원</button>
		</div>
	</div>
	<div class="d-flex justify-content-center">	
		<div id="Rpic"> 충청 페이지로
		<button type="button" onclick="location.href='main.do'">충북</button>
		</div>
		
		<div id="Rpic"> 강원 페이지로
		<button type="button" onclick="location.href='main.do'">충남</button>
		</div>
		
		<div id="Rpic"> 경북 페이지로
		<button type="button" onclick="location.href='main.do'">경북</button>
		</div>
	</div>	 -->
	
	<div><tiles:insertAttribute name="footer"/></div>	
	



 

</div>
</body>
</html>