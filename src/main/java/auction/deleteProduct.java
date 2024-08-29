
package auction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/delete_product")
public class deleteProduct extends HttpServlet {


 private static Connection con;
    PreparedStatement pstmt;
   

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                PrintWriter pw=response.getWriter();
  RequestDispatcher dispatcher=null;
  String id=request.getParameter("id");
  
   try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bidding_db","root","");
       
                pw.print("connection success");
    
         
        pstmt=con.prepareStatement("delete from products where id=?");
       
          
               pstmt.setString(1,id);               
          
            int rowCount=pstmt.executeUpdate();
         
            
            if(rowCount>0){
               dispatcher=request.getRequestDispatcher("Products.jsp");
              
              
            }
            dispatcher.forward(request, response);
        
         }catch(Exception e){
           pw.print("Exception found:"+e);
          dispatcher=request.getRequestDispatcher("dashboard.jsp");
               
        }finally{
           try {
               con.close();
           } catch (SQLException e) {
              e.printStackTrace();
           }
         }
    }

}
