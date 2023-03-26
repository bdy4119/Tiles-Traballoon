    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    HttpSession loginsession = request.getSession();
%>
<html>

<head>
    <title>Title</title>

<style>
	body {
		text-align : center;
		background-repeat: no-repeat;
   		background-size: cover;
	}
	.maintitle img {
	 width: 700px;
 	 height: 200px; 
	}
	table {
		margin : 0 auto;
	}
	body {
		text-align: center;
	}
	.table1 {
	 	display: flex;
	  	justify-content: center;
	}
	.table1 table {
	 	border-collapse: collapse;
	}
	.text1 h1 {
		margin: 0;
	}
 	.table1 td {
		padding: 40px;
		text-align: center;
		font-family: Arial, sans-serif;
	}
	.table1 img {
		width: 150px;
		height: 150px;
	}
	.table1 p{
		color : #78A9ED	;	
		font-weight : bold;
		font-size : 20px;
	}
	.table1 pre{
		font-weight : bold;
		color : gray;
		font-family: Arial, sans-serif;
	}
	.table1 a {
	  	text-decoration: none;
	}
	.table1 img:hover{
  		 filter: grayscale(50%); /* 이미지 회색 톤 효과 추가 */
 		 transform: scale(0.95); /* 이미지 크기 약간 축소 */
 	}
	.popular {
	  	display: flex;
	  	justify-content: center;
	  	align-items: center;
	}
	.flex-container {
		display: flex;
		flex-wrap: wrap;
	}
	
	.flex-container > div {
		width: 33.33%;
		height: 200px;
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center center;
		position: relative;
	}
	
	.flex-container > div > h3 {
		position: absolute;
		bottom: 0;
		left: 0;
		right: 0;
		padding: 10px;
		background-color: rgba(0, 0, 0, 0.5);
		color: #fff;
	}
	
	.flex-container > div:nth-child(odd) {
		height: 400px;
	}
	
	.flex-container > div:nth-child(odd) > h3 {
		top: 0;
		bottom: initial;
	}
	.flex-container div:hover {
 		 transform: scale(1.1);
	}
	.popular {
  		display: flex;
  		justify-content: center;
  		align-items: center;
	}
	.popular img{
		 width: 600px;
	 	 height: 200px; 
	}
	}
</style>

</head>

<body> 
<br><br>
<div class = "maintitle">
	<img src="./pageimage/mainimage/tralogo.png">
</div>

<br>



<div class = "table1"> 
	<table>
	<tr> 
	
	<td>
	<a href="trip.do">
		<img src = "./pageimage/mainimage/mainlocal.png">
		<p> 지역별여행</p>
		<pre>우리나라, 어디까지 가봤니?
아름다운 여행지를
트래벌룬에서 만나보세요.</pre>
	</a>
	</td>
	
	<td>
	<a href="hotel.do">
	<img src = "pageimage/mainimage/mainhotels.png">
		<p>숙소추천</p>
	<pre>감성숙소부터 안락한 호텔까지!
여행 중 지친 몸과 마음,
편안한 숙소에서 쉬어가세요.</pre>
	</a>
	</td>

	
	<td>
	<a href="review.do"> 
	<img src = "./pageimage/mainimage/mainreview.png">
		<p>여행리뷰</p>
	<pre>나만의 국내 추천 코스를
많은 사람들에게 공유해주세요!
#여행코스 #여행추천 #리뷰</pre>
	</a>
	</td>
	 
	<td>
	<a href="community.do"?>
	<img src = "./pageimage/mainimage/maincommunity.png">
		<p>커뮤니티</p>
	<pre>다양한 정보를 공유할 수 있어요.
여행과 관련된 나의 생각을
이곳에서 펼쳐볼까요?</pre>
	</a>
	</td>

	</tr>
	 
	</table>
</div>
<br>
 
<div style="border-top: 1px solid #dcdcdc; width: 700px; margin: 0 auto;"></div> 	<!-- 회색 구분선 -->

<br><br>
<div class="popular"> 
	<img src = "./pageimage/mainimage/recent.png">
</div>

<br><br>
<div class="flex-container">
	<div style="background-image: url('./pageimage/tripImage/trip-seoul.png');" onclick="location.href='./tripcity.do?name=seoul';">
		<h3>SEOUL</h3>
	</div>	
	<div style="background-image: url();">		
	</div>
	
	<div style="background-image: url('./pageimage/tripImage/trip-jeju.png');" onclick="location.href='./tripcity.do?name=jeju';">
		<h3>JEJU</h3>
	</div>
	
	<div style="background-image: url();">
	</div>
	
	<div style="background-image: url('./pageimage/tripImage/trip-chungcheong.png');" onclick="location.href='./tripcity.do?name=chungcheong';">
		<h3>CHUNGCHEONG</h3>
	</div>
	
	<div style="background-image: url();">
	</div>
	
	<div style="background-image: url('./pageimage/tripImage/trip-gangwon.png');" onclick="location.href='./tripcity.do?name=gangwon';">
		<h3>GANGWON</h3>
	</div>
	
	<div style="background-image: url();">
	</div>
	
	<div style="background-image: url('./pageimage/tripImage/trip-gyeongsang.png');" onclick="location.href='./tripcity.do?name=gyeongsang';">
		<h3>GYEONGSANG</h3>
	</div>
	
	<div style="background-image: url();">
	</div>
	
	<div style="background-image: url('./pageimage/mainimage/trip_jeolla.png');" onclick="location.href='./tripcity.do?name=jeolla';">
		<h3>JEOLLA</h3>
	</div>
	
	<div style="background-image: url();">
	</div>
	
</div>
	<br><br>
</body>

<!-- <p style="line-height: 30em;">&nbsp;</p>  --> <!-- 줄간격 -->
</html>
    
