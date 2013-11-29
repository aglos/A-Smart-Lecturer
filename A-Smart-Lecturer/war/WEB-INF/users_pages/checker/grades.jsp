<%
		
	/*
	
		create array: 	[id] [name] [grade] 
						[012312313][mosge david] [100]
				
								
					 
	*/
		
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he" dir="rtl">
<head>   

    <meta name="viewport" content="width=1031, maximum-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Content-Language" content="he" />
    
	<title>A Smart Lecturer</title>

	<link href="../../style/main.css" rel="stylesheet" type="text/css" media="screen" />
   	<link href="../../style/index.css" rel="stylesheet" type="text/css" media="screen" />

					    
		
	<link rel="stylesheet" type="text/css" href="../../style/jquery-ui-slider-pips.css"> 
	<link rel="stylesheet" type="text/css" href="http://sites.simey.me/jquery-pip/demo/css/flick/jquery-ui-1.10.1.custom.css"> 
  

</head>
<body>
	
	<div id="main_site_div">

            <!-- START HEADER -->
        	<div id="header">
            	<div class="headerTitle">
                    <h3>שלום אלוהים,</h3>
                    יום ראשון, 22 לנובמבר 2013, 22:00
                </div>
                
               <a href="../../login.html" class="logout">יציאה</a>
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
            
 			<div class="header_fade">
            	<a href="../index_lecturer.html">עמוד ראשי</a> -
                עריכת תרגיל ממאגר
            </div>
            <!-- END TOP BAR -->
        	
            
            <!-- START SITE MAIN -->   
            <div id="warp">	
                
                        <div class="menuDiv">
                            <div class="menuTitle">מדדי ציונים</div>
                            <div class="SelectedmenuItem">הוספת מדדים לתרגיל חדש</div>
                            <a href="checker/edit_grades.html"><div class="menuItem">עריכת מדדי תרגיל קודם</div></a>                           
                        </div>
                        
                        <div class="mainContent">
                        	<h2>הוספת ציונים לתרגיל בית חדש</h2>
                                   
         					<div class="exericse_filterDiv">
                                <h3>חוג: &nbsp;&nbsp;&nbsp;
                                
                                <select name="subject" id="subject" class="formField">
                                    <option value="0" style="background-color:#CCCfff">בחר חוג</option>
                                    <option id="1" value="">הנדסת תעשייה וניהול</option>
                                    <option id="2" value="">הנדסת תוכנה</option>
                                </select>
                                
                                &nbsp;&nbsp;&nbsp;קורס: &nbsp;&nbsp;&nbsp;
                                <select name="subject" id="subject" class="formField">
                                    <option value="0" style="background-color:#CCCfff">בחר חוג</option>
                                    <option id="1" value="">הנדסת תוכנה</option>
                                    <option id="2" value="">מערכות הפעלה</option>
                                </select>
                                
                               &nbsp;&nbsp;&nbsp; תרגיל מספר: &nbsp;&nbsp;&nbsp;
                                
                                <select name="subject" id="subject" class="formField" style="width:100px">
                                    <option value="0" style="background-color:#CCCfff">בחר תרגיל</option>
                                    <option id="1" value="">1</option>
                                    <option id="2" value="">2</option>
                                </select>
                                </h3>
                             </div>
                             <br />
                             <form id="formcontact"  method="post">
                             
                                <table  border="1" cellpadding="0" cellspacing="0" width="100%">
                                    
                                    <tr class="form_tr">
                                        <td width="10%" style="padding:10px">000000000</td>
                                        <td width="80%" style="padding:30px">
                                        	<div class="slider"></div>	
                                       </td>
                                       <td width="10%">
                                       		<div align="center" id="val">&nbsp;</div>
                                       </td>
                                    </tr>
                                   
                                </table>
                               <br /><br />
                               הערות למתרגל:<br /><textarea id="context" name="context" dir="rtl" ></textarea>
                               <br /><br />
                                <input type="submit" id="cmdsend" name="cmdsend" value="שלח" class="form_button" onClick="javascript:alert('אישור הפרטים');" />
                                <input type="reset" id="cmdreset" name="reset" value="נקה" class="form_button"  />  
                            </form>
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
    </div>
    
	
    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>

  	<script src="../../script/jquery-ui-slider-pips.js"></script>
					    
	
	<script>
	$(document).ready( function() {

		$('.slider').slider({ 
			max: 100, 
			min: 0, 
			value: 0,
			slide: function( event, ui ) {
		         
		          $("#val").html(ui.value);
		       }	
		}).slider('pips');
		
	});

</script>
</body>
</html>
