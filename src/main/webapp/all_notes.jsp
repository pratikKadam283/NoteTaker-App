<%@page import="java.io.PrintWriter"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.factoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@ page import="org.hibernate.query.Query"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Personal Notes</title>
<%@include file="all_js_css.jsp"%>
<style>
    .note-card {
        transition: all 0.3s ease;
        border-radius: 15px;
    }
    .note-card:hover {
        transform: translateY(-5px);
        box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
    }
    .note-img {
        max-width: 60px;
        margin-top: 15px;
    }
    .note-date {
        font-size: 0.9rem;
        background: #e3f2fd;
        padding: 5px 10px;
        border-radius: 20px;
        color: #0d47a1;
    }
</style>
</head>
<body>
    <div class="container-fluid p-0 m-0">
        <%@include file="NavBar.jsp"%>
    </div>
    
    <div class="container my-4">
        <h2 class="text-center mb-4">📝 Your Notes</h2>
        
        <div class="row">
            <%
                Session s = factoryProvider.getFactory().openSession();
                Query<Note> q = s.createQuery("from Note", Note.class);
                List<Note> list = q.getResultList();
                
                for(Note no: list){
            %>
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm note-card h-100">
                    <img class="card-img-top mx-auto note-img" src="image/notes.png" alt="Note">
                    <div class="card-body">
                        <h5 class="card-title text-primary"><%=no.getTitle() %></h5>
                        <p class="note-date">📅 <%=no.getAddedDate() %></p>
                        <p class="card-text mt-2">
                            <%=no.getContent().length() > 120 ? no.getContent().substring(0,120) + "..." : no.getContent() %>
                        </p>
                    </div>
                    <div class="card-footer text-center bg-white border-0">
                        <a href="edit.jsp?note_id=<%=no.getId() %>" class="btn btn-sm btn-outline-primary mx-2">✏️ Edit</a>
                        <a href="deleteServlet?note_id=<%=no.getId() %>" class="btn btn-sm btn-outline-danger mx-2">🗑 Delete</a>
                    </div>
                </div>
            </div>
            <%
                }
                s.close();
            %>
        </div>
    </div>
</body>
</html>
