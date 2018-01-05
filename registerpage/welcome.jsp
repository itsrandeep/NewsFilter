
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <html>
  <head>
    <title>Welcome To NewsFilter</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <style>
    #myFrame { width:120%; height:120%; }
</style>
 <style>
 body {

     position:absolute;

 }
 #section1 {padding-top:50px;height:800px;color: #fff; background-color: #1E88E5;}
 #section2 {padding-top:50px;height:800px;color: #fff; background-color: #673ab7;}
 #section3 {padding-top:50px;height:800px;color: #fff; background-color: #ff9800;}
 </style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-inverse navbar-fixed-top">
 <div class="container-fluid">
   <div class="navbar-header">
       <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
     </button>
     <a class="navbar-brand" href="#">NewsFilter</a>
   </div>
   <div>
     <div class="collapse navbar-collapse" id="myNavbar">
       <ul class="nav navbar-nav">
         <li><a href="#section1">Topics</a></li>
         <li><a href="#section2">Categories</a></li>
         <li><a href="#section3">Sources</a></li>
         <li><a href="#section5">News Videos</a></li>
          <li><a href="#section4">Twitter News Accounts</a></li>
         <li><a href="#">Welcome, <%=session.getAttribute("username")%> !</a></li>
         <li ><a href="registerpage/ctopics.jsp">View/Change Your Custom Topics</a></li>
         <li style="float:right;"><a href="logout.jsp">Log Out</a></li>
         </li>
       </ul>
     </div>
   </div>
 </div>
</nav>

<div id="section1" class="container-fluid">
 <h1>Topics</h1>
 <p> <iframe src="temp.jsp" width="630px" height="500"></iframe>
     <iframe src="temp3.jsp" width="630px" height="500"></iframe>
</p>
</div>


<div id="section2" class="container-fluid">

 <h1>Categories</h1>
 <p><iframe src="temp1.jsp" width="1270" height="500"></iframe></p>
</div>

<div id="section3" class="container-fluid">
 <h1>Sources</h1>
 <p><iframe src="temp2.jsp" width="1270" height="500"></iframe></p>

</div>
<div id="section5" class="container-fluid">
  <h1>News Videos</h1>
  <iframe src="http://www.youtube.com/embed/?listType=user_uploads&list=ndtvindia" width="600" height="500"></iframe>
  &nbsp;&nbsp;&nbsp;
  <iframe src="http://www.youtube.com/embed/?listType=user_uploads&list=ddnewsOfficial" width="600" height="500"></iframe>

</div>

<div id="section4" class="container-fluid">
 <h1>Twitter</h1>

 <a class="twitter-timeline" href="https://twitter.com/ani?ref_src=twsrc%5Etfw">Tweets by ANI News</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

</div>



</body>
</html>
