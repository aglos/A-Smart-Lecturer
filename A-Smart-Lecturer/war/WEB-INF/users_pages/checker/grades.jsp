<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

            <%@ include file="../../header.jsp" %>
        	
            
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
                             
                                <table  border="0" cellpadding="0" cellspacing="0" width="100%" style="border-bottom:1px dotted #999">
                                    <% for (int i=0;i<10;i++) {%>
                                    <tr>
                                        <td width="15%" style="padding:10px;border-right:1px dotted #999;border-top:1px dotted #999">000000000</td>
                                        <td width="75%" style="padding:20px;border-top:1px dotted #999"">
                                        	<div class="slider"></div>	
                                       </td>
                                       <td width="10%" style="border-left:1px dotted #999;border-top:1px dotted #999"">
                                       		<div align="center" id="val<%=i%>">&nbsp;</div>
                                       </td>
                                    </tr>
									 <% } %>
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
       
            <%@ include file="../../footer.jsp" %>
    
    
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
