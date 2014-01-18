<%@page import="aglosh2014.appspot.com.Lecturer"%>
<%@page import="aglosh2014.appspot.com.Course"%>
<%@page import="aglosh2014.appspot.com.Circle"%>
<%@page import="aglosh2014.appspot.com.Checker"%>
<%@page import="aglosh2014.appspot.com.Student"%>
<%@page import="aglosh2014.appspot.com.Academy"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="org.apache.tools.ant.filters.TokenFilter.Trim"%>
	
<%
	static_db db = new static_db();

	
	String student=db.jce.get_users_names_and_id_by_type(1); 
	String lecturer=db.jce.get_users_names_and_id_by_type(2); 
	String checker=db.jce.get_users_names_and_id_by_type(3); 

	String	usersTypes=  "בודק, מרצה , סטודנט";
	String[] types=usersTypes.split(",");
	String[] students =student.split(",");
	String[] checkers =checker.split(",");
	String[] lecturers =lecturer.split(",");
%>

<!-- START FILTER -->
<div class="exericse_filterDiv">
	<h3>

		סוג: &nbsp;&nbsp;&nbsp; <select name="type"
			id="type" class="formField">
			<option value="n" style="background-color: #CCCfff">בחר סוג משתמש</option>
		<%if(types!=null)
			for (int i=0; i<types.length;i++)
			{%>
				<option value="<%=types[i]%>"><%=types[i]%></option>
			<% }%>
		

			
		</select>&nbsp;&nbsp;&nbsp; שם משתמש: &nbsp;&nbsp;&nbsp; 
		<select name="students" id="students"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר שם</option>
					<%
				
			if(students!=null) //must login first!
				for (int i=0;i<students.length-1;i=i+2) { %>
					<option value="<%=students[i+1]%>"><%=students[i]%></option>
				<%}%>
		</select>
		
			
		<select style="visibility: " name="checkers" id="checkers"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר שם</option>
					<%
				
			if(checkers!=null) //must login first!
				for (int i=0;i<checkers.length-1;i=i+2) { %>
					<option value="<%=checkers[i+1]%>"><%=checkers[i]%></option>
				<%}%>
		</select>
			
		<select style="visibility: " name="lecturers" id="lecturers"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר שם</option>
					<%
				
			if(lecturers!=null) //must login first!
				for (int i=0;i<lecturers.length-1;i=i+2) { %>
					<option value="<%=lecturers[i+1]%>"><%=lecturers[i]%></option>
				<%}%>
		</select>
	
	</h3>
</div>
<br />
<hr  id=filterline />
<br />
<%	
	String userId="";
	
	
	if (request.getParameter("UserId")!=null) { 
		
		userId = request.getParameter("UserId").trim();
	
	

		int course_id=0;

		course_id=Integer.parseInt(userId);
		//circle_id=Integer.parseInt(CircleId);
		System.out.println("courseId:"+course_id);
		
		//static_db.jce.add_new_course_to_circle(circle_id, CourseName, course_id, "sssr", "checker");
		//Course c= new Course();
		
	} %>
<!-- END FILTER -->