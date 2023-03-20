<%@page import="mul.cam.a.dto.MemberDto"%>
<%@page import="mul.cam.a.dto.HotelDto"%>

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
	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
    <style type="text/css">
    
    /* 지도 가운데 정렬 */
     #map {
 	 margin: 0 auto !important;
	}
	/* 줄바꿈 선 */
	.border-top-gray {
  	border-top: 1px solid #dcdcdc;
	} 
	/* 줄간격 */   
	.text pre {
 	line-height: 3;
	}
	/* 버튼 왼쪽 정렬 시키기 */
	.btn-group {
	  display: flex;
	  justify-content: flex-start;
	}
	
	/* 버튼 크기 유지시키기 */
	.btn-group .btn {
	  flex-grow: 0;
	}
	 .cover {
 	 margin: 0 auto !important;
	}
	.name {
	font-family: 'Noto Serif KR', serif; 
	}
	.readcount {
	  margin-right: 40px;
	  margin-left: -40px;
	  text-align: right;
	}
	.readcount p {
	  text-decoration: underline;
	  display: inline;
	  margin-left: 5px;
	}
	.content img{

 border-radius: 20px 0 20px 0;

	}
	

    </style>
    
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=6535dc6f68759c638b09e6bca23442d2"></script>
	
	<% 
	//컨트롤러에서 받아오기
	//HotelDto 얻어오기
		HotelDto hoteldto = (HotelDto)request.getAttribute("hoteldto");
	//login정보 얻어오기
		//처음에 login 정보는 dto가 아니라 session으로 불러온다. 
		//로그인 안 한 상태에선 login이 null값인데 dto는 null값일때 형변환 할 수가 없음.
		Object loginObject = session.getAttribute("login");
		//login이 null일 경우 오류나므로 login 변수를 null이 아닌 MemberDto인스턴스로 초기화
		MemberDto login = new MemberDto(); 
		boolean isLogin = false;	//isLogin 의 초기값은 false
		if (loginObject != null) {	//로그인이 되고나서야
			login = (MemberDto)session.getAttribute("login");	// 로그인 값을 얻어올 수 있다.
			isLogin = true;	//로그인이 되면 isLogin은 true로 바뀐다.
		} 
		request.setAttribute("isLogin", isLogin);	//jsp에서 사용 가능하도록 isLogin 값 request객체에 저장
	
	// 호텔이름 얻어오기
		String hotelname = (String)request.getAttribute("hotelname");
	// 예약주소 얻어오기
		String hotelbook = (String)request.getAttribute("hotelbook");
	// 사진 얻어오기
   		String photo = (String)request.getAttribute("photo");
	// 지도 경도,위도 얻어오기
		// String hotelmap = (String)request.getAttribute("hotelmap");
		String hotelmap = (String)request.getAttribute("hotelmap");
	// 텍스트 얻어오기
		String hotelcontent = (String)request.getAttribute("hotelcontent");
	// 조회수 얻어오기
		String readcount = String.valueOf(request.getAttribute("readcount"));
	// 간단글 얻어오기
		String brief = (String)request.getAttribute("brief");
   	%> 
   
</head>

<body>

<br>
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

<%--container--%>


<!-- 1.  DB -> 예약할 주소 연결 + 커서 올리면 툴팁 실행 
target="_blank : 새탭으로 이동 -->  
 <br><br>
<div class="btn-group">	
    <a href="<%=hotelbook %>" class="btn btn-secondary" data-toggle="tooltip" title="호텔페이지로 이동!" target="_blank">예약</a>
    <a href="#app" class="btn btn-light" data-toggle="tooltip" title="후기를 남겨주세요!">후기</a>
</div> 

<!--조회수-->

<div class="readcount">
	<img src = "./hotelimage/balloon.png">	<!--  풍선 아이콘 -->
	<p>조회수 : <%=readcount %></p>
</div>


<!-- 호텔 상세내용 묶어주는 div태그 -->
<div class="detail-container" style="width: 80%; margin: 0 auto; text-align: center; color: gray;"> 

    <div class="border-top-gray" style="width: 62%; margin: 0 auto;"></div>
   
<!-- 2. DB-> 호텔이름 연결 -->

<br><br>
  <div class="name">
  	<h1><%=hotelname %></h1>
  </div>
  
  
<!-- 3. DB-> 간단소개 연결 -->
<br>
  <p><%=brief  %></p>

<!-- 4.  DB -> 이미지 연결  -->   

    <br><br>
   <div class="content">
        <div class="image">
            <img src=<%=photo%> style="width:50%;"> 
   </div>
   </div>

   
 <!-- 5.  DB -> 텍스트 연결 -->  
 <br><br>
         <div class="border-top-gray" style="width: 62%; margin: 0 auto;"></div>
<br><br>
	<div style="width: 60%; margin: 0 auto;">
		<div class = "hoteltext" style="text-align: left; ">
			<img src="./hotelimage/detail1.png"> <br> 
	 	</div>
	 </div>
    <div class="text">
            <pre><%=hotelcontent %></pre>
    </div>
         
     
     <br>
    <!--  <div style="border-top: 1px solid #dcdcdc; width: 600px; margin: 0 auto;"></div> -->
    <div class="border-top-gray" style="width: 600px; margin: 0 auto;"></div>
    
    
<!-- 6.  DB -> 카카오맵 연결 -->
<br><br>
	<div style="width: 60%; margin: 0 auto;">
		<div class = "mapimage" style="text-align: left; ">
			<img src="./hotelimage/detail2.png"> <br> 
	 	</div>
	 </div> 

	<div id="map" style="width:550px;height:400px;"></div>
<script>
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(<%=hotelmap %>),
        level: 3
    };

    var map = new kakao.maps.Map(container, options);

    var markerPosition = new kakao.maps.LatLng(<%=hotelmap %>);

    var marker = new kakao.maps.Marker({
        position: markerPosition,
        map: map
    });
     
</script>
	<br><br>
	 <div class="border-top-gray" style="width: 62%; margin: 0 auto;"></div>

   
<!-- 7. 공통 기능 : 품질보장 -->
<br><br>
	<div style="width: 60%; margin: 0 auto;">
		<div class = "cover" style="text-align: left; ">
		<img src="./hotelimage/detail3.png"> 
		<br>
	     <pre>  	모든 예약에는 호텔이 예약을 취소하거나 숙소 정보가 정확하지 않은 경우 또는 
    	체크인에 문제가 있는 상황에 대비한 무료 보호 프로그램이 포함됩니다.</pre>     
	 	</div>
	 </div>
	 
	 
 </div> 
 
	<div style="height: 100px;"></div> 	 <!--  공백 추가 -->
	
	
 <!-- 8. 댓글 -->	
	<div id="app" class="container"> <!--  부트스트랩 쓸 때 적용하는 코드 -->
		
	<form action="HotelcommentWriteAf.do" method="post">
	<input type="hidden" name="hotelSeq" value="<%=hoteldto.getSeq() %>">
	<input type="hidden" name="id" value="<%=login.getId() %>">
										<!--  위에서 session으로 넘겨받은 login 활용 -->
	<table>
	<col width="1500px"><col width="150px">
	<tr>
		<td>후기 <img src="./hotelimage/balloon.png"></td>
		<td style="padding-left: 30px">올리기<img src ="./hotelimage/balloon2.png"></td>
	</tr>
	<tr>
		<td>
			<textarea rows="3" class="form-control" name="content" onclick="checkLogin()"></textarea>
		</td> 
		
		<td style="padding-left: 30px">
			<button type="submit" class="btn btn-secondary btn-block p-4" onclick="checkLogin()">등록</button>
		</td>
	</tr>
	</table>
	</form>
		
	<br><br>



		
	<!-- ajax로 댓글 뿌리기 -->
			
	<table class="table-hover table table-sm">
		<col width="500"><col width="500">
		<tbody id="tbody"> </tbody>
	</table>
		
	</div>

		
	<script type="text/javascript">
	$(document).ready(function(){
		$.ajax({
			url:"./HotelcommentList.do",
			type:"get",
			data:{ "seq":<%=hoteldto.getSeq() %> },         
				
			success:function(list){
				// alert('success');
				// alert(JSON.stringify(list));
					
				$("#tbody").html("");	//먼저 비워놔야함. 안그러면 새로고침할 때마다 추가됨.
					
				// $.each : for문과 동일
				$.each(list, function(index, item){ //리스트에서 하나씩 꺼낸다
					let str = "<tr class='table-light'>" 	//부트스트랩
							+	"<td>작성자:" + item.id + "</td>"
							+	"<td>작성일:" + getFormattedDate(new Date(item.wdate)) + "</td>"
							+ "</tr>"
							+ "<tr>"
							+	"<td colspan='2'>" + item.content + "</td>"
							+ "</tr>";
					$("#tbody").append(str);
				});
			},
			error:function(){
				alert('error');	
			}		
		});	
	}); 
		//댓글 작성시 날짜 + 시간 + 분 (초 제외) 까지 보여주는 함수
		function getFormattedDate(d){
		    function pad(n) { return n<10 ? "0"+n : n }
		    return d.getFullYear()+"-"+
		    pad(d.getMonth()+1)+"-"+
		    pad(d.getDate())+" "+
		    pad(d.getHours())+":"+
		    pad(d.getMinutes());
		}
		// 비로그인일 때 로그인 페이지로 보내기
 		function checkLogin() {
			// alert('checkLogin()');
			let id = "<%=isLogin %>";
			if(id == 'false'){
				window.location.href = 'login.do';
			}
		}
		</script>
      	
   
        <%--내용 end--%>


    <%--공백--%>
 <!--    <div class="b-example-divider"></div> -->


</div>
</body>
</html>
