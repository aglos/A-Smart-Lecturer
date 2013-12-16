<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	if (request.getParameter("year")!=null && request.getParameter("circleName")!=null) {
		
		int year = Integer.parseInt(request.getParameter("year"));
		String circle_name=request.getParameter("circleName").trim();
		
		circle_name=circle_name.trim();
		
		System.out.println(year + circle_name);
		
		static_db db = new static_db();
		int id = db.jce.get_circle_id_by_name_and_year(circle_name, year); 
		 %>
		
		<%=id%>
		
	<%  }
	%>
		
