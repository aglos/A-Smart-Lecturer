<%@page import="java.util.Arrays"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	

	if (request.getParameter("circleId")!=null && request.getParameter("courseId")!=null) {
		
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		int circleId = Integer.parseInt(request.getParameter("circleId"));
	
		static_db db = new static_db();
		int[] Student_array = new int[3];
		
		String courseName = db.get_course_name(courseId,circleId);
		String circleName = db.get_circle_name(circleId);
		int year = db.get_circle_year(circleId);
		Student_array = db.get_students_in_course(circleId, courseId);  %>


<form id="formcontact" method="post" action="Results">
	<input type="hidden" id="count" name="count" value="<%=Student_array.length%>" />
	<input type="hidden" id="circle" name="circleId" value="<%=circleId%>" />
	<input type="hidden" id="course" name="courseId" value="<%=courseId%>" />
	<input type="hidden" id="courseName" name="courseName" value="<%=courseName%>" />
	<input type="hidden" id="circleName" name="circleName" value="<%=circleName%>" />
	<input type="hidden" id="year" name="year" value="<%=year%>" />
	
	<table border="0" cellpadding="0" cellspacing="0" width="100%"
		style="border-bottom: 1px dotted #999">
		<% for (int i=0;i<Student_array.length;i++) {%>
		<tr>
			<td align="center" width="15%"
				style="padding:10px;border-right:1px dotted #999;border-top:1px dotted #999<%
	                                        
	                                        if (i==0) { %>;border-top-right-radius: 25px 25px;<%}
	                                        %>"><%=Student_array[i]%></td>
			<td width="77%" style="padding: 20px; border-top: 1px dotted #999"">
				<div class="slider" id="s<%=i%>"></div>
			</td>
			<td width="8%" align="center"
				style="border-left:1px dotted #999;border-top:1px dotted #999<%
	                                        
	                                        if (i==0) { %>;border-top-left-radius: 25px 25px;<%} %>">
				<input class="textVal" maxlength="3" value="0" type="text"
				align="center" id="val<%=i%>" name="val<%=i%>"
				style="width: 30px; text-align: center;" />
			</td>
		</tr>
		<% } %>
	</table>
	<br/><br/>
	הערות למתרגל:<br />
	<textarea id="context" name="context" dir="rtl"></textarea>
	<br /> <br /> <input type="submit" id="cmdsend" name="cmdsend"
		value="שלח" class="form_button" /> <input type="reset"
		id="cmdreset" name="reset" value="נקה" class="form_button" />
</form>

		<%
	}
%>