<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	static_db db = new static_db();
	String s = db.get_circles_list();

	String[] circles = s.split(",");
%>

<!-- START FILTER -->
<div class="exericse_filterDiv">
	<h3>
		חוג: &nbsp;&nbsp;&nbsp; <select name="circle" id="circle"
			class="formField">
			<option value="n" style="background-color: #CCCfff">בחר חוג</option>
			<%
				
			for (int i=0;i<circles.length;i++) { %>
				<option id="<%=i%>" value="<%=i%>"><%=circles[i]%></option>
			<%}%>
			
		</select> &nbsp;&nbsp;&nbsp;קורס: &nbsp;&nbsp;&nbsp; <select name="course"
			id="course" class="formField">
			<option value="0" style="background-color: #CCCfff">בחר קורס</option>

		</select> &nbsp;&nbsp;&nbsp; תרגיל מספר: &nbsp;&nbsp;&nbsp; <select
			name="subject" id="subject" class="formField" style="width: 100px">
			<option value="0" style="background-color: #CCCfff">בחר
				תרגיל</option>
			<option id="1" value="">1</option>
			<option id="2" value="">2</option>
		</select>
	</h3>
</div>
<br />
<hr />
<br />
<!-- END FILTER -->