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
    <title>community write</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--서머노트--%>
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
</head>
<body>

<div class="container">
        <img src="images/friendship.png" class="img-fluid" alt="Responsive image">
    <br>
    <br>
    <form action="communityupdateAf.do" id="frm" method="get" type="submit" enctype="multipart/form-data">
    <input type="hidden" name="seq" value="<%=dto.getSeq() %>" >
        <div class="form-group">
            <label>아이디</label>
            <input type="text" class="form-control" name="id" value="<%=dto.getId() %>" readonly>
        </div>
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" value='<%=dto.getTitle() %>'>
        </div>
        <label>내용</label>
        <textarea id="content" name="content"><%=dto.getContent() %></textarea>
        <div class="d-flex justify-content-center mt-4">
            <button id="frmbtn" type="submit" class="btn btn-secondary">글수정 완료</button>
        </div>
    </form>
    <br>
</div>

<script type="text/javascript">
$(document).ready(function() {	
	$("frmbtn").click(function() {
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

