<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	if (request.getParameter("circleId")!=null) {
		
		int id = Integer.parseInt(request.getParameter("circleId"));
	
		if (id==2) { %>
			הנדסת תוכנה,מערכות הפעלה,מתמטיקה להנדסה,מבוא לתכנות מדעי,חדוא 1, אלגורתמיקה 1
		<% }  if (id==1) {  %>
		מבוא לתעשייה וניהול,מבוא לכלכלה,כימיה,פיזיקה
	<% }
	}
%>
		
