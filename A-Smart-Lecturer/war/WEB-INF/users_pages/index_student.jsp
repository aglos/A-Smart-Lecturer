<%@page import="aglosh2014.appspot.com.Student"%>
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
	        {id:'E',label:'הוגש',type:'boolean'},
	        {id:'F',label:'ציון',type:'string'}],
	      rows:[
		
   	
				<% 
					
					Student students[] = null;
					int circle_id, course_id;
					if (session.getAttribute("id")==null)
						return;
					
					int student_id = Integer.parseInt(session.getAttribute("id").toString());
					int p=-1;
					boolean studentExist;
				for(int i=0;i<cs.length;i++) {
                      	
                      	Course[] cr = cs[i].get_courses_in_circle();
                      	circle_id = cs[i].get_circle_id();
                      	
                      	for(int j=0;j<cr.length;j++) {
                      		
                      		Exercise[] e = cr[j].get_exercises_in_course();
                      		
                      		course_id = cr[j].get_course_id();
                      		students =  a.get_students_array_in_course(circle_id, course_id);
                      		
                      		studentExist = false;
                      		for (p=0;p<students.length;p++) {
                      			if (students[p].get_id() == student_id) {
                      				studentExist = true;
                      				break;
                      			}
                      		}
                      		
                      		if (p==-1 || studentExist==false)
                      			continue;
                      		
                      		int hugash_counter=0, total_exe_for_course=0;
                      		for(int k=0;k<e.length;k++) {
                      			
                      			if (students[p].get_student_grade(e[k])==null)
                      				continue;
                      			
                      			int student_grade = -1 ; //defualt for not hugash
                      			if (e[k].is_checked()==true) {
                      				total_exe_for_course++;
                      				student_grade = students[p].get_student_grade(e[k]).get_grade();
                      				if (student_grade != -1)
                      					hugash_counter++;
                      			}
                      			
                      			request.setAttribute ("circle", i);
                      		%>
                      		{c:[{v:'<%=hugash_counter%>'},{v:'<%=cr[j].get_course_name()%>'},{v:'<%=cs[i].get_circle_name()%>'},
								{v:'<%=e[k].get_exercise_title()%>  | <%=k+1%>'},{v:<%=((e[k].is_checked()==true)?"true":"false")%>},
                			  	{v:'<%=((student_grade==-1)?"לא הוגש":student_grade)%>'}]},
                      		<%}
                      		
                      		if (e.length>0) {%>
                      			
                      			{c:[{v:'<div class="total_row"></div>'},
                          			{v:'<div class="total_row"><%=cr[j].get_course_name()%></div>'},
                          			{v:'<div class="total_row">סה"כ הוגשו: </div>'},
                          			{v:'<div class="total_row"><%=hugash_counter%> מתוך: <%=total_exe_for_course%></div>'},
                          			{v:null},{v:''}]},

                          		{c:[{v:'<div class="space_row"></div>'},{v:''},{v:''},{v:''},{v:null},{v:''}]},
                      		<%}
                      		 
                      	}
                      	
                      } %>

	      ]};
	      data = new google.visualization.DataTable(dataAsJson);


	      
	      // Set paging configuration options
	      // Note: these options are changed by the UI controls in the example.
	      options['page'] = 'disable';
	      options['pageSize'] = 10;
	      options['allowHtml'] = 'true';
	      options['sort'] = 'disable';
	      options['cssClassNames'] = {selectedTableRow : 'highlightClass', hoverTableRow: 'highlightClass'};
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
				<%@ include file="/WEB-INF/inc/ExecriseFillterByUser.jsp"%>

				<div id='table'></div>
			</div>

			<div style="clear: both"></div>


		</div>
		<!-- END SITE MAIN -->

		<%@ include file="../inc/footer.jsp"%>


	</div>


</body>
</html>
