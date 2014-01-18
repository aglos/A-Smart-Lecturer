package aglosh2014.appspot.com;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addCircle
 */
//@WebServlet("/addCircle")
public class addCircle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCircle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String CircleName="";
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
		
			System.out.println("*************************************************************************************************************************************************************************************************");
			System.out.println("CircleId:"+circle_id+" circleYear: "+circle_year+" CircleName: "+CircleName);
			
			//static_db.jce.add_new_course_to_circle(circle_id, CourseName, course_id, "sssr", "checker");
			//Course c= new Course();
			Circle c= new Circle(circle_id , CircleName, circle_year);
			System.out.println(c.get_circle_id()+" "+c.get_circle_name()+" "+c.get_circle_year());
			DataStoreManager.getInstance().insertNewCircle(c);
		}
		 response.sendRedirect("AddCircle");
	}

}