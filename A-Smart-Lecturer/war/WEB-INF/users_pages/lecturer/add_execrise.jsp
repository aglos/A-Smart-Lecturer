<%@page import="aglosh2014.appspot.com.Exercise"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	boolean isAdded=false;
	static_db studentdb = new static_db();
	static_db.db_init();
	int[] Student_array = null ;
	int courseId=0;
	String titleExec;
	if (request.getParameter("courseId")!=null && request.getParameter("titleExec")!=null) {
		
		// create new Course Object and save it to db
		
		titleExec = request.getParameter("titleExec").toString();
		courseId = Integer.parseInt(request.getParameter("courseId"));
		isAdded = true;
		//Exercise newExec = new Exercise()
		
		//Student_array = studentdb.jce.get_students_id_in_course(circleId, courseId);
		
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
	
<script type="text/javascript" src="../../script/jquery.js"></script>
<script type="text/javascript" src="../../script/clock.js"></script>
<script type="text/javascript">
	var state_mode=1;
</script>


<link rel="stylesheet" type="text/css"
	href="../../style/jquery-ui-slider-pips.css">
<link rel="stylesheet" type="text/css"
	href="../../style/jquery-ui-1.10.1.custom.css">

</head>
<body>

	<div id="main_site_div">

		<%@ include file="/WEB-INF/inc/header.jsp"%>


		<!-- START SITE MAIN -->
		<div id="warp">


			<div class="mainContent"
				style="width: 971px; float: right; padding: 0 10px 10px 10px;">
				<h2><%=((isAdded==true)?"תרגיל הוסף בהצלחה":"הוספת תרגיל חדש") %></h2>
				<% if (isAdded==false) { %>
				<h4 class="pageDesc"></h4>
				<%@ include file="/WEB-INF/inc/ExecriseFillterByUser.jsp"%>
				<div id="gradeContent" class="gradeContent">
				
				</div>
				<div id="hidden_add" style="display: none;">
				
					<div id="exec_title"></div> <br/>
					אנא מלא את הפרטים הבאים:<br/><br/>
					<form method="post"">
						
						<div style="width: 200px">
						
							<input type="hidden" id="courseId" name="courseId" />
							
							כותרת
							<input type="text" autocomplete="off" dir="rtl" id="titleExec" name="titleExec"
								style="float:left" />
		
							<div style="clear: both"></div>
							<br />
							משקל
							<input type="text" autocomplete="off" name="weight" id="weight" dir="ltr"
								 style="float:left" />
		
							<div style="clear: both"></div>
		
							<div style="">
								<input type="submit" id="sendExec" name="sendExec" value="שלח"
									class="loginButton" />
							</div>
		
							<div style="clear: both"></div>
						</div>
						
					
					</form>
				</div>
			</div>
			<% } else {%>
				<a href="/Lecturer">חזור לעמוד ראשי</a>
			<% } %>
		</div>
		<!-- END SITE MAIN -->
		<div style="clear: both"></div>


	
	

	<%@ include file="/WEB-INF/inc/footer.jsp"%>

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
	

  	</script>

	
</body>
</html>
