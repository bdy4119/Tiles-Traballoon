<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

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
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Rashi+Hebrew:wght@600&display=swap" rel="stylesheet">

<style>
	h1 {
	font-family: "Playfair Display", Georgia, "Times New Roman", serif;
	color : white;
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
	
<table style="width:100%">
	<tr>				
		<td colspan="2" style="background-image:url('pageimage/mainimage/bgocean.png'); height: 550px; 
			background-size : contain; background-position: center center; background-repeat: no-repeat;">
			<div style="text-align: center; ">
				<h1>FLY ON THE TRABALLOON</h1>
		
			</div>
		</td>
	</tr>
</table>
<!-- content -->
<tiles:insertAttribute name="maincontent"/>



<!-- footer -->
<tiles:insertAttribute name="footer"/>

</body>
</html>