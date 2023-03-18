<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
ul.hotel-menu-list {
    padding: 0;
    margin: 0;
    text-align: left;
    padding-top: 30px;
    list-style-type: none;
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

<!-- 메뉴 -->
<ul class="hotel-menu-list">
	<li><a href="./menu_sudo.do">수도권</a></li>
	<li><a href="./menu_gwd.do">강원도</a></li>
	<li><a href="./menu_ccd.do">충청도</a></li>
	<li><a href="./menu_gsd.do">경상도</a></li>
	<li><a href="./menu_jld.do">전라도</a></li>
	<li><a href="./menu_jeju.do">제주도</a></li>
</ul>