<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 

	
%>
<!-- START HEADER -->

<div id="header">
	<div class="headerTitle">
		<h3 id=mainName>שלום 
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
	<a href="/ExitSession"><img src="/images/logout-button-blue-hi.jpg" width="60" height="30" alt="" /></a>
		
	</div>
</div>
<!-- END HEADER -->

<!-- START TOP BAR -->
<div class="imei_box_cell">

	<div id="top_bar">
		<div class="logo"><span style="width: 30px; height: 30px; -webkit-transition: -webkit-transform 500ms ease-in-out; transition: -webkit-transform 500ms ease-in-out; -webkit-transform: translateX(0%) translateY(0%) translateZ(0px) rotateX(0deg) rotateY(0deg) rotate(0deg); background-position: 0px 0px;"></span>
		<span style="width: 30px; height: 30px; -webkit-transition: -webkit-transform 500ms ease-in-out; transition: -webkit-transform 500ms ease-in-out; -webkit-transform: translateX(0%) translateY(0%) translateZ(0px) rotateX(0deg) rotateY(0deg) rotate(0deg); background-position: -30px 0px;"></span>
		<span style="width: 30px; height: 30px; -webkit-transition: -webkit-transform 500ms ease-in-out; transition: -webkit-transform 500ms ease-in-out; -webkit-transform: translateX(0%) translateY(0%) translateZ(0px) rotateX(0deg) rotateY(0deg) rotate(0deg); background-position: -60px 0px;"></span>
		<span style="width: 30px; height: 30px; -webkit-transition: -webkit-transform 500ms ease-in-out; transition: -webkit-transform 500ms ease-in-out; -webkit-transform: translateX(0%) translateY(0%) translateZ(0px) rotateX(0deg) rotateY(0deg) rotate(0deg); background-position: -90px 0px;"></span>
		<span style="width: 30px; height: 30px; -webkit-transition: -webkit-transform 500ms ease-in-out; transition: -webkit-transform 500ms ease-in-out; -webkit-transform: translateX(0%) translateY(0%) translateZ(0px) rotateX(0deg) rotateY(0deg) rotate(0deg); background-position: -120px 0px;"></span>
		<span style="width: 30px; height: 30px; -webkit-transition: -webkit-transform 500ms ease-in-out; transition: -webkit-transform 500ms ease-in-out; -webkit-transform: translateX(0%) translateY(0%) translateZ(0px) rotateX(0deg) rotateY(0deg) rotate(0deg); background-position: -150px 0px;"></span>
		<span style="width: 30px; height: 30px; -webkit-transition: -webkit-transform 500ms ease-in-out; transition: -webkit-transform 500ms ease-in-out; -webkit-transform: translateX(0%) translateY(0%) translateZ(0px) rotateX(0deg) rotateY(0deg) rotate(0deg); background-position: -180px 0px;"></span>
		
		</div>
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