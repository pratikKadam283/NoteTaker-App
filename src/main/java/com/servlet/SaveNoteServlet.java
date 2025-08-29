package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import org.hibernate.Session;
import org.hibernate.Transaction;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.entities.Note;
import com.helper.factoryProvider;




public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveNoteServlet() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			//fetching data from requesst
			String title= request.getParameter("title");
			String content=request.getParameter("content");
			
			LocalDate date = LocalDate.now();			//if we directly pass LocalDate.now to constructor sometimes it gives error so created seperate object and passed it 
			
			Note note= new Note(title,content,date );
			
			//saving in hibernate
			Session session=  factoryProvider.getFactory().openSession();		//used created sessionfactory object in factoryProvider
			Transaction tx= session.beginTransaction();
			
			session.persist(note);
			
			tx.commit();
			session.close();
			response.setContentType("text/html");		//tells browser that we are sending a html snippet to show on browser
			PrintWriter write= response.getWriter();	//PrintWriter is used to write data on browser
			write.println("<h1 style='text-align:center;'>Note is added successfully</h1>");		//we send data to browser using response
			write.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View All Notes</a></h1>");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
