<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900" rel="stylesheet">

    <style>
        .blog-header {
            line-height: 1;
            border-bottom: 1px solid #e5e5e5;
        }

        .blog-header-logo {
            font-family: "Playfair Display", Georgia, "Times New Roman", serif;
            font-size: 2.25rem;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: nowrap;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>

</head>

<body>
<div class="container">
    <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
                <a class="text-muted"></a>
            </div>
            <div class="col-4 text-center">
                <a class="blog-header-logo text-dark" href="main.do">Traballoon</a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
                <a class="text-muted" href="#" aria-label="Search">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor"
                         stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
                         viewBox="0 0 24 24" focusable="false"><title>Search</title>
                        <circle cx="10.5" cy="10.5" r="7.5"/>
                        <path d="M21 21l-5.2-5.2"/>
                    </svg>
                </a>
                <a class="btn btn-sm btn-outline-secondary" href="login.do">Login</a>
            </div>
        </div>
    </header>

    <div class="d-flex justify-content-center">
        <div class="nav-scroller py-1 mb-2">
            <nav class="nav d-flex justify-content-between">
                <a href="trip.do" class="p-2 text-muted" style="margin-right: 50px;">지역별 여행</a>
                <a href="hotel.do" class="p-2 text-muted" style="margin-right: 50px;">숙소 추천</a>
                <a href="review.do" class="p-2 text-muted" style="margin-right: 50px;">여행 리뷰</a>
                <a href="community.do" class="p-2 text-muted" style="margin-right: 50px;">커뮤니티</a>
                <a href="mypage.do" class="p-2 text-muted" style="margin-right: 50px;">마이페이지</a>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
