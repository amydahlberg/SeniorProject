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
<title>Job Bid</title>
<link rel="stylesheet" href="bootstrap.css">
</head>
<body>
<%HttpSession httpSession=request.getSession();
       String job =  (String)httpSession.getAttribute("jobTitle");
   %>
<div class="table-responsive">
 <% 
 	String sql = "SELECT * FROM Bids WHERE title='";
	statement = connect.createStatement();
	resultSet = statement.executeQuery(sql+job+"'");
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
</body>
</html>
<% if (connect != null) { 
connect.close();
}%>