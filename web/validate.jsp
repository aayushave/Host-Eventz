<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Validate</title>
	</head>
	<body><!-- values given at login page are taken here and checks if the valid details are not -->
		<%
                    
                    try{
		String e=request.getParameter("email");
            String pass=request.getParameter("pass");
            String sql="select email,pass,username from table1 where email=?";
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","Vandana@2");
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,e);
            ResultSet rs=ps.executeQuery();
            String msg="";
           
            if(rs.next())
            {
                String email=rs.getString("email");
                String pwd=rs.getString("pass");
                String uname=rs.getString("username");
               
                
                   if(pass.equals(pwd))
                   {
                       session.setAttribute("user",uname);//THIS IS HOW WE DECLARE THE USER IN A SESSION
			response.sendRedirect("index_1.jsp"); //AND WE REDIRECTED TO LOGIN PAGE
                       
                   
                   }else
            {
                out.println("<script type=\"text/javascript\">");
   out.println("alert('Invalid Credentials');");
   out.println("location='index.jsp';");
   out.println("</script>");
            }  }
                  
                       
            
              
               
                
            
                
               
                
            }        
        
            catch(Exception ex)
            {
                    out.println(ex);
                    out.println("<h1>Account unsuccessful  Please try Again" + ex +"</h1>");
            }
            finally
            {
                    
            }
            
		
		%>
	</body>
</html>
