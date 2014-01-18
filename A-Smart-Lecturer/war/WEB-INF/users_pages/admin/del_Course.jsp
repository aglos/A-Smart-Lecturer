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
                            <a href="/Admin/EditCourse"><div class="menuItem">עריכת פרטי קורס קיים</div></a>  
                       		<div class="menuItem">מחיקת קורס</div>
                            <div class="menuTitle">ניהול חוגים</div>
                            <a href="/Admin/AddCircle"><div class="menuItem">הוספת חוג חדש</div></a>
                            <a href="/Admin/EditCircle"><div class="menuItem">עריכת פרטי חוג קיים</div></a>  
                            <a href="/Admin/delCircle"><div class="menuItem">מחיקת חוג</div></a>                           
                        </div>
  		 <script type="text/javascript" src="../../../script/delCourse.js"></script>
  		    <%@ include file="../../inc/Admin/delCourse.jsp" %>
        	<form id="delCourseForm" action="" method="post" name="delCourseForm">           
 				<div class="delUser">

					<div class="loginBoxHeader"><b>מחיקת קורס</b></div>
					
					<input type="hidden" id="CircleId" autocomplete="off" name="CircleId" dir="rtl"
						id="CourseId" class="formField" />
				
					
					<div class="fieldTitle"><b>הקש מספר קורס</b></div>
					<input type="text" id="delCourseId" autocomplete="off" name="delCourseId" dir="rtl"
						id="CourseId" class="formField" />

					<div style="clear: both"></div>
					
					
					<div style="">
						<input type="submit" id="delCourseButton" name="login" value="מחיקה"
							class="loginButton" />
					</div>
					
					<div style="clear: both"></div>
					
					<div class="loginBoxFooter" id="delCourseMsg"></div>
					
				</div>
    	 </form>            
          		
            </div>

            <!-- END SITE MAIN -->   
       
            <%@ include file="../../inc/footer.jsp" %>
             
   
	</div>
 </body>
</html>
