<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	

	if (request.getParameter("circleId")!=null) {
		
		int id = Integer.parseInt(request.getParameter("circleId"));
		
		System.out.println(id);
	
		static_db db = new static_db();
		String s = db.jce.get_courses_name_list_in_circle(id); 
		 %>
		
		<%=s %>
		
	<%  }
	%>
		
