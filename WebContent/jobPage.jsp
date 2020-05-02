<%@ page import="edu.westmont.cs195.amy.dbConnection, java.sql.*" %>

<!DOCTYPE html>

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
			<li class="nav-item">
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
<!-- add the name of the job??? -->
<% HttpSession httpSession = request.getSession();
   httpSession.setAttribute("jobTitle", request.getParameter("jobTitle"));
 %>
<div class="container-fluid">
    <div class="row-align-items-center">
        <div class="col">
<!-- pull jobs from a database -->

            <button type="button" class="btn btn-secondary btn-lg btn-block" onclick="location.href='Clients.jsp'">Client Information</button>

            <button type="button" class="btn btn-secondary btn-lg btn-block" onclick="location.href='jobDescription.jsp'">Job Description</button>

            <button type="button" class="btn btn-secondary btn-lg btn-block" onclick="location.href='Subcontractors.jsp'">Subcontractors</button>
            
            <button type="button" class="btn btn-secondary btn-lg btn-block" onclick="location.href='bidDescription.jsp'">Job Bid</button>
            

        </div>
    </div>
</div>

</body>
</html>

