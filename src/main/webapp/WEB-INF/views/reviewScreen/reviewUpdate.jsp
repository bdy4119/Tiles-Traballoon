<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="mul.cam.a.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
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
  	<!--  -->
  	
  	
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
		<%--container--%>
		<div class="container">
		<main>
		        <%--공백--%>
		<!-- <div class="b-example-divider"></div> -->
		
		<%--내용--%>
		<br>
		        
		<%
		ReviewDto dto = (ReviewDto)request.getAttribute("dto");
		%>
		<h2>수정</h2>
		<div align="center">
			<form action="reviewUpdateAf.do" id="frm" method="post">
				<input type="hidden" name="seq" value="<%=dto.getSeq() %>"> <!-- seq보내기 -->
				
				<table border="1">
				<col width="200"><col width="500">
					<tr>
						<th>아이디</th>
						<td><%=dto.getId() %></td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="title" size="50" value='<%=dto.getTitle()%>'>
						</td>	
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="20" cols="50px" id="summernote" name="content" class="summernote">
							<%
							for(int i=1; i<=dto.getSeq(); i++) {
								if(dto.getSeq() == i){
							%>
								<img src="images/review/<%=i%>.jpg" class="d-block w-100">
								<br>
								<%=dto.getContent()%>
							<%
								}
							}
							%>
							</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" id="reviewUpdateAf" value="수정완료">
						</td>
					</tr>
				</table>
			</form>
		</div>
    </main>

    <%--공백--%>
	<!--     <div class="b-example-divider"></div> -->
	
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#reviewUpdateAf").click(function(){
				
				$.ajax({
					type:"POST",
					url:"reviewUpdateAf.do",
					data: {
						"title" : $("title").val(),
						"content" : $("content").val()},
					success:function(str) {
						if(str == "REVIEW_UPDATE_OK") {
							alert("성공적으로 수정되었습니다.");
							location.href="review.do";
						}
					},
					error:function() {
						alert("수정에 실패했습니다.");
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