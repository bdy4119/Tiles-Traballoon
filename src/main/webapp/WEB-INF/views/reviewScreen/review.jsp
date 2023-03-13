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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
    

    <style>
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            
        }
        
        .travel-photo {
        	margin: 20px;
        	width: 270px;
        	border: solid 5px aqua;
        }
        
        
        /* 화면 넓어졌을때 */
        @media (min-width: 1000px) {
		  table {
		    width: 1000px;
		  }
		  
		  .order {
		  	margin-left: 147px;
		  }
		  
		  .class {
		  	margin-right: 147px;
		  }
		}
    </style>

</head>

<body>
<%--container--%>
<div class="container">
    <main>
        <%--공백--%>
<!--         <div class="b-example-divider"></div> -->

        <%--내용--%>
        <br>
        
        <%
        List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("review");
		int pageBbs = (Integer)request.getAttribute("pageBbs");
		int pageNumber = (Integer)request.getAttribute("pageNumber");
		String choice = (String)request.getAttribute("choice");
		String search = (String)request.getAttribute("search");
		
		//아래 for문이랑 사진링크 거는 부분 중복돼서 이름바꿈
		ReviewDto reviewdto = (ReviewDto)request.getAttribute("dto");
        %>
        <hr>
        <h1>여행지 리뷰</h1>
        <hr>
		
		<!-- 사진링크 -->
		<div align="center">
			<button type="button" style="font-size:20px;padding-top:1px;padding-bottom:1px;">«</button>
			<a href="">
				<img alt="철원" src="images/cheolwon.jpg" class="travel-photo">
			</a>
			<a href="">
				<img alt="제주" src="images/jeju.jpg" class="travel-photo">
			</a>
			<button type="button" style="font-size:20px;padding-top:1px;padding-bottom:1px;">»</button>
		</div>
		
		
		<br>
		<br>
		<br>
		<!-- 원하는 순서로 보기 -->
		<div style="float: left;" class="order">
			<select id="order">
				<option value="wdate">최신순</option>
				<option value="longdate">오래된순</option>
				<option value="readcount">조회수</option>
			</select>
		</div>
		<!-- 원하는 순서로 보기 -->
		
		<!-- 검색 -->
		<div style="float: right;" class="class">
			<select id="choice">
				<option value="">검색</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>
			<input type="text" id="search" value="">
			
			<button type="button" onclick="searchBtn()">검색</button>
		</div>
		<!-- 검색 끝 -->

		
		<br>
		<div align="center">
		<br>
			<table border="1">
				<col width="70">
				<col width="450">
				<col width="120">
				<col width="200">
				<col width="150">
				<thead>
					<tr align="center">
						<th>번호</th>
						<th>제목</th>
						<th>ID</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody align="center" class="b-example-divider">
					<%
						if(list == null || list.size() == 0) {
							%>
							<tr>
								<td colspan="4">작성된 글이 없습니다.</td>
							</tr>
							<%
						} else {
							for(int i=0; i<list.size(); i++) {
								ReviewDto dto = list.get(i);
							%>
							<tr>
								<th><%=i+1+(pageNumber*10) %></th>
								<%
								if(dto.getDel() == 0) {
								%>
								<td>
									<%=Utility.arrow(dto.getDepth()) %>
									<a href="reviewdetail.do?seq=<%=dto.getSeq() %>">
										<%=dto.getTitle() %>	
									</a>
								</td>
								<%
								} else if(dto.getDel() == 1) {
									%>
									<td>
										<%=Utility.arrow(dto.getDepth()) %>
										<font color="#ff0000">
											*** 이 글은 작성자에 의해 삭제된 게시글입니다 ***
										</font>
									</td>
									<%
								}	
								%>
						
								<td><%=dto.getId() %></td>
								<td><%=dto.getWdate() %></td>
								<td><%=dto.getReadcount() %></td>
							</tr>
							<%
							}
						}
						%>
				</tbody>
			</table>
				
			<br>
			<br>
			<div class="container">
				<nav aria-label="Page navigation">
					<ul class="pagination" id="pagination" style="justify-content:center"></ul>
				</nav>
			</div>
	 		<a href="reviewwrite.do">
				<button type="button" style="float:right;">글쓰기</button>
	 		</a>
	 			
		    <br>
		    <br>
		    <br>
		</div>
		
    </main>
	<script type="text/javascript">
	
		let search = "<%=search %>";
		console.log("search= " + search);
		if(search !="") {
			let obj = document.getElementById("choice");
			obj.value = "<%=choice %>";
			obj.setAttribute("selected", "selected");
		}
		
		
		function searchBtn() {
			let choice = document.getElementById('choice').value;
			let search = document.getElementById('search').value;
				
			/* if(choice == ""){
				alert("카테고리를 선택해 주십시오");
				return;
			} 
			if(search.trim() == ""){
				alert("검색어를 선택해 주십시오");
				return;
			} */
				
			location.href = "review.do?choice=" + choice + "&search=" + search;
		}
			
			
		//페이지 부트스트랩
		$('#pagination').twbsPagination({
			startPage: <%=pageNumber+1 %>, 
			totalPages: <%=pageBbs %>,
			visiblePages: 10,
			first:'<span srid-hidden="true">«</span>',
			prev:"이전",
			next:"다음",
			last:'<span srid-hidden="true">»</span>',
			initiateStartPageClick:false,   // onPageClick 자동실행되지 않도록
			onPageClick: function (event, page) {
			    // alert(page);
			    let choice = document.getElementById('choice').value;
				let search = document.getElementById('search').value;
			    location.href = "review.do?choice=" + choice + "&search=" + search + "&pageNumber=" + (page-1);
			}
		});
		</script>
        
        <%--내용end--%>
        


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
