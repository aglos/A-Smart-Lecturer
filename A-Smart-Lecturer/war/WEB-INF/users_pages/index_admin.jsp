<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he" dir="rtl">
<head>   
	<link href="../style/main.css" rel="stylesheet" type="text/css" media="screen" />
   	<link href="../style/index.css" rel="stylesheet" type="text/css" media="screen" />
    
    <meta name="viewport" content="width=1031, maximum-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Content-Language" content="he" />
    
	<title>A Smart Lecturer</title>
    
    <link rel="shortcut icon" href="images/unlock-it.ico" type="image/x-icon" />
    <link rel="image_src" href="images/share.png" />

</head>
<body>

	<div id="main_site_div">

        	<%@ include file="../inc/header.jsp" %>
            
            <!-- START SITE MAIN -->   
            <div id="warp">	
                
                        <div class="menuDiv">
                            <div class="menuTitle">ניהול משתמשים</div>
                            <a href=""><div class="menuItem">הוספת משתמש חדש</div></a>
                            <a href=""><div class="menuItem">עריכת פרטי משתמש קיים</div></a>  
                            <a href=""><div class="menuItem">מחיקת משתמש</div></a>     
                            <div class="menuTitle">ניהול קורסים</div>
                            <a href=""><div class="menuItem">הוספת קורס חדש</div></a>
                            <a href=""><div class="menuItem">עריכת פרטי קורס קיים</div></a>  
                            <a href=""><div class="menuItem">מחיקת קורס</div></a>   
                            <div class="menuTitle">ניהול חוגים</div>
                            <a href=""><div class="menuItem">הוספת חוג חדש</div></a>
                            <a href=""><div class="menuItem">עריכת פרטי חוג קיים</div></a>  
                            <a href=""><div class="menuItem">מחיקת חוג</div></a>                           
                        </div>
                        
                        <div class="mainContent">
                            תוכן של העמוד ומידע<br/>
                            כאן ניתן להציג הודעות חדשות מהמרצה<br/>
                            ועוד
                        </div>
                        
                        <div style="clear:both"></div>
			
                
            </div>
            <!-- END SITE MAIN -->   
       
            <%@ include file="../inc/footer.jsp" %>
    
    
	</div>
    </div>
    
    <script type="text/javascript" src="script/jquery.easing.1.3.js.js"></script>
  	<script type="text/javascript" src="script/jquery-ui.js"></script>
</body>
</html>
