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
    	/* 디자인 통일 */
    	 .board-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            margin-top: 40px; /* 상단 간격 조정 */
        }
        .board-sort {
            display: flex;
            align-items: center;
            padding-bottom: 15px;
        }
        .search-container {
            display: flex;
            align-items: center;
        }
        .custom-select {
            width: 100px;
            margin-right: 10px;
        }
        .form-control {
            flex: 1;
            margin-right: 10px;
        }
        .btn-secondary {
            width: 70px;
        }
        a {
            color: #666; /* 적용할 색상 */
            text-decoration: none; /* 밑줄 제거 */
        }
        td, th {
            color: #666;
        }
        table {
            font-size: 14px;
        }
        .pagination a, .pagination span {
            color: #666; /* 글씨 색상 */
            background-color: #fff; /* 버튼 색상 */
            /* 버튼 테두리 색상 */
        }
        .pagination a:hover, .pagination span:hover {
            color: #666; /* 호버 시 글씨 색상 */
            background-color: #eceef0; /* 호버 시 버튼 색상 */
            /* 호버 시 버튼 테두리 색상 */
        }
        .pagination .page-item.active .page-link {
            color: #666;
            background-color: #eceef0;
            border-color: #dee2e6;
        }
        .pagination-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin: 0px 50px;
        }
        .write-button-container {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }
        .button-wrapper .btn {
            width: 70px;
        }
		/* 디자인 통일 end */
    
    
    
    
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            
        }
        
        
        
        
        
        #bright {
        	filter: brightness(80%); 
        	
        	padding-bottom: -50px;
        }
        
        
       
        
        
        
        a {
        	text-decoration-line: none;
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
        
        
        .travel-photo {
        	margin: 10px;
        	width: 270px;
        	border: solid 5px aqua;
        }
        
        .container-fluid {
        	padding-left: 20%;
        	padding-rignt: 20%;
        }
        
        
        /* 슬라이드 사진 높이 조정 */
		.carousel-inner {
		     width: 100%;
		     height: 300px;
		 }
		 
		 
		 /* 슬라이드 폰트 위치 */
		 .carousel-caption {

		    position: absolute;		
		    right: 50%;		
		    bottom: 210px;		
		    left: 15%;
		    z-index: 10;		
		    padding-top: 20px;		
		    padding-bottom: 20px;		
		    color: #fff;	
		    text-align: center;		
		    text-shadow: 0 1px 2px rgba(0,0,0,.6);
		
		}
		
		
        
        /* 화면 넓어졌을때 */
        @media (min-width: 1000px) {
        /* 슬라이드 사진 높이 조정 */
			.carousel-inner {
		            width: 100%;
		            height: 500px;
		        }
			 
			 /* 슬라이드 폰트 위치 */
			 .carousel-caption {
	
			    position: absolute;		
			    right: 50%;		
			    bottom: 450px;		
			    left: 15%;
			    z-index: 10;		
			    padding-top: 20px;		
			    padding-bottom: 20px;
			    padding-right: 50px;	
			    color: #fff;	
			    text-align: center;		
			    text-shadow: 0 1px 2px rgba(0,0,0,.6);
			
			}
        
        	h1{
        		font-family: sans-serif;
        		font-size: 60px;
        		padding-bottom: 10px;
        	}
        	
        	p {
        		font-size: 20px;
        		padding-bottom: 30px;
        	}
        	
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
    <%
    MemberDto login = (MemberDto)session.getAttribute("login");

    List<ReviewDto> list = (List<ReviewDto>)request.getAttribute("review");
        
    int pageBbs = (Integer)request.getAttribute("pageBbs");
	int pageNumber = (Integer)request.getAttribute("pageNumber");
	String choice = (String)request.getAttribute("choice");
	String search = (String)request.getAttribute("search");
    %>
    
    
 

<div class="container">
<!-- <img src="images/reviewmain2.JPG" class="img-fluid" alt="Responsive image"> -->
		
	<!-- 사진 슬라이드  -->
		<div class="container">
		<div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		    	<a href="reviewdetail.do?seq=4">
			      <img src="images/review/4.jpg" class="d-block w-100" alt="..." id="bright">
		      </a>
		      <div class="carousel-caption d-none d-md-block">
		        <h1 id="size">여수밤바다~</h1>
		        <p id="size">장범준 노래 생각나는 여수 밤바다 Gamsung..</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		    	<a href="reviewdetail.do?seq=1">
			      <img src="images/review/1.jpg" class="d-block w-100"  alt="..." id="bright">
		    	</a>
		      <div class="carousel-caption d-none d-md-block">
		        <h1 id="size">제주여행기</h1>
		        <p id="size">여행 가격은?</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <a href="reviewdetail.do?seq=3">
			      <img src="images/review/3.jpg" class="d-block w-100" alt="..." id="bright">
		    	</a>
		      <div class="carousel-caption d-none d-md-block">
		        <h1 id="size">강원도 철원 다녀옴!</h1>
		        <p id="size">철원 고석정 꽃밭</p>
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

	
	<div class="board-header">
        <div class="board-sort" style="margin-bottom: -13px;">
			<!-- 원하는 순서로 보기 -->
			<button type="button" value="wdate" onclick="location.href='wdateOrder.do'" class="btn btn-secondary" style="margin-right: 5px; padding-left: 10px; padding-right: 10px;">최신순</button>
			<button type="button" value="longdate" onclick="location.href='longdateOrder.do'" class="btn btn-secondary" style="margin-right: 5px; padding-left: 10px; padding-right: 10px;">옛날순</button>
			<button type="button" value="readcount" onclick="location.href='readcountOrder.do'" class="btn btn-secondary" style="margin-right: 5px; padding-left: 10px; padding-right: 10px;">조회수</button>
			<button type="button" value="reviewCommunityList" onclick="location.href='reviewCommunityList.do'" class="btn btn-secondary" style="margin-right: 5px; padding-left: 10px; padding-right: 10px;">커뮤니티 글 가져오기</button>
			<!-- 원하는 순서로 보기 END-->
        </div>

		 <div class="search-container">
			<!-- 검색 -->
			<select id="choice" class="custom-select" aria-label="Default select example">
				<option selected>검색</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>
			<input type="text" id="search"value="<%=search %>" class="form-control"/>
			<button type="button" onclick="searchBtn()" class="btn btn-secondary">검색</button>
			<!-- 검색 끝 -->
		 </div>
     </div>

		
	<div class="table-responsive">
		
		<table class="table" style="border-collapse: collapse;">
			<thead style="background-color: #f8f9fa;">
		       <tr>
		          <th scope="col" style="width: 8%; text-align: center;">번호</th>
		          <th scope="col" style="width: 50%">제목</th>
		          <th scope="col" style="width: 16%; text-align: center;">조회수</th>
		          <th scope="col" style="width: 16%; text-align: center;">작성일</th>
		          <th scope="col" style="width: 16%; text-align: center;">작성자</th>
		       </tr>
		     </thead>
		     <tbody>
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
								<th style="text-align: center;"><%=i+1+(pageNumber*10) %></th>
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
											*** 이 글은 작성자에 의해서 삭제되었습니다 ***
										</font>
									</td>
									<%
								}
								%>
								<td style="text-align: center;"><%=dto.getReadcount() %></td>
								<td style="text-align: center;"><%=dto.getWdate() %></td>
								<td style="text-align: center;"><%=dto.getId() %></td>
							</tr>
							<%
							}
						}
						%>
				</tbody>
			</table>
	</div>
		
	<div class="pagination-container">
		<div class="container">
			<nav aria-label="Page navigation">
				<ul class="pagination" id="pagination"></ul>
			</nav>
		</div>
		<div class="write-button-container">
		    <div class="button-wrapper" style="margin-right: -50px;">
		         <a href="reviewwrite.do" class="btn btn-secondary" style="margin-right: 5px; padding-left: 10px; padding-right: 10px;">
		         	글쓰기
		         </a>
		    </div>
		</div>
	</div>
		
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
        



</div>


<%--BootStrap--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">
</script>
<%--BootStrap--%>


</body>
</html>
