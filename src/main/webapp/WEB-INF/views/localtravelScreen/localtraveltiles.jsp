<%@page import="mul.cam.a.dto.LocalDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.Rpicwrap {
	width: 20%;
	margin: 10px auto;
	position: relative;
}
.textlink {
	color:white;
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	top: 80%;
	left: 50%;
}
</style>
</head>
<body>
<%	
	LocalDto dto = (LocalDto)request.getAttribute("localdto");
%>
<%-- <%=dto.getSeq() %>
<%=dto.getRegionname() %> --%>

	<div><tiles:insertAttribute name="header"/></div>
	<div align="center">가고싶은 여행지를 골라보세요</div>

	<div class="d-flex justify-content-center" align="center">
		<!-- <div id="Rpic"> 서울 페이지로
		<button type="button" onclick="location.href='localtravel2.do'">서울</button>
		</div> -->
		<div class="Rpicwrap">
			<div class="Rpicimage"><img src="images/서울2.jpg" alt="" width="250" height="250"></div>
			<div class="Rpictext">
				<a href="localtravel2.do" class="textlink">서울</a>
			</div>
		</div>
		
		<div class="Rpicwrap">
			<div class="Rpicimage"><img src="images/수원화성2.jpg" alt="" width="250" height="250"></div>
			<div class="Rpictext">
				<a href="localtravel2.do">경기</a>
			</div>
		</div>
			
		<div class="Rpicwrap">
			<div class="Rpicimage"><img src="images/메인2.jpg" alt="" width="250" height="250"></div>
			<div class="Rpictext">
				<a href="localtravel2.do" >제주</a>
			</div>
		</div>
		
	</div>
	<div class="d-flex justify-content-center" align="center">	
		<div class="Rpicwrap">
			<div class="Rpicimage"><img src="images/메인2.jpg" alt="" width="300" height="300"></div>
			<div class="Rpictext">
				<a href="localtravel2.do" >제주</a>
			</div>
		</div>
		
		<div class="Rpicwrap">
			<div class="Rpicimage"><img src="images/메인2.jpg" alt="" width="300" height="300"></div>
			<div class="Rpictext">
				<a href="localtravel2.do" >제주</a>
			</div>
		</div>
		
		<div class="Rpicwrap">
			<div class="Rpicimage"><img src="images/메인2.jpg" alt="" width="300" height="300"></div>
			<div class="Rpictext">
				<a href="localtravel2.do" >제주</a>
			</div>
		</div>
	</div>
		
	<div class="d-flex justify-content-center" align="center">
		<div class="Rpicwrap">
			<div class="Rpicimage"><img src="images/메인2.jpg" alt="" width="300" height="300"></div>
			<div class="Rpictext">
				<a href="localtravel2.do" >제주</a>
			</div>
		</div>
		
		<div class="Rpicwrap">
			<div class="Rpicimage"><img src="images/메인2.jpg" alt="" width="300" height="300"></div>
			<div class="Rpictext">
				<a href="localtravel2.do" >제주</a>
			</div>
		</div>
		
		<div class="Rpicwrap">
			<div class="Rpicimage"><img src="images/메인2.jpg" alt="" width="300" height="300"></div>
			<div class="Rpictext">
				<a href="localtravel2.do" >제주</a>
			</div>
		</div>
	</div>

	<div><tiles:insertAttribute name="footer"/></div>	
	


<%-- <div align="center">

<table style="width: 100%; height: 100%; border-color: gray;" >

<!-- header -->
<tr align="center">
	<td colspan="3" style="height: 10%">
		<tiles:insertAttribute name="header"/>
	</td>
</tr>

<tr align="center">
	<td colspan="3" style="height: 10%">
		<tiles:insertAttribute name="content"/>
	</td>
</tr>


<tr class="d-flex justify-content-center">
<td align="left" valign="top" style="background-color: rgb(204,204,204); width: 20%">
		<tiles:insertAttribute name="menu"/> 
	</td>
	<td style="height: 400px">
		<tiles:insertAttribute name="content"/>
	</td>
	<span></span>
	<td style="height: 400px">
		<tiles:insertAttribute name="content"/>
	</td>
	<span></span>
	<td style="height: 400px">
		<tiles:insertAttribute name="content"/>
	</td>
	<td align="center" style="width: 15%">
		<tiles:insertAttribute name="empty"/>
	</td>
</tr>

<tr class="d-flex justify-content-center">
<td align="left" valign="top" style="background-color: rgb(204,204,204); width: 20%">
		<tiles:insertAttribute name="menu"/> 
	</td>
	<td style="height: 400px">
		<tiles:insertAttribute name="content"/>
	</td>
	<span></span>
	<td style="height: 400px">
		<tiles:insertAttribute name="content"/>
	</td>
	<span></span>
	<td style="height: 400px">
		<tiles:insertAttribute name="content"/>
	</td>
	<td align="center" style="width: 15%">
		<tiles:insertAttribute name="empty"/>
	</td>
</tr>

<tr class="d-flex justify-content-center">
<td align="left" valign="top" style="background-color: rgb(204,204,204); width: 20%">
		<tiles:insertAttribute name="menu"/> 
	</td>
	<td style="height: 400px">
		<tiles:insertAttribute name="content"/>
	</td>
	<span></span>
	<td style="height: 400px">
		<tiles:insertAttribute name="content"/>
	</td>
	<span></span>
	<td style="height: 400px">
		<tiles:insertAttribute name="content"/>
	</td>
	<td align="center" style="width: 15%">
		<tiles:insertAttribute name="empty"/>
	</td>
</tr>
</div>
<!-- footer -->
<tr align="center">
	<td colspan="3" style="height: 10%">
		<tiles:insertAttribute name="footer"/>
	</td>
</tr>

 
</table>

</div>
 --%>
</body>
</html>