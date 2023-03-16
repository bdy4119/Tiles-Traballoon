<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">
      .b-example-divider {
            height: 1px;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 0.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }
        .container {
	display: block;
	height: 50em;
}

.container2 {
	/* display: block; */
	width: auto;
	height: 100em;
	align: center;
	align-items: center;
	align-content: center;
}
</style>
</head>
<body>
<div class="container-fluid">
	<div align="center">
    	<img src="images/community.png" class="img-fluid">
		<main class="col-10 py-md-3 pl-md-5 bd-content" role="main">

			<div id="mypage-nav" class="hidden-md-down">
				<div class="row row-0 top">
					<div class="col-4 active">
							<a href="mypageAf.do"> 
						<div align="center">
								<img src="images/211731_contact_icon.png"> <span
								class="txt-h4 ls-04">마이 페이지</span>
						</div>
						</a>
					</div>

					<div class="col-4 ">
						<a href="wishlist.do">
							<div align="center">
								<img src="images/211754_heart_icon.png"> <span
									class="txt-h4 ls-04">위시리스트</span>
							</div>
						</a>
					</div>

					<div class="col-4 ">
						<a href="writeme.do">
							<div align="center">
								<img src="images/9165605_pencil_write_icon (1).png"> 
								<span class="txt-h4 ls-04">내가 쓴 글</span>
						</a>
					</div>
				</div>
				<div class="row row-0 bottom ">
					<div class="col-4 ">
						<a href="reference.do">
							<div align="center">
								<img
									src="images/5355695_chat_comment_email_letter_mail_icon.png">
								<span class="txt-h4 ls-04">문의하기</span>
						</a>
					</div>
				</div>
				<div class="col-4 ">
					<a href="leave.do">
						<div align="center">
							<img src="images/211835_trash_icon.png"> <span
								class="txt-h4 ls-04">회원탈퇴</span>
						</div>
					</a>
				</div>
			</div>
		</main>
	</div>
	<div class="container">
            <ul class="nav nav-pills nav-justified">
            <li class="nav-item">
                <a class="nav-link font-nt" href="/mypage/order">찜한 목록</a>
            </li>
            <li class="nav-item">
                <a class="nav-link font-nt" href="/mypage/return_lists">취소/환불 내역</a>
            </li>
			
        </ul>

        <div class="gap-1"></div>
    
    <!-- <div class="card-title">주문 상태 정보</div> -->


<!-- //* ===========================================
					pc 취소/환불내역 시작
==============================================*// -->   
    <table class="table module-table info-table">
        <thead>
            <tr class="hidden-xs-down">
                <th class="width-9">주문번호</th>
                <th class="img width-6 hidden-sm-down"></th>
                <th class="width-20">상품정보</th>
                <th class="width-6">주문수량</th>
                <th class="width-6">진행상황</th>
                <th class="hidden-md-down width-10">취소정보</th>
                <!-- 조민정 2019-12-27 '기능'열은 현재 필요가 없는 듯 하여 주석처리함 -->
                <!-- <th class="width-8" style="display:none;">기능</th> -->
            </tr>
        </thead>
        <tbody>
        <!--#####===== 리스트 =====#####-->
                    <td colspan="7" class="text-xs-center">취소내역이 없습니다.</td>
                </tbody>
    </table><!--/.order-table.info-table-->
</section>
</div>
</div>
</body>
</html>