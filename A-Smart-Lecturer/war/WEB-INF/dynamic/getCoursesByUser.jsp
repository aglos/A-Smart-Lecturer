<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (request.getParameter("circleId")!=null && request.getParameter("year")!=null) {
		
		if(session.getAttribute("id")!=null)
		{
			static_db db = new static_db();
			int user_id=Integer.parseInt((session.getAttribute("id").toString())); //get id from session
			int circle_id=Integer.parseInt(request.getParameter("circleId"));
			int year=Integer.parseInt(request.getParameter("year").trim());
		
			String s = db.jce.get_user_courses_in_circle_by_year(user_id, year, circle_id);
		 %>
<%=s %>
<%}}%>

