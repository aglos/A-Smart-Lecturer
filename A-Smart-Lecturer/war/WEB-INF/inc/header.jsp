<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 

	
%>
<!-- START HEADER -->
<script type="text/javascript" src="/script/clock.js"></script>
<div id="header">
	<div class="headerTitle">
		<h3>שלום 
		<%if(session.getAttribute("user")!= null) {%>
		<%=session.getAttribute("user").toString() %>
		<%}
		else
		{%>
		אורח
		<%}%>
		,</h3>
		<div id="displayDate"></div>
	</div>
	<div id="exitButton">
		<a href="/ExitSession">התנתק מהמערכת</a>
	</div>
</div>
<!-- END HEADER -->

<!-- START TOP BAR -->
<div class="imei_box_cell">

	<div id="top_bar">
		<div class="logo"></div>
	</div>

</div>

<div class="header_fade"></div>

<script type="text/javascript">
	$(document).ready(function() {
		$('#exitButton').hide();
		
		<%if(session.getAttribute("user")!=null){%>
			$('#exitButton').show();
		<%}%>
	});

</script>
<!-- END HEADER -->