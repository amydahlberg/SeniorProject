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
<form id="jobForm" class="container-fluid" action="processJobs.jsp">
	<div class="row-align-items-center">
		<div class="col">
				
				<div class="form-group">
					<label for="title">Job Title</label>
                    <input type="text" class="form-control" id="title" name="title">

				</div>
				<div class="form-group">
					<label for="client">Client</label>
                    <input type="text" class="form-control" id="client" name="client">

				</div>
				<div class="form-group">
					<label for="address">Address</label>
                    <input type="text" class="form-control" id="address" name="address">

				</div>
				<div class="form-group">
					<label for="notes">Notes</label>
					<textarea class="form-control" id="notes" name="notes" rows="5"></textarea>
				</div>
			
		</div>
	</div>
	<div class="row align-items-end">
		<div class="col-lg">
			<input class="btn btn-outline-danger my-2 my-sm-0" type="button" value="Cancel" onclick="location.href='jobs.jsp'">
		</div>
		<div class="col-sm">
            <input class="btn btn-outline-secondary my-2 my-sm-0" type="submit" value="Submit" onclick="location.href='jobs.jsp'">
		</div>
	</div>
	</form>
</body>
</html>