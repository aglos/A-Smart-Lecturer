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
        		width: 970,
        		height: 400,
        		
        	    
        	    
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

</head>
<body>

	<div id="main_site_div">

         <%@ include file="../../inc/header.jsp" %>
        	
            
            <!-- START SITE MAIN -->   
            <div id="warp">	
                
                        
                        <div class="mainContent"  style="width:971px;float:right;padding:10px;">
                        	<h2>צפייה בסטטיסטיקות</h2>
                                   
         					<%@ include file="../../inc/ExecriseFilter.jsp" %>
                            
                             <!--Div that will hold the pie chart-->
                             <div align="center" style="width:800px">
                             	<div id="chart_div" style="height: 500px;"></div>
                             </div>
                        </div>
                        
                        <div style="clear:both"></div>
			
                
            </div>
            <!-- END SITE MAIN -->   
       
           <%@ include file="../../inc/footer.jsp" %>
    
    
	</div>
    </div>
    
    <script type="text/javascript" src="../script/jquery.easing.1.3.js.js"></script>
  	<script type="text/javascript" src="../script/jquery-ui.js"></script>
</body>
</html>
