<%@page import="mul.cam.a.dto.HotelDto"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>


 
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@200&display=swap" rel="stylesheet">
		
	<%
			int page2 = (int) request.getAttribute("page");
			int totalCount = (int) request.getAttribute("totalCount");
			String orderBy = request.getAttribute("orderBy").toString();	//orderBy 받아오기
			int countPage = 9; // 페이지 당 노출 개수 (9개씩 보여주기)
			int totalPage = totalCount / countPage;	//전체 페이지 (데이터 총 개수를 한페이지에 보여줄 개수로 나누기)
	    
	%>
    <style>
        p{
            font-size: 12px;
        } 
        h3{
            font-size: 15px;
        } 
        a{
            color: #333; /* 원하는 색상으로 변경 */
            text-decoration: none; /* 텍스트 밑줄 제거 */
        } 
         a:hover {
            text-decoration: none; /* 마우스 오버시 텍스트 밑줄 제거 */
            color: #333;
        } 
        .image-text h2 {
            font-size: 24px;
            color: #fff;
        }
     
        td {
  		text-align: center;
		}
		
		.hotelname {
  		font-size: 20px;
  		font-family: 'IBM Plex Sans KR', sans-serif;
		}
		.namebrief:hover {
 		 color: #C0C0C0	;
		}
		.brief{
		 color: gray;
		}

		.thumbnail:hover {
		 opacity: 0.8; /* 이미지 투명도 변경 */
  		 filter: grayscale(50%); /* 이미지 회색 톤 효과 추가 */
 		 transform: scale(0.95); /* 이미지 크기 약간 축소 */
 		}
 		
		/* dropdown 부모요소에 상대적인 위치 이동 기능 추가*/
		.nav-item {
		  position: relative;	
		}
		/* dropdown 왼쪽정렬 */
		.dropdown {
		  position: absolute; /* 절대적 위치 고정-다른요소에 영향 주지 않음) */
		  right: 6cm;
		}
        .dropdown .btn-primary {
      	   background-color: gray;
        }
		.pagination a, .pagination span {
         color: #666; /* 글씨 색상 */
         background-color: #fff; /* 버튼 색상 */
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
            justify-content: center;
            align-items: flex-start;
            margin: 0px 50px;
         } 
         .orderBy select {
	 		border: none;
	  		cursor: pointer;
	  		color : gray;
		}
  
    </style>

</head>
<body>
<br>
<!--  상단nav -->
<div class="nav-container" style="width:100%; margin: 0 auto;">
	<ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link active" href="./menu_sudo.do">수도권</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="./menu_gwd.do">강원도</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="./menu_ccd.do">충청도</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="./menu_gsd.do">경상도</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="./menu_jld.do">전라도</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="./menu_jeju.do">제주도</a>
			  </li>  


<div class ="orderBy" style="text-align: right; margin-left: auto;">
	<select onchange="location.href='./hotel.do?orderBy='+this.value;" style="display: inline-block; margin-right: 2cm;">
	    <option value="" <%= ("".equals(orderBy)) ? "selected" : "" %>>지역순</option>
	    <option value="1" <%= ("1".equals(orderBy)) ? "selected" : "" %>>인기순</option>
	    <option value="2" <%= ("2".equals(orderBy)) ? "selected" : "" %>>후기순</option>
	</select>
</div>
</div>	


	<br>
	
		<%
		//DB의 thumbnail 뿌려주기(총 18개)
		List<HotelDto> list = (List<HotelDto>)request.getAttribute("hotellist");
		%>
		<table>
		<%
		for(int i = 0; i< list.size(); i++){
			HotelDto h = list.get(i);
			String thumbnail = h.getThumbnail();
			int seq = h.getSeq();
			String hotelname = h.getHotel_name();
			String brief = h.getBrief();

 
		
			if(i%3==0){ 	// 0, 1, 2  /  0, 1, 2
		%> 
		<tr>
		<% 	
		}
		%>
   			<td>
				<a href="hoteldetail.do?seq=<%=seq %>">
					<img class="thumbnail" src=<%=thumbnail%> style="width:350px; height:350px; border-radius:10px;">
					<div class="namebrief">
					<p class="hotelname"> <%=hotelname %></p> <!-- 호텔 이름 출력 -->
					<pre class="brief"> <%=brief %> </pre> 	<!--  호텔 소개 --> 
					</div>
				</a>
			</td>	 
		<% 	
			if(i%3==2){
			%> 
			</tr>
			<%	
				
			}
		}
		if(list.size()%3!=0){
			%> 
			</tr>
			<%
		}
		%>
		</table>




<!--  페이지네이션 시작 -->
 <br>
	<div class="pagination-container" style="margin-top: 50px;">
	      <nav aria-label="Page navigation">
	          <ul class="pagination" id="pagination" style="justify-content:center"></ul>
	      </nav>
	</div>
	
  <script type="text/javascript">


	    
	    
	    $('#pagination').twbsPagination({
            startPage: <%=page2%>,
            totalPages: <%=totalPage %>,
            visiblePages: 9,
            first: '<span srid-hidden="true">«</span>',
            prev: "이전", 
            next: "다음",
            last: '<span srid-hidden="true">»</span>',
            initiateStartPageClick: false,   // onPageClick 자동실행되지 않도록
            onPageClick: function (event, page) {
                // alert(page);
                location.href = "?page=" + page + "&orderBy=<%=orderBy%>";
                //첫번째 매개변수는 ?, 두번째 매개변수는 & 사용해야함.
                //http://localhost:8090/TraballoonTiles/hotel.do?page=2&orderBy=2
            }
        });

	    
	    </script>
<!--  </div> -->

</body>
</html>