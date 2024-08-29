
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

@WebServlet("/add_product")
@MultipartConfig(fileSizeThreshold= 1024 * 1024 * 2,//2MB
                    maxFileSize=1024 * 1024 *10, //10MB
                    maxRequestSize=1024 * 1024 * 50)
public class AddProduct extends HttpServlet {

 private static Connection con;
    PreparedStatement pstmt;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw=response.getWriter();
  RequestDispatcher dispatcher=null;
      String productname=request.getParameter("productname");
        String category=request.getParameter("category");
        String description=request.getParameter("description");
        String regularprice=request.getParameter("regularprice");
        String biddingprice=request.getParameter("biddingprice");
        String bstartdate=request.getParameter("bstartdate");
        String benddate=request.getParameter("benddate");
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");

        // Get the current date and format it
        Date currentDate = new Date();
        String formattedDate = dateFormat.format(currentDate);
        Part part=request.getPart("pimg");
        String ImgName=extractFileName(part);
        String savePath="D:\\Netbeans Projects\\Online_Auction_System\\src\\main\\webapp\\assets\\img\\Products\\"+File.separator+ImgName;
        File fileSaveDir=new File(savePath);
        part.write(savePath+File.separator);
    //  pw.print(productname+" "+category+" "+description+" "+regularprice+" "+biddingprice+" "+bstartdate+" "+benddate+" "+ImgName+" "+savePath);
   
     try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bidding_db","root","");
       
                pw.print("connection success");
    
         
        pstmt=con.prepareStatement("insert into products(name,description,start_bid,regular_price,bid_end_datetime,img_fname,date_created,path,bid_start_datetime,category_name)values(?,?,?,?,?,?,?,?,?,?)");
       
            pstmt.setString(1,productname);
            pstmt.setString(2,description);
            pstmt.setString(3,biddingprice);
            pstmt.setString(4,regularprice);
           pstmt.setString(5,benddate);
          pstmt.setString(6,ImgName);
               pstmt.setString(7,formattedDate);
           pstmt.setString(8,savePath);
            pstmt.setString(9,bstartdate);
           pstmt.setString(10,category);
                              
          
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
