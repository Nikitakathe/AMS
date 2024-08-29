
package auction;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin_logout")
public class Logout_Admin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession session=request.getSession();
           response.setHeader("Pragma","no-cache");
           response.setHeader("Cache-Control","no-store");
           response.setHeader("Expires","0");
           response.setDateHeader("Expires", -1);
            session.setAttribute("id",null);
        session.invalidate();
        response.sendRedirect("AdminLogin.jsp");
    }

}
