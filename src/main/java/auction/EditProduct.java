
package auction;

import java.io.File;
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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/edit_product")

public class EditProduct extends HttpServlet {

 private static Connection con;
    PreparedStatement pstmt;
 
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter pw=response.getWriter();
  RequestDispatcher dispatcher=null;
  String id=request.getParameter("id");
      String productname=request.getParameter("productname");
        String category=request.getParameter("category");
        String description=request.getParameter("description");
        String regularprice=request.getParameter("regularprice");
        String biddingprice=request.getParameter("biddingprice");
        String bstartdate=request.getParameter("bstartdate");
        String imgname=request.getParameter("Imgname");
        String benddate=request.getParameter("benddate");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

        // Get the current date and format it
        Date currentDate = new Date();
        String formattedDate = dateFormat.format(currentDate);
 
       
     // pw.print(productname+" "+category+" "+description+" "+regularprice+" "+biddingprice+" "+bstartdate+" "+benddate+" "+ImgName+" "+savePath);
   
     try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bidding_db","root","");
       
                pw.print("connection success");
    
         
        pstmt=con.prepareStatement("update products set start_bid=?,regular_price=?,bid_end_datetime=?,date_created=?,bid_start_datetime=? where id=?");
       
         
            pstmt.setString(1,biddingprice);
            pstmt.setString(2,regularprice);
           pstmt.setString(3,benddate);
        
         
         pstmt.setString(4,formattedDate);
       
            pstmt.setString(5,bstartdate);
          
               pstmt.setString(6,id);               
          
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

    private String extractFileName(Part part) {
        String contentDisp=part.getHeader("content-disposition");
     String[] items=contentDisp.split(";");
     for(String s: items){
         if(s.trim().startsWith("filename")){
             return s.substring(s.indexOf("=")+2,s.length()-1);
         }
     }
     return "";
    }

}
