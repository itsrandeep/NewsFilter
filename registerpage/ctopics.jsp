<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.JSONValue" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%@ page import="java.sql.*"%>
 <%@ page import="java.net.*" %>
 <%@ page import="java.io.*" %>
  <%@ page import="java.util.*" %>
<%
  Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/try1",
"root", "phpmyadmin");
int uid= (int)session.getAttribute( "uid" );
%>
<html>
<head>
<title> Select Custom Topics</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pretty-checkbox@3.0/dist/pretty-checkbox.min.css">
</head>
<body>
<div class="container">
<div class="jumbotron">
  <h1>Select Custom Topics</h1>
  <p>Add any Custom Topic or Celebrity Name or Politician Name or Model of any Phone or Car etc.</p>
</div>
<div class="form-group">
<label for="inputdefault">Add Topic</label>
<form action="addctopics.jsp">
<input class="form-control" id="inputdefault" type="text" name="custom">
<br>
<input  type="submit" style="float: left;" class="btn btn-primary" value="Add"  />

</div>
</form>
<p align="center"><a href="sources.jsp">Done Adding Topics</a></p>
<br><br><br>
<div class="jumbotron">
  <div class="row">


       <div class="col-md-5">
         <h1>Your Interests</h1>
<%
      PreparedStatement utop=con.prepareStatement("SELECT topic_name from topics WHERE topicid IN (SELECT topicid FROM utopics where uid = ?)");
      utop.setInt(1,uid);
      ResultSet result=utop.executeQuery();
      while(result.next()){

        out.print("&nbsp&nbsp&nbsp&nbsp<p>"+result.getString(1));

      }
%>
       </div>
       <div class="col-md-7">

<h2>Custom Topics from Other Users</h2>
<p>Click on Any to add to Your Interests</p>
<%
PreparedStatement all=con.prepareStatement("select topic_name from topics");
ResultSet topics=all.executeQuery();
 	topics.afterLast();
while(topics.previous()){

  URL url=new URL("https://api.qwant.com/api/search/images?count=1&offset=1&q="+URLEncoder.encode(topics.getString(1), "UTF-8"));
  URLConnection urlcon=url.openConnection();
  InputStream stream=urlcon.getInputStream();
  int i;
  String json="";
  while((i=stream.read())!=-1){
  json+=((char)i);
  }
     int k;
     Object obj=JSONValue.parse(json);
     JSONObject jsonObject = (JSONObject) obj;
      String status = (String) jsonObject.get("status");

      JSONObject data =(JSONObject)jsonObject.get("data");
      JSONObject jresult=(JSONObject)data.get("result");

      JSONObject temp = new JSONObject();
      JSONArray items =(JSONArray) jresult.get("items");
      temp= (JSONObject)items.get(0);

       String link="https://";
       String llink=(String)temp.get("thumbnail");
        link+=llink.substring(2);

  %> <img src="<%=link%>" height="80" width="80"> <%
out.print("&nbsp&nbsp&nbsp&nbsp<a href=addctopics.jsp?custom="+URLEncoder.encode(topics.getString(1), "UTF-8")+">"+topics.getString(1)+"</a>");

}


%>
</div>
</div>
</div>
</div>
