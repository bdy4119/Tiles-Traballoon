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
  
    <%--BootStrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	  
    <script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>
    <title>SemiProject</title>
    

    

    <style>
    	
    	
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            
        }
        
        
        #bright {
        	filter: brightness(80%); 
        }
        
        
        /* 메인 사진 */
        .main-wrap {
			position: relative;
			vertical-align: middle;
			width: 120%;
			margin: none;
		}
		
		.main-img img {
			display:block;
			vertical-align: middle;
			width: 120%;
			margin-top: -3.0%;
			filter: brightness(40%);
		}
		
		.main-text {
			position: absolute;
			text-align: center;
			top: 50%;
			left: 50%;
			transform: translate( -50%, -50% );
		}
        /* 메인 사진 */
        
        
        
        a {
        	text-decoration-line: none;
        }
        
        .travel-photo {
        	margin: 10px;
        	width: 270px;
        	border: solid 5px aqua;
        }
        
        
        .travel-photo {
        	margin: 10px;
        	width: 270px;
        	border: solid 5px aqua;
        }
        
        .container-fluid {
        	padding-left: 20%;
        	padding-rignt: 20%;
        }
        
        
        /* 화면 넓어졌을때 */
        @media (min-width: 1000px) {
        
        .travel-photo {
        	margin: 10px;
        	width: 450px;
        	border: solid 5px aqua;
		}
        	
        	
        .main-img img {
			display:block;
			width: 100%;
			vertical-align: middle;
			margin-top: -1.4%;
			filter: brightness(50%); 
			 object-fit: cover;
        }
        
        
        .main-text {
			position: absolute;
			text-align: center;
			top: 50%;
			left: 50%;
			transform: translate( -50%, -50% );
			font-size: 200px;
		}
        
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
<div class="container-fluid">
    <main>
        <%--공백--%>
<!--         <div class="b-example-divider"></div> -->

        <%--내용--%>
        <%
        MemberDto login = (MemberDto)session.getAttribute("login");

        List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("review");
        
        int pageBbs = (Integer)request.getAttribute("pageBbs");
		int pageNumber = (Integer)request.getAttribute("pageNumber");
		String choice = (String)request.getAttribute("choice");
		String search = (String)request.getAttribute("search");
        %>
        
        <!-- 상단 사진 -->
		<!-- <div class="container-fluid" align="center">
	        <div class="main-img">
	        	<img src="images/reviewMainPhoto.jpg" class="img-fluid" alt="...">
	        </div>        
	        <div class="main-text">
	        	<hr style="color:white;">
		        <h1 style="color:white; font-size: 50px; font-style: italic;">여행지 리뷰</h1>
		        <hr style="color:white;">
	        </div>
		</div>     --> 
		<br>   
		<br>   
		<br>   
		<br>   
	
        <!-- 상단 사진 -->
		
		
	
		
		<!-- 사진 슬라이드  -->
		<div class="container" style="margin-top: -80px; margin-bottom: 40px;">
		<div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		    	<a href="reviewdetail.do?seq=3">
			      <img src="images/review/3.jpg" class="d-block w-100" alt="..." id="bright">
		    	</a>
		      <div class="carousel-caption d-none d-md-block">
		        <h1>강원도 철원 다녀옴!</h1>
		        <p>철원 고석정 꽃밭</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		    	<a href="reviewdetail.do?seq=1">
			      <img src="images/review/1.jpg" class="d-block w-100" alt="..." id="bright">
		    	</a>
		      <div class="carousel-caption d-none d-md-block">
		        <h1>제주여행기</h1>
		        <p>여행 가격은?</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <a href="reviewdetail.do?seq=4">
			      <img src="images/review/4.jpg" class="d-block w-100" alt="..." id="bright">
		      </a>
		      <div class="carousel-caption d-none d-md-block">
		        <h1>여수밤바다~</h1>
		        <p>장범준 노래 생각나는 여수 밤바다 Gamsung..</p>
		      </div>
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		</div>
		<!-- 사진 슬라이드 end -->

	
		
						
		<br>
		<br>
		<br>
		<!-- 원하는 순서로 보기 -->
		<div style="float: left;">
			<button type="button" value="wdate" onclick="location.href='wdateOrder.do'" class="btn btn-info">최신순</button>
			<button type="button" value="longdate" onclick="location.href='longdateOrder.do'" class="btn btn-info">오래된순</button>
			<button type="button" value="readcount" onclick="location.href='readcountOrder.do'" class="btn btn-info">조회수순</button>
		</div>
		<!-- 원하는 순서로 보기 END-->
		
		
		<!-- 검색 -->
		<div style="float: right;" class="form-grouup row">
			<div class="col">
				<select id="choice" class="form-select" aria-label="Default select example">
					<option value="">검색</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
				</select>
			</div>
			
			<div class="col">
				<input type="text" id="search" value="" class="form-control"/>
			</div>
			
			<div class="col">
				<button type="button" onclick="searchBtn()" class="btn btn-secondary">검색</button>
			</div>
			
		</div>
		<!-- 검색 끝 -->

		
		<br>
		<div align="center">
		<br>
			<table class="table">
				<col width="70">
				<col width="450">
				<col width="120">
				<col width="200">
				<col width="150">
				<thead class="table-dark">
					<tr align="center">
						<th>번호</th>
						<th>제목</th>
						<th>ID</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody align="center">
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
				<button type="button" style="float:right;" class="btn btn-secondary">글쓰기</button>
	 		</a>
	 			
		    <br>
		    <br>
		    <br>
		</div>
		
    </main>
	<script type="text/javascript">	
	
	
		//검색
		let search = "<%=search %>";
		console.log("search= " + search);
		if(search !="") {
			let obj = document.getElementById("choice");
			obj.value = "<%=choice %>";
			obj.setAttribute("selected", "selected");
			
<%-- 			let orderObj = document.getElementById("choiceOrder");
			orderObj = "<%=orderList %>"
			orderObj.setAttribute("selected", "selected"); --%>
		}
		
		
		function searchBtn() {
			let choice = document.getElementById('choice').value;
			let search = document.getElementById('search').value;
		//	let choiceOrder = document.getElementById('choiceOrder').value;
				
			/* if(choice == ""){
				alert("카테고리를 선택해 주십시오");
				return;
			} 
			if(search.trim() == ""){
				alert("검색어를 선택해 주십시오");
				return;
			} */
				
			location.href = "review.do?choice=" + choice + "&search=" + search // +"&choiceOrder" +choiceOrder;
		}
		

		<%-- function reviewwrite() {
			if(<%=login%> == null) {
				alert('로그인 해 주십시오');			
				location.href = "login.do";
			} else {
				location.href = "reviewwrite.do";
			}
		} --%>
		
		
	/* 	$("#choiceOrder").change(function(){
			
			let choiceOrder = document.getElementById('choiceOrder').value;
			
			location.href = "review.do?choiceOrder=" + choiceOrder;
		}); */
			
			
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
