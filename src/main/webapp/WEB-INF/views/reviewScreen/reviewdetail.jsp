<%@page import="mul.cam.a.dto.ReviewComment"%>
<%@page import="mul.cam.a.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>SemiProject</title>

    <%--BootStrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <style>
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }
        
        th{
			background-color: #007bff;
			color: white;
		}
		
		pre{
			white-space: pre-wrap;
			word-break: break-all;
			overflow: auto;
		}
        
        /*  .main-crop {
		    position: relative;
		    width: 100%; // 자를 사이즈를 명시해준다.
		    height: 20px;
		    overflow: hidden;
		
		    .main-img {
		      position: absolute; // 포지션을 주고,
		      top: 100px; 		  // 보이기 원하는 위치를 지정
		      left: 0;
		      width: 300px; // 오리지널 사이즈
		      height: 200px;
		  } */
    </style>

</head>

<body>
<%
	ReviewDto dto = (ReviewDto)request.getAttribute("dto");
%>



<%--container--%>
<div class="container">
    <main>

        <%--공백--%>
        <!-- <div class="b-example-divider"></div> -->

        <%--내용--%>
<!-- 작성자 제목 작성일 조회수 정보 내용
		답글버튼, 삭제 버튼, 수정 버튼 -> 삭제랑 수정은 작성자 본인만 할 수 있게
	-->
		<br>
		
        <hr>
        <h1>여행지 리뷰</h1>
        <hr>
		
		<br>
		
        <hr>
        <h2>상세 리뷰</h2>
        <hr>
        
		<div class="main-img">
 	       	<img alt="제주" src="images/jeju.jpg" class="main-img" width="100%" height="50%">
		</div>
		<div id="app" class="container">
			<form>
				<table class="table table-striped">
				<colgroup>
					<col width="170px"/>
					<col width="500px"/>
				</colgroup>
					<tr>
						<th>작성자</th>
						<td><%=dto.getId() %></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><%=dto.getTitle() %></td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><%=dto.getWdate() %></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><%=dto.getReadcount() %></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="2" style="background-color:white;">
							<pre style="font-size: 20px;font-family:고딕, arial;background-color:white"><%=dto.getContent() %></pre>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<!-- <button type="button" class="btn btn-primary" onclick="answerBbs()">답글</button> -->
							<button type="button" class="btn btn-primary" onclick="location.href='review.do'">글목록</button>
							
							<!-- 수정, 삭제는 로그인한 본인한테만 보이게 하기 -->
							<button type="button" class="btn btn-primary" onclick="updateBbs()">수정</button>
							<button type="button" class="btn btn-primary" onclick="deleteBbs()">삭제</button>
							
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<script type="text/javascript">
			/* function answerBbs(seq) {
				//seq를 넘겨주고 있으므로 seq값 가지고 넘어가기
				location.href = "answer.do?seq=" + seq;
			} */
			
			function updateBbs(seq) {
				location.href = "reviewUpdate.do?seq=" + seq;
			}
			
			//진짜 지우는 게 아니라 업데이트로 지우기
			//del변수를 1로 바꾸고 보이지 않게 바꾸기
			function deleteBbs(seq) {
				location.href = "reviewdeleteAf.do&seq=" + seq;
			}
		</script>
		
		
		
		
		<br>
		<br>
		<!-- 댓글 -->
		<%
			ReviewComment comment = (ReviewComment)request.getAttribute("seq");
		%>
		<div id="app" class="container">
			<form action="" method="post">
			<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
			<input type="hidden" name="id" value="<%=dto.getId() %>">
			
				<table>
				<col width="1500px">
				<col width="150px">
					<tr>
						<td>comment</td>
					</tr>
					<tr>
						<td>
							<textarea rows="3" class="form-control" name="content"></textarea>
						</td>
						<td style="padding-left:30px">
							<button type="button" onclick="reviewCommentWrite()" class="btn btn-primary btn-block p-4">등록</button>
						</td>
					</tr>
				</table>
			</form>
			
			<br>
			<br>
			<!-- 댓글 뿌리기  -->
			<table class="table table-sm">
			<col width="500">
			<col width="500">
				<tbody id="tbody">
				</tbody>
			</table>
		</div>
		
		<script type="text/javascript">
			function reviewCommentWrite(seq) {
				location.href = "reviewCommentWrite.do?seq=" + <%=dto.getSeq()%>;
			}
			
			$(document).ready(function(){
				
				$.ajax({
					url:"./reviewCommentList.do", //react에서는 경로표시 해줘야함
					type:"get",
					data:{"seq":<%=dto.getSeq() %>},
					success:function(list) {
					//	alert('success')
					//	alert(JSON.stringify(list));
						
						
						$("#tbody").html(""); //한번 비워줘야 새로고침해도 더 추가되지않음
						
						//밑에서 올려주기
						//each문 == for문	  (인덱스 번호대로 오브젝트 하나씩 꺼내옴)
						$.each(list, function(index, item){
							let str = "<tr class='table-info'>"
									+ 	"<td> 작성자 : " + item.id + "</td>"
									+ 	"<td> 작성일 : " + item.wdate + "</td>"
									+ "</tr>"
									+ "<tr>"
									+	"<td colspan='2'>" + item.content + "</td>"
									+ "</tr>"
							$("#tbody").append(str);
						});
					},
					error:function() {
						alert('error');
					}
				});
				
			});
		</script>

    </main>

    <%--공백--%>
<!--     <div class="b-example-divider"></div> -->

</div>
<%--container--%>

<%--BootStrap--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">
</script>
<%--BootStrap--%>

</body>
</html>
