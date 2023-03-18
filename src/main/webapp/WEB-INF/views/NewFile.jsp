<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% // 스크립트랫 
						// 세션은 받아올 수 있다 
						// 모델은 request.get 
	/* List<MemberDto> list = (List<MemberDto>)request.getAttribute("list"); */
 	MemberDto login = (MemberDto)session.getAttribute("login");
	// 컨트롤러에서 짐싼 모델을 여기서 받아온 것
	/* list.toString(); */
	// list에 정보는 담겨있는 상태. 
	// toString 은 문자열 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body>
<%-- <%=list%> --%>
<%=login.getId()%>

<!-- 모델접근법 -->
<%-- ${list[0].name} --%>
<form action="deleteMember.do" method="post" id="frm">
			<p><input type="hidden" name="id" value="<%=login.getId()%>"><p>
        	<button type="button" id="delBtn" class="btn btn-primary btn-block"> 삭제  </button>
    	</form>
<script type="text/javascript">
/* $.ajax({
	url:"http://localhost:8090/TraballoonTiles/allMember.do", // 컨트롤러에서 데이터호출 어디로가야하는가
	type:"get",													// 어떻게 갈것인가
	/* data:{"id": id}		 
					받아올 데이터가있으니 
	// url 과 타입을 가지고 컨트롤러로 간다
	success:function(list){
		// alert(list);
		// alert(JSON.stringify(list));
		alert(list[0].id);
	},
	error:function(){
		alert('error');
	}
}); */
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