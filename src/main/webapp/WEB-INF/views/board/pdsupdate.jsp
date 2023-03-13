<%@page import="mul.cam.a.dto.PdsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
PdsDto pds = (PdsDto)request.getAttribute("pds");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>자료수정</h1>

<hr>

<div align="center">

<form action="pdsupdateAf.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="seq" value="<%=pds.getSeq() %>">

<table border="1">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td><%=pds.getId() %></td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50" value="<%=pds.getTitle() %>">
	</td>
</tr>
<tr>
	<th>파일명</th>
	<td><%=pds.getFilename() %>
		<!-- 파일이 변경되지 않았을 경우를 위해서 -->
		<input type="hidden" name="filename" value="<%=pds.getFilename() %>">
		<input type="hidden" name="newfilename" value="<%=pds.getNewfilename() %>">
	</td>
</tr>
<tr>
	<th>수정(대체)할 파일</th>
	<td>
		<input type="file" name="fileload">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea rows="10" cols="50" name="content"><%=pds.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<button type="submit">수정완료</button>
	</td>
</tr>
</table>
</form>
</div>

</body>
</html>








