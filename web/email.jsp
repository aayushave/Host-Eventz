<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,javax.mail.*"%>

<%@ page import="javax.mail.internet.*" %>

<%

    //Creating a result for getting status that messsage is delivered or not!

    String result;

    // Get recipient's email-ID, message & subject-line from index.html page

    final String to = request.getParameter("email");

    final String subject = request.getParameter("subject");

    final String messg = request.getParameter("name")+" "+"Requested Details"+ "\n" +request.getParameter("message");

 

    // Sender's email ID and password needs to be mentioned

    final String from = "aayushrambhad@gmail.com";

    final String pass = "8087095435";

 

    // Defining the gmail host

    String host = "smtp.gmail.com";

 

    // Creating Properties object

    Properties props = new Properties();

 

    // Defining properties

    props.put("mail.smtp.host", host);

    props.put("mail.transport.protocol", "smtp");

    props.put("mail.smtp.auth", "true");

    props.put("mail.smtp.starttls.enable", "true");

    props.put("mail.user", from);

    props.put("mail.password", pass);

    props.put("mail.port", "465");

 

    // Authorized the Session object.

    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, pass);

        }

    });

 

    try {

        // Create a default MimeMessage object.

        MimeMessage message = new MimeMessage(mailSession);

        // Set From: header field of the header.

        message.setFrom(new InternetAddress(from));

        // Set To: header field of the header.

        message.addRecipient(Message.RecipientType.TO,

                new InternetAddress(to));

        // Set Subject: header field

        message.setSubject(subject);

        // Now set the actual message

        message.setText(messg);

        // Send message

        Transport.send(message);

        result = "Your mail sent successfully....";
        out.println("<script type=\"text/javascript\">");
   out.println("alert('Mail Sent Successfully');");
   out.println("location='index.jsp';");
   out.println("</script>");
    } catch (MessagingException mex) {

        mex.printStackTrace();

        result = "Error: unable to send mail....";
        out.println("<script type=\"text/javascript\">");
   out.println("alert('Email Not Sent  Please Try Again To Continue');");
   out.println("location='index.jsp';");
   out.println("</script>");
    }

%>

