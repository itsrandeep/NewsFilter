<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.gargoylesoftware.htmlunit.*" %>
<%@ page import="com.gargoylesoftware.htmlunit.html.*" %>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
   background-image: url("1.jpg");
   background-color: #cccccc;
}

</style>
<div class="container-fluid">
<%
int uid= (int)session.getAttribute( "uid" );
int i=0;
String searchQuery[]= new String[20];
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/try1",
        "root", "phpmyadmin");
PreparedStatement utop=con.prepareStatement("SELECT topic_name from topics WHERE topicid IN (SELECT topicid FROM utopics where uid = ?)");
utop.setInt(1,uid);
ResultSet result=utop.executeQuery();
while(result.next()){

  searchQuery[i]=result.getString(1);
  out.print(searchQuery[i]);
  i++;
}

String[] title=new String[500];
String[] itemUrl=new String[500];
String[] imgUrl=new String[500];
int n=0,nt=0;
HtmlPage pag;
WebClient client = new WebClient();
client.getOptions().setCssEnabled(false);
client.getOptions().setJavaScriptEnabled(false);
for(nt=0;nt<i;nt++){
String searchUrl ="https://news.google.com/news/search/section/q/"+ URLEncoder.encode(searchQuery[nt], "UTF-8")+"/"+ URLEncoder.encode(searchQuery[nt], "UTF-8")+"?hl=en-IN&gl=IN&ned=in";
pag = client.getPage(searchUrl);
List<HtmlElement> items = (List<HtmlElement>)(List) pag.getByXPath("//c-wiz[@class='PaqQNc']") ;




out.println(items.size());
if(items.isEmpty()){
  out.println("No items found !");
}else{
for(HtmlElement htmlItem : items){

  HtmlAnchor itemAnchor =  ((HtmlAnchor) htmlItem.getFirstByXPath(".//c-wiz/div/div/c-wiz/a"));
  title[n] = itemAnchor.asText();
  itemUrl[n] = itemAnchor.getHrefAttribute() ;



try{
    HtmlImage img = ((HtmlImage)htmlItem.getFirstByXPath(".//c-wiz/div/div[1]/a/img"));
  imgUrl[n]= img.getSrcAttribute();
}catch(Exception e){e.printStackTrace();}


out.print("<div class=\"panel panel-default\"><br> <div class=\"panel-heading\">Title : "+ title[n] +"</div> <br><div class=\"panel-content\"> <a href="+ itemUrl[n] +" target=\"_blank\"><img src="+ imgUrl[n] +"><br> </a></div> <br></div>" );
n++;
}
}
}
    %>
  </div>
