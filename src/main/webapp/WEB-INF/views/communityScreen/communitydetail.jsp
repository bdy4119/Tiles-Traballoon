<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="mul.cam.a.dto.CommunityDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	CommunityDto dto = (CommunityDto)request.getAttribute("communitydto");
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<style type="text/css">

</style>

</head>
<body>

<div class="container">
	<img src="pageimage/image01.jpg" class="img-fluid" alt="Responsive image">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<br>
			<div class="card">
				<div class="card-header">
					<h4><%=dto.getTitle() %></h4>
					<div class="small text-muted">
						작성자: <%=dto.getId() %>, 작성일: <%=dto.getWdate() %>, 조회수: <%=dto.getReadcount() %>
					</div>
				</div>
				<div class="card-body">
					<%=dto.getContent() %>
				</div>
			</div>
			<br>

			<div class="d-flex justify-content-end">
				<button type="submit" class="btn btn-secondary mr-3">수정</button>
				<button type="submit" class="btn btn-secondary">삭제</button>
			</div>


			<!-- 댓글 정보 출력을 위한 템플릿 코드 -->
			<div class="card mt-3">
				<div class="card-header">
					댓글 (commentList.size())
				</div>
				<div class="card-body">
					<ul class="list-unstyled">
						<li>
							<div>comment.getWriter()</div>
							<div>comment.getWdate()</div>
							<div>comment.getContent()</div>
						</li>
						<li>
							<div>comment.getWriter()</div>
							<div>comment.getWdate()</div>
							<div>comment.getContent()</div>
						</li>
						<li>
							<div>comment.getWriter()</div>
							<div>comment.getWdate()</div>
							<div>comment.getContent()</div>
						</li>
					</ul>
				</div>
			</div>
			<br>

			<form action="comment_write.do" method="post">
				<input type="hidden" name="board_id" value="글번호">
				<div class="form-group">
					<textarea class="form-control" id="comment_content" name="content" rows="3"></textarea>
				</div>
				<button type="submit" class="btn btn-secondary">댓글 등록</button>
			</form>

		</div>
	</div>
</div>


<!-- 댓글 정보 출력을 위한 템플릿 코드 -->
<%--			<div class="card mt-3">--%>
<%--				<div class="card-header">--%>
<%--					댓글 (<%=commentList.size() %>)--%>
<%--				</div>--%>
<%--				<div class="card-body">--%>
<%--					<ul class="list-unstyled">--%>
<%--						<% for (CommentDTO comment : commentList) { %>--%>
<%--						<li>--%>
<%--							<div><%=comment.getWriter() %></div>--%>
<%--							<div><%=comment.getWdate() %></div>--%>
<%--							<div><%=comment.getContent() %></div>--%>
<%--						</li>--%>
<%--						<% } %>--%>
<%--					</ul>--%>
<%--				</div>--%>
<%--			</div>--%>


<%--기존 코드--%>

<%--<div id="app" class="container">--%>

<%--<table class="table table-striped table-sm">--%>
<%--<colgroup>--%>
<%--	<col style="width: 150px"/>--%>
<%--	<col style="width: 500px"/>--%>
<%--</colgroup>--%>

<%--<tr>--%>
<%--	<th>작성자</th>--%>
<%--	<td><%=dto.getId() %></td>--%>
<%--</tr>--%>

<%--<tr>--%>
<%--	<th>작성일</th>--%>
<%--	<td><%=dto.getWdate() %></td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--	<th>조회수</th>--%>
<%--	<td><%=dto.getReadcount() %></td>--%>
<%--</tr>--%>
<%--<tr>	--%>
<%--	<td colspan="2" style="font-size: 22px;font-weight: bold;"><%=dto.getTitle() %></td>--%>
<%--</tr>--%>
<%--<tr>	--%>
<%--	<td colspan="2" style="background-color: white;">--%>
<%--		<pre style="font-size: 20px;font-family: 고딕, arial;background-color: white"><%=dto.getContent() %></pre>--%>
<%--	</td>--%>
<%--</tr>--%>
<%--</table>--%>

<%--<br>--%>
<%--<button type="button" class="btn btn-primary" onclick="location.href='communityanswer.do?seq=<%=dto.getSeq() %>'">답글</button>--%>

<%--<button type="button" class="btn btn-primary" onclick="location.href='community.do'">글목록</button>--%>

<%--<%--%>
<%--MemberDto login = (MemberDto)session.getAttribute("login");--%>
<%--if(dto.getId().equals(login.getId())){--%>
<%--	%>--%>
<%--	<button type="button" class="btn btn-primary" onclick="updateCommunity(<%=dto.getSeq() %>)">수정</button>--%>
<%--	--%>
<%--	<button type="button" class="btn btn-primary" onclick="deleteCommunity(<%=dto.getSeq() %>)">삭제</button>--%>
<%--	<%--%>
<%--}--%>
<%--%>--%>
<%--</div>--%>

<%--<script type="text/javascript">--%>
<%--function updateCommunity( seq ) {--%>
<%--	location.href = "communityupdate.do?seq=" + seq;--%>
<%--}--%>
<%--function deleteCommunity( seq ) {--%>
<%--	location.href = "communitydelete.do?seq=" + seq;  // update del=1--%>
<%--}--%>
<%--</script>--%>


<%--<br><br>--%>
<%--&lt;%&ndash; 댓글 &ndash;%&gt;--%>
<%--<div id="app" class="container">--%>

<%--<form action="communitycommentWriteAf.do" method="post">--%>
<%--<input type="hidden" name="seq" value="<%=dto.getSeq() %>">--%>
<%--<input type="hidden" name="id" value="<%=login.getId() %>">--%>

<%--<table>--%>
<%--<col width="1500px"><col width="150px">--%>
<%--<tr>--%>
<%--	<td>comment</td>--%>
<%--	<td style="padding-left: 30px">올리기</td>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--	<td>--%>
<%--		<textarea rows="3" class="form-control" name="content"></textarea>--%>
<%--	</td> --%>
<%--	<td style="padding-left: 30px">--%>
<%--		<button type="submit" class="btn btn-primary btn-block p-4">완료</button>--%>
<%--	</td>--%>
<%--</tr>--%>
<%--</table>--%>
<%--</form>--%>

<%--<br><br>--%>

<%--<table class="table table-sm">--%>
<%--<col width="500"><col width="500">--%>
<%--<tbody id="tbody">--%>
<%--</tbody>--%>
<%--</table>--%>

<%--</div>--%>

<%--<script type="text/javascript">--%>
<%--$(document).ready(function(){--%>
<%--	$.ajax({--%>
<%--		url:"./communitycommentList.do",--%>
<%--		type:"get",--%>
<%--		data:{ "seq":<%=dto.getSeq() %> },--%>
<%--		success:function(list){--%>
<%--			// alert('success');--%>
<%--			// alert(JSON.stringify(list));--%>
<%--			--%>
<%--			$("#tbody").html("");--%>
<%--			--%>
<%--			$.each(list, function(index, item){--%>
<%--				let str = "<tr class='table-info'>" --%>
<%--						+	"<td>작성자:" + item.id + "</td>"--%>
<%--						+	"<td>작성일:" + item.wdate + "</td>"--%>
<%--						+ "</tr>"--%>
<%--						+ "<tr>"--%>
<%--						+	"<td colspan='2'>" + item.content + "</td>"--%>
<%--						+ "</tr>";--%>
<%--				$("#tbody").append(str);--%>
<%--			});--%>
<%--		},--%>
<%--		error:function(){--%>
<%--			alert('error');	--%>
<%--		}		--%>
<%--	});	--%>
<%--});--%>
<%--</script>--%>

<br>
</body>
</html>











