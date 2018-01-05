<%
session.setAttribute("uid", null);
session.setAttribute("username", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
GOODBYE
