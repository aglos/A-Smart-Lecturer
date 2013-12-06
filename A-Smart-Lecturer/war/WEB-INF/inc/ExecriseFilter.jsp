<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	static_db db = new static_db();
	String s = db.get_circles_list();
	String y = db.get_circles_year_list();
	String[] years = y.split(",");
	String[] circles = s.split(",");
%>

<!-- START FILTER -->
<div class="exericse_filterDiv">
	<h3>
	
		מחזור: &nbsp;&nbsp;&nbsp; <select name="year"
			id="year" class="formField">
			<option value="n" style="background-color: #CCCfff">בחר מחזור</option>
			<%for (int i=0;i<years.length;i++) { %>
			<option value="<%=years[i]%>"><%=years[i]%></option>
			<%}%>
		</select>&nbsp;&nbsp;&nbsp; חוג: &nbsp;&nbsp;&nbsp; <select name="circle" id="circle"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר חוג</option>		
		</select> &nbsp;&nbsp;&nbsp;קורס: &nbsp;&nbsp;&nbsp; <select name="course"
			id="course" class="formField" disabled="disabled">
			<option value="0" style="background-color: #CCCfff">בחר קורס</option>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="exnum"></span>

	</h3>
</div>
<br />
<hr />
<br />
<!-- END FILTER -->