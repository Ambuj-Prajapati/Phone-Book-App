package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContact extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve form data
        int userId = Integer.parseInt(req.getParameter("userid"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phno = req.getParameter("phno");
        String about = req.getParameter("about");

        // Create Contact object
        Contact c = new Contact(name, email, phno, about, userId);
        ContactDAO dao = new ContactDAO(DbConnect.getConn());

        // Handle session and contact saving
        HttpSession session = req.getSession();
        boolean isSaved = dao.saveContact(c);

        // Set messages in session and redirect
        if (isSaved) {
            session.setAttribute("succMsg", "Your Contact Saved...");
            resp.sendRedirect("addContact.jsp");
        } else {
            session.setAttribute("failedMsg", "Something Went Wrong on Server...");
            resp.sendRedirect("addContact.jsp");
        }
    }
}
