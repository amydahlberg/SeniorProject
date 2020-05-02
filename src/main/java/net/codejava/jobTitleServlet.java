package net.codejava;

import java.io.IOException;
import java.io.PrintWriter;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("/jobTitleServlet")
public class jobTitleServlet extends HttpServlet {
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
         
        // read form fields
        String jobTitle = request.getParameter("jobTitle");
         
        System.out.println("Job title: " + jobTitle);
        request.setAttribute("jobTitle", jobTitle);
        response.sendRedirect("jobPage.jsp");
        //request.getRequestDispatcher("jobPage.jsp").forward(request, response);
        return;
        // do some processing here...
         /**
        // get response writer
        PrintWriter writer = response.getWriter();
         
        // build HTML code
        String htmlRespone = "<html>";
        htmlRespone += "<h2>Your username is: " + username + "<br/>";      
        htmlRespone += "Your password is: " + password + "</h2>";    
        htmlRespone += "</html>";
         
        // return response
        writer.println(htmlRespone);
         **/
    }
 
}
