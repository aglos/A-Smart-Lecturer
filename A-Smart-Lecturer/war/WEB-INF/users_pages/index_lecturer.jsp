<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	static_db db = new static_db();


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
	
	    var options = {'showRowNumber': true};
	    function drawVisualization() {
	      // Create and populate the data table.
	      var dataAsJson =
	      {cols:[
	        {id:'A',label:'שם קורס',type:'string'},
	        {id:'B',label:'שם חוג',type:'string'},
	        {id:'C',label:'מספר תרגיל',type:'number'},
	        {id:'D',label:'נבדק',type:'boolean'},
	        {id:'E',label:'כלים',type:'string'}],
	      rows:[
				<% for (int i=0;i<10;i++) { %>
	      		{c:[{v:'הנדסת תוכנה'},{v:'תקשורת מחשבים'}, {v:<%=i%>,f:'<%=i%>'},{v:true,f:'TRUE'},{v:'<a href="/Lecturer/Show/?exId=<%=i%>&courseId=1&year=2013">צפה</a>'}]},
	      		<% } %>

	      		<% for (int i=0;i<10;i++) { %>
	      		{c:[{v:'הנדסת תוכנה'},{v:'אותות ומערכות'}, {v:<%=i%>,f:'<%=i%>'},{v:true,f:'TRUE'},{v:'<a href="/Lecturer/Show/?exId=<%=i%>&courseId=2&year=2013">צפה</a>'}]},
	      		<% } %>
	      ]};
	      data = new google.visualization.DataTable(dataAsJson);
	    
	      // Set paging configuration options
	      // Note: these options are changed by the UI controls in the example.
	      options['page'] = 'enable';
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
	    
	
	    google.setOnLoadCallback(drawVisualization);
	

    
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
