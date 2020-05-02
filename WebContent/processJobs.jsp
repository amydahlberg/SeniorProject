<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="edu.westmont.cs195.amy.dbConnection, java.sql.*" %>
    <% dbConnection db = new dbConnection(); 
	Connection connect = db.connect(); 
	Statement statement = null;
	ResultSet resultSet = null;
	
statement = connect.createStatement();
 String title = request.getParameter("title");
String client = request.getParameter("client");
String address = request.getParameter("address");
String notes = request.getParameter("notes");

statement.executeUpdate("INSERT INTO Jobs values('"+client+"','"+address+"','"+notes+"','"+title+"')");
response.sendRedirect("jobs.jsp"); %>

<% if (connect != null) { 
connect.close();
}%>