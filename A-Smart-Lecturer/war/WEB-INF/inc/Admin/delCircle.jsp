<%@page import="aglosh2014.appspot.com.DataStoreManager"%>
<%@page import="aglosh2014.appspot.com.Circle"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="org.apache.tools.ant.filters.TokenFilter.Trim"%>

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
<%	String CircleNum="";

	if (request.getParameter("delCircle")!=null) { 
		CircleNum = request.getParameter("delCircle").trim();
		
		int circle_id=0;
		circle_id=Integer.parseInt(CircleNum);
	
	
		System.out.println("CircleId:"+circle_id);//+" circleYear: "+circle_year+" CircleName: "+CircleName);
		
	//	DataStoreManager.getInstance().removeCircle(circle_id);
		
		
		System.out.println("");
		static_db.jce.remove_circle_by_id(circle_id);
		//static_db.jce.add_new_course_to_circle(circle_id, CourseName, course_id, "sssr", "checker");
		//Course c= new Course();
		// Circle c= new Circle(circle_id , CircleName, circle_year);
		
	} %>
<!-- END FILTER -->