<%@page import="aglosh2014.appspot.com.static_db"%>
<%@page import="org.apache.tools.ant.filters.TokenFilter.Trim"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String redirectURL="";
	String user_id_as_string="";
	String pass="";
	
	
	if (request.getParameter("user_id_as_string")!=null) { // &&  request.getParameter("pass") != null) {
		HttpSession UserSession = request.getSession();
		user_id_as_string = request.getParameter("user_id_as_string").trim();
		pass = request.getParameter("pass").trim();
		
		//static_db db=new static_db();
		static_db.db_init();
		int user_type=-1;
		int user_id=0;
	
		try{
		user_id=Integer.parseInt(user_id_as_string);
		}
		catch (Exception e)
		{
			redirectURL="/Login";
			response.sendRedirect(redirectURL);
		}
		
		user_type=static_db.jce.user_login(user_id, pass);
		
		if (user_type==1) //student
			redirectURL="/Student";
		else if (user_type==2) //lecturer
			redirectURL="/Lecturer";
		else if (user_type==3) //checker
			redirectURL="/Checker";
		else if (user_type==4) //admin
			redirectURL="/Admin";
		else if (user_type==-1) //error in login
			redirectURL="/Login";
		
		String username=static_db.jce.get_user_name_by_id(user_id);
		
		if(username!=null)
			UserSession.setAttribute("user", username);
		
	    response.sendRedirect(redirectURL);
	}
%>

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

<script type="text/javascript">
		$(document).ready(function() {
			
			$('#login').click(function() {
	
				/* To copy imei number to the currect form
				var user_id_as_string = $("#user_id_as_string").val();
				var password = $("#pass").val();
				var div = $("#loginMsg");
				var msg = '';
	
				if (user_id_as_string == "")
					msg = 'הכנס שם משתמש תקין';
	
				if (password == "")
					msg = 'הכנס סיסמה תקינה';
	
				if (user_id_as_string == "" && password == "")
					msg = 'שדות שם משתמש וסיסמה דרושים';
	
				if (msg != '') {
					div.html(msg);
					return false;
				}

				 */
							
				return true;
			});
		});
	</script>
</head>
<body>

	<div id="main_site_div">

		<%@ include file="inc/header.jsp"%>


		<!-- START SITE MAIN -->
		<div id="warp">

			<h2>ברוכים הבאים למערכת מרצה חכם</h2>
			<form id="loginForm" action="" method="post">
				<div class="loginBox">

					<div class="loginBoxHeader">הזן שם משתמש וסיסמה תקינים</div>

					<div class="fieldTitle">שם משתמש:</div>
					<input type="text" autocomplete="off" name="user_id_as_string" id="user_id_as_string" dir="ltr"
						id="user_id_as_string" class="formField" />


					<div style="clear: both"></div>

					<div class="fieldTitle">סיסמה:</div>
					<input type="password" autocomplete="off" name="pass" id="pass" dir="ltr"
						id="pass" class="formField" />

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
