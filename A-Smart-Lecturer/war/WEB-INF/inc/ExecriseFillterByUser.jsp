<%@page import="aglosh2014.appspot.com.Exercise"%>
<%@page import="aglosh2014.appspot.com.Academy"%>
<%@page import="aglosh2014.appspot.com.Circle"%>
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
	
	int circle =-1;
	/*****************************************************************************************/
	//			CLASSES FALUIRE TO GET STUDENT CIRCLE
	/*****************************************************************************************/
	
	
	Course[] courses = null;
	Circle[] cs1 = db.jce.get_circles_in_academy();
	Student students[] = null;
	int circle_id, course_id;
	if (session.getAttribute("id") == null)
		return;

	int student_id = Integer.parseInt(session.getAttribute("id").toString());
	int p = -1;
	boolean studentExist;
	for (int i = 0; i < cs1.length; i++) {

		Course[] cr = cs1[i].get_courses_in_circle();
		circle_id = cs1[i].get_circle_id();

		for (int j = 0; j < cr.length; j++) {

			//Exercise[] e = cr[j].get_exercises_in_course();

			course_id = cr[j].get_course_id();
			students = db.jce.get_students_array_in_course(circle_id,course_id);
		
			
			studentExist = false;
						
			
			for (p = 0; p < students.length; p++) {
				if (students[p].get_id() == student_id) {
					studentExist = true;
					
					
					break;
				}
			} 
				
			if (studentExist == true) {
				circle = i;
				break;
				
			}
		
		}
		if (circle != -1)
			break;
	}

	/******************************************************************************************/
	
	if (circle != -1 && user_type==1) {
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
			id="course" class="formField" <%=((user_type==1)?"":"disabled")%>>
			<option value="0" style="background-color: #CCCfff">בחר קורס</option>
			<%if (user_type==1 && courses != null) {
				
				for (int i=0;i<courses.length;i++) {%>
					<option value="<%=courses[i].get_course_id()%>"><%=courses[i].get_course_name()%></option>
				<% }
			}%>
			
				
				
		</select>

	</h3>
</div>
<br />
<hr id="filterline" />
<br />
<!-- END FILTER -->