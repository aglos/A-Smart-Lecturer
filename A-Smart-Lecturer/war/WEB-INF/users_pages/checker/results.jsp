<%@page import="aglosh2014.appspot.com.static_db"%>
<%@page import="aglosh2014.appspot.com.StatisticsFunctionsClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%if(session.getAttribute("user")== null || session.getAttribute("type")==null) {
	response.sendRedirect("/Login");
} 

int usertype = Integer.parseInt(session.getAttribute("type").toString());
String url = "";

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
if (usertype!=3) {
	
	
	response.sendRedirect(url);
}
%>
<% 
	int count = 0;
	if (request.getParameter("count")!=null) {
		count = Integer.parseInt(request.getParameter("count"));
	} else {
		// redirect
	}
	
	
	StatisticsFunctionsClass s = new StatisticsFunctionsClass();
	
	double a[] = new double[count];
	double d[] = new double[10];
	
	for (int i = 0; i < count ; i++) {
		String input = "val"+i;
		a[i] = Double.parseDouble( request.getParameter(input));
	}
	
	d = s.Distribution(a);
	
	int courseId = Integer.parseInt(request.getParameter("courseId"));
	int circleId = Integer.parseInt(request.getParameter("circleId"));
	
	//static_db db = new static_db();
	
	//.g
	
%>




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
    <script type="text/javascript" src="../../script/clock.js"></script>
    <script type="text/javascript" src="../../script/jquery.js"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['ציון', 'אחוזים'],
          ['0-10',  <%=Math.floor(d[0] * 100) / 100%>],
          ['10-20',  <%=Math.floor(d[1] * 100) / 100%>],
          ['20-30',  <%=Math.floor(d[2] * 100) / 100%>],
          ['30-40',  <%=Math.floor(d[3] * 100) / 100%>],
          ['40-50',  <%=Math.floor(d[4] * 100) / 100%>],
          ['50-60',  <%=Math.floor(d[5] * 100) / 100%>],
          ['60-70',  <%=Math.floor(d[6] * 100) / 100%>],
          ['70-80',  <%=Math.floor(d[7] * 100) / 100%>],
          ['80-90',  <%=Math.floor(d[8] * 100) / 100%>],
          ['90-100', <%=Math.floor(d[9] * 100) / 100%>]
          
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
                        	<h4>קורס: <%=courseId%> | שנה: ____ | חוג: <%=circleId%></h4>
                                   
         					<%// include file="../../inc/ExecriseFilter.jsp" %>
                            
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
    
    <script type="text/javascript" src="../script/jquery.easing.1.3.js.js"></script>
  	<script type="text/javascript" src="../script/jquery-ui.js"></script>
  		<script>


	 $("#home").attr("href", "<%=url%>");
	</script>
</body>
</html>
