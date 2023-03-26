<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	 <link rel="stylesheet" href="css/login.css">
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900" rel="stylesheet">
    <!-- BootStrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
	
	<style type="text/css">
		header h1 {
		    font-size: 50px;
		    color:
		}
		body{
			/* background:var(--body-background-color); */
			/* 배경 꽉차게 */
			background: linear-gradient(rgba(0, 0, 0, 0.3),rgba(0, 0, 0, 0.3)),
							url('./pageimage/image01.jpg')
							no-repeat center fixed;
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
		}
		
		a {
			text-decoration: none;
		}
		
		a:hover {
			text-decoration: underline;
			color:#666;
		}
		
		
		.login-button-wrap:hover {
			--green-color:#666;
			--green-border-color: #666;
		}
		
		.blog-header-logo {
		    font-family: "Playfair Display", Georgia, "Times New Roman", serif;
		    font-size: 3.5rem;
		    color: white;
		    text-shadow: 0 2px 20px rgba(0,0,0,0);
		}b 
	</style>
	</head>
	<body>
	
	<div class="main-container" id="container">
		<header class="blog-header py-3" style="margin-top: -8%;">
	         <div class="col-4 text-center">
	                <a class="blog-header-logo" href="maintraballoon.do">Traballoon</a>
	         </div>
	    </header>
	

		<h4 style="color:white">회원가입</h4>
		
		<form action="regiAf.do" method="post" class="login-input-section-wrap" style="margin-top: 0%;">
			<!-- id -->
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">
					<i class="fa fa-user" aria-hidden="true"></i>
				</span>
			    <input id="id" name="id" placeholder=" id" type="text" class="form-control">

			    <!-- idcheck -->
		    	<input type="button" class="btn btn-danger" value="중복확인" id="idChkBtn" />
		    </div>
		
		    <div style="float:left;">
		   		<p id="idcheck" style="margin-left:-60%;"></p>
		    </div>
		    	
		    <!-- Fullname -->
			<div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">
					<i class="fa fa-user" aria-hidden="true"></i>
				</span>
		        <input name="name" placeholder="Full name" type="text" class="form-control">
		    </div>
		    
		    <!-- nickname -->
		    <div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">
					<i class="fa fa-user" aria-hidden="true"></i>
				</span>
		        <input name="nickname" class="form-control" placeholder="NickName" type="text">
		    </div>
		    
		    <!-- 주소 -->
		  	 <div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">
				   	<i class="fa fa-map-marker" aria-hidden="true"></i>
				</span>
		        <input name="address" class="form-control" placeholder="address" type="text">
		    </div>
		    
		    <!-- 이메일 -->
		    <div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">
				   	<i  class="fa fa-envelope" aria-hidden="true"></i>
				</span>
		        <input name="email" class="form-control" placeholder="Email address" type="email">
		    </div>
		    

		    <!-- 전화번호
		    <div>
		    	<div class="input-group mb-3">
				    <span class="input-group-text" id="basic-addon1">
				    	<i class="fa fa-phone" aria-hidden="true"></i>
				    </span>
					<select class="custom-select" style="max-width: 120px;">
					    <option selected="selected">+02</option>
					    <option value="1">+032</option>
					    <option value="2">+041</option>
					    <option value="3">+053</option>
					    <option value="4">+010</option>
					</select>
			    	<input name="phonenumber" placeholder="Phone number" class="form-control" type="text">
				</div>
		    </div> 
		    -->
		    
		    <!-- 전화번호 -->
		    <div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">
					<i class="fa fa-mobile" aria-hidden="true"></i>
				</span>
				 <select class="form-select" style="padding-right: " id="inputGroupSelect01">
					<option selected="selected">+02</option>
					<option value="1">+032</option>
					<option value="2">+041</option>
					<option value="3">+053</option>
					<option value="4">+010</option>
			  	</select>
			    <input name="phonenumber" placeholder="Phone number" class="form-control" type="text" aria-label="Text input with dropdown button">
		    </div>
		    
		    
		    <!-- 직업 -->
		   <div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">
					<i class="fa fa-building" aria-hidden="true"></i>
				</span>
			  <select class="form-select" id="inputGroupSelect01">
				<option selected="selected">직업</option>
				<option>디자이너</option>
				<option>프로그래머</option>
				<option>자영업</option>
			  </select>
			</div>
			
			<!-- password -->
		    <div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">
					<i class="fa fa-lock" aria-hidden="true"></i>
				</span>
		        <input id="" name="pwd" placeholder="Create password" type="password" class="form-control">
		    </div>
		    
			<!-- repeat password -->
		    <div class="input-group mb-3">
				<span class="input-group-text" id="basic-addon1">
					<i class="fa fa-lock" aria-hidden="true"></i>
				</span>
		        <input placeholder="Repeat password" type="password" class="form-control">
		    </div>
		    
		    <!-- Create Account -->        
		    <div class="login-button-wrap">
		        <button type="submit"> Create Account  </button>
		    </div>
		</form>
		
		<section class="Easy-sgin-in-wrap">
	        <a href="login.do" class="forget-msg">Have an account?  Log In</a>
	    </section>
	    
		 <footer style="margin-bottom: 5%;">
	        <div class="copyright-wrap">
	            <span>Thank you for visiting Multicampus Team Four's website!</span>
	        	<br>
	        	<p style="font-size: 12px;">Designed and developed by | 권하나, 김동민, 김영권, 백다연, 심재훈 | © 2023 All Rights Reserved</p>
	        </div>
	    </footer>
	</div>
	  
	
	<script type="text/javascript">
	$(document).ready(function() {
		
		$("#idChkBtn").click(function() {		
			// id의 빈칸을 조사!
			
			$.ajax({
				type:"post",
				url:"idcheck.do",
				data:{ "id":$("#id").val() },
				success:function(msg){
					if(msg == "YES"){
						$("#idcheck").css("color", "#ffffff");
						$("#idcheck").text("사용할 수 있는 아이디입니다");
					}else{
						$("#idcheck").css("color", "#ff0000");
						$("#idcheck").text("사용중인 아이디입니다");
						$("#id").val("");
					}
				},
				error:function(){
					alert('error');
				}
			});
		});
	});
	</script>
	
	
	
	</body>
</html>





