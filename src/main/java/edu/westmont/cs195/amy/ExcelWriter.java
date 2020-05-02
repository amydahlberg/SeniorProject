package edu.westmont.cs195.amy;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.awt.Desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


//https://www.callicoder.com/java-write-excel-file-apache-poi/
//http://cursor.si/kb/jsp1/complete~Create-Hello-World-App-with-JavaServer-Pages-JSP-Maven-and-Eclipse

//code to write to and format an excel file
public class ExcelWriter {

    public Workbook createBook() {
    	// Create a Workbook
        Workbook workbook = new XSSFWorkbook(); // new HSSFWorkbook() for generating `.xls` file

        return workbook;
    }
    public CreationHelper createHelper(Workbook workbook) {
    	CreationHelper createHelper = workbook.getCreationHelper();
    	return createHelper;
    }
    public Sheet createSheet(Workbook workbook) {
    	Sheet sheet = workbook.createSheet("Estimate");
    	return sheet;
    }
    public void writeHeader(Workbook workbook, Sheet sheet, CreationHelper creationHelper, String client, String address, String date) {
    	
        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerFont.setFontHeightInPoints((short) 14);
        headerFont.setColor(IndexedColors.BLACK.getIndex());
        CellStyle headerCellStyle = workbook.createCellStyle();
        headerCellStyle.setFont(headerFont);
        
        
        Font headingFont = workbook.createFont();
        headingFont.setBold(false);
        headingFont.setFontHeightInPoints((short) 14);
        headingFont.setColor(IndexedColors.BLACK.getIndex());
        
        CellStyle headingCellStyle = workbook.createCellStyle();
        headingCellStyle.setFont(headingFont);

        Row headerRow = sheet.createRow(1);

        Cell cell = headerRow.createCell(8);
        cell.setCellValue("Estimate");
        cell.setCellStyle(headerCellStyle);
        
        Cell cell2 = headerRow.createCell(10);
        cell2.setCellValue(date);
        cell2.setCellStyle(headerCellStyle);
        
        Row clientRow = sheet.createRow(3);
        
        Cell cell3 = clientRow.createCell(0);
        cell3.setCellValue(client);
        cell3.setCellStyle(headingCellStyle);
        
        Row addressRow = sheet.createRow(4);
        
        Cell cell4 = addressRow.createCell(0);
        cell4.setCellValue(address);
        cell4.setCellStyle(headingCellStyle);
        
        Row headers = sheet.createRow(5);
        
        Cell cell5 = headers.createCell(5);
        cell5.setCellValue("Cost Estimate");
        cell5.setCellStyle(headingCellStyle);
        
        Cell cell6 = headers.createCell(7);
        cell6.setCellValue("Notes");
        cell6.setCellStyle(headingCellStyle);
        
        Cell cell7 = headers.createCell(9);
        cell7.setCellValue("Quantity");
        cell7.setCellStyle(headingCellStyle);
        
     // Resize all columns to fit the content size
        for(int i = 0; i < 8; i++) {
            sheet.autoSizeColumn(i);
        }
    }
    public void writeData(int rowNum, Workbook workbook, CreationHelper creationHelper, Sheet sheet, String element, String cost, String notes, String quantity) {
    	//all of the elements that go under the headers
    	Font headingFont = workbook.createFont();
        headingFont.setBold(false);
        headingFont.setFontHeightInPoints((short) 14);
        headingFont.setColor(IndexedColors.BLACK.getIndex());
       
        CellStyle headingCellStyle = workbook.createCellStyle();
        headingCellStyle.setFont(headingFont);
        
             Row row = sheet.createRow(rowNum);

             row.createCell(0).setCellValue(element);

             row.createCell(5).setCellValue(cost);

             row.createCell(7).setCellValue(notes);
             
             row.createCell(9).setCellValue(quantity);

 		// Resize all columns to fit the content size
         for(int i = 0; i < 12; i++) {
             sheet.autoSizeColumn(i);
         }
    }
    
    public void writeLabel(int rowNum, Workbook workbook, CreationHelper creationHelper, Sheet sheet, String label) {
    	//label is the section header
    	Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerFont.setFontHeightInPoints((short) 14);
        headerFont.setColor(IndexedColors.BLACK.getIndex());
        CellStyle headerCellStyle = workbook.createCellStyle();
        headerCellStyle.setFont(headerFont);
    	
    	Row row = sheet.createRow(rowNum);
    	Cell cell = row.createCell(0);
    	cell.setCellValue(label);
    	cell.setCellStyle(headerCellStyle);
    	
    	sheet.autoSizeColumn(0);
    }
    
    public void closeBook(Workbook workbook, String file, File fileName) throws IOException {
    	// write to a file and close the workbook
        FileOutputStream fileOut = new FileOutputStream(file);
        workbook.write(fileOut);
        fileOut.close();
        System.out.println(file);
      
        workbook.close();
        Desktop desktop = Desktop.getDesktop();
        desktop.open(fileName);
    }
}