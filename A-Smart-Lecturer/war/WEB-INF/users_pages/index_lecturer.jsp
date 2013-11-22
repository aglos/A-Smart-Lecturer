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

	<script type="text/javascript" src="../script/jquery.js"></script>  
	<script type="text/javascript" src="../script/jquery-ui.js"></script>  

	<script type="text/javascript">
	$(document).ready(function() {
    // initialise
    $('.menuDiv > li > ul').hide();
  //  $('.menuDiv > li:first-child > ul').show();

    // accordion
    $('.menuDiv > li > div').click(function() {
        // do nothing if already expanded
        if($(this).next().css('display') == 'none') {
            $('.menuDiv > li > ul').slideUp();
            $(this).next().slideDown();
        } else if ($(this).css('display') != 'none') {
            $(this).next().slideUp();
		}
    });
});
	</script>

</head>
<body>




	<div id="main_site_div">

            <!-- START HEADER -->
        	<div id="header">
            	<div class="headerTitle">
                    <h3>שלום מרצה יקר,</h3>
                    יום ראשון, 22 לנובמבר 2013, 22:00
                </div>
                
                 <a href="../login.html" class="logout">יציאה</a>
            </div>
            <!-- END HEADER -->

            <!-- START TOP BAR -->
            <div class="imei_box_cell">
                
                
                <!-- START IMEI TEXT BOX -->
                <div id="top_bar"> 
  					<div class="logo"></div>
                </div>
                <!-- END IMEI TEXT BOX  -->
            </div>
            
 			<div class="header_fade"></div>
            <!-- END TOP BAR -->
        	
            
            <!-- START SITE MAIN -->   
            

            <div id="warp">	
                		<ul class="menuDiv">
                        	<li>
                            	<div class="menuTitle">ניהול מאגר שאלות</div>
                                <ul class="subMenu1" style="list-style-type: none;margin:0;padding:0;">
                                    <li class="menuItem"><a href="lecturer/add_question.html"><span>הוספת שאלה</span></a></li>
                                    <li class="menuItem"><a href="lecturer/edit_question.html"><span>עריכת שאלה</span></a></li>
                                    <li class="menuItem"><a href="lecturer/del_question.html"><span>מחיקת שאלה</span></a></li>
                                </ul>
                            </li>
                            <li>
                            	<div class="menuTitle">ניהול מאגר תרגילים</div>
                                <ul class="subMenu1" style="list-style-type: none;margin:0;padding:0;">
                                    <li class="menuItem"><a href="lecturer/add_exericse.html"><span>הוספת תרגיל</span></a></li>
                                    <li class="menuItem"><a href="lecturer/edit_exericse.html"><span>עריכת תרגיל</span></a></li>
                                    <li class="menuItem"><a href="lecturer/del_exericse.html"><span>מחיקת תרגיל</span></a></li>
                                </ul>
                            </li>
                            <li>
                            	<div class="menuTitle">סטטיסטיקות וציונים</div>
                                <ul class="subMenu1" style="list-style-type: none;margin:0;padding:0;">
                                    <li class="menuItem"><a href="lecturer/statics.html"><span>צפייה בסטטיסטיקות</span></a></li>
                                </ul>
                            </li>
                        </ul>
                    
                        
                        <div class="mainContent">
                            <div id="exericses_table" style="width: 600px;" align="right" dir="rtl"></div>
                        </div>
                        
                        <div style="clear:both"></div>
			
                
            </div>
            <!-- END SITE MAIN -->   
       
            <!-- START FOOTER -->
            <div id="footer">
                
                <a href="http://www.unlock-it.co.il/tutorial/iphone_unlock.php" title="מדריכים">פתרון תקלות</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="http://www.unlock-it.co.il/contact/contact.php" title="צור קשר">צור קשר עם מנהל</a>&nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="#" title="דף הבית">שאלות ותשובות</a>    
            </div>
            <!-- END FOOTER -->
    
    
	</div>
    

</body>
</html>
