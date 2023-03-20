<%@page import="mul.cam.a.dto.MemberDto"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
pre{
	white-space: pre-wrap;
	word-break:break-all;
	overflow: auto;
}
</style>
</head>
<body>

<h1>자료상세보기</h1>
<hr>

<div id="app" class="container">
<table class="table">
<col style="width: 150px"/><col style="width: 150px"/><col style="width: 150px"/>
<tr>	
	<td colspan="3" style="font-size: 22px;font-weight: bold;">제목: <%=pds.getTitle() %></td>
</tr>

<tr>
	<td colspan="3">
		<%=pds.getFilename() %>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-info" value="다운로드" onclick="filedown(<%=pds.getSeq() %>, '<%=pds.getNewfilename() %>', '<%=pds.getFilename() %>')">
	</td>
</tr>

<tr>	
	<td>아이디: <%=pds.getId() %></td>
	<td>다운로드수: <%=pds.getDowncount() %></td>
	<td>등록일: <%=pds.getRegdate() %></td>
</tr>

<tr>	
	<td colspan="3">
		<pre style="font-size: 20px;font-family: 고딕, arial;background-color: #fafafa;"><%=pds.getContent() %></pre>
	</td>
</tr>

</table>

<br>
<button type="button" class="btn btn-info" onclick="location.href='pdslist.do'">자료실목록</button>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
if(pds.getId().equals(login.getId())){
	%>
	<button type="button" class="btn btn-info" onclick="updatePds(<%=pds.getSeq() %>)">수정</button>
	
	<button type="button" class="btn btn-info" onclick="deletePds(<%=pds.getSeq() %>)">삭제</button>
	<%
}
%>

</div>

<form name="file_down" action="filedownLoad.do" method="post">
	<input type="hidden" name="newfilename">
	<input type="hidden" name="filename">
	<input type="hidden" name="seq">
</form>

<script type="text/javascript">
function filedown(seq, newfilename, filename) {
	document.file_down.newfilename.value = newfilename;
	document.file_down.filename.value = filename;
	document.file_down.seq.value = seq;
	document.file_down.submit();
	
	setTimeout(replay, 500);  // 0.5초
}

function updatePds( seq ) {
	location.href = "pdsupdate.do?seq=" + seq;
}
function deletePds( seq ) {
	location.href = "pdsdelete.do?seq=" + seq;  
}
function replay() {
	location.reload();
}
</script>

</body>
</html>




