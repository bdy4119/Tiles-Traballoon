<%@page import="mul.cam.a.dto.AreaDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
List<AreaDto> list = (List<AreaDto>)request.getAttribute("arealist");
%>
<%-- <div align="center">
 <table >	<!-- 테이블 -->
		<%
		for(int i = 0; i < list.size(); i++){
				AreaDto a = list.get(i);
				String image = a.getImage();
				int areacode = a.getAreacode();
				
				if(i%3==0){
				%> <tr>	
				<%
				}
				%>
					<td>
						<form action="/localtravel2.do"></form>
						 <a href="localtravel2.do?areacode=<%=areacode %>">	<!-- local앞에 / 있어서 안됐었음 --> 
							<img src="<%=image %>" alt="" width="250" height="250">
						</a>
					</td>
				<%
				if(i%3==2){
				%>
				</tr>
				<%	
				}
			}
			if(list.size()%3!=0){
				%>
				</tr>
				<% 
			}
		%>
</table>   --%>

 
<%
		for(int i = 0; i < list.size(); i++){
				AreaDto a = list.get(i);
				String image = a.getImage();
				int areacode = a.getAreacode();
				
				if(i%3==0){
				%>
				<div class="d-flex justify-content-center" align="center"> 
					
				<%
				}
				%>
					<div width="250" height="250">
						<a href="localtravel2.do?areacode=<%=areacode %>">
							<img src="<%=image %>" alt="" width="250" height="250">
						</a>
					</div>
				<%
				if(i%3==2){
				%>
				</div>
				<%
				}
		}
%> 
						
<!-- </div> -->
</body>
</html>