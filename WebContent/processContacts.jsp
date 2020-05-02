<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="edu.westmont.cs195.amy.dbConnection, java.sql.*" %>
    <% dbConnection db = new dbConnection(); 
	Connection connect = db.connect(); 
	Statement statement = null;
	ResultSet resultSet = null;
	//https://www.studentstutorial.com/java-project/jsp-insert-data.php as a reference
statement = connect.createStatement();
 String name = request.getParameter("name");
String email = request.getParameter("email");
String phoneNum = request.getParameter("phoneNum");
String notes = request.getParameter("notes");

statement.executeUpdate("INSERT INTO Contacts(person, email, phoneNum, notes) values('"+name+"','"+email+"','"+phoneNum+"','"+notes+"')");
response.sendRedirect("Contacts.jsp"); %>

<% if (connect != null) { 
connect.close();
}%>