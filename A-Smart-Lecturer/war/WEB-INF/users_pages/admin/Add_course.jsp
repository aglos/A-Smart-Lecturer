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
                            <div class="menuItem">הוספת קורס חדש</div>
                            <a href="/Admin/EditCourse"><div class="menuItem">עריכת פרטי קורס קיים</div></a>  
                            <a href="/Admin/delCourse"><div class="menuItem">מחיקת קורס</div></a>   
                            <div class="menuTitle">ניהול חוגים</div>
                            <a href="/Admin/AddCircle"><div class="menuItem">הוספת חוג חדש</div></a>
                            <a href="/Admin/EditCircle"><div class="menuItem">עריכת פרטי חוג קיים</div></a>  
                            <a href="/Admin/delCircle"><div class="menuItem">מחיקת חוג</div></a>                           
                        </div>
     	<script type="text/javascript" src="../../../script/addCourse.js"></script>
  	    <%@ include file="../../inc/Admin/addCourse.jsp" %>
        <form id="addCourseForm" action="" method="post" name="addCourseForm">                           
 		<div class="addCourse">

					<div class="loginBoxHeader"><b>הוספת קורס</b></div>
					<input type="hidden" id="CircleId" name="CircleId" />
					
				
					
					<div class="fieldTitle"><b>שם קורס</b></div>
					<input type="text" autocomplete="off" name="CourseName" dir="rtl"
						id="CourseName" class="formField" />

					<div style="clear: both"></div>
					
					<div class="fieldTitle"><b>מספר קורס</b></div>
					<input type="text" autocomplete="off" name="CourseNum" dir="rtl"
						id="CourseNum" class="formField" />

					<div style="clear: both"></div>
					
					<div class="fieldTitle"><b>ת.ז  מרצה</b></div>
					<input type="text" autocomplete="off" name="lecturerName" dir="rtl"
						id="lecturerName" class="formField" />

					<div style="clear: both"></div>
					
						<div class="fieldTitle"><b>ת.ז  בודק</b></div>
					<input type="text" autocomplete="off" name="checkerName" dir="rtl"
						id="checkerName" class="formField" />

					<div style="clear: both"></div>
						
					<div style="">
						<input type="submit" id="addCourse" name="addCourse" value="הוספה"
							class="loginButton" />
					</div>

					<div style="clear: both"></div>
					<div class="loginBoxFooter" id="addCourseMsg"></div>

					
				</div>
                 </form>
            </div>
       
            <!-- END SITE MAIN -->   
       
            <%@ include file="../../inc/footer.jsp" %>
    
    
	</div>

 
</body>
</html>
