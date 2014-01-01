<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	
	if (request.getParameter("year")!=null) {
		String s="";
		
		if(session.getAttribute("id")!=null)
		{
			static_db db = new static_db();
			int user_id=Integer.parseInt((session.getAttribute("id").toString())); //get id from session
			int year = Integer.parseInt(request.getParameter("year"));
			s = db.jce.get_user_circles_by_year(user_id, year);
		}
		
		 %>
		<%=s %>

	<%  }
	%>
		
