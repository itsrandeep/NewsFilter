<%@page language="java" contentType="text/html" %>
<%@ page import="java.sql.*" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%

String select[] = request.getParameterValues("topic");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/try1","root", "phpmyadmin");
int uid= (int)session.getAttribute( "uid" );
String sql1="INSERT INTO ucategories  VALUES(?,?)";
PreparedStatement stmt1=con.prepareStatement(sql1);
stmt1.setInt(1,uid);
if (select != null && select.length != 0) {
out.println("You have selected: ");
for (int i = 0; i < select.length; i++) {
out.println(select[i]);
PreparedStatement ps3 =con.prepareStatement("select cid from categories where category_name=?");
ps3.setString(1,select[i]);
ResultSet rs1=ps3.executeQuery();
rs1.next();


int categoryid1= rs1.getInt(1);

stmt1.setInt(2,categoryid1);

int j=stmt1.executeUpdate();

}
}


response.sendRedirect("ctopics.jsp");

%>
