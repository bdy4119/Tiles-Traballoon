<%@page import="mul.cam.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
MemberDto login = (MemberDto) session.getAttribute("login");
String id = login.getId();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script	 src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<body>
	<div class="container">
		<div class="border-box">
			<div class="complete-wrap font-nt ls-05 word-break">
				<h3 align="center">떠나신다니 아쉬워요</h3>
				<div class="gap-1 hidden-md-down"></div>

				<p align="center">그동안 이용해주셔서 감사드립니다</p>
				<br>
				<div class="gap-1 hidden-md-up"></div>
			</div>
		</div>
	</div>
	<div class="gap-3 hidden-xs-down"></div>
	<div class="gap-1 hidden-sm-up"></div>
	<div class="container">
		<div class="card none-border">
			<div class="mb-3">
				<h4 class="card-title">
					<br>남기시고 싶은 말씀을 남겨주세요.
				</h4>
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="15"></textarea>
			</div>
		</div>
	</div>
	<div class="gap-3 hidden-xs-down"></div>
	<div class="gap-1 hidden-sm-up"></div><br>
	<div class="container">
		<form action="deleteMember.do" method="post" id="frm">
			<input type="hidden" name="id" id="id1" value="<%=login.getId()%>">
			<button type="button" class="btn btn-outline-secondary" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="-bs-btn-padding-y: 1rem; - -bs-btn-padding-x: 2.2rem; - -bs-btn-font-size: 1.1rem;">탈퇴하기</button>
			<button type="button" onclick="location.href='mypageLeave.do'" class="btn btn-outline-secondary" style="-bs-btn-padding-y: 3rem; - -bs-btn-padding-x: 3.3rem; - -bs-btn-font-size: 1.1rem;">취소</button>
			<!-- <button type="button" id="delBtn" class="btn btn-primary">탈퇴하기</button> -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
				        <button type="button"  class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				       	정말 탈퇴하시겠습니까?
				      </div>
				      <div class="modal-footer">
				      	<button type="button" id="delBtn" class="btn btn-primary">탈퇴하기</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
				      </div>
				    </div>
				  </div>
				</div>
		</form>
	</div>

<!-- Modal -->

<script type="text/javascript">
// 모달 버튼에 이벤트를 건다.
$('#openModalBtn').on('click', function(){
	$('#modalBox').modal('show');
});
		  // 모달 안의 취소 버튼에 이벤트를 건다.
$('#closeModalBtn').on('click', function(){
	$('#modalBox').modal('hide');
});
$("#delBtn").click(function(){
	var id = $("#id1").val();		// getter
$("#id1").val('<%=login.getId()%>');
	$("#frm").submit();
});

$("#ccBtn").click(function() {
	location.href = "mypageLeave.do";
});

</script>

</body>
</html>