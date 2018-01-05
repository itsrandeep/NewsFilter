<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("username");
    String pwd = request.getParameter("password");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/try1",
            "root", "phpmyadmin");
            String sql="INSERT INTO users VALUES(NULL,?,?,?,md5(?),?)";
            PreparedStatement stmt=con.prepareStatement(sql);
            stmt.setString(1,fname);
            stmt.setString(2,lname);
            stmt.setString(3,email);
            stmt.setString(4,pwd);
            stmt.setString(5,user);

              int i=stmt.executeUpdate();
            //System.out.println(i+" records inserted");



            //out.print(con + "<br>");

            //out.print(ps + "<br>");

            //out.print(ps + "<br>");


       if (i > 0) {
         session.setAttribute("username", user);
         //out.print(con + "<br>");
         PreparedStatement ps=con.prepareStatement("select uid from users where username=?");
         //out.print(ps + "<br>");
         ps.setString(1,user);
         //out.print(ps + "<br>");
         ResultSet rs=ps.executeQuery();
         //out.print(rs + "<br>");
         rs.next();
         int uid= rs.getInt(1);
      //  response.sendRedirect("welcome.jsp");
         session.setAttribute("uid", uid);

         response.sendRedirect("topics.jsp");
    } else {
        out.print("Registration Failed! <br> .. ");
        response.sendRedirect("index.html");
    }
%>
