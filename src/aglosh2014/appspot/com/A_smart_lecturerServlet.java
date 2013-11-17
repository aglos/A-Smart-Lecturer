package aglosh2014.appspot.com;

import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class A_smart_lecturerServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
	}
}
