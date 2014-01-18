<%@page import="aglosh2014.appspot.com.Exercise"%>
<%@page import="aglosh2014.appspot.com.Circle"%>
<%@page import="aglosh2014.appspot.com.Course"%>
<%@page import="aglosh2014.appspot.com.Academy"%>
<%@page import="aglosh2014.appspot.com.Student"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%if(session.getAttribute("user")== null || session.getAttribute("type")==null) {
	response.sendRedirect("/Login");
} 

int usertype = Integer.parseInt(session.getAttribute("type").toString());
String url = "";

switch (usertype) {
case 1:	url="/Student";
		break;
case 2:	url="/Lecturer";
		break;
case 3:	url="/Checker";
		break;
case 4:	url="/Admin";
		break;
}
if (usertype!=3) {
	
	
	response.sendRedirect(url);
}
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he"
	dir="rtl">
<head>

<meta name="viewport" content="width=1031, maximum-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="he" />

<title>A Smart Lecturer</title>

<link href="../../style/main.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../../style/index.css" rel="stylesheet" type="text/css"
	media="screen" />
	
<script type="text/javascript" src="../../script/jquery.js"></script>
<script type="text/javascript" src="../../script/clock.js"></script>
<script type="text/javascript">
	var state_mode=0;
</script>


<link rel="stylesheet" type="text/css"
	href="../../style/jquery-ui-slider-pips.css">
<link rel="stylesheet" type="text/css"
	href="../../style/jquery-ui-1.10.1.custom.css">

</head>
<body>

	<div id="main_site_div">

		<%@ include file="/WEB-INF/inc/header.jsp"%>


		<!-- START SITE MAIN -->
		<div id="warp">


			<div class="mainContent"
				style="width: 971px; float: right; padding: 0 10px 10px 10px;">
					<h2>התרגיל נשמר בהצלחה</h2>
					<a href="/Checker">חזור לעמוד ראשי</a>
					<%//TODO:  %>
				</div>
			</div>
		
		<!-- END SITE MAIN -->
		<div style="clear: both"></div>


	

	<%@ include file="/WEB-INF/inc/footer.jsp"%>
</div>
	<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>

	<script src="../../script/jquery-ui-slider-pips.js"></script>


	<script>


	 $("#home").attr("href", "<%=url%>");
	</script>
</body>
</html>
