<%--
  Created by IntelliJ IDEA.
  User: kimyoungkwon
  Date: 2023/03/20
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    String tripupdate = (String) request.getAttribute("tripupdate");
    if (tripupdate != null && !tripupdate.equals("")) {
        if (tripupdate.equals("TRIP_UPDATE_OK")) {
%>
<script type="text/javascript">
    alert("성공적으로 수정되었습니다");
    location.href = "trip.do";
</script>
<%
} else {
%>
<script type="text/javascript">
    alert("다시 작성해 주십시오");
    location.href = "trip.do";
</script>
<%
        }
    }
%>


<%
    String tripdelete = (String) request.getAttribute("tripdelete");
    if (tripdelete != null && !tripdelete.equals("")) {
        if (tripdelete.equals("TRIP_DELETE_OK")) {
%>
<script type="text/javascript">
    alert("성공적으로 삭제되었습니다");
    location.href = "trip.do";
</script>
<%
} else {
%>
<script type="text/javascript">
    alert("삭제되지 않았습니다.");
    location.href = "trip.do";
</script>
<%
        }
    }
%>
</body>
</html>
