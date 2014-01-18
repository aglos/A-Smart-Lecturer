
<%@page import="aglosh2014.appspot.com.Lecturer"%>
<%@page import="aglosh2014.appspot.com.Course"%>
<%@page import="aglosh2014.appspot.com.Circle"%>
<%@page import="aglosh2014.appspot.com.Checker"%>
<%@page import="aglosh2014.appspot.com.Student"%>
<%@page import="aglosh2014.appspot.com.Academy"%>
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
	
	
	String UserName="";
	String UserId="";
	String UserTypes="";
	String password="";
	
	if (request.getParameter("UserName")!=null) { 
		
		UserName = request.getParameter("UserName").trim();
		UserId = request.getParameter("UserId").trim();
		UserTypes = request.getParameter("userType").trim();
		password = request.getParameter("Userpass").trim();

		int user_id=0;
		int user_type=0;
		user_id=Integer.parseInt(UserId);
	//    STUDENT=1, LECTURER=2, CHECKER=3, ADMIN=4;
	
		if (UserTypes.trim()=="סטודנט")
		{	user_type=1;
			Student s= new Student(user_id, UserName,password);
		}
		else if (UserTypes.trim()=="בודק")
		{	user_type=3;
			Checker s= new Checker(user_id, UserName,password);
		}
		else if (UserTypes.trim()=="מרצה")
		{	user_type=2;
			Lecturer s= new Lecturer(user_id, UserName,password);
		}
				//user_type=static_db.jce.user_login(user_id, password);
		//user_type=Integer.parseInt(UserType)
		System.out.println("UserId:"+user_id+" UserName: "+UserName+" user_type: "+user_type+" password: "+password);
		
	
		//insert(c)
		
	}
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
		</select>
			
			
				&nbsp;&nbsp;&nbsp; סוג: &nbsp;&nbsp;&nbsp; 
		<select name="Type" id="Type"
			class="formField" disabled="disabled">
			<option value="n" style="background-color: #CCCfff">בחר סוג משתמש </option>
		</select>
		
			
		
	
	</h3>
</div>
<br />
<hr id="filterline" />
<br />
<!-- END FILTER -->