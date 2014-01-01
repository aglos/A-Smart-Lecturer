<%@page import="java.util.ArrayList"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	static_db db = new static_db();
	String user_data="";
	String years[];

	//get user data
	if(session.getAttribute("id")!=null)
	{
		int user_id=Integer.parseInt((session.getAttribute("id").toString())); //get id from session
		user_data=db.jce.get_user_years_as_string(user_id);
		
		if(!user_data.isEmpty())
			years=user_data.split(","); //split years
	}
%>

<!-- START FILTER -->
<div class="exericse_filterDiv">
	<h3>
	<script type="text/javascript" src="/script/ExecriseFilterByUser.js"></script>
		מחזור: &nbsp;&nbsp;&nbsp; <select name="year"
			id="year" class="formField">
			<option value="n" style="background-color: #CCCfff">בחר מחזור</option>
			
			<%
			if(years!=null) //must login first!
				for (String year: years) {%> 
					<option value="<%=year%>"><%=year%></option>
				<%}%>
			
		</select>&nbsp;&nbsp;&nbsp; חוג: &nbsp;&nbsp;&nbsp; <select name="circle" id="circle"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר חוג</option>
			
		</select> &nbsp;&nbsp;&nbsp;קורס: &nbsp;&nbsp;&nbsp; <select name="course"
			id="course" class="formField" disabled="disabled">
			<option value="0" style="background-color: #CCCfff">בחר קורס</option>
		</select>

	</h3>
</div>
<br />
<hr />
<br />
<!-- END FILTER -->