<%@page import="aglosh2014.appspot.com.Exercise"%>
<%@page import="aglosh2014.appspot.com.Circle"%>
<%@page import="aglosh2014.appspot.com.Academy"%>
<%@page import="aglosh2014.appspot.com.Course"%>
<%@page import="aglosh2014.appspot.com.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
[['' , 'שם קורס','שם חוג','מספר תרגיל','הוגש','ציון'],

<%
	static_db studentdb = new static_db();
	static_db.db_init();

	Academy a = static_db.jce;
	int courseId;
	
	if (request.getParameter("courseId")==null) {
		courseId=-1;
	} else {
		courseId = Integer.parseInt(request.getParameter("courseId"));
	}
	
	Circle[] cs = a.get_circles_in_academy();
	Student students[] = null;
	int circle_id, course_id;
	if (session.getAttribute("id") == null)
		return;

	int student_id = Integer.parseInt(session.getAttribute("id")
			.toString());
	int p = -1;
	boolean studentExist;
	boolean studntHasExerciseInCourse = false;
	for (int i = 0; i < cs.length; i++) {

		Course[] cr = cs[i].get_courses_in_circle();
		circle_id = cs[i].get_circle_id();

		for (int j = 0; j < cr.length; j++) {

			Exercise[] e = cr[j].get_exercises_in_course();

			if (courseId != -1)
				course_id = courseId;
			else
				course_id = cr[j].get_course_id();
			
			students = a.get_students_array_in_course(circle_id,
					course_id);

			studentExist = false;
			for (p = 0; p < students.length; p++) {
				if (students[p].get_id() == student_id) {
					studentExist = true;
					break;
				}
			}

			if (p == -1 || studentExist == false)
				continue;

			int hugash_counter = 0, total_exe_for_course = 0;
			for (int k = 0; k < e.length; k++) {

				if (students[p].get_student_grade(e[k]) == null)
					continue;

				studntHasExerciseInCourse = true;
				
				int student_grade = -1; //defualt for not hugash
				if (e[k].is_checked() == true) {
					total_exe_for_course++;
					student_grade = students[p].get_student_grade(e[k])
							.get_grade();
					if (student_grade != -1)
						hugash_counter++;
				}

				
%>
                      		['<%=hugash_counter%>','<%=cr[j].get_course_name()%>','<%=cs[i].get_circle_name()%>',
								'<%=e[k].get_exercise_title()%>  | <%=k+1%>',<%=((e[k].is_checked()==true)?"'true'":"'false'")%>,
                			  	'<%=((student_grade==-1)?"לא הוגש":student_grade)%>'],
                      		<%}
                      		
						if (e.length>0) {%>
			  			
			  			['<div class="total_row"></div>','<div class="total_row"><%=cr[j].get_course_name()%></div>',
			      			'<div class="total_row">סה"כ הוגשו: </div>',
			      			'<div class="total_row"><%=hugash_counter%> מתוך: <%=total_exe_for_course%></div>',
			      			'',''],
						
						['<div class="space_row"></div>','','','','','']]
			      		
			  	<%	}
                      	
                      		
                      		 
                      	}
                      	
                      }
	 if (studntHasExerciseInCourse==false) {%>]<%} %>
                      