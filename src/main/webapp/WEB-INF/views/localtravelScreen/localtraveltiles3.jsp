<%@page import="mul.cam.a.dto.LocalDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<%	
	LocalDto dto = (LocalDto)request.getAttribute("localdto");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="container">
	<div>
		<tiles:insertAttribute name="header"/>
	</div>
	<div>
		<tiles:insertAttribute name="weather"/>
	</div>
    
	<div class="d-flex justify-content-center" align="center">
		<div style="float: left;">
			<tiles:insertAttribute name="placemenu"/>
		</div>
		<div style="float: left;">
			<tiles:insertAttribute name="map"/>
		</div>
		<div style="float: left;">
			<tiles:insertAttribute name="placebbs"/>
		</div>
	</div>
	<div>
		<tiles:insertAttribute name="footer"/>
	</div>	
</div>

</body>
</html>