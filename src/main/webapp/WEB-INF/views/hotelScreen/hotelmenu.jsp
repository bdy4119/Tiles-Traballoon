<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
ul.hotel-menu-list {
    padding: 0;
    margin: 0;
    text-align: left;
    padding-top: 30px;
}

ul.hotel-menu-list > li > a {
    text-decoration: none;
    color: #333333;
    font-size: 10pt;
    font-weight: 700;
    border-top: 1px solid #999;
    width: 100%;
    display: inline-block;
    line-height: 30px;
}

ul.hotel-menu-list > li:hover {
    opacity: 0.7;
}
</style>

<!-- 메뉴 링크 수정할 부분 -->
<ul class="hotel-menu-list">
	<li><a href="menu_seoul.do"
		data-img="hotelimage/seoul/seoul1.jpg">수도권</a></li>
	<li><a href="menu_gwd.do"
		data-img="hotelimage/gangwon/gangwon1.jpg">강원도</a></li>
	<li><a href="menu_ccd.do"
		data-img="hotelimage/chungcheong/chungcheong1.jpg">충청도</a></li>
	<li><a href="menu_gsd.do"
		data-img="hotelimage/gyeongsang/gyeongsang1.jpg">경상도</a></li>
	<li><a href="menu_jld.do"
		data-img="hotelimage/jeolla/jeolla1.jpg">전라도</a></li>
	<li><a href="menu_jeju.do"
		data-img="hotelimage/jeju/jeju1.jpg">제주도</a></li>
</ul>