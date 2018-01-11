<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.JSONValue" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
 <%@ page import="java.net.*" %>
 <%@ page import="java.io.*" %>
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Sources</title>
 </head>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
   background-image: url("4.jpg");
   background-color: #cccccc;
}
img.center {
    display: block;
    margin: 0 auto;
}



</style>
 <body>

   <%
   String[] title=new String[100];
   String[] description=new String[100];
   String[] surl=new String[100];
   String[] author=new String[100];
   String[] imageUrl=new String[100];
   int uid= (int)session.getAttribute( "uid" );
   int f=0,rec=0;
   String searchQuery[]= new String[20];
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/try1",
           "root", "phpmyadmin");
   PreparedStatement utop=con.prepareStatement("SELECT source_name from sources WHERE sourceid IN (SELECT sourceid FROM usources where uid=?)");
   utop.setInt(1,uid);
   ResultSet result=utop.executeQuery();
   while(result.next()){

     searchQuery[f]=result.getString(1);
    // out.print(searchQuery[f]);
     f++;
   }
for(int re=0;re<f;re++){
    URL url=new URL("https://newsapi.org/v1/articles?source="+ URLEncoder.encode(searchQuery[re], "UTF-8")+"&sortBy=top&apiKey=YOUR_API_KEY");
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
        String sortBy = (String) jsonObject.get("sortBy");
        String source = (String) jsonObject.get("source");
        JSONArray articles =(JSONArray) jsonObject.get("articles");
        JSONObject array[]= new JSONObject[20];
        JSONObject temp = new JSONObject();

        out.print(sortBy);

        %> <br>
   <%     out.print(source);  %>
   <br>
     <%
        int length= articles.size();
        out.print(length);


        for(k=0;k<length;k++)
        {
          array[k]= (JSONObject)articles.get(k);

          title[rec] = (String)array[k].get("title") ;
         author[rec]= (String)array[k].get("author") ;
         description[rec]= (String)array[k].get("description") ;
          surl[rec]= (String)array[k].get("url") ;
          imageUrl[rec]=(String)array[k].get("urlToImage");
          out.print("<div class=\"panel panel-default\"><br> <div class=\"panel-heading\">"+title[rec]+"</div><br><div class=\"panel-content\"><a href=\""+surl[rec]+"\" target=\"_blank\"><img src=\""+imageUrl[rec]+"\" height='200' width='300' class='center'><br>"+description[rec]+"</a></div></div>");
          rec++;
   %>

    <% }} %>
