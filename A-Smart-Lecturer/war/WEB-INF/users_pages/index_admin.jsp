<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%if(session.getAttribute("user")== null || session.getAttribute("type")==null) {
	response.sendRedirect("/Login");
} 

int usertype = Integer.parseInt(session.getAttribute("type").toString());
String url = "";
if (usertype!=4) {
	
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
	response.sendRedirect(url);
}
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he" dir="rtl">
<head>   
	<link href="../style/main.css" rel="stylesheet" type="text/css" media="screen" />
   	<link href="../style/index.css" rel="stylesheet" type="text/css" media="screen" />
    
    <meta name="viewport" content="width=1031, maximum-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Content-Language" content="he" />
    
	<title>A Smart Lecturer</title>
	<script type="text/javascript" src="../../script/jquery.js"></script>
<script type="text/javascript" src="../../script/jquery-ui.js"></script>
<script type="text/javascript" src="../../script/clock.js"></script>
    
    <link rel="shortcut icon" href="images/unlock-it.ico" type="image/x-icon" />
    <link rel="image_src" href="images/share.png" />

</head>
<body>

	<div id="main_site_div">

        	<%@ include file="../inc/header.jsp" %>
            
            <!-- START SITE MAIN -->   
            <div id="warp" >	
                
                        <div class="menuDiv1">
                            <div class="menuTitle">ניהול משתמשים</div>
                            <a href="/Admin/addUser"><div class="menuItem">הוספת משתמש חדש</div></a>
                            <a href="/Admin/EditUser"><div class="menuItem">עריכת פרטי משתמש קיים</div></a>  
                            <a href="/Admin/delUser"><div class="menuItem">מחיקת משתמש</div></a>     
                        </div>
                         <div class="menuDiv2">
                            <div class="menuTitle">ניהול קורסים</div>
                            <a href="/Admin/addCourse"><div class="menuItem">הוספת קורס חדש</div></a>
                            <a href="/Admin/EditCourse"><div class="menuItem">עריכת פרטי קורס קיים</div></a>  
                            <a href="/Admin/delCourse"><div class="menuItem">מחיקת קורס</div></a>   
                        </div>
                        <div class="menuDiv3">
                            <div class="menuTitle">ניהול חוגים</div>
                            <a href="/Admin/AddCircle"><div class="menuItem">הוספת חוג חדש</div></a>
                            <a href="/Admin/EditCircle"><div class="menuItem">עריכת פרטי חוג קיים</div></a>  
                            <a href="/Admin/delCircle"><div class="menuItem">מחיקת חוג</div></a>                           
                        </div>
     
                
            </div>
            <!-- END SITE MAIN -->   
       
            <%@ include file="../inc/footer.jsp" %>
    
    
	</div>
	<script>

	 $("#home").attr("href", "<%=url%>");
	 $('#home').hide();
	</script>
</body>
</html>
