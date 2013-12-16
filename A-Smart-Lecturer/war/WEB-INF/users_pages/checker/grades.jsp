<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	boolean isView;
	static_db studentdb = new static_db();
	static_db.db_init();
	int[] Student_array = null ;
	int circleId=0,courseId=0;
	
	if (request.getParameter("courseId")!=null && request.getParameter("circleId")!=null) {
	
		// View grades
		isView = true;
		
		circleId = Integer.parseInt(request.getParameter("circleId"));
		courseId = Integer.parseInt(request.getParameter("courseId"));
		
		
		Student_array = studentdb.jce.get_students_id_in_course(circleId, courseId);
		
	} else { 
		// Add new grades
		isView = false;
		Student_array = new int[0];
	}
%>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="he" lang="he"
	dir="rtl">
<head>

<meta name="viewport" content="width=1031, maximum-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Language" content="he" />

<title>A Smart Lecturer</title>

<link href="../../style/main.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="../../style/index.css" rel="stylesheet" type="text/css"
	media="screen" />



<link rel="stylesheet" type="text/css"
	href="../../style/jquery-ui-slider-pips.css">
<link rel="stylesheet" type="text/css"
	href="../../style/jquery-ui-1.10.1.custom.css">

</head>
<body>

	<div id="main_site_div">

		<%@ include file="../../inc/header.jsp"%>


		<!-- START SITE MAIN -->
		<div id="warp">


			<div class="mainContent"
				style="width: 971px; float: right; padding: 0 10px 10px 10px;">
				<h2><%=((isView==true)?"צפייה בציונים":"הזנת ציונים") %></h2>
				<h4 class="pageDesc"><%=((isView==true)?("קורס: "+courseId+" | שנה: ____ | חוג: "+circleId):"בחר קורס")%></h4>
				<% if(isView==false) { %>
				<%@ include file="../../inc/ExecriseFilter.jsp"%>
				<% } else { %> <br/> <% } %>
				<div id="gradeContent" class="gradeContent">
				
				<% if (Student_array.length >0) { %>
	
						<table border="0" cellpadding="0" cellspacing="0" width="100%"
							style="border-bottom: 1px dotted #999">
							<% for (int i=0;i<Student_array.length;i++) {%>
							<tr>
								<td align="center" width="15%"
									style="padding:10px;border-right:1px dotted #999;border-top:1px dotted #999<%
	                                        
	                                        if (i==0) { %>;border-top-right-radius: 25px 25px;<%}
	                                        %>"><%=Student_array[i]%></td>
								<td width="77%"
									style="padding: 20px; border-top: 1px dotted #999"">
									<div class="slider" id="s<%=i%>"></div>
								</td>
								<td width="8%" align="center"
									style="border-left:1px dotted #999;border-top:1px dotted #999<%
	                                        
	                                        if (i==0) { %>;border-top-left-radius: 25px 25px;<%} %>">
									<input class="textVal" maxlength="3" value="0" type="text"
									align="center" id="val<%=i%>"
									style="width: 30px; text-align: center;" />
								</td>
							</tr>
							<% } %>
						</table>			
				
				<% }  %>
				</div>
			</div>
		</div>
		<!-- END SITE MAIN -->
		<div style="clear: both"></div>


	
	

	<%@ include file="../../inc/footer.jsp"%>

</div>

	<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>

	<script src="../../script/jquery-ui-slider-pips.js"></script>


	<script>

	 function initSliders () {
			
			$.extend( $.ui.slider.prototype.options, { animate: true });
			$('.slider').slider({ 
				max: 100, 
				min: 0, 
				value: 0,
				range: "min",
				slide: function( event, ui ) {
	
						var id = $(this).attr("id");
						id = id.substring(1,id.length);
					    $("#val"+id).val(ui.value);
			    }	
			}).slider('pips');
	
			$('.textVal').change(function () {
				var obj = this.id;
				var id = obj.substring(3,obj.length);
			    var value = this.value;
			    selector = $("#s"+id);
			    valSelector = $("#val"+id);
			   
			   
			    if (value < 0) valSelector.val(0);
			    if (value > 100) valSelector.val(100);
			    selector.slider("value", value);
			    
			})
		}
	
	$(document).ready( function() {

		 initSliders();

	});

	

  	$(document).ready(function() {


  		$( "#year" ).change(function() {

  			$("#gradeContent").html('');
  			var dataString = 'year='+ this.value;

  			if (this.value=='n') {

  				//$("#circle").html('<option value="0" style="background-color: #CCCfff">בחר חוג</option>');
  				$("#course").html('<option value="0" style="background-color: #CCCfff">בחר קורס</option>');
  				$("#course").attr("disabled", "disabled");
  				$("#circle").attr("disabled", "disabled");
	  			return false;
  			}
  			
  			$.ajax({
  				async: false,
  				type: "POST",
  				url: "/getCircle",
  				data: dataString,
  				success: function(ret){
  					// success
  					
  					var res = ret.split(",");
  					var options = '<option value="n">בחר קורס</option>';
  					
  					for (var i = 0; i < res.length; i++) {
				  			var dataString2 = dataString + '&circleName=' + res[i];
				  			
				  			$.ajax({
				  				async: false,
				  				type: "POST",
				  				url: "/getCircleId",
				  				data: dataString2,
				  				success: function(ret2){
				  					// success
									options += '<option value="' + ret2 + '">' + res[i] + '</option>';
				  				}
				  			});
				  			
						}
						$("#circle").html(options);
						$("#circle").removeAttr("disabled");
  				}
  			});
  	});
  	  	
	  	$( "#circle" ).change(function() {

	  			$(".pageDesc").html("בחר קורס");
	  			$("#gradeContent").html('');
	  			var circleId =  $("#circle").val();
	  			var year= $("#year").val();
	  			var dataString = 'circleId='+ this.value;
	  			
	  			if (this.value=='n') {

	  				$("#course").html('<option value="0" style="background-color: #CCCfff">בחר קורס</option>');
	  				$("#course").attr("disabled", "disabled");
		  			return false;
	  			}
	  			
	  			$.ajax({
	  				async: false,
	  				type: "POST",
	  				url: "/getCourse",
	  				data: dataString,
	  				success: function(ret){
	  					// success
	  					
	  					var res = ret.split(",");
	  					var options = '<option value="n">בחר קורס</option>';
	  					for (var i = 0; i < res.length; i++) {
							var dataString2 = dataString + '&courseName=' +  res[i] + '&year=' + year;
				  			$.ajax({
				  				async: false,
				  				type: "POST",
				  				url: "/getCourseId",
				  				data: dataString2,
				  				success: function(ret2){
				  					// success
									options += '<option value="' + ret2 + '">' + res[i] + '</option>';
				  				}
				  			});
  						}
	  						$("#course").html(options);
  							$("#course").removeAttr("disabled");
	  				}
	  			});
	  	});
		$( "#course" ).change(function() {
			<% if (isView==false) { %>

				$("#gradeContent").html('');
				var circleId =  $("#circle").val();
				var courseId =  $("#course").val();
				var year = $("#year").val();
				var dataString = 'circleId='+ circleId + '&courseId='+ courseId;

				if (courseId=='n') {
					$(".pageDesc").html("בחר קורס");
					$(".gradeContent").html("");
		  			return false;
	  			}
				
				$.ajax({
	  				async: false,
	  				type: "POST",
	  				url: "/getStudentsInCourse",
	  				data: dataString,
	  				success: function(ret){
	  					// success

  						$(".gradeContent").html(ret);	
  						$(".pageDesc").html("שנה: " + year + " | " +  "חוג: "+circleId + " | " +  "קורס: " + courseId);
  						initSliders();  					
	  				}
	  			});
			<% } %>
		});
  	});
  	

  	</script>

</body>
</html>
