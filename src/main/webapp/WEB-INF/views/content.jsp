<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto login = (MemberDto)session.getAttribute("login");

%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SemiProject</title>

    <%--BootStrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

    <style>
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>

<body>

<%--내용--%>
        <h1>Multi Campus</h1>
        <h1>Semi-Project</h1>
        <p>김영권 김동민 권하나 심재훈 백다연</p>
        <h1>할 수 있 다 !</h1>
        <%--내용--%>
        <button type="button" onclick ="location.href='NewFile.do'" > 버튼 </button>
</div>

<button type="button" onclick="location.href='deleteMember.do'"  value="">adsds</button>
<form action="deleteMember.do" method="post" id="frm">
			<p><input type="hidden" name="id" value="<%=login.getId()%>"><p>
        	<button type="button" id="delBtn" class="btn btn-primary btn-block"> 삭제  </button>
    	</form>
<input>
<div class="mb-3 row">
				<label for="staticEmail" class="col-sm-2 col-form-label">id</label>
				<div class="col-sm-10">
					<input type="text" readonly class="form-control-plaintext"
						id="name" value="<%=login.getId()%>">	
				</div>
			</div>
<a href="newFile.do">newFile</a>
<script type="text/javascript">
$(document).ready(function() {	
	$("deleteBtn").click(function() {		
		if($("#title").val().trim() == "" ){
			alert("제목을 기입해 주십시오");
			return;
		}else if($("#content").val().trim() == "" ){
			alert("내용을 기입해 주십시오");
			return;
		}else{
			$("#frm").submit();
		}		
	});	
});
$("#delBtn").click(function(){
	var id = $("#id").val();
	alert(id);
	
	$("#id1").val('<%=login.getId()%>');
	
	alert($("#id1").val('<%=login.getId()%>'));
	
	$("#frm").submit();
});
</script>
</body>
</html>
