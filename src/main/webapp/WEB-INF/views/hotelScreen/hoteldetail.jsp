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
    <style>
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }
    </style>

</head>

<body>


<%--container--%>
<div class="container">
    <main>

  
        <%--공백--%>
<!--         <div class="b-example-divider"></div>    -->

        <%--내용 start--%>
      
  <div class="header">
  	<h1>노보텔 앰배서더 서울 용산</h1>
  </div>
  
<!-- 1.  DB -> 예약할 주소 연결  -->  
    <br>
    <div class="button">
        <button onclick="location.href='https://sdc-club.com/ko/index.php'">예약하기</button>
    </div> 
    
<!-- 2.  DB -> 이미지 연결  -->   
   <% 
   
    String photo = (String)request.getAttribute("photo");
   
   %> 
    <br><br>
   <div class="content">
        <div class="image">
            <img src=<%=photo%> style="width:50%;"> 
        </div>
        
        
<!-- 3.  DB -> 카카오맵 연결 -->
    
     <div id="map" style="width:400px;height:300px;"></div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f2e4deda43e78926c2d5c62ec8f0e232"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.53194265302995, 126.96290776191967), // 지도의 중심좌표 
	        level: 5, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 지도에 마커를 생성하고 표시한다
	var marker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(37.53194265302995, 126.96290776191967), // 마커의 좌표
	    map: map // 마커를 표시할 지도 객체
	});
</script>
        
        
 <!--  카카오맵 끝 -->   
 
 <!-- 4.  DB -> 텍스트 연결 -->  

        <div class="text">
            <pre>
            	 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
           		 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
            	 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
          		 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
          		 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
           		 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
            	 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
          		 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
          		 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
           		 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
            	 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
          		 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
          		 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
           		 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
            	 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
          		 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 호텔 상세 텍스트 
            </pre>
        </div>
    </div>
    
 

   
      	<!-- 댓글 공간 댓글버튼, 댓글 수정 버튼 필요-->
      	
      	<!--  댓글 태그 시작 -->
		<div id="app" class="container"> <!--  부트스트랩 쓸 때 적용하는 코드 -->
		
		
		<!-- 댓글 달 때도 seq와 id는 넘겨받아야 함. -->
		
		<%
		//HotelDto 얻어오기
		HotelDto hoteldto = (HotelDto)request.getAttribute("hoteldto");
		%>
		
		<% 
		//호텔 Seq 얻어오기 
		
		
		%>
		<form action="commentWriteAf.do" method="post">
		<input type="hidden" name="hotelseq" value="<%=hoteldto.getSeq() %>">
		<input type="hidden" name="id" value="">
										<!--  위에서 session으로 넘겨받은 login 활용 -->
		
		
		<table>
		<col width="1500px"><col width="150px">
		<tr>
			<td>후기</td>
			<td style="padding-left: 30px">올리기</td>
		</tr>
		<tr>
			<td>
				<textarea rows="3" class="form-control" name="content"></textarea>
			</td> 
			<td style="padding-left: 30px">
				<button type="submit" class="btn btn-primary btn-block p-4">완료</button>
			</td>
		</tr>
		</table>
		</form>
		
		<br><br>
		
		<!--  ajax로 댓글 뿌리기 -->
		<table class="table table-sm">
		<col width="500"><col width="500">
		<tbody id="tbody">
		</tbody>
		</table>
		
		</div>
		
	</main>
		
		<!-- 댓글 뿌릴 때 무조건 댓글 읽어오게 만들기 -->
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
						let str = "<tr class='table-info'>" 	//부트스트랩
								+	"<td>작성자:" + item.id + "</td>"
								+	"<td>작성일:" + new Date(item.wdate) + "</td>"
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
		</script>
      	
      	     
        
        <%--내용 end--%>


    <%--공백--%>
 <!--    <div class="b-example-divider"></div> -->


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
