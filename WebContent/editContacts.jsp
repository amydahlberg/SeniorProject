<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="edu.westmont.cs195.amy.dbConnection, java.sql.*" %>   
 <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% dbConnection db = new dbConnection(); 
	Connection connect = db.connect(); 
	Statement statement = null;
ResultSet resultSet = null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Edit Contact</title>
<link rel="stylesheet" href="bootstrap.css">
</head>
<body>
<%  
	HttpSession httpSession = request.getSession();
    httpSession.setAttribute("contact", request.getParameter("contact"));
    
	statement = connect.createStatement();
	resultSet = statement.executeQuery("SELECT * FROM Contacts WHERE person='"+request.getParameter("contact")+"'");
	String name = "";
	String email = "";
	String phoneNum = "";
	String notes = "";
	while (resultSet.next()) {
		name = resultSet.getString("person");
		email = resultSet.getString("email");
		phoneNum = resultSet.getString("phoneNum");
		notes = resultSet.getString("notes");
	}
 %>
 
<form id="contactForm" class="container-fluid" action="processEdits.jsp">
	<div class="row-align-items-center">
	<%resultSet.beforeFirst(); %>
		<div class="col">
				<div class="form-group">
					<label for="person">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%=name%>">

				</div>
				<div class="form-group">
					<label for="email">Email Address</label>
                    <input type="text" class="form-control" id="email" name="email" value="<%=email%>">

				</div>
				<div class="form-group">
					<label for="phone">Phone Number</label>
                    <input type="text" class="form-control" id="phoneNum" name="phoneNum" value="<%=phoneNum%>">

				</div>
				<div class="form-group">
					<label for="notes">Notes</label>
					<textarea class="form-control" id="notes" name="notes" rows="5"><%=notes%></textarea>
				</div>
		</div>
	</div>
	<!-- change to be filled in -->
	<div class="row align-items-end">
	<div class="col-lg">
			<input class="btn btn-outline-primary my-2 my-sm-0" type="submit" id="btn" name="btn" value="Delete Contact" onclick="location.href='Contacts.jsp'">
		</div>
	</div>
	<br>
	<div class="row align-items-end">
		<div class="col-lg">
			<input class="btn btn-outline-danger my-2 my-sm-0" type="button" id="btn" name="btn" value="Cancel" onclick="location.href='Contacts.jsp'">
		</div>
		<div class="col-sm">
            <input class="btn btn-outline-secondary my-2 my-sm-0" type="submit" id="btn" name="btn" value="Submit" onclick="location.href='Contacts.jsp'">
		</div>
	</div>
	</form>
</body>
</html>
<% if (connect != null) { 
connect.close();
}%>