<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
    
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
    <!-- 부트스트랩 -->	
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
<div class="container-fluid">
<div align="center">

<!-- header -->
<tiles:insertAttribute name="header"/><br>
<!-- mypageMenubar -->
<tiles:insertAttribute name="mypageMenubar"/>
<!-- mypageContent -->
<tiles:insertAttribute name="mypageContent"/>
<!-- footer -->
<tiles:insertAttribute name="footer"/>



</div>
</div>
</body>
</html>






