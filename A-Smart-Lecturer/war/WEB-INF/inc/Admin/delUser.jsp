<%@page import="aglosh2014.appspot.com.Course"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="org.apache.tools.ant.filters.TokenFilter.Trim"%>
	
<%
	static_db db = new static_db();

	String name=db.jce.get_students_array(); //get years
	String	usersTypes=  "בודק, מרצה , סטודנט";
	String[] types=usersTypes.split(",");
	//int lecturerNames[]=db.jce.g
	String[] names =name.split(",");
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
		<select name="name" id="name"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר שם</option>
					<%
				
			if(names!=null) //must login first!
				for (int i=0;i<names.length;i++) { %>
					<option value="<%=names[i]%>"><%=names[i]%></option>
				<%}%>
		</select>
		
			
		
	
	</h3>
</div>
<br />
<hr  id=filterline />
<br />
<%	String CourseName="";
	String CourseNum="";
	String CheckerName="";
	String LecturerName="";
	String CircleId="";
	
	if (request.getParameter("courseName")!=null) { 
		
		CourseName = request.getParameter("courseName").trim();
		CourseNum = request.getParameter("courseId").trim();
		LecturerName = request.getParameter("courseLecturerName").trim();
		CheckerName = request.getParameter("courseCheckerName").trim();
		//static_db db=new static_db();
	//	static_db.db_init();

		int course_id=0;
		int circle_id=0;
		course_id=Integer.parseInt(CourseNum);
		//circle_id=Integer.parseInt(CircleId);
		System.out.println("courseId:"+course_id+" courseId: "+circle_id+" courseName: "+CourseName+" checkeName: "+CheckerName+" lecturerName: "+LecturerName);
		
		//static_db.jce.add_new_course_to_circle(circle_id, CourseName, course_id, "sssr", "checker");
		//Course c= new Course();
		
	} %>
<!-- END FILTER -->