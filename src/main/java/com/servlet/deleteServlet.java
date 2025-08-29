package com.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.factoryProvider;



public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public deleteServlet() {
        super();
       
    }

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());		//fetched note id
			Session session=factoryProvider.getFactory().openSession();
			Transaction tx= session.beginTransaction();
			Note note=(Note)session.find(Note.class,noteId);	//here we could have used get also but find return null if noteId is not present 
			if(note!=null) {
				session.remove(note);
			}
			
			
			tx.commit();
			session.close();
			
			response.sendRedirect("all_notes.jsp");		//once we delete note we redirect page to all_notes 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	

}
