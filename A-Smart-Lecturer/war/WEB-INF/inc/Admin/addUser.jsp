<%@page import="aglosh2014.appspot.com.User"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.tools.ant.filters.TokenFilter.Trim"%>
	
<%
	static_db db = new static_db();

	int years[]=db.jce.get_circles_years(); //get years
	String Names=db.jce.get_circles_in_academy_as_string(); //get years
	String Id = db.jce.get_circles_in_academy_as_string(); //get circles
	String	usersType[]=  {"בודק","מרצה","סטודנט"};


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
			
					</select>&nbsp;&nbsp;&nbsp; סוג: &nbsp;&nbsp;&nbsp; 
		<select name="Type" id="Type"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר סוג משתמש </option>
			<%
			for (int i=0;i<usersType.length;i++) { 
				%>
				<option id="<%=i%>" value="<%=i%>"><%=usersType[i]%></option>
		</select>
			<%}%>
			
		
	
	</h3>
</div>
<br />
<hr id="filterline" />
<br />
<%	String UserName="";
	String UserId="";
	String UserType="";
	String password="";
	
	if (request.getParameter("UserName")!=null) { 
		
		UserName = request.getParameter("UserName").trim();
		UserId = request.getParameter("UserId").trim();
		UserType = request.getParameter("UserType").trim();
		password = request.getParameter("Userpass").trim();

		int user_id=0;
		int user_type=0;
		
		user_id=Integer.parseInt(UserId);
		//user_type=static_db.jce.user_login(user_id, password);
		//user_type=Integer.parseInt(UserType)
		System.out.println("UserId:"+user_id+" UserName: "+UserName+" UserType: "+UserType+" password: "+password);
		//User c= new User(user_id, UserName, password, user_type );
		
	} %>
<!-- END FILTER -->