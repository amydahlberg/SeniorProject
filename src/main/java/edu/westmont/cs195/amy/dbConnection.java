package edu.westmont.cs195.amy;
//https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-usagenotes-connect-drivermanager.html
// database connection using connector/j
import java.sql.*; 

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
   public class dbConnection {
       public Connection connect() {
      
		   Connection conn = null;
           try
           {
		   Class.forName ("com.mysql.cj.jdbc.Driver").newInstance ();
               String userName = "root";
               String password = "mdAh!1999";
               String host = "localhost";       
               conn = DriverManager
            	       .getConnection("jdbc:mysql://" + host + "/Senior_Project?"
            	               + "user=" + userName + "&password=" + password );
               System.out.println ("\nDatabase Connection Established...");
               return conn;
           }
          catch (Exception ex)
           {
		       System.err.println ("Cannot connect to database server");
			   ex.printStackTrace();
			   return conn;
           }      
           
       }
   }
