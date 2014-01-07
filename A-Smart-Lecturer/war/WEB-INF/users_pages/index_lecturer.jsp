<%@page import="aglosh2014.appspot.com.Exercise"%>
<%@page import="aglosh2014.appspot.com.Circle"%>
<%@page import="aglosh2014.appspot.com.Course"%>
<%@page import="aglosh2014.appspot.com.Academy"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

static_db studentdb = new static_db();
static_db.db_init();

Academy a = static_db.jce;
Circle[] cs = a.get_circles_in_academy();


%>


<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he"
	dir="rtl">
<head>
<link href="../style/main.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../style/index.css" rel="stylesheet" type="text/css"
	media="screen" />

<meta name="viewport" content="width=1031, maximum-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="he" />

<title>A Smart Lecturer</title>


<script type="text/javascript" src="../script/jquery.js"></script>
<script type="text/javascript" src="../script/jquery-ui.js"></script>
<script type="text/javascript" src="../script/clock.js"></script>

 <script type="text/javascript" src="//www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load('visualization', '1', {packages: ['table']});
    </script>
    <script type="text/javascript">
	    var visualization;
	    var data;
	
	    var options = {'showRowNumber': false};
	    function drawVisualization() {
	      // Create and populate the data table.
	      var dataAsJson =
	      {cols:[
			{id:'A',label:'',type:'string'},
	        {id:'B',label:'שם קורס',type:'string'},
	        {id:'C',label:'שם חוג',type:'string'},
	        {id:'D',label:'מספר תרגיל',type:'string'},
	        {id:'E',label:'נבדק',type:'boolean'},
	        {id:'F',label:'כלים',type:'string'}],
	      rows:[
		
   
				<%for(int i=0;i<cs.length;i++) {
                      	
                      	Course[] cr = cs[i].get_courses_in_circle();
                      	
                      	for(int j=0;j<cr.length;j++) {
                      		
                      		int checked_count=0;;
                      		Exercise[] e = cr[j].get_exercises_in_course();
                      		for(int k=0;k<e.length;k++) {
                      			if (e[k].is_checked()==true)
                      				checked_count++;
                      		%>
                      		{c:[{v:'<%=k+1%>'},{v:'<%=cr[j].get_course_name()%>'},{v:'<%=cs[i].get_circle_name()%>'},
								{v:'<%=e[k].get_exercise_title()%>  | <%=k+1%>'},{v:<%=((e[k].is_checked()==true)?"true":"false")%>},
                			  	{v:'<a href="/Lecturer/Show/?exId=<%=e[k].get_exercise_id()%>&circleId=<%=cs[i].get_circle_id()%>&courseId=<%=cr[j].get_course_id()%>&year=<%=cs[i].get_circle_year()%>"><%=((e[k].is_checked()==true)?"צפייה":"")%></a>'}]},
                      		<%}
                      		if (e.length>0) {%>
                      		{c:[{v:''},{v:'<div class="total_row">סטטיסטיקה כיתית</div>'},{v:'<%=e.length%> מתוך <%=checked_count%> תרגילים'},{v:'<div class="total_row">סה"כ <%=checked_count * cr[j].get_students_in_course().length%> תרגילים שנבדקו</div>'},{v:''},
                      		  {v:'<a href="/Lecturer/Show/?exId=total&circleId=<%=cs[i].get_circle_id()%>&courseId=<%=cr[j].get_course_id()%>&year=<%=cs[i].get_circle_year()%>">צפייה</a>'}]},
                      		<% } %>
                      <%
                      }
                      	
                      } %>
	      ]};
	      data = new google.visualization.DataTable(dataAsJson);
	    
	      // Set paging configuration options
	      // Note: these options are changed by the UI controls in the example.
	      options['page'] = 'disable';
	      options['pageSize'] = 10;
	      options['allowHtml'] = 'true';
	      options['pagingSymbols'] = {prev: 'הקודם', next: 'הבא'};
	      options['pagingButtonsConfiguration'] = 'auto';
	      
	    
	      // Create and draw the visualization.
	      visualization = new google.visualization.Table(document.getElementById('table'));
	      draw();
	    }
	    
	    function draw() {
	      visualization.draw(data, options);
	    }
	    
	
	    google.setOnLoadCallback(function() {

	    	drawVisualization(function() {
				
	    	}),

	    	$(function() {
			var i=0;
	    	var space_row = $(".space_row").parent(); 	
			var table_cell = $(".total_row").parent();
			
				$(space_row).siblings().css('border','none');
				$(space_row).css('border','none');
				
				$(table_cell).siblings().css( "background-color", "#BDD8DA" );
				$(table_cell).siblings().css('color','black');
				//$(table_cell).siblings().css('margin','0px');
				//$(table_cell).siblings().css('padding','0px')
				$(table_cell).siblings().css('border','none');
				$(table_cell).siblings().css('font-weight','700');
				//$(table_cell).siblings().html(' ');
				$(table_cell).parent().find('td').each (function() {
					if (i==4)
						$(this).html('');
				   	i++;
				});
				

			//	$(".summery1").html('1');
			
			});
	   
	    });
	

    
    </script>
</head>
<body>




	<div id="main_site_div">

		<%@ include file="../inc/header.jsp"%>


		<!-- START SITE MAIN -->


		<div id="warp">



			<div class="mainContent"
				style="width: 971px; float: right; padding: 10px;">
				<div align="left">
                	<a href="#"><img src="images/search.jpg" width="20" height="20" alt="" /></a>
                	<a href="Lecturer/Add"><img src="images/plus.jpg" width="20" height="20" alt="" /></a>
                </div>
				<div id='table'></div>
			</div>

			<div style="clear: both"></div>


		</div>
		<!-- END SITE MAIN -->

		<%@ include file="../inc/footer.jsp"%>


	</div>


</body>
</html>
