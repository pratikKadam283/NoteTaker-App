<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>
<style>
    body {
        background: #f8f9fa;
    }
    .card {
        border-radius: 15px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .card h2 {
        font-weight: bold;
        color: #007bff;
    }
    textarea {
        resize: none;
    }
</style>
</head>
<body>

    <div class="container-fluid p-0 m-0">
        <%@include file="NavBar.jsp"%>
    </div>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card p-4">
                    <div class="text-center mb-4">
                        <img src="image/notes.png" alt="Notes" style="max-width:80px;">
                        <h2 class="mt-3">Create a New Note</h2>
                        <p class="text-muted">Write down your thoughts, ideas, or important reminders.</p>
                    </div>

                    <!-- Add Note Form -->
                    <form action="SaveNoteServlet" method="post">
                        <div class="form-group mb-3">
                            <label for="title" class="fw-bold">Title</label>
                            <input name="title" required type="text"
                                class="form-control" id="title"
                                placeholder="Enter title for your note">
                        </div>

                        <div class="form-group mb-4">
                            <label for="content" class="fw-bold">Content</label>
                            <textarea name="content" required id="content"
                                class="form-control" placeholder="Write your note here..."
                                style="height: 200px;"></textarea>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary px-4 py-2">➕ Add Note</button>
                            <button type="reset" class="btn btn-outline-secondary px-4 py-2">Reset</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
