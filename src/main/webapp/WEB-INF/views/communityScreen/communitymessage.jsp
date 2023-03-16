<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
</head>
<body>

<%
String communitywrite = (String)request.getAttribute("communitywrite");
if(communitywrite != null && !communitywrite.equals("")){
	if(communitywrite.equals("COMMUNITY_ADD_OK")){
		%>
		<script type="text/javascript">
		alert("성공적으로 작성되었습니다");
		location.href = "community.do";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("다시 작성해 주십시오");
		location.href = "communitywrite.do";
		</script>
		<%
	}
}

String sessionOut = (String)request.getAttribute("sessionOut");
if(sessionOut != null && !sessionOut.equals("")){
	%>
		<script type="text/javascript">
		alert("로그인 해 주십시오");
		location.href = "login.do";
		</script>
	<%
}

String communityupdate = (String)request.getAttribute("communityupdate");
if(communityupdate != null && !communityupdate.equals("")){
	if(communityupdate.equals("COMMUNITY_UPDATE_OK")){
		%>
		<script type="text/javascript">
		alert("성공적으로 수정되었습니다");
		location.href = "community.do";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("다시 작성해 주십시오");
		location.href = "community.do";
		</script>
		<%
	}
}





String answer = (String)request.getAttribute("answer");
if(answer != null && !answer.equals("")){
	if(answer.equals("COMMUNITY_ANSWER_OK")){
		%>
		<script type="text/javascript">
		alert("답글이 성공적으로 작성되었습니다");
		location.href = "community.do";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("답글을 다시 작성해 주십시오");
		location.href = "community.do";
		</script>
		<%
	}
}

String communitydelete = (String)request.getAttribute("communitydelete");
if(communitydelete != null && !communitydelete.equals("")){
	if(communitydelete.equals("COMMUNITY_DELETE_OK")){
		%>
		<script type="text/javascript">
		alert("성공적으로 삭제되었습니다");
		location.href = "community?param=communitylist";
		</script>
		<%
	}
	else{
		%>
		<script type="text/javascript">
		alert("삭제되지 않았습니다");
		location.href = "community?param=communitylist";
		</script>
		<%
	}	
}



%>
</body> 
</html> 




