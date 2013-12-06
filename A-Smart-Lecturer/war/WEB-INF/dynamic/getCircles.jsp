<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	

	if (request.getParameter("year")!=null) {
		
		int year = Integer.parseInt(request.getParameter("year"));
	
		static_db db = new static_db();
		String c = db.get_circles_by_year(year);
		String cid = db.get_circles_id_by_year(year); %>
		<%=c%>|<%=cid%>
	<%  }
	%>
		
