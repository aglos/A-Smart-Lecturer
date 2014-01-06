<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	static_db db = new static_db();

	int years[]=db.jce.get_circles_years(); //get years
	String Names=db.jce.get_circles_in_academy_as_string(); //get years
	String Id = db.jce.get_circles_in_academy_as_string(); //get circles

	String[] circles =Id.split(",");
%>

<!-- START FILTER -->
<div class="exericse_filterDiv">
	<h3>
		מחזור: &nbsp;&nbsp;&nbsp; <select name="year"
			id="year" class="formField">
			<option value="n" style="background-color: #CCCfff">בחר מחזור</option>
			
			<%
				
			if(years!=null) //must login first!
				for (int i=0;i<years.length;i++) { %>
					<option value="<%=years[i]%>"><%=years[i]%></option>
				<%}%>
			
		</select>&nbsp;&nbsp;&nbsp; חוג: &nbsp;&nbsp;&nbsp; 
		<select name="circle" id="circle"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר חוג</option>
			<%
			for (int i=0;i<circles.length;i++) { 
				%>
				<option id="<%=i%>" value="<%=i%>"><%=circles[i]%></option>
		</select>
			<%}%>
			
		
	
	</h3>
</div>
<br />
<hr id=filterline />
<br />
<!-- END FILTER -->