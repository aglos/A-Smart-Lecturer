<%@page import="aglosh2014.appspot.com.Student"%>
<%@page import="aglosh2014.appspot.com.Exercise"%>
<%@page import="aglosh2014.appspot.com.Circle"%>
<%@page import="aglosh2014.appspot.com.Course"%>
<%@page import="aglosh2014.appspot.com.Academy"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%if(session.getAttribute("user")== null || session.getAttribute("type")==null) {
	response.sendRedirect("/Login");
} 

int usertype = Integer.parseInt(session.getAttribute("type").toString());
String url = "";
if (usertype!=1) {
	
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
	response.sendRedirect(url);
}
%>

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

<script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("jquery", "1.6.1");
      google.load('visualization', '1', {packages: ['table']});
    </script>
    <script type="text/javascript">

    var visualization;
    var options = {'showRowNumber': false};
    var dataFromAjax;

    function makeAjaxCall(course_id) {
		var dataString = "courseId="+course_id;
		var _dataFromAjax;
    	$.ajax({
    			async: false,
				url: "/updateStudentTable",
				data: dataString,
				success: function(ret){
					
					var arrayForGviz = eval("(" + ret + ")");
					_dataFromAjax = arrayForGviz;
					dataFromAjax = _dataFromAjax;
                    drawVisualization();
                   
               	
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
           		
           		
				}	
		});

    	
    	
    	
    }
    
    
    function drawVisualization() {
       
    	
      var data = google.visualization.arrayToDataTable(dataFromAjax);

      options['page'] = 'disable';
      options['pageSize'] = 10;
      options['allowHtml'] = 'true';
      options['sort'] = 'disable';
      options['cssClassNames'] = {selectedTableRow : 'highlightClass', hoverTableRow: 'highlightClass'};
      options['pagingSymbols'] = {prev: 'הקודם', next: 'הבא'};
      options['pagingButtonsConfiguration'] = 'auto';
      
      visualization = new google.visualization.Table(document.getElementById('table'));
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

   


    makeAjaxCall(-1);


<% 
	/*
  		var visualization;
	    var data;
	
	    var options = {'showRowNumber': false};
	    function drawVisualization() {
	      // Create and populate the data table.
	      var dataAsJson =
	      
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
	    */%>


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

	<script>

	$( "#course" ).change(function() {
		makeAjaxCall(this.value);
	});

	 $("#home").attr("href", "<%=url%>");
	 $('#home').hide();
	</script>

</body>
</html>
