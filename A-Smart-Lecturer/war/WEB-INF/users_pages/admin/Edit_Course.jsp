<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<script type="text/javascript" src="../../script/Admin_script.js"></script>
<script type="text/javascript" src="../../script/clock.js"></script>



<link rel="stylesheet" type="text/css"
	href="../../style/jquery-ui-slider-pips.css">
<link rel="stylesheet" type="text/css"
	href="../../style/jquery-ui-1.10.1.custom.css">

</head>
<body>

	<div id="main_site_div">

        	<%@ include file="../../inc/header.jsp" %>
            
            <!-- START SITE MAIN -->   
            <div id="warp" >	
                
                         <div class="menuDiv">
                            <div class="menuTitle">ניהול משתמשים</div>
                            <a href="/Admin/addUser"><div class="menuItem">הוספת משתמש חדש</div></a>
                            <a href="/Admin/EditUser"><div class="menuItem">עריכת פרטי משתמש קיים</div></a>  
                            <a href="/Admin/delUser"><div class="menuItem">מחיקת משתמש</div></a>     
                            <div class="menuTitle">ניהול קורסים</div>
                            <a href="/Admin/addCourse"><div class="menuItem">הוספת קורס חדש</div></a>
                           <div class="menuItem">עריכת פרטי קורס קיים</div>
                            <a href="/Admin/delCourse"><div class="menuItem">מחיקת קורס</div></a>   
                            <div class="menuTitle">ניהול חוגים</div>
                            <a href="/Admin/AddCircle"><div class="menuItem">הוספת חוג חדש</div></a>
                            <a href="/Admin/EditCircle"><div class="menuItem">עריכת פרטי חוג קיים</div></a>  
                            <a href="/Admin/delCircle"><div class="menuItem">מחיקת חוג</div></a>                           
                        </div>
            <script type="text/javascript" src="../../../script/EditCourse.js"></script>
  		    <%@ include file="../../inc/Admin/delCourse.jsp" %>
  		    <div class="addUser">

					<div class="loginBoxHeader"><b>עריכת פרטי קורס</b></div>
					
					<div class="fieldTitle"><b>שם קורס</b></div>
					<form name=myText>
						<input type="text" id="courseName" name=myText value="Enter Your Name">
					</form>

					<div style="clear: both"></div>
					
					<div class="fieldTitle"><b>קוד קורס</b></div>
					<form name=myText>
						<input type="text" id="courseId" name=myText value="Enter Your Name">
					</form>
					<div class="fieldTitle"><b>שם מרצה</b></div>
					<form name=myText>
						<input type="text" id="courseLecturerName" name=myText value="Enter Your Name">
					</form>
					
					<div style="clear: both"></div>
					
					<div class="fieldTitle"><b>שם בודק</b></div>
					<form name=myText>
						<input type="text" id="courseCheckerName" name=myText value="Enter Your Name">
					</form>
					<div style="">
						<input type="submit" id="login" name="login" value="סיום"
							class="loginButton" />
					</div>
					
		
						
					<div style="clear: both"></div>
					
							

				</div>
                
            </div>
            <!-- END SITE MAIN -->   
       
            <%@ include file="../../inc/footer.jsp" %>
    
    
	</div>
 
</body>
</html>
