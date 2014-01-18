<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	

	if (request.getParameter("circleId")!=null) {
		
		String circle_id=request.getParameter("circleId");
		circle_id=circle_id.trim();
		int id = Integer.parseInt(circle_id);
		
		static_db db = new static_db();
		
		String	usersType=  "בודק, מרצה , סטודנט";
		 %>
		<%=usersType %>
		
	<%  }
	%>
		
