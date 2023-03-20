<%-- <%@page import="mul.cam.a.dto.HotelDto"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>


<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SemiProject</title>



  BootStrap
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>


<!-- style은  head-->
  <style>
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            
        }
		.left-menu {
			margin-left: 100px;
			padding-top: 5rem;
			width: 400px;
			display: flex;
		}
		.left-menu li {
		display: inline-block;
		margin-right: 1rem;
		font-size: 1.2rem;
		}

		table {
		width: 100%;
		border-collapse: collapse;
		border: none;
		}
		td {
		width: 25%;
		padding: 5px;
		text-align: center;
		border: none;
		overflow: hidden;
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
            justify-content: center;
            align-items: flex-start;
            margin: 0px 50px;
        }
</style>



</head>

<body>
<br>
	<!-- 정렬 
 		<div class ="sortby" style="text-align: right; margin-left: auto;">
			<select id="orderBy" onchange="location.href='hotel.do?orderBy='+this.value;" style="display: inline-block; margin-right: 2cm;">
			  <option value="">정렬</option>
			  <option value="1">조회수순</option>
			  <option value="2">후기순</option>
			</select>
		</div>
 -->	
 	<!--정렬 --> 		
 	<div class="sortby" style="text-align: right; margin-right: 50px;">
 		<div class="btn-group">
  			 <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="border-color: #ced4da;">
     		 정렬
   			 </button>
    		<ul class="dropdown-menu dropdown-menu-end">
     		 <li><a class="dropdown-item" href="hotel.do?orderBy=">지역순</a></li>
     		 <li><a class="dropdown-item" href="hotel.do?orderBy=1">인기순</a></li>
      		<li><a class="dropdown-item" href="hotel.do?orderBy=2">후기순</a></li>
    		</ul>
  		</div>
	</div>
 		
 
 	
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
		
			if(i%3==0){ 	// 0, 1, 2  /  0, 1, 2
		%> 
		<tr>
		<% 	
		}
		%>

   			<td>
				<a href="hoteldetail.do?seq=<%=seq %>">
					<img src=<%=thumbnail%> style="width:70%; height:200px; border-radius:10px;"> 
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

	    <div class="pagination-container" style="margin-top: 50px;">
	        <nav aria-label="Page navigation">
	            <ul class="pagination" id="pagination" style="justify-content:center"></ul>
	        </nav>
	    </div>
	    
	    <script type="text/javascript">
	    
	    <%
			int page2 = (int) request.getAttribute("page");
			int totalCount = (int) request.getAttribute("totalCount");
			String orderBy = request.getAttribute("orderBy").toString();	//orderBy 받아오기
			int countPage = 9; // 페이지 당 노출 개수 (9개씩 보여주기)
			int totalPage = totalCount / countPage;	//전체 페이지 (데이터 총 개수를 한페이지에 보여줄 개수로 나누기)
	    
	    %>
	    
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
</div>

BootStrap
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous">
</script>
	BootStrap

</body>
</html>
 --%>