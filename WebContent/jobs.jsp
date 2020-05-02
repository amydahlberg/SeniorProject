<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="edu.westmont.cs195.amy.dbConnection, java.sql.*" %>
    <% dbConnection db = new dbConnection(); 
	Connection connect = db.connect(); 
	Statement statement = null;
ResultSet resultSet = null;
%>
<%HttpSession httpSession=request.getSession();
       String job =  (String)httpSession.getAttribute("jobTitle");
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" dir="ltr">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<title>Jobs</title>

		<link rel="stylesheet" href="bootstrap.css">
	</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<a class="navbar-brand" href="index.jsp">Home</a>

	<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
			<li class="nav-item active">
				<a class="nav-link" href="jobs.jsp">Jobs <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="Bids.jsp">Bids <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="Contacts.jsp">Contacts <span class="sr-only">(current)</span></a>
			</li>
		</ul>
	</div>
</nav>
<br>
<form name="jobTitleForm" method="post" action="jobPage.jsp"> 
<div class="container-fluid">
    <div class="row-align-items-center">
        <div class="col">
        <% 
 	String sql = "SELECT * FROM jobs";
	statement = connect.createStatement();
	resultSet = statement.executeQuery(sql);
 %>
<!-- pull jobs from a database -->

	<% while (resultSet.next()) { %>
            <input type="submit" name="jobTitle" type="button" class="btn btn-secondary btn-lg btn-block" onclick="location.href='jobPage.jsp'" value="<%=resultSet.getString("title")%>">
            
    <% } %>
     	   </div>
    </div>
</div>
</form>
<br>
<button type="button" class="btn btn-outline-secondary my-2 my-sm-0" onclick="location.href='addJob.jsp'"> Add New</button>
</body>
</html>

<% if (connect != null) { 
connect.close(); 
} %>