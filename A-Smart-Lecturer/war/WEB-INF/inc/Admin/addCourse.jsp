<%@page import="aglosh2014.appspot.com.Course"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="org.apache.tools.ant.filters.TokenFilter.Trim"%>

	
<%
	static_db db = new static_db();

	int years[]=db.jce.get_circles_years(); //get years
	String Names=db.jce.get_circles_in_academy_as_string(); //get years
	String Id = db.jce.get_circles_in_academy_as_string(); //get circles

	String[] circles =Id.split(",");



	%>

	



<!-- START FILTER -->
<div class="exericse_filterDiv">
	<h3>
	
		מחזור: &nbsp;&nbsp;&nbsp; <select name="year"
			id="year" class="formField">
			<option value="n" style="background-color: #CCCfff">בחר מחזור</option>
			
			<%
				
			if(years!=null) //must login first!
				for (int i=0;i<years.length;i++) { %>
					<option value="<%=years[i]%>"><%=years[i]%></option>
				<%}%>
			
		</select>&nbsp;&nbsp;&nbsp; חוג: &nbsp;&nbsp;&nbsp; 
		<select name="circle" id="circle"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר חוג</option>
			<%
			for (int i=0;i<circles.length;i++) { 
				%>
				<option id="<%=i%>" value="<%=i%>"><%=circles[i]%></option>
		</select>
			<%}%>
			
		
	
	</h3>
</div>
<br />
<hr id=filterline />
<br />
<%	String CourseName="";
	String CourseNum="";
	String CheckerName="";
	String LecturerName="";
	String CircleId="";
	
	if (request.getParameter("CourseName")!=null) { 
		
		CourseName = request.getParameter("CourseName").trim();
		CourseNum = request.getParameter("CourseNum").trim();
		LecturerName = request.getParameter("lecturerName").trim();
		CheckerName = request.getParameter("checkerName").trim();
		//static_db db=new static_db();
	//	static_db.db_init();

		int course_id=0;
		int circle_id=0;
		course_id=Integer.parseInt(CourseNum);
		//circle_id=Integer.parseInt(CircleId);
		System.out.println("courseId:"+course_id+" circleId: "+circle_id+" courseName: "+CourseName+" checkeName: "+CheckerName+" lecturerName: "+LecturerName);
		
		//static_db.jce.add_new_course_to_circle(circle_id, CourseName, course_id, "sssr", "checker");
		//Course c= new Course(CheckerName, );
		
	} %>
<!-- END FILTER -->