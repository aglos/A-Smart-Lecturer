package aglosh2014.appspot.com;

import java.io.IOException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteCircle
 */
//@WebServlet("/deleteCircle")
public class deleteCircle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCircle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String CircleNum="";
		if (request.getParameter("delCircle")!=null) { 
			CircleNum = request.getParameter("delCircle").trim();
			
			int circle_id=0;
			circle_id=Integer.parseInt(CircleNum);
		
		
			System.out.println("CircleId:"+circle_id);//+" circleYear: "+circle_year+" CircleName: "+CircleName);
			
			DataStoreManager.getInstance().removeCircle(circle_id);
			
			
			System.out.println("");
			static_db.jce.remove_circle_by_id(circle_id);
			//static_db.jce.add_new_course_to_circle(circle_id, CourseName, course_id, "sssr", "checker");
			//Course c= new Course();
			// Circle c= new Circle(circle_id , CircleName, circle_year);
			
		}
		response.sendRedirect("deleteCircle");
	}

}
