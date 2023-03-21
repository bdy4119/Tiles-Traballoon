<%@page import="mul.cam.a.dto.MemberDto" %>
<%@page import="mul.cam.a.dto.CommunityDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    CommunityDto dto = (CommunityDto) request.getAttribute("communitydto");
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

        .getmargin {
            margin-bottom: 20px;
        }
    </style>

</head>
<body>


<%
    //login정보 얻어오기
    Object loginObject = session.getAttribute("login");
    //login이 null일 경우 오류나므로 login 변수를 null이 아닌 MemberDto인스턴스로 초기화
    MemberDto login = new MemberDto();
    boolean isLogin = false;	//isLogin 의 초기값은 false
    if (loginObject != null) {	//로그인이 되고나서야
        login = (MemberDto)session.getAttribute("login");	// 로그인 값을 얻어올 수 있다.
        isLogin = true;	//로그인이 되면 isLogin은 true로 바뀐다.
    }
    request.setAttribute("isLogin", isLogin);	//jsp에서 사용 가능하도록 isLogin 값 request객체에 저장
%>




<div class="container">
    <img src="images/pageimage/image01.jpg" class="img-fluid" alt="Responsive image">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <br>
            <div class="card">
                <div class="card-header">
                    <h4><%=dto.getTitle() %>
                    </h4>
                    <div class="small text-muted">
                        작성자: <%=dto.getId() %>, 작성일: <%=dto.getWdate() %>, 조회수: <%=dto.getReadcount() %>
                    </div>
                </div>
                <div class="card-body">
                    <%=dto.getContent() %>
                </div>
            </div>
            <br>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-12">
            <!-- 수정, 삭제는 로그인한 본인한테만 보이게 -->
            <%
                if (dto.getId().equals(login.getId())) {
            %>
            <div class="d-flex justify-content-end">
                <button type="submit" class="btn btn-secondary mr-3" onclick="updateCommunity(<%=dto.getSeq() %>)">
                    수정
                </button>
                <button type="submit" class="btn btn-secondary" onclick="deleteCommunity(<%=dto.getSeq() %>)">삭제
                </button>
                <%
                    }
                %>
            </div>
            <br>
        </div>
    </div>

</div>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <form action="communitycommentWriteAf.do" method="post">
                <!-- 	<input type="hidden" name="board_id" value="글번호"> -->
                <input type="hidden" name="seq" value="<%=dto.getSeq() %>">
                <input type="hidden" name="id" value="<%=login.getId() %>">
                <div class="form-group">
                    <textarea class="form-control" id="comment_content" name="content" rows="3" onclick="checkLogin()"></textarea>
                </div>
                <button type="submit" class="btn btn-secondary">댓글 등록</button>
            </form>
            <br>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-12">
            <div id="li">
            </div>
        </div>
    </div>

</div>


<script type="text/javascript">
    function updateCommunity(seq) {
        location.href = "communityupdate.do?seq=" + seq;
    }

    function deleteCommunity(seq) {
        location.href = "communitydelete.do?seq=" + seq;  // update del=1
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url: "./communitycommentList.do",
            type: "get",
            data: {"seq":<%=dto.getSeq() %>},
            success: function (list) {
                // alert('success');
                // alert(JSON.stringify(list));

                $("#li").html("");

                $.each(list, function (index, item) {
                    let str = "<div class='card mt-1'>"
                        + "<div class='card-header'>" + item.id + "</div>"
                        + "<div class='card-body'>"
                        + "<ul class='list-unstyled'>"
                        + "<li>"
                        + "<div>" + item.content + "</div>"
                        + "<br>"
                        + "<div>작성일: " + item.wdate + "</div>"
                        + "</li>"
                        + "</ul>"
                        + "</div>"
                        + "</div>"
                        + "<br>"
                    $("#li").append(str);

                });
            },
            error: function () {
                alert('error');
            }
        });
    });

    // 비로그인일 때 로그인 페이지로 보내기
    function checkLogin() {
        // alert('checkLogin()');
        let id = "<%=isLogin %>";
        if(id == 'false'){
            window.location.href = 'login.do';
        }
    }
</script>

</body>
</html>