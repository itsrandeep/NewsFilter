<%@page language="java" contentType="text/html" %>
<%@ page import="java.sql.*" %>



<html>
<body>
<% String username=request.getParameter("username"); %>
<% String password=request.getParameter("password");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/try1",
            "root", "phpmyadmin");
    PreparedStatement ps=con.prepareStatement("select * from users where username=? and password=md5(?)");
    ps.setString(1,username);
    ps.setString(2,password);
    ResultSet rs=ps.executeQuery();


    if (rs.next()) {
      session.setAttribute("username", username);
      out.println("welcome " + username);

      //out.print(ps + "<br>");

      //out.print(ps + "<br>");

      //out.print(rs + "<br>");
      int uid= rs.getInt("uid");
   //  response.sendRedirect("welcome.jsp");
   session.setAttribute("uid", uid);
  //    out.println("Teri uid hai: "+ uid);
      response.sendRedirect("../welcome.jsp");
  } else {
      out.println("Invalid Username or password <a href='index.html'>try again</a>");
  }
%>

</body>
</html>
