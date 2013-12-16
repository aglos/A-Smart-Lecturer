<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	if (request.getParameter("year")!=null && request.getParameter("circleId")!=null && request.getParameter("courseName")!=null) {
		
		int year = Integer.parseInt(request.getParameter("year").trim());
		int circle_id=Integer.parseInt(request.getParameter("circleId").trim());
		String course_name=request.getParameter("courseName").trim();
		
		static_db db = new static_db();
		int id = db.jce.get_course_id_by_name_circle_and_year(course_name, circle_id, year);
		System.out.println("Course id: "+id);
		 %>
		
		<%=id%>
		
	<%  }
	%>
		