package com.servlet;

import java.io.IOException;
import java.time.LocalDate;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.helper.factoryProvider;
import com.entities.Note;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public updateServlet() {
        super();
        
    }



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title= request.getParameter("title");
			String content = request.getParameter("content");
			int id= Integer.parseInt(request.getParameter("noteId").trim());
			
			
			Session session= factoryProvider.getFactory().openSession();
			Transaction tx= session.beginTransaction();
			
			Note note=session.find(Note.class,id);
			note.setTitle(title);
			note.setContent(content);
			LocalDate date= LocalDate.now();
			note.setAddedDate(date);
			
			tx.commit();
			session.close();
			
			response.sendRedirect("all_notes.jsp");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
