<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.jdom2.*" %>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="org.w3c.dom.*"%>
<style>
.box{
    display: none;
    width: 100%;
}

a:hover + .box,.box:hover{
    display: block;
    position: relative;
    z-index: 100;


}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body {
   background-image: url("3.jpg");
   background-color: #cccccc;

}
img.center {
    display: block;
    margin: 0 auto;
}

</style>
<%
String[] title=new String[100];
String[] description=new String[100];
String[] link=new String[100];
String[] published=new String[100];
String[] imageUrl=new String[100];
int uid= (int)session.getAttribute( "uid" );
int i=0,ne=0;
String searchQuery[]= new String[20];
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/try1",
        "root", "phpmyadmin");
PreparedStatement utop=con.prepareStatement("SELECT category_name from categories WHERE cid IN (SELECT cid FROM ucategories where uid = ?) AND rss_from='ht'");
utop.setInt(1,uid);
ResultSet result=utop.executeQuery();
while(result.next()){

  searchQuery[i]=result.getString(1);
  out.print(searchQuery[i]);
  i++;
}






        for(int r=0;r<i;r++){
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
         DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();

         Document doc = dBuilder.parse("http://www.hindustantimes.com/rss/"+searchQuery[r] +"/rssfeed.xml");
          doc.getDocumentElement().normalize();
         out.println("Root element :" + doc.getDocumentElement().getNodeName());
         NodeList nList = doc.getElementsByTagName("item");
         out.print("----------------------------");

         for (int temp = 0; temp < nList.getLength(); temp++) {
            Node nNode = nList.item(temp);
          //  out.print("\nCurrent Element :" + nNode.getNodeName());

            if (nNode.getNodeType() == Node.ELEMENT_NODE) {
               Element eElement = (Element) nNode;

               title[ne]=eElement.getElementsByTagName("title").item(0).getTextContent();
               description[ne]="Description : "+ eElement.getElementsByTagName("description").item(0).getTextContent();
               link[ne]=eElement.getElementsByTagName("link").item(0).getTextContent();
               published[ne]=eElement.getElementsByTagName("pubDate").item(0).getTextContent();
               imageUrl[ne]=eElement.getElementsByTagName("media:content").item(0).getAttributes().getNamedItem("url").getTextContent();
                ne++;
              }
            }
  }
%>
<%for(int rec=0;rec<ne;rec++)
out.print("<div class=\"panel panel-default\"><br> <div class=\"panel-heading\">"+title[rec]+"</div><br><div class=\"panel-content\"><a href=\""+link[rec]+"\" target=\"_blank\"><img src=\""+imageUrl[rec]+"\" height='200' width='300' class=\"center\"><br>"+description[rec]+"</a></div></div>");%>
