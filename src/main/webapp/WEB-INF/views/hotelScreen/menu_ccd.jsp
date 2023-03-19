<%@page import="mul.cam.a.dto.HotelDto"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>


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
    <script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>

<!-- style은  head-->
  <style>
        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
            
        }

	.left-menu {
			margin-left: 100px;
			padding-top: 5rem;
			width: 400px;
			display: flex;
}



	.left-menu li {
		display: inline-block;
		margin-right: 1rem;
		font-size: 1.2rem;
	}

	
	table {
		width: 100%;
		border-collapse: collapse;
		border: none;
	}
	
	td {
		width: 25%;
		padding: 5px;
		text-align: center;
		border: none;
		overflow: hidden;
	}
	

	 
</style>



</head>

<body>
<br>
		<!-- 정렬하기 -->
<!-- 		<div class ="sortby" style="text-align: right; margin-left: auto;">
			<select onchange="location.href='./hotel.do?orderBy='+this.value;" style="display: inline-block; margin-right: 2cm;">
			  <option value="">정렬</option>
			  <option value="1">조회수순</option>
			  <option value="2">후기순</option>
			</select>
		</div> -->

		<%
		//DB의 thumbnail 뿌려주기(총 18개)
		List<HotelDto> list = (List<HotelDto>)request.getAttribute("hotellist");
		%>
		<table>
		<%
		for(int i = 6; i< 9; i++){
			HotelDto h = list.get(i);
			String thumbnail = h.getThumbnail();
			int seq = h.getSeq();
		
			if(i%3==0){ 	// 0, 1, 2  /  0, 1, 2
		%> 
		<tr>
		<% 	
		}
		%>

   			<td>
				<a href="./hoteldetail.do?seq=<%=seq %>">
					<img src=<%=thumbnail%> style="width:70%; height:200px; border-radius:10px;"> 
				</a>
			</td>	 
		
		<% 	
			if(i%3==2){
			%> 
			</tr>
			<%	
				
			}
		}
		if(list.size()%3!=0){
			%> 
			</tr>
			<%
		}
		%>
		</table>
		
				

<%--BootStrap--%>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous">
</script>
	<%--BootStrap--%>

</body>
</html>