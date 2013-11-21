
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he" dir="rtl">
<head>   
	<link href="style/main.css" rel="stylesheet" type="text/css" media="screen" />
   	
    <meta name="viewport" content="width=1031, maximum-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Content-Language" content="he" />
    
	<title>A Smart Lecturer</title>


</head>
<body>

	<div id="main_site_div">

            <%@ include file="header.jsp" %>
        	
            
            <!-- START SITE MAIN -->   
            <div id="warp">	
                
                	<h2>ברוכים הבאים למערכת מרצה חכם</h2>
                    <form id="loginForm" action="" method="post">
                        <div class="loginBox">
                        
                            <div class="loginBoxHeader">
                            הזן שם משתמש וסיסמה תקינים
                            </div>
                            
                            <div class="fieldTitle">שם משתמש:</div>
                            <input type="text" autocomplete="off" name="username" dir="ltr" id="username" class="formField" />
                          
                            
                            <div style="clear:both"></div>
                            
                            <div class="fieldTitle">סיסמה:</div>
                            <input type="password" autocomplete="off" name="pass" dir="ltr" id="pass" class="formField" />
                            
                            <div style="clear:both"></div>
                            
                            <div style="loginDiv">
                                <input type="submit" id="login" name="login" value="כניסה" class="loginButton" />
                            </div>
                            
                            <div style="clear:both"></div>
                            
                            <div class="loginBoxFooter" id="loginMsg">
                            שדות שם משתמש וסיסמה דרושים
                            </div>

                        </div>
					</form>
            
            <a href="users_pages/index_lecturer.jsp" title="">מרצה</a><Br />
       		<a href="users_pages/index_checker.jsp" title="">בודק</a><Br />
            <a href="users_pages/index_student.jsp" title="">סטודנט</a><Br />
            <a href="users_pages/index_admin.jsp" title="">מנהל</a><Br />
            </div>
            
            <!-- END SITE MAIN -->   

            <%@ include file="footer.jsp" %>
    
    
	</div>
    </div>
    
    <script type="text/javascript" src="script/jquery.easing.1.3.js.js"></script>
  	<script type="text/javascript" src="script/jquery-ui.js"></script>
</body>
</html>
