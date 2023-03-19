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
		

<!-- style은  head-->
  <style>
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            }
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
	

</style>


</head>

<body>
<br>

<!--  상단 메뉴 -->
<div class="nav-container">
<!-- <div class="nav-container" style="display: flex; justify-content: center;"> -->
<nav class="navbar navbar-expand-lg navbar-light bg-light";>
  <div class="container-fluid">
    <a class="navbar-brand" href="./hotel.do">menu</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
    		data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
      <!--   <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link" href="./menu_sudo.do">수도권</a>
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
      </ul>
    </div>
  </div>
</nav>
</div>

<br><br>
	<%
		//DB의 thumbnail 뿌려주기(총 18개)
		List<HotelDto> list = (List<HotelDto>)request.getAttribute("hotellist");
		%>
		<table>
		<%
		for(int i = 9; i< 12; i++){
		    HotelDto h = list.get(i);
		    String thumbnail = h.getThumbnail();
		    int seq = h.getSeq();
		    String hotelname = h.getHotel_name();
			String brief = h.getBrief();
		    if(i%3==0){     // 0, 1, 2  /  0, 1, 2
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
		
		
		<p style="line-height: 10em;">&nbsp;</p>  <!-- 줄간격 -->

</body>
</html>
