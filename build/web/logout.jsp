<html>
	<body>
		<% session.invalidate();
                out.println("<script type=\"text/javascript\">");
   
   out.println("location='index.jsp';");
   out.println("</script>");%> <!-- HERE WE ARE INVALIDATE THE SESSION, SO THAT NO VALUES WILL BE PRESENT IN SESSION -->
		
	</body>
<html>
