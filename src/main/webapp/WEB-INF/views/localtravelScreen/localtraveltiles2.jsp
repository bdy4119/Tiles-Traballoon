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
		
	<div><tiles:insertAttribute name="header"/></div>
	<div><tiles:insertAttribute name="weather"/></div>
	
	<div class="d-flex justify-content-center">
		<div id="Rpic"> 서울 페이지로
		<button type="button" onclick="location.href='localtravel2.do'">서울</button>
		</div>
		
		
		<div id="Rpic"> <!-- 경기 페이지로 -->
		<button type="button" onclick="location.href='main.do'">경기</button>
		</div>
		
		<div id="Rpic"> <!-- 제주 페이지로 -->
		<button type="button" onclick="location.href='main.do'">제주</button>
		</div>
	</div>
	<div class="d-flex justify-content-center">	
		<div id="Rpic"> <!-- 충청 페이지로 -->
		<button type="button" onclick="location.href='main.do'">충청</button>
		</div>
		
		<div id="Rpic"> <!-- 강원 페이지로 -->
		<button type="button" onclick="location.href='main.do'">강원</button>
		</div>
		
		<div id="Rpic"> <!-- 경북 페이지로 -->
		<button type="button" onclick="location.href='main.do'">경북</button>
		</div>
	</div>	

	
	<div><tiles:insertAttribute name="footer"/></div>	
	



 
</table>

</div>

</body>
</html>