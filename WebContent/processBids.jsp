<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="edu.westmont.cs195.amy.dbConnection, java.sql.*"%>
<%@ page import="org.apache.poi.ss.usermodel.*" %>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook" %>
<%@ page import="edu.westmont.cs195.amy.ExcelWriter" %>
<%@ page import="java.io.FileNotFoundException"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.awt.Desktop" %>
<%@ page import="java.io.File" %>
<% dbConnection db = new dbConnection(); 
	Connection connect = db.connect(); 
	Statement statement = null;
	Statement s = null;
ResultSet resultSet = null;
ResultSet rs = null;%>
	
<%	String job = request.getParameter("job");
	String file = request.getParameter("file")+".xlsx";
	String client = request.getParameter("client");
	String address = request.getParameter("address");
	String date = request.getParameter("date");
	String section1 = request.getParameter("label1");
	String section2 = request.getParameter("label2");
	String element1 = request.getParameter("element1:0");
	String cost1 = request.getParameter("cost1:0");
	String notes1 = request.getParameter("notes1:0");
	String quantity1 = request.getParameter("quantity1:0");
	String element2 = request.getParameter("element1:1");
	String cost2 = request.getParameter("cost1:1");
	String notes2 = request.getParameter("notes1:1");
	String quantity2 = request.getParameter("quantity1:1");
	String element3 = request.getParameter("element2:0");
	String cost3 = request.getParameter("cost2:0");
	String notes3 = request.getParameter("notes2:0");
	String quantity3 = request.getParameter("quantity2:0");
	String element4 = request.getParameter("element2:1");
	String cost4 = request.getParameter("cost2:1");
	String notes4 = request.getParameter("notes2:1");
	String quantity4 = request.getParameter("quantity2:1");
	int rowNum = 6;
	
	String sql = "INSERT INTO Bids values('";
	String end = "')";
	statement = connect.createStatement();
	statement.executeUpdate(sql+file+"', '"+job+end);
	
	//writing to the excel file using daata from the bid form
	File fileName = new File(file);
	ExcelWriter ew = new ExcelWriter();
	Workbook workbook = ew.createBook();
	CreationHelper creationHelper = ew.createHelper(workbook);
	Sheet sheet = ew.createSheet(workbook);
	ew.writeHeader(workbook, sheet, creationHelper, client, address, date);
	ew.writeLabel(rowNum, workbook, creationHelper, sheet, section1);
	rowNum++;
	
	ew.writeData(rowNum, workbook, creationHelper, sheet, element1, cost1, notes1, quantity1);
	rowNum++;
	ew.writeData(rowNum, workbook, creationHelper, sheet, element2, cost2, notes2, quantity2);
	rowNum++;
	ew.writeLabel(rowNum, workbook, creationHelper, sheet, section2);
	rowNum++;
	ew.writeData(rowNum, workbook, creationHelper, sheet, element3, cost3, notes3, quantity3);
	rowNum++;
	ew.writeData(rowNum, workbook, creationHelper, sheet, element4, cost4, notes4, quantity4);
	
	ew.closeBook(workbook, file, fileName);
	%>
	<script>
	alert("Success! Your file will open now in Excel");
	</script>
	<%
	response.sendRedirect("Bids.jsp");
	%>