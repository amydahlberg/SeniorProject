<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="edu.westmont.cs195.amy.dbConnection, java.sql.*" %>
    <% dbConnection db = new dbConnection(); 
	Connection connect = db.connect(); 
	Statement statement = null;
ResultSet resultSet = null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Description</title>
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
			<li class="nav-item">
				<a class="nav-link" href="jobs.jsp">Jobs <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item active">
				<a class="nav-link" href="Bids.jsp">Bids <span class="sr-only">(current)</span></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="Contacts.jsp">Contacts <span class="sr-only">(current)</span></a>
			</li>
		</ul>
	</div>
</nav>
<div class="table-responsive">
 <% 
 	String sql = "SELECT * FROM Bids";
	statement = connect.createStatement();
	resultSet = statement.executeQuery(sql);
 %>
      <table border = "1" width = "100%">
         <tr>
            <th>Job</th>
            <th>File Name</th>
         </tr>
         
         <% while (resultSet.next()) { %>
         <tr>
            <td><%=resultSet.getString("title")%></td>
			<td><%=resultSet.getString("file")%></td>
		</tr>
         <% } %>
      </table>
</div>
<button type="button" class="btn btn-outline-secondary my-2 my-sm-0" onclick="location.href='bidForm.jsp'"> Add New</button>
</body>
</html>
<% if (connect != null) { 
connect.close();
}%>