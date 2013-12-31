<%@page import="aglosh2014.appspot.com.static_db"%>
<%@page import="org.apache.tools.ant.filters.TokenFilter.Trim"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String redirectURL="";
	String user_id_as_string="";
	String pass="";
	
	
	if (request.getParameter("user_id_as_string")!=null) { // &&  request.getParameter("pass") != null) {
		
		user_id_as_string = request.getParameter("user_id_as_string").trim();
		pass = request.getParameter("pass").trim();
		
		//static_db db=new static_db();
		static_db.db_init();
		int user_id=0;
		int user_type=-1;

		try{
		user_id=Integer.parseInt(user_id_as_string);
		}
		catch (Exception e)
		{
			redirectURL="";
			response.sendRedirect(redirectURL);
		}
		
		
		user_type=static_db.jce.user_login(user_id, pass);
		
		
		redirectURL=redirect_to_user_page(user_type);
		
		if(user_type!=-1)
		{
			String username=static_db.jce.get_user_name_by_id(user_id);
			HttpSession UserSession = request.getSession();
			UserSession.setAttribute("user", username);
			UserSession.setAttribute("id", user_id);
			UserSession.setAttribute("type", user_type);
		}
		
	    response.sendRedirect(redirectURL);   
	}
%>

<%!public String redirect_to_user_page(int user_type){
	String redirectURL="";
	
	if (user_type==1) //student
		redirectURL="/Student";
	else if (user_type==2) //lecturer
		redirectURL="/Lecturer";
	else if (user_type==3) //checker
		redirectURL="/Checker/Add";
	else if (user_type==4) //admin
		redirectURL="/Admin";
	else if (user_type==-1) //error in login
		redirectURL="";
	
	return redirectURL;
}%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he"
	dir="rtl">
<head>
<link href="style/main.css" rel="stylesheet" type="text/css"
	media="screen" />

<meta name="viewport" content="width=1031, maximum-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="he" />

<title>A Smart Lecturer</title>

<script type="text/javascript" src="script/jquery.js"></script>
<script type="text/javascript" src="script/login_script.js"></script>
<script type="text/javascript" src="script/clock.js"></script>

</head>
<body>

	<div id="main_site_div">

		<%@ include file="inc/header.jsp"%>
		
		<%
		if(session.getAttribute("user")!=null){ //if already connected
			int user_type=Integer.parseInt(session.getAttribute("type").toString()); //get user type
			
			redirectURL=redirect_to_user_page(user_type); //where should it be redirect?
			
		    response.sendRedirect(redirectURL);
		}
		%>
		<!-- START SITE MAIN -->
		<div id="warp">

			<h2>ברוכים הבאים למערכת מרצה חכם</h2>
			<form id="loginForm" action="" method="post" name="loginForm">
				<div class="loginBox">

					<div class="loginBoxHeader">הזן תעודת זהות וסיסמה תקינים</div>

					<div class="fieldTitle">תעודת זהות:</div>
					<input type="text" autocomplete="off" name="user_id_as_string" dir="ltr"
						id="user_id_as_string" class="formField" />


					<div style="clear: both"></div>

					<div class="fieldTitle">סיסמה:</div>
					<input type="password" autocomplete="off" name="pass" id="pass" dir="ltr"
						 class="formField" />

					<div style="clear: both"></div>

					<div style="">
						<input type="submit" id="login" name="login" value="כניסה"
							class="loginButton" />
					</div>

					<div style="clear: both"></div>

					<div class="loginBoxFooter" id="loginMsg">שדות שם משתמש
						וסיסמה דרושים</div>
				</div>
			</form>
		</div>

		<!-- END SITE MAIN -->

		<%@ include file="inc/footer.jsp"%>


	</div>

</body>
</html>
