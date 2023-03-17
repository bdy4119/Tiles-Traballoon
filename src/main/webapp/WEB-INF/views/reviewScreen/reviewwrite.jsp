<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="mul.cam.a.dao.ReviewDao"%>
<%@page import="mul.cam.a.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="mul.cam.a.util.Utility"%>
<%@page import="mul.cam.a.dto.BbsDto"%>
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
    
    <!-- ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    
   	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	
	
	<!-- 서머노트를 위해 추가해야할 부분 -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
  	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  	<!--  -->
  	
  	
    <style>
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            
        }
        
        table {
        	padding-left: 100px;
        	padding-right: 100px;
        }
    </style>

</head>

<body>

 <%
	MemberDto login = (MemberDto)session.getAttribute("login");
	ReviewDto dto = (ReviewDto)request.getAttribute("dto");
%>

<%--container--%>
<div class="container">
    <main>    
    <%--내용--%>
    <hr>
    <h1>글쓰기</h1>
    <hr>
		<div align="center">
		<form action="writeReviewAf.do" id="frm" method="post" enctype="multipart/form-data">
			<table class="table table-striped">
				<col width="150">
				<col width="400">
				<tr>
					<th>id</th>
					<td>
						<%=login.getId() %>
						<input type="hidden" name="id" size="50px" value="<%=login.getId() %>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="title" name="title" name="" size="50px" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="20" cols="50px" id="summernote" name="content" class="summernote"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<button type="submit" id="reviewwrite" class="btn btn-secondary">글쓰기</button>
					</td>
				</tr>
			</table>
		</form>
		</div>
		
		
		<script type="text/javascript">
			
		</script>
    </main>
    <%--내용--%>
    

</div>
<script type="text/javascript">

	$(document).ready(function() {
	
		$("#reviewwrite").click(function() {
			$.ajax({
				type:"POST",
				url:"writeReviewAf.do",
				data: {
					"id" : $("id").val(),
					"title" : $("title").val(),
					"content" : $("content").val()},
				success: function(str) {
					if(str == "REVIEW_ADD_OK") {
						alert("글이 등록되었습니다.");
						location.href="review.do";
					}
				}, error: function() {
					alert("글을 등록하지 못했습니다.");
					location.href="review.do";
				}
			})
		})
	});
	
	
	$(document).ready(function() {

		var toolbar = [
			    // 글꼴 설정
			    ['fontname', ['fontname']],
			    // 글자 크기 설정
			    ['fontsize', ['fontsize']],
			    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    // 글자색
			    ['color', ['forecolor','color']],
			    // 표만들기
			    ['table', ['table']],
			    // 글머리 기호, 번호매기기, 문단정렬
			    ['para', ['ul', 'ol', 'paragraph']],
			    // 줄간격
			    ['height', ['height']],
			    // 그림첨부, 링크만들기, 동영상첨부
			    ['insert',['picture','link','video']],
			    // 코드보기, 확대해서보기, 도움말
			    ['view', ['codeview','fullscreen', 'help']]
			  ];

		var setting = {
	            height : 300,
	            minHeight : null,
	            maxHeight : null,
	            focus : true,
	            lang : 'ko-KR',
	            toolbar : toolbar,
	            callbacks : { //여기 부분이 이미지를 첨부하는 부분
	            onImageUpload : function(files, editor, welEditable) {
	           	 	for (var i = files.length - 1; i >= 0; i--) {
	            		uploadSummernoteImageFile(files[i], this);
	            		}
	            	}
	            }
	         };

	    $('#summernote').summernote(setting);
	});
	    
	    
	    
	    function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			const directory = "productInfo";
			
			$.ajax({
				data : data,
				type : "post",
				url : "uploadSummernoteImageFile.do",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
		
		/*썸머노트 함수
			//text 쓰기
			$('#summernote').summernote('insertText', 써머노트에 쓸 텍스트);
			
			
			//쓰기 비활성화
			$('#summernote').summernote('disable');
			
			//쓰기 활성화
			$('#summernote').summernote('enable');
			
			
			//리셋
			$('#summernote').summernote('reset');
			
			
			//뒤로가기
			$('#summernote').summernote('undo');
			// 앞으로가기
			$('#summernote').summernote('redo');
		*/
		
</script>
<%--container--%>

<%--BootStrap--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">
</script>
<%--BootStrap--%>

</body>
</html>
        