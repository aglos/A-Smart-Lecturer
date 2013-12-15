<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	static_db db = new static_db();
	String s = db.jce.get_circles_in_academy_as_string();

	String[] circles = s.split(",");
%>

<!-- START FILTER -->
<div class="exericse_filterDiv">
	<h3>
	
		מחזור: &nbsp;&nbsp;&nbsp; <select name="year"
			id="year" class="formField">
			<option value="n" style="background-color: #CCCfff">בחר מחזור</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
		</select>&nbsp;&nbsp;&nbsp; חוג: &nbsp;&nbsp;&nbsp; <select name="circle" id="circle"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר חוג</option>
			<%
				
			for (int i=0;i<circles.length;i++) { %>
				<option id="<%=i%>" value="<%=i%>"><%=circles[i]%></option>
			<%}%>
			
		</select> &nbsp;&nbsp;&nbsp;קורס: &nbsp;&nbsp;&nbsp; <select name="course"
			id="course" class="formField" disabled="disabled">
			<option value="0" style="background-color: #CCCfff">בחר חוג</option>
		</select>

	</h3>
</div>
<br />
<hr />
<br />
<!-- END FILTER -->