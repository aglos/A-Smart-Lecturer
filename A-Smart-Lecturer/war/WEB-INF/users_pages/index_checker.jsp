<%@page import="aglosh2014.appspot.com.Exercise"%>
<%@page import="aglosh2014.appspot.com.Circle"%>
<%@page import="aglosh2014.appspot.com.Course"%>
<%@page import="aglosh2014.appspot.com.Academy"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

static_db studentdb = new static_db();
static_db.db_init();

Academy a = static_db.jce;
Circle[] cs = a.get_circles_in_academy();


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

	 <script type='text/javascript' src='https://www.google.com/jsapi'></script>
	 <script type="text/javascript" src="../../script/jquery.js"></script>
	 <script type="text/javascript" src="../../script/clock.js"></script>

    <script type='text/javascript'>
      google.load('visualization', '1', {packages:['table']});
      google.setOnLoadCallback(drawTable);
      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'שם קורס');
        data.addColumn('string', 'שם חוג');
        data.addColumn('string', 'תרגיל');
        data.addColumn('boolean', 'הוזנו ציונים');
        data.addColumn('string', 'ניהול');
        data.addRows([

                      <%for(int i=0;i<cs.length;i++) {
                      	
                      	Course[] cr = cs[i].get_courses_in_circle();
                      	
                      	for(int j=0;j<cr.length;j++) {
                      		Exercise[] e = cr[j].get_exercises_in_course();
                      		for(int k=0;k<e.length;k++) {%>
                      		[	'<%=cr[j].get_course_name()%>', '<%=cs[i].get_circle_name()%>',
								'<%=e[k].get_exercise_title()%>  | <%=k+1%>', <%=((e[k].is_checked()==true)?"true":"false")%>,
                			  	'<a href="/Checker/<%=((e[k].is_checked()==true)?"Show":"Insert")%>/?exId=<%=e[k].get_exercise_id()%>&circleId=<%=cs[i].get_circle_id()%>&courseId=<%=cr[j].get_course_id()%>&year=<%=cs[i].get_circle_year()%>"><%=((e[k].is_checked()==true)?"צפייה ועריכה":"הזנת מדדים")%></a>'],
                      		<%}
                      		 
                      	}
                      	
                      } %>
        ]);

        var table = new google.visualization.Table(document.getElementById('table_div'));
        table.draw(data, {allowHtml: true});
      }
    </script>

</head>
<body>

	<div id="main_site_div">

           <%@ include file="../inc/header.jsp" %>
        	
            
            <!-- START SITE MAIN -->   
            <div id="warp">	
               
                        
                        <div class="mainContent"  style="width:971px;float:right;padding:10px;">
                       		<div align="left">
                       			<a href="#"><img src="images/search.jpg" width="20" height="20" alt="" /></a>
                       		</div>
                            <div id='table_div'></div>
                        </div>
                     
                
            </div>
            <!-- END SITE MAIN -->   
       
            <%@ include file="../inc/footer.jsp" %>
    

	</div>
  
</body>
</html>
