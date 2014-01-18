<%@page import="aglosh2014.appspot.com.Circle"%>
<%@page import="aglosh2014.appspot.com.static_db"%>
<%@page import="aglosh2014.appspot.com.DataStoreManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="org.apache.tools.ant.filters.TokenFilter.Trim"%>

	
<%
	static_db db = new static_db();

	int years[]=db.jce.get_circles_years(); //get years

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
			
		</select>
			
		
	
	</h3>
</div>
<br />
<hr id=filterline />
<br />
<%	String CircleName="";
	String CircleNum="";
	String CircleYear="";
	
	
	if (request.getParameter("CircleName")!=null) { 
		
		CircleName = request.getParameter("CircleName").trim();
		CircleNum = request.getParameter("CircleNum").trim();
		CircleYear = request.getParameter("CircleYear").trim();


		int circle_year=0;
		int circle_id=0;
		circle_id=Integer.parseInt(CircleNum);
		circle_year=Integer.parseInt(CircleYear);
	
		System.out.println("CircleId:"+circle_id+" circleYear: "+circle_year+" CircleName: "+CircleName);
		
		//static_db.jce.add_new_course_to_circle(circle_id, CourseName, course_id, "sssr", "checker");
		//Course c= new Course();
		 Circle c= new Circle(circle_id , CircleName, circle_year);
		 DataStoreManager.getInstance().insertNewCircle(c);
	} %>
<!-- END FILTER -->