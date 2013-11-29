<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he" dir="rtl">
<head>   
	<link href="../../style/main.css" rel="stylesheet" type="text/css" media="screen" />
   	<link href="../../style/index.css" rel="stylesheet" type="text/css" media="screen" />
    
    <meta name="viewport" content="width=1031, maximum-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Content-Language" content="he" />
    
	<title>A Smart Lecturer</title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['ציון', 'אחוזים'],
          ['0-10',  18],
          ['20-30',  2],
          ['30-40',  2],
          ['40-50',  4],
          ['50-60',  4],
          ['60-70',  5],
          ['70-80',  5],
          ['80-90',  20],
          ['90-100',  40]
          
        ]);

        var options = {
        		width: 800,
        		height: 400,
        		chartArea: {left:185},
        	    
        	    
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

</head>
<body>

	<div id="main_site_div">

         <%@ include file="../../header.jsp" %>
        	
            
            <!-- START SITE MAIN -->   
            <div id="warp">	
                
                         <div class="menuDiv">
                            <div class="menuTitle">מדדי ציונים</div>
                            <div class="SelectedmenuItem">צפייה במדדים</div>                         
                        </div>
                        
                        <div class="mainContent">
                        	<h2>צפייה בסטטיסטיקות</h2>
                                   
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
                             <hr />
                            
                             <!--Div that will hold the pie chart-->
                             <div align="center" style="width:800px">
                             	<div id="chart_div" style="height: 500px;"></div>
                             </div>
                        </div>
                        
                        <div style="clear:both"></div>
			
                
            </div>
            <!-- END SITE MAIN -->   
       
           <%@ include file="../../footer.jsp" %>
    
    
	</div>
    </div>
    
    <script type="text/javascript" src="../script/jquery.easing.1.3.js.js"></script>
  	<script type="text/javascript" src="../script/jquery-ui.js"></script>
</body>
</html>
