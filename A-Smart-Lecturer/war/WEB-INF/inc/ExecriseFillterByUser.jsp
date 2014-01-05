<%@page import="aglosh2014.appspot.com.Course"%>
<%@page import="aglosh2014.appspot.com.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	static_db db = new static_db();
	String user_data="";
	String years[]=null;
	int user_type = -1;
	

	//get user data
	if(session.getAttribute("id")!=null)
	{
		user_type = Integer.parseInt((session.getAttribute("type").toString()));
		int user_id=Integer.parseInt((session.getAttribute("id").toString())); //get id from session
		user_data=db.jce.get_user_years_as_string(user_id);
		
		if(!user_data.isEmpty())
			years=user_data.split(","); //split years
	}
	if (user_type == -1)
		return;
	
	int circle;
	Course[] courses = null;
	
	if (request.getAttribute ("circle") != null && user_type==1) {
		circle = Integer.parseInt(request.getAttribute ("circle").toString());
		courses = db.jce.get_circles_in_academy()[circle].get_courses_in_circle();
	} 
%>

<!-- START FILTER -->
<div class="exericse_filterDiv">
	<h3>
	
	<% if(user_type!=1) { %>
		<script type="text/javascript" src="/script/ExecriseFilterByUser.js"></script>
		מחזור: &nbsp;&nbsp;&nbsp; <select name="year"
			id="year" class="formField">
			<option value="n" style="background-color: #CCCfff">בחר מחזור</option>
			
			<%
			if(years!=null) //must login first!
				for (String year: years) {%> 
					<option value="<%=year%>"><%=year%></option>
				<%}%>
			
		</select>&nbsp;&nbsp;&nbsp; חוג: &nbsp;&nbsp;&nbsp; <select name="circle" id="circle"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר חוג</option>
	<% } else { %>
		<script>

			$(document).ready(function() {
				
			});

		</script>
	<% } %>
		</select> &nbsp;&nbsp;&nbsp;קורס: &nbsp;&nbsp;&nbsp; <select name="course"
			id="course" class="formField" <%=((user_type==1  && courses != null)?"":"disabled")%>>
			<option value="0" style="background-color: #CCCfff">בחר קורס</option>
			<%if (user_type==1 && courses != null) {
				
				for (int i=0;i<courses.length;i++) {%>
					<option value="<%=courses[i].get_course_id()%>"><%=courses[i].get_course_name()%></option>
				<%}
			} %>
			
				
				
		</select>

	</h3>
</div>
<br />
<hr />
<br />
<!-- END FILTER -->