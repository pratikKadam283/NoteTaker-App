<%@page import="com.entities.Note"%>
<%@page import="com.helper.factoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Note</title>
<%@include file="all_js_css.jsp" %>
<style>
    body {
        background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .card {
        border-radius: 20px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        background: #fff;
        padding: 30px;
        width: 600px;
    }
    .form-control {
        border-radius: 12px;
        padding: 12px;
        font-size: 16px;
    }
    .btn-save {
        background: linear-gradient(135deg, #43e97b, #38f9d7);
        border: none;
        color: #fff;
        font-weight: bold;
        padding: 12px 25px;
        border-radius: 30px;
        transition: all 0.3s ease;
    }
    .btn-save:hover {
        transform: scale(1.05);
        box-shadow: 0px 6px 15px rgba(0,0,0,0.2);
    }
    h1 {
        font-weight: bold;
        color: #333;
        text-align: center;
        margin-bottom: 25px;
    }
</style>
</head>
<body>
    <%
        int id=Integer.parseInt(request.getParameter("note_id").trim());
        Session session2= factoryProvider.getFactory().openSession();
        Note note=(Note)session2.get(Note.class, id);
    %>
    
    <div class="card">
        <h1>Edit Your Note ✏️</h1>
        <form action="updateServlet" method="post">
            <input name="noteId" value="<%=note.getId() %>" type="hidden" />
            
            <div class="form-group mb-4">
                <label for="title" class="fw-bold">Title</label>
                <input name="title" required type="text" class="form-control"
                    id="title" value="<%= note.getTitle()%>"/>
            </div>

            <div class="form-group mb-4">
                <label for="content" class="fw-bold">Content</label>
                <textarea name="content" required id="content" placeholder="Enter your thoughts..."
                    class="form-control" style="height: 200px;"><%= note.getContent() %></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn-save">💾 Save Note</button>
            </div>
        </form>
    </div>
</body>
