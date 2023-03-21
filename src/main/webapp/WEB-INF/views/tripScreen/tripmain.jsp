<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>

<head>
<title>Title</title>
<style>
p {
	font-size: 12px;
}

h3 {
	font-size: 15px;
}

.card-body {
	height: 145px; /* 원하는 높이값 */
}

.citycard {
	color: #333; /* 원하는 색상으로 변경 */
	text-decoration: none; /* 텍스트 밑줄 제거 */
}

.citycard:hover {
	text-decoration: none; /* 마우스 오버시 텍스트 밑줄 제거 */
	color: #333;
}

.image-container {
	position: relative;
	display: inline-block;
	padding: 15px;
}

.card-img-top {
	max-width: 100%;
}

.image-text h2 {
	font-size: 24px;
	color: #fff;
}
</style>

</head>
<body>

	<div class="container">
		<div></div>
		<br>
		<div class="row">
			<%--1--%>
			<div class="col-md-4">
				<div class="card">
					<a class="citycard" href="tripcity.do?name=seoul">
						<div class="image-container" style="position: relative;">
							<img class="card-img-top"
								src="pageimage/tripImage/trip-seoul.png" alt="Card image cap">
							<span
								style="position: absolute; top: 30px; left: 30px; color: white; font-weight: bold; font-size: 30px">서울</span>
						</div>
						<div class="card-body">
							<h3 class="card-title">서울</h3>
							<p class="card-text">역사와 현대의 만남이 있는 도시, 한국의 중심지이자 대표적인
								관광도시입니다.</p>

						</div>
					</a>
				</div>
			</div>
			<%--2--%>
			<div class="col-md-4">
				<div class="card">
					<a class="citycard" href="tripcity.do?name=gyeonggi">
						<div class="image-container" style="position: relative;">
							<img class="card-img-top"
								src="pageimage/tripImage/trip-gyeonggi.png" alt="Card image cap">
							<span
								style="position: absolute; top: 30px; left: 30px; color: white; font-weight: bold; font-size: 30px">경기</span>
						</div>
						<div class="card-body">
							<h3 class="card-title">경기</h3>
							<p class="card-text">관광과 쇼핑의 메카, 수도권 최대의 국제도시인 인천과 경기도 일대를
								아우르며 많은 인파를 유치합니다.</p>
						</div>
					</a>
				</div>
			</div>
			<%--3--%>
			<div class="col-md-4">
				<div class="card">
					<a class="citycard" href="tripcity.do?name=gangwon">
						<div class="image-container" style="position: relative;">
							<img class="card-img-top"
								src="pageimage/tripImage/trip-gangwon.png" alt="Card image cap">
							<span
								style="position: absolute; top: 30px; left: 30px; color: white; font-weight: bold; font-size: 30px">강원</span>
						</div>
						<div class="card-body">
							<h3 class="card-title">강원</h3>
							<p class="card-text">청정한 자연과 풍부한 문화 유산, 세계적인 스키 리조트와 천혜의 자연
								경관이 있는 도시입니다.</p>
						</div>
					</a>
				</div>
			</div>
		</div>

		<div class="row">
			<%--4--%>
			<div class="col-md-4">
				<div class="card">
					<a class="citycard" href="tripcity.do?name=chungcheong">
						<div class="image-container" style="position: relative;">
							<img class="card-img-top"
								src="pageimage/tripImage/trip-chungcheong.png"
								alt="Card image cap"> <span
								style="position: absolute; top: 30px; left: 30px; color: white; font-weight: bold; font-size: 30px">충청</span>
						</div>
						<div class="card-body">
							<h3 class="card-title">충청</h3>
							<p class="card-text">자연과 역사가 공존하는 고즈넉한 도시, 대한민국의 중심부에 위치하며
								국내외 여행객들의 사랑을 받습니다.</p>
						</div>
					</a>
				</div>
			</div>
			<%--5--%>
			<div class="col-md-4">
				<div class="card">
					<a class="citycard" href="tripcity.do?name=jeolla">
						<div class="image-container" style="position: relative;">
							<img class="card-img-top"
								src="pageimage/tripImage/trip-jeolla.jpg" alt="Card image cap">
							<span
								style="position: absolute; top: 30px; left: 30px; color: white; font-weight: bold; font-size: 30px">전라</span>
						</div>
						<div class="card-body">
							<h3 class="card-title">전라</h3>
							<p class="card-text">역사와 문화가 깊게 새겨진 고요한 도시, 세계적으로 유명한 순천만습지를
								비롯해 많은 자연과 문화유산을 보유하고 있습니다.</p>
						</div>
					</a>
				</div>
			</div>
			<%--6--%>
			<div class="col-md-4">
				<div class="card">
					<a class="citycard" href="tripcity.do?name=gyeongsang">
						<div class="image-container" style="position: relative;">
							<img class="card-img-top"
								src="pageimage/tripImage/trip-gyeongsang.png"
								alt="Card image cap"> <span
								style="position: absolute; top: 30px; left: 30px; color: white; font-weight: bold; font-size: 30px">경상</span>
						</div>
						<div class="card-body">
							<h3 class="card-title">경상</h3>
							<p class="card-text">바다와 산, 역사와 문화의 향연, 부산과 울산, 대구와 경주, 그리고
								현대화와 전통이 공존하는 곳입니다.</p>
						</div>
					</a>
				</div>
			</div>
		</div>

		<div class="row">
			<%--7--%>
			<div class="col-md-4">
				<div class="card">
					<a class="citycard" href="tripcity.do?name=jeju">
						<div class="image-container" style="position: relative;">
							<img class="card-img-top" src="pageimage/tripImage/trip-jeju.png"
								alt="Card image cap"> <span
								style="position: absolute; top: 30px; left: 30px; color: white; font-weight: bold; font-size: 30px">제주</span>
						</div>
						<div class="card-body">
							<h3 class="card-title">제주</h3>
							<p class="card-text">한국의 남쪽 끝, 온갖 자연과 문화를 만날 수 있는 최고의 여행지이자
								세계 자연유산입니다.</p>
						</div>
					</a>
				</div>
			</div>
			<%--8--%>
			<div class="col-md-4">
				<div class="card">
					<a class="citycard" href="tripcity.do?name=incheon">
						<div class="image-container" style="position: relative;">
							<img class="card-img-top"
								src="pageimage/tripImage/trip-incheon.png" alt="Card image cap">
							<span
								style="position: absolute; top: 30px; left: 30px; color: white; font-weight: bold; font-size: 30px">인천</span>
						</div>
						<div class="card-body">
							<h3 class="card-title">인천</h3>
							<p class="card-text">미래도시, 인천공항을 비롯한 유네스코 인류문화유산인 중구청사, 자유공원
								등 다양한 관광지를 보유하고 있습니다.</p>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<br>

</body>
</html>