
package auction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/login_admin")
public class Login_Admin extends HttpServlet {
private static Connection con;
  PreparedStatement pstmt;
  


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              String email= request.getParameter("email");
        String password=request.getParameter("password");
        HttpSession session=request.getSession();
        RequestDispatcher dispatcher=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bidding_db","root","");
            pstmt=con.prepareStatement("select * from users where email=? and password=? and type=?");
            pstmt.setString(1, email);
            pstmt.setString(2, password);
             pstmt.setInt(3, 1);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()){
                session.setAttribute("id", rs.getString("id"));
                session.setAttribute("uname",rs.getString("username"));
                session.setAttribute("password",rs.getString("password"));
                session.setAttribute("email",rs.getString("email"));
                session.setAttribute("contact",rs.getString("contact"));
                session.setAttribute("cdate",rs.getString("date_created"));
     
                session.setAttribute("name",rs.getString("name"));
               
                dispatcher=request.getRequestDispatcher("dashboard.jsp");
            }else{
                request.setAttribute("status","failed");
                dispatcher=request.getRequestDispatcher("AdminLogin.jsp");
                
                
            }
            dispatcher.forward(request,response);
        }catch(Exception e){
             dispatcher=request.getRequestDispatcher("AdminLogin.jsp");
                request.setAttribute("status","exception");
                request.setAttribute("errmsg",e);
                System.out.println("Error"+e);
                dispatcher.forward(request, response);
        }
    }

    

}
