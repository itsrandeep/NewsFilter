
    <%@ page import="org.json.simple.*" %>
    <%@ page import="org.json.simple.JSONValue" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
     <%@ page import="java.sql.*"%>
     <%@ page import="java.net.*" %>
     <%@ page import="java.io.*" %>
<html>
<head>
<title> Select Topics</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
</head>
<body>
  <div class="container">
    <div class="jumbotron">
      <h1>Select Topics</h1>
      <p>Select from various topics or add topic in which you are interested.</p>
    </div>


     <%

     Class.forName("com.mysql.jdbc.Driver");
     Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/try1","root", "phpmyadmin");
  //   int uid= (int)session.getAttribute( "uid" );
     PreparedStatement ps3 =con.prepareStatement("select * from categories");
     ResultSet rs1=ps3.executeQuery();


 %>


 <form action="addtopics.jsp">
   <%  while(rs1.next()){ %>
    <div class="pretty p-icon p-round p-jelly">
         <input type="checkbox"  name="topic" value="<%= rs1.getString("category_name")%>" >
             <div class="state p-primary">
               <i class="icon mdi mdi-check"></i>

               <label><%= rs1.getString("category_name")%></label>
             </div>
         </input>
     </div>
     <% } %>
    &nbsp;
    &nbsp;
    &nbsp;
    &nbsp;
    &nbsp;
    &nbsp;<input  type="submit"  class="btn btn-primary" value="Next" />
      </form>
</body>
</html>
