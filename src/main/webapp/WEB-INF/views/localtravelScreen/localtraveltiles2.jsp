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

<div class="container">

<div><tiles:insertAttribute name="header"/></div>
<div><tiles:insertAttribute name="weather"/></div>
<div><tiles:insertAttribute name="contents"/></div>
<div><tiles:insertAttribute name="footer"/></div>
</div>

</body>
</html>