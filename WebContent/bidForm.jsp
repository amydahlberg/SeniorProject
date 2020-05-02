<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="edu.westmont.cs195.amy.dbConnection, java.sql.*" %>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Bid Form</title>
<link rel="stylesheet" href="bootstrap.css">
</head>
<body>

<%int i=1; 
int rowNum=13;%>
<script>
function addLabel() {
	document.getElementById("section").style.display = 'block';
	<% for (int x=0; x < 2; x++) { %>
			document.getElementById("element<%=x%>").style.display = 'block';
			document.getElementById("cost<%=x%>").style.display = 'block';
			document.getElementById("notes<%=x%>").style.display = 'block';
			document.getElementById("quantity<%=x%>").style.display = 'block';
	<% } %>
}
</script>
<form id="bidForm" class="container-fluid" action="processBids.jsp">
<br>
	<div class="row-align-items-center">
		<div class="col">
				<div class="form-group">
					<label for="person">Name of Spreadsheet (leave off file extension)</label>
                    <input type="text" class="form-control" id="file" name="file">

				</div>
				<div class="form-group">
					<label for="person">Client Name</label>
                    <input type="text" class="form-control" id="client" name="client">

				</div>
				<div class="form-group">
					<label for="address">Job Title</label>
                    <input type="text" class="form-control" id="job" name="job">

				</div>
				<div class="form-group">
					<label for="address">Job Address</label>
                    <input type="text" class="form-control" id="address" name="address">

				</div>
				<div class="form-group">
					<label for="date">Date</label>
                    <input type="text" class="form-control" id="date" name="date">

				</div>
				<div class="form-group">
					<label for="header1">Section <%=i%> Header</label>
                    <input type="text" class="form-control" id="label<%=i%>" name="label<%=i%>">

				</div>
				<%for (int x=0; x < 2; x++) { %>
					<div class="form-group">
						<label>Element <%=x+1 %></label>
	                    <input type="text" class="form-control" id="element<%=i%>:<%=x%>" name="element<%=i%>:<%=x%>">
					</div>
					<div class="form-group">
						<label>Cost <%=x+1 %></label>
	                    <input type="text" class="form-control" id="cost<%=i%>:<%=x%>" name="cost<%=i%>:<%=x%>">
					</div>
					<div class="form-group">
						<label>Notes <%=x+1 %></label>
	                    <input type="text" class="form-control" id="notes<%=i%>:<%=x%>" name="notes<%=i%>:<%=x%>">
					</div>
					<div class="form-group">
						<label>Quantity <%=x+1 %></label>
	                    <input type="text" class="form-control" id="quantity<%=i%>:<%=x%>" name="quantity<%=i%>:<%=x%>">
					</div>
				<% } %>
				<%i++; %>
				<div class="form-group" id="section" style="display:none">
					<label>Section <%=i%> Header</label>
                    <input type="text" class="form-control" id="label<%=i%>" name="label<%=i%>">

				</div>
				<%for (int x=0; x < 2; x++) { %>
					<div class="form-group" id="element<%=x%>" style="display:none">
						<label>Element <%=x+1%></label>
	                    <input type="text" class="form-control" id="element<%=i%>:<%=x%>" name="element<%=i%>:<%=x%>">
					</div>
					<div class="form-group" id="cost<%=x%>" style="display:none">
						<label>Cost <%=x+1%></label>
	                    <input type="text" class="form-control" id="cost<%=i%>:<%=x%>" name="cost<%=i%>:<%=x%>">
					</div>
					<div class="form-group" id="notes<%=x%>" style="display:none">
						<label>Notes <%=x+1%></label>
	                    <input type="text" class="form-control" id="notes<%=i%>:<%=x%>" name="notes<%=i%>:<%=x%>">
					</div>
					<div class="form-group" id="quantity<%=x%>" style="display:none">
						<label>Quantity <%=x+1%></label>
	                    <input type="text" class="form-control" id="quantity<%=i%>:<%=x%>" name="quantity<%=i%>:<%=x%>">
					</div>
				<% } %>
				<button type="button" onclick="addLabel()" id="sectionButton">Add New Section</button>
				
		</div>
	</div>
	<div class="row align-items-end">
		<div class="col-lg">
			<input class="btn btn-outline-danger my-2 my-sm-0" type="button" value="Cancel" onclick="location.href='Bids.jsp'">
		</div>
		<div class="col-sm">
            <input class="btn btn-outline-secondary my-2 my-sm-0" type="submit" value="Submit" onclick="location.href='Bids.jsp'">
		</div>
	</div>
	</form>
</body>
</html>