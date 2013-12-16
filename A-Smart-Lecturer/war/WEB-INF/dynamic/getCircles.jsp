<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	

	if (request.getParameter("year")!=null) {
		
		int year = Integer.parseInt(request.getParameter("year"));
		
		static_db db = new static_db();
		String s = db.jce.get_circles_in_spec_year(year); 
		 %>
		
		<%=s %>
		
	<%  }
	%>
		
