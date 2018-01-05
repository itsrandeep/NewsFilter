<%@ page import="org.json.simple.*" %>
<%@ page import="org.json.simple.JSONValue" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

 <%@ page import="java.net.*" %>
 <%@ page import="java.io.*" %>
 <%@ page import="java.util.Random" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>NewsFilter</title>
<link href="https://fonts.googleapis.com/css?family=Able|Arvo" rel="stylesheet">

<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="jquery.dropotron-1.0.js"></script>
<script type="text/javascript" src="jquery.slidertron-1.0.js"></script>
</head>
<body>
<%

   String newssource[]={"engadget","bbc-news","the-times-of-india","abc-news-au","al-jazeera-english","associated-press","bbc-sport","buzzfeed","entertainment-weekly","mtv-news","national-geographic","new-scientist","the-economist","the-hindu"};
   Random rand = new Random();

   int  n = rand.nextInt(13) + 0;
   URL url=new URL("https://newsapi.org/v1/articles?source="+newssource[n]+"&sortBy=top&apiKey=43e0f95189d54526bf404b41d547687a");
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

	   //  out.print(sortBy);

	     %> <br>

	<br>
	  <%
	     int length= articles.size();
	//     out.print(length);


	     for(k=0;k<4;k++)
	     array[k]= (JSONObject)articles.get(k);

	  //    out.print("<br>Title: " + array[0].get("title") );
	   //   out.print("<br>Author: " + array[0].get("author") );
	   //   out.print("<br>Description: " + array[0].get("description") );
	%>
<div id="wrapper">
	<div id="header-wrapper">
		<div id="header">
			<div id="logo">
				<h1><a href="#">NewsFilter</a></h1>
        Hello,
        <%
          if(session.getId().equals(null) == true)
          {  out.print(session.getAttribute( "username" ));  int loggedin = 1;
               response.sendRedirect("welcome.jsp");
           }
          else
            out.print("New User"); %>

			</div>

		</div>
		<div id="menu-wrapper">
			<ul id="menu">
				<li class="current_page_item"><a href="#"><span>Homepage</span></a></li>
        <li><a href="registerpage"><span>Log In/ Register</span></a></li>
				<li>

				<li><span>Powered By</span>
					<ul>
						<li class="first"> <a target="_blank" href="http://newsapi.org">NewsApi</a> </li>

						<li><a target="_blank" href="https://timesofindia.indiatimes.com/rss.cms">RSS Feeds</a></li>
					</ul>
				</li>

        <li><a href="#"><span>About</span></a></li>
			<script type="text/javascript">
			$('#menu').dropotron();
		</script>
		</div>
		<!-- end #menu -->
		<div id="banner">
			<div id="slider"> <a href="#" class="button previous-button">&lt;</a> <a href="#" class="button next-button">&gt;</a>
				<div class="viewer">
					<div class="reel">
            <div class="slide">
							<h2><%=array[0].get("title") %></h2>

							<a  target="_blank" href="<%=array[0].get("url")%>">Full story ...<img src="<%= array[0].get("urlToImage") %>" width="900" height="350" alt="" /></a></div>
						<div class="slide">
							<h2><%=array[1].get("title") %></h2>

							<a  target="_blank" href="<%=array[1].get("url")%>">Full story ...<img src="<%= array[1].get("urlToImage") %>" width="900" height="350" alt="" /></a></div>
              <div class="slide">
  							<h2><%=array[2].get("title") %></h2>

  							<a  target="_blank" href="<%=array[2].get("url")%>">Full story ...<img src="<%= array[2].get("urlToImage") %>" width="900" height="350" alt="" /></a></div>
                <div class="slide">
    							<h2><%=array[3].get("title") %></h2>

    							<a  target="_blank" href="<%=array[3].get("url")%>">Full story ...<img src="<%= array[3].get("urlToImage") %>" width="900" height="350" alt="" /></a></div>

           </div>
        	</div>
				<div class="indicator">
					<ul>
						<li class="active">1</li>
						<li>2</li>
            <li>3</li>
            <li>4</li>
					</ul>
				</div>
			</div>
			<script type="text/javascript">
				$('#slider').slidertron({
					viewerSelector: '.viewer',
					reelSelector: '.viewer .reel',
					slidesSelector: '.viewer .reel .slide',
					advanceDelay: 3000,
					speed: 'slow',
					navPreviousSelector: '.previous-button',
					navNextSelector: '.next-button',
					indicatorSelector: '.indicator ul li',
					slideLinkSelector: '.link'
				});
			</script>
		</div>
	</div>
	<!-- end #header -->
	<div id="page">
		<div id="content">
			<div class="contentbg">
				<div class="post">
					<h2 class="title"><a href="#">Welcome to NewsFilter</a></h2>
<!–– and the comment closes with ––>

					<div class="entry">
						<p>This is <strong>NewsFilter</strong>, a free, personalised news web application designed by <a href="#" rel="nofollow">Abhishek and Randeep</a>. This project is made by using technologies like <strong>JAVA, HTML, MySQL.</strong></p>
						<p>Application Information HERE.</p>
					</div>
				</div>
				<div style="clear: both;">&nbsp;</div>
			</div>
		</div>
		<!-- end #content -->
		<div id="sidebar-bg">
			<div id="sidebar">
				<ul>
					<li>
						<h2>About Slideshow</h2>
						<ul>
							<li><a href="#">Source: <%=source%></a></li>


						</ul>
					</li>
				</ul>
			</div>
		</div>

		<div style="clear: both;">&nbsp;</div>
	</div>
	<!-- end #page -->
</div>
<div id="footer">
	<p>2017. NewsFilter. Designed by Abhishek and Randeep.</p>
</div>
<!-- end #footer -->
</body>
</html>
