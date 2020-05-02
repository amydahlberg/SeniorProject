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

<div class="table-responsive">
<%HttpSession httpSession=request.getSession();
       String job =  (String)httpSession.getAttribute("jobTitle");
   %>
 <% 
 	String sql = "SELECT * FROM Jobs WHERE title='";
 	String sql2 = "'";
	statement = connect.createStatement();
	resultSet = statement.executeQuery(sql+job+sql2);
 %>
 <h1><%=job%></h1>
      <table border = "1" width = "100%">
         <tr>
            <th>Client</th>
            <th>Address</th>
            <th>Notes</th>
         </tr>
         
         <% while (resultSet.next()) { %>
         <tr>
            <td><%=resultSet.getString("client")%></td>
			<td><%=resultSet.getString("address")%></td>
			<td><%=resultSet.getString("notes")%></td>
		</tr>
         <% } %>
      </table>
</div>
</body>
</html>