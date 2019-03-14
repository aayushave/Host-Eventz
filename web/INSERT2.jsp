<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String username=request.getParameter("username");
String dob=request.getParameter("dob");
String email=request.getParameter("email");
String pass=request.getParameter("pass");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students", "root", "Vandana@2");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into table1(username,pass,email,dob)values('"+username+"','"+pass+"','"+email+"','"+dob+"')");
if (i==1){
out.println("<script type=\"text/javascript\">");
   out.println("alert('Account created  Please Log In To Continue');");
   out.println("location='index.jsp';");
   out.println("</script>");

}}
    
catch(Exception e)
{
System.out.print(e);
out.println("<script type=\"text/javascript\">");
   out.println("alert('Account not created  Please Try Again To Continue');");
   out.println("location='index.jsp';");
   out.println("</script>");
e.printStackTrace();
}
%>