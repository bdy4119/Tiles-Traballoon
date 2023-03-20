<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
</head>
<body>

	<%
	String message = (String) request.getAttribute("message"); //model 로 받은 짐 푼다
	
	if (message != null && !message.equals("")) {
		// 메세지가 MEMBER_ADD_YES 입니까?
		if (message.equals("MEMBER_ADD_YES")) {
	%>
	<script type="text/javascript">
		alert("성공적으로 가입되었습니다");
		location.href = "login.do";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("가입되지 않았습니다 다시 가입해 주십시오");
		location.href = "regi.do";
	</script>
	<%
	}
	}

	String login = (String) request.getAttribute("login");
	if (login != null && !login.equals("")) {
	if (login.equals("LOGIN_OK")) {
	%>
	<script type="text/javascript">
		alert("로그인되었습니다");
		location.href = "main.do";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("아이디나 패스워드를 확인해 주십시오");
		location.href = "login.do";
	</script>
	<%
	}
	}

	String bbswrite = (String) request.getAttribute("bbswrite");
	if (bbswrite != null && !bbswrite.equals("")) {
	if (bbswrite.equals("BBS_ADD_OK")) {
	%>
	<script type="text/javascript">
		alert("성공적으로 작성되었습니다");
		location.href = "bbslist.do";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("다시 작성해 주십시오");
		location.href = "bbswrite.do";
	</script>
	<%
	}
	}

	String sessionOut = (String) request.getAttribute("sessionOut");
	if (sessionOut != null && !sessionOut.equals("")) {
	%>
	<script type="text/javascript">
		alert("로그인 해 주십시오");
		location.href = "login.do";
	</script>
	<%
	}

	String bbsupdate = (String) request.getAttribute("bbsupdate");
	if (bbsupdate != null && !bbsupdate.equals("")) {
	if (bbsupdate.equals("BBS_UPDATE_OK")) {
	%>
	<script type="text/javascript">
		alert("성공적으로 수정되었습니다");
		location.href = "bbslist.do";
	</script>
	<%
	} else {
	%>

	<script type="text/javascript">
		alert("다시 작성해 주십시오");
		location.href = "bbslist.do";
	</script>
	<%
	}
	}

	String answer = (String) request.getAttribute("answer");
	if (answer != null && !answer.equals("")) {
	if (answer.equals("BBS_ANSWER_OK")) {
	%>
	<script type="text/javascript">
		alert("답글이 성공적으로 작성되었습니다");
		location.href = "bbslist.do";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("답글을 다시 작성해 주십시오");
		location.href = "bbslist.do";
	</script>
	<%
	}
	}

	String bbsdelete = (String) request.getAttribute("bbsdelete");
	if (bbsdelete != null && !bbsdelete.equals("")) {
	if (bbsdelete.equals("BBS_DELETE_OK")) {
	%>
	<script type="text/javascript">
		alert("성공적으로 삭제되었습니다");
		location.href = "bbs?param=bbslist";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("삭제되지 않았습니다");
		location.href = "bbs?param=bbslist";
	</script>
	<%
	}
	}	
	String deleteMember = (String) request.getAttribute("deleteMember");
	if (deleteMember != null && deleteMember != "") {
	if (deleteMember == "DELETE_MEMBER_OK"){
	%>
	<script type="text/javascript">
		alert("회원님의 정보가 삭제되었습니다");
		location.href = "main.do";
	</script>
	<%
	}else{
	%>
	<script type="text/javascript">
		alert("삭제되지 않았습니다");
		locatin.href = "leave.do";
	</script>
	<%
	}
	}
	String updateMember = (String)request.getAttribute("updateMember");
	// 가져온 값이 비어있는값인지 빈문자열인지 먼저 판단
	if(updateMember != null && updateMember != ""){
	if(updateMember == "UPDATE_MEM_OK"){	
	%>
	<script type="text/javascript">
		alert("회원님의 정보 수정이 완료되었습니다");
		location.href = "mypageAf.do";
	</script>
	<%
	}else{
	%>
	<script type="text/javascript">
		alert("수정이 완료되지 않았습니다");
		location.href = "mypageAf.do";
	</script>
	<%
	}
	}
	String refmsg = (String) request.getAttribute("refmsg"); //model 로 받은 짐 푼다
	if (refmsg != null && message != ("")) {
		if (refmsg == ("REF_ADD_YES")) {
	%>
	<script type="text/javascript">
		alert("문의사항이 접수되었습니다");
		location.href = "mypageAf.do";
	</script>
	<%
	} else {
	%>
	<script type="text/javascript">
		alert("문의사항이 접수되지않았습니다.다시 작성해 주십시오");
		location.href = "mypageReference.do";
	</script>
	<%
	}
	}
	 %>
</body>
</html>




