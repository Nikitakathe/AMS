
package auction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/register_admin")
public class Register_Admin extends HttpServlet {
    private static Connection con;
    PreparedStatement pstmt;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          PrintWriter pw=response.getWriter();
  RequestDispatcher dispatcher=null;
     String uname=request.getParameter("username");
       String fname=request.getParameter("fname");
       String email=request.getParameter("email");
       String pass=request.getParameter("password");
       String contact=request.getParameter("contact");
       String aggrement= request.getParameter("license");
          SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

        // Get the current date and format it
        Date currentDate = new Date();
        String formattedDate = dateFormat.format(currentDate);
       
         try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bidding_db","root","");
       
                pw.print("connection success");
        
        pstmt=con.prepareStatement("insert into users(name,username,password,email,contact,type,date_created)values(?,?,?,?,?,?,?)");
     
          
            pstmt.setString(1,fname);
            pstmt.setString(2,uname);
            pstmt.setString(3,pass);
              pstmt.setString(4,email);
            pstmt.setString(5,contact);
              pstmt.setInt(6,1);
            pstmt.setString(7,formattedDate);
            int rowCount=pstmt.executeUpdate();
         
            
            if(rowCount>0){
               dispatcher=request.getRequestDispatcher("AdminLogin.jsp");
                
              
            }else{
                  dispatcher=request.getRequestDispatcher("AdminRegister.jsp");
                
            }
            dispatcher.forward(request, response);
        
         }catch(Exception e){
           pw.print("Exception found:"+e);
          dispatcher=request.getRequestDispatcher("AdminRegister.jsp");
               
                dispatcher.forward(request, response);
        }finally{
           try {
               con.close();
           } catch (SQLException e) {
              e.printStackTrace();
           }
         }
    }


}
