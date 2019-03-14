package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public final class validate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("\t\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("\t\t<title>Validate</title>\n");
      out.write("\t</head>\n");
      out.write("\t<body><!-- values given at login page are taken here and checks if the valid details are not -->\n");
      out.write("\t\t");

                    
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
            
		
		
      out.write("\n");
      out.write("\t</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
