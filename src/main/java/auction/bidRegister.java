
package auction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bid")
public class bidRegister extends HttpServlet {
private static Connection con;
    PreparedStatement pstmt;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                      PrintWriter pw=response.getWriter();
  RequestDispatcher dispatcher=null;
     
       String uname=request.getParameter("Uname");
       String pid=request.getParameter("pid");
       String amount=request.getParameter("bidamount");
       String uid=request.getParameter("uid");
   String Pname=request.getParameter("Pname");
    String category=request.getParameter("Category");
          SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

        // Get the current date and format it
        Date currentDate = new Date();
        String formattedDate = dateFormat.format(currentDate);
       
         try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bidding_db","root","");
       
                pw.print("connection success");
        
        pstmt=con.prepareStatement("insert into bids(user_id,product_id,bid_amount,status,date_created,user,pname,category,highBid)values(?,?,?,?,?,?,?,?,?)");
     
          
            pstmt.setString(1,uid);
            pstmt.setString(2,pid);
            pstmt.setString(3,amount);
              pstmt.setString(4,"Bidding Stage");
            pstmt.setString(5,formattedDate);
           
            pstmt.setString(6,uname);
            pstmt.setString(7,Pname);
             pstmt.setString(8,category);
              pstmt.setInt(9,0);
            int rowCount=pstmt.executeUpdate();
         
            
            if(rowCount>0){
               dispatcher=request.getRequestDispatcher("CustomerProducts.jsp");
               request.setAttribute("status","success");
                
              
            }else{
                  dispatcher=request.getRequestDispatcher("CustomerProducts.jsp");
                request.setAttribute("status","exception");
            }
            dispatcher.forward(request, response);
        
         }catch(Exception e){
           pw.print("Exception found:"+e);
         dispatcher=request.getRequestDispatcher("CustomerProducts.jsp");
             request.setAttribute("status","exception");
                request.setAttribute("errmsg",e);
                //pw.print(e);
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
