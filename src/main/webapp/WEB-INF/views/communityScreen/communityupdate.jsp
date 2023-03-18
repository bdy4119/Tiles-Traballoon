<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="mul.cam.a.dto.CommunityDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
CommunityDto dto = (CommunityDto)request.getAttribute("dto");
System.out.println(dto.toString());
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<%--서머노트
	:혹시 다른 거 지웠다가 영권님이 추가시켜놓으신 것들 지워질까봐
	 일단 안지우고 영권님 글쓰기에서 써머노트 부분만 가져왔습니다ㅠㅠ 
	 겹치는 거 빼고 적용하시면 될 것 같아요 영권님ㅠㅠ
	 
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            var toolbar = [
                // 글꼴 설정
                ['fontname', ['fontname']],
                // 글자 크기 설정
                ['fontsize', ['fontsize']],
                // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
                // 글자색
                ['color', ['forecolor', 'color']],
                // 표만들기
                ['table', ['table']],
                // 글머리 기호, 번호매기기, 문단정렬
                ['para', ['ul', 'ol', 'paragraph']],
                // 줄간격
                ['height', ['height']],
                // 그림첨부, 링크만들기, 동영상첨부
                ['insert', ['picture', 'link', 'video']],
                // 코드보기, 확대해서보기, 도움말
                ['view', ['codeview', 'fullscreen', 'help']]
            ];
            var setting = {
                height: "100%",
                minHeight: 800,
                focus: true,
                toolbar: toolbar,
                callbacks: {
                    onImageUpload:
                        function (files, editor, welEditable) {
                            for (var i = files.length - 1; i >= 0; i--) {
                                uploadImageFile(files[i], this);
                            }
                        }
                }
            };
            $('#content').summernote(setting);
        });

        function uploadImageFile(file, el) {
            data = new FormData();
            data.append("file", file);
            const directory = "productInfo";
            $.ajax({
                data: data,
                type: "POST",
                url: "./uploadImage.do",
                contentType: false,
                enctype: 'multipart/form-data',
                processData: false,
                success: function (data) {
                    $(el).summernote('editor.insertImage', data.url);
                }
            });
        }
    </script>
<!-- 써머노트 end -->
--%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<style type="text/css">
th{
	background-color: #007bff;
	color: white;
	text-align: center;
	vertical-align: middle;
}
</style>
</head>
<body>

<img src="images/friendship.png" class="img-fluid">

<div id="app" class="container">

<form action="communityupdateAf.do" id="frm" method="get">
<input type="hidden" name="seq" value="<%=dto.getSeq() %>" >

<table class="table table-sm">
<col width="100px"><col width="500px">

<tr>
	<th>아이디</th>
	<td>		
		<%=dto.getId() %>
		<input type="hidden" id="id" name="id" value="<%=dto.getId() %>">		
	</td>
</tr>
<tr>
	<th class="align-middle">제목</th>
	<td>
		<input type="text" id="title" name="title" size="50px" class="form-control form-control-lg" value='<%=dto.getTitle() %>'>
	</td>
</tr>
<tr>	
	<td colspan="2">
		<textarea rows="18" id="content" name="content" class="form-control"><%=dto.getContent()  %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="right" style="padding-top: 20px">
		<button type="button" class="btn btn-primary">글수정 완료</button>
	</td>
</tr>

</table>
</form>
</div>


<script type="text/javascript">
$(document).ready(function() {	
	$("button").click(function() {		
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
</script>


</body>
</html>