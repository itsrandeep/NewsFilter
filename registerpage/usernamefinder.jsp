<%@ page import="java.sql.*" %>
<%
String username=request.getParameter("username");

try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/try1","root","phpmyadmin");
//out.print(con + "<br>");
PreparedStatement ps=con.prepareStatement("select * from users where username=?");
//out.print(ps + "<br>");
ps.setString(1,username);
//out.print(ps + "<br>");
ResultSet rs=ps.executeQuery();
//out.print(rs + "<br>");
if(rs.next()){
out.print( "Unavailable!");
}else{
out.print(" Available! ");
}
}catch(Exception e){out.print(e);}


%>
