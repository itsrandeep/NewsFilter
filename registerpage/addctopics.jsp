
<%@ page import="java.sql.*" %>
<%

String topic = request.getParameter("custom");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/try1",
"root", "phpmyadmin");
int uid= (int)session.getAttribute( "uid" );
PreparedStatement ps=con.prepareStatement("select topicid from topics where topic_name=?");
ps.setString(1,topic);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
int topicid= rs.getInt(1);
String sql1="INSERT INTO utopics  VALUES(?,?)";
PreparedStatement stmt1=con.prepareStatement(sql1);
stmt1.setInt(1,uid);

stmt1.setInt(2,topicid);
int j=stmt1.executeUpdate();
}else{
String sql="INSERT INTO topics VALUES(NULL,?)";
String sql1="INSERT INTO utopics  VALUES(?,?)";
PreparedStatement stmt=con.prepareStatement(sql);
PreparedStatement stmt1=con.prepareStatement(sql1);
stmt.setString(1,topic);
int i=stmt.executeUpdate();
stmt1.setInt(1,uid);
PreparedStatement ps3 =con.prepareStatement("select topicid from topics where topic_name=?");
ps3.setString(1,topic);
ResultSet rs1=ps3.executeQuery();
rs1.next();


int topicid1= rs1.getInt(1);

stmt1.setInt(2,topicid1);

int j=stmt1.executeUpdate();

}
response.sendRedirect("ctopics.jsp");
%>
