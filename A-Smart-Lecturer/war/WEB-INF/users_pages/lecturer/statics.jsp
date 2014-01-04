<%@page import="aglosh2014.appspot.com.Exercise"%>
<%@page import="aglosh2014.appspot.com.Circle"%>
<%@page import="aglosh2014.appspot.com.Course"%>
<%@page import="aglosh2014.appspot.com.Academy"%>
<%@page import="aglosh2014.appspot.com.Student"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@page import="aglosh2014.appspot.com.StatisticsFunctionsClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	static_db studentdb = new static_db();
	static_db.db_init();
	Student[] students =  null;
	
	int circleId=0,courseId=0,exId=0;
	
	Exercise ex = null;
	Circle circle = null;
	Course course = null;
	
	if (request.getParameter("courseId")!=null && request.getParameter("circleId")!=null && request.getParameter("exId")!=null) {
	
		// View grades
		
		circleId = Integer.parseInt(request.getParameter("circleId"));
		courseId = Integer.parseInt(request.getParameter("courseId"));
		exId = Integer.parseInt(request.getParameter("exId"));
		
		
		Circle[] circles = studentdb.jce.get_circles_in_academy();
	
	
		
		//Student_array = studentdb.jce.get_students_id_in_course(circleId, courseId);
		
		int k,j=-1;
		 for(k=0;k<circles.length && course == null;k++) {
			int id = circles[k].get_circle_id();
			
			if (id == circleId) {
				circle = circles[k];
				for(j=0;k<circles[k].courses.size();j++) {
					id = circle.get_courses_in_circle()[j].get_course_id();
					if (id == courseId) {
						course = circle.get_courses_in_circle()[j];
						break;
					}
				}
			}
		}
		 
		students =  studentdb.jce.get_students_array_in_course(circleId, courseId);
		if (course != null)
			ex = course.get_exercises_in_course()[exId];
	
		
	} else { 
		// Add new grades

	}

	int count = students.length;
	
	StatisticsFunctionsClass s = new StatisticsFunctionsClass();
	
	double a[] = new double[count];
	double d[] = new double[10];
	
	for (int i = 0; i < count ; i++) {
		a[i]= students[i].get_student_grade(ex).get_grade();
		//a[i] = Double.parseDouble( request.getParameter(input));
	}
	
	d = s.Distribution(a);
	
	
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
                                   
         					<%//@ include file="../../inc/ExecriseFilter.jsp" %>
                            
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
