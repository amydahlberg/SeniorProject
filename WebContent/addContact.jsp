<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="edu.westmont.cs195.amy.dbConnection, java.sql.*" %>   
<% dbConnection db = new dbConnection(); 
	Connection connect = db.connect(); 
	Statement statement = null;%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>New Contact</title>
<link rel="stylesheet" href="bootstrap.css">
</head>
<body>
<script type="text/javascript">
</script>
<form id="contactForm" class="container-fluid" action="processContacts.jsp">
	<div class="row-align-items-center">
		<div class="col">
				
				<div class="form-group">
					<label for="person">Name</label>
                    <input type="text" class="form-control" id="name" name="name">

				</div>
				<div class="form-group">
					<label for="email">Email Address</label>
                    <input type="text" class="form-control" id="email" name="email">

				</div>
				<div class="form-group">
					<label for="phone">Phone Number</label>
                    <input type="text" class="form-control" id="phoneNum" name="phoneNum">

				</div>
				<div class="form-group">
					<label for="notes">Notes</label>
					<textarea class="form-control" id="notes" name="notes" rows="5"></textarea>
				</div>
			
		</div>
	</div>
	<div class="row align-items-end">
		<div class="col-lg">
			<input class="btn btn-outline-danger my-2 my-sm-0" type="button" value="Cancel" onclick="location.href='Contacts.jsp'">
		</div>
		<div class="col-sm">
            <input class="btn btn-outline-secondary my-2 my-sm-0" type="submit" value="Submit" onclick="location.href='Contacts.jsp'">
		</div>
	</div>
	</form>
</body>
</html>