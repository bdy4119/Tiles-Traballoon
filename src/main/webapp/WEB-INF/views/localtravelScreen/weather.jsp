<%@page import="mul.cam.a.dto.AreaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
AreaDto dto = (AreaDto)request.getAttribute("areadto");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


<div align="center" style="background-image: url('<%=dto.getImage() %>');">

<h1><%=dto.getAreaname() %></h1>


</div>

</body>
</html>