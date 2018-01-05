<%@page language="java" contentType="text/html" %>
<%@ page import="java.sql.*" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<h2 color="red"> Welcome
<%
out.print(session.getAttribute( "username" ));
%>
</h2>
<h3>Choose the Sources</h3>

<form action="addsources.jsp">


<div class="form-group">
  <label class="checkbox-inline">

  <input type="checkbox" name="isource" value="the-new-york-times">
    <img alt="The New York Times" class="icon" src="https://icons.better-idea.org/icon?url=http://www.nytimes.com&size=70..120..200" />
    <div class="name" title="The New York Times">
            The New York Times
    </div>
  </input>
</label>
 <label class="checkbox-inline">
   <input type="checkbox" name="isource" value="bbc-news">
     <img alt="BBC News" class="icon" src="https://icons.better-idea.org/icon?url=http://www.bbc.co.uk/news&size=70..120..200" />
     <div class="name" title="BBC News">
            BBC News
     </div>
   </input>
  </label>
  <label class="checkbox-inline">
     <input type="checkbox" name="isource" value="buzzfeed">
       <img alt="Buzzfeed" class="icon" src="https://icons.better-idea.org/icon?url=https://www.buzzfeed.com&size=70..120..200" />
                               <div class="name" title="Buzzfeed">
                                   Buzzfeed
                               </div>
     </input>
  </label>
  <label class="checkbox-inline">
     <input type="checkbox" name="isource" value="cnn">
       <img alt="CNN" class="icon" src="https://icons.better-idea.org/icon?url=http://us.cnn.com&size=70..120..200" />
                               <div class="name" title="CNN">
                                   CNN
                               </div>
     </input>
  </label>
  <label class="checkbox-inline">
     <input type="checkbox" name="isource" value="engadget">
       <img alt="Engadget" class="icon" src="https://icons.better-idea.org/icon?url=https://www.engadget.com&size=70..120..200" />
                             <div class="name" title="Engadget">
                                 Engadget
                             </div>
     </input>
  </label>


  <label class="checkbox-inline">
     <input type="checkbox" name="isource" value="independent">
       <img alt="Independent" class="icon" src="https://icons.better-idea.org/icon?url=http://www.independent.co.uk&size=70..120..200" />
                               <div class="name" title="Independent">
                                   Independent
                               </div>
     </input>
  </label>
  <label class="checkbox-inline">
     <input type="checkbox" name="isource" value="mashable">
       <img alt="Mashable" class="icon" src="https://icons.better-idea.org/icon?url=http://mashable.com&size=70..120..200" />
                              <div class="name" title="Mashable">
                                  Mashable
                              </div>
     </input>
  </label>
  <label class="checkbox-inline">
     <input type="checkbox" name="isource" value="mtv-news">
       <img alt="MTV News" class="icon" src="https://icons.better-idea.org/icon?url=http://www.mtv.com/news&size=70..120..200" />
                               <div class="name" title="MTV News">
                                   MTV News
                               </div>
     </input>
  </label>
  <label class="checkbox-inline">
     <input type="checkbox" name="isource" value="reddit-r-all">
       <img alt="Reddit /r/all" class="icon" src="https://icons.better-idea.org/icon?url=https://www.reddit.com/r/all&size=70..120..200" />
                                <div class="name" title="Reddit /r/all">
                                    Reddit /r/all
                                </div>
     </input>
  </label>
  <label class="checkbox-inline">
     <input type="checkbox" name="isource" value="techcrunch">
       <img alt="TechCrunch" class="icon" src="https://icons.better-idea.org/icon?url=https://techcrunch.com&size=70..120..200" />
                               <div class="name" title="TechCrunch">
                                   TechCrunch
                               </div>
     </input>
  </label>
  <label class="checkbox-inline">
     <input type="checkbox" name="isource" value="techradar">
       <img alt="TechRadar" class="icon" src="https://icons.better-idea.org/icon?url=http://www.techradar.com&size=70..120..200" />
                                  <div class="name" title="TechRadar">
                                      TechRadar
                                  </div>
     </input>
  </label>
  <label class="checkbox-inline">
     <input type="checkbox" name="isource" value="the-times-of-india">
       <img alt="The Times of India" class="icon" src="https://pbs.twimg.com/profile_images/781514680732749824/PG2_gebm_400x400.jpg" width=100 />
                                <div class="name" title="The Times of India">
                                    The Times of India
                                </div>
     </input>

  </label>
  <label class="checkbox-inline">
     <input type="checkbox" name="isource" value="the-hindu">
       <img alt="The Hindu" class="icon" src="https://pbs.twimg.com/profile_images/627376030282416128/pYl_LmcW_400x400.jpg" width=100/>
                               <div class="name" title="The Hindu">
                                   The Hindu
                               </div>
     </input>
  </label>
<input  type="submit" style="float: right;" class="btn btn-primary" value="Next" />
</div>

</form>
