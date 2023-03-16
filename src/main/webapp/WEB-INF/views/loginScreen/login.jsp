<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!doctype HTML>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <style type="text/css">
        header h1 {
            font-size: 50px;
        }
    </style>
</head>
<body>
<div class="main-container">
    <header>
        <font color="white"><h1>Traballoon</h1></font>
    </header>
    <form action="loginAf.do" method="post" class="login-input-section-wrap">
        <div class="login-input-wrap">
            <input id="id" name="id" placeholder="Username" type="text"></input>
        </div>
        <div class="login-input-wrap password-wrap">
            <input id="pwd" name="pwd" placeholder="Password" type="password"></input>
        </div>
        <div class="login-button-wrap">
            <button type="submit">Sign in</button>
        </div>
        <div class="login-stay-sign-in">
            <input class="far fa-check-circle" type="checkbox" value="" id="chk_save_id"></input>
            <span>Stay Signed in</span>
        </div>
    </form>
    <section class="Easy-sgin-in-wrap">
        <a href="#" class="forget-msg">Forgot your Username or Password?</a>
        <a href="#" onclick="account()" class="forget-msg">Sign up</a>
    </section>
    <footer>
        <div class="copyright-wrap">
            <span> Copyright © travel Corp. All Rights Reserved.</span>
        </div>
    </footer>
</div>


<script type="text/javascript">
    function account() {
        location.href = "regi.do";
    }

    let user_id = $.cookie("user_id");

    if (user_id != null) {	// 저장한 id가 있음
        $("#id").val(user_id);
        $("#chk_save_id").prop("checked", true);
    }

    $("#chk_save_id").click(function () {

        if ($("#chk_save_id").is(":checked") == true) {

            if ($("#id").val().trim() == "") {
                alert('id를 입력해 주십시오');
                $("#chk_save_id").prop("checked", false);
            } else {
                // cookie를 저장
                $.cookie("user_id", $("#id").val().trim(), {expires: 7, path: './'});
            }

        } else {
            $.removeCookie("user_id", {path: './'});
        }
    });

</script>

</body>
</html>