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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    
    <!-- ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    
	<!-- 서머노트를 위해 추가해야할 부분 -->
   	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>	
	
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
  	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>

</head>

<body>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	ReviewDto dto = (ReviewDto)request.getAttribute("dto");
%>

<div class="container">
    <img src="images/beach.jpg" class="img-fluid" alt="Responsive image">
    <br>
    <br>
    <form action="writeReviewAf.do" id="frm" method="post" type="submit" enctype="multipart/form-data">
        <div class="form-group">
            <label>아이디</label>
            <input type="text" class="form-control" name="id" value="<%=login.getId() %>" readonly="readonly">
        </div>
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
        </div>
        <label>내용</label>
        <textarea id="summernote" name="content" class="summernote"></textarea>
        <div class="d-flex justify-content-center mt-4">
            <button id="reviewwrite" type="submit" class="btn btn-secondary">작성완료</button>
        </div>
    </form>
    <br>
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

</body>
</html>
        