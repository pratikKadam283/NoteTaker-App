<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  
    <title>Note Taker : Home Page</title>
    
    <%@include file="all_js_css.jsp" %>
    
  </head>
  <body>
    <div class="container-fluid p-0 m-0">
    	<%@include file="NavBar.jsp" %>
    	<br>
    	<div class="card py-5">
    	<img class="img-fluid  mx-auto" style="max-width:300px;" src="image/notes.png" alt="Card image cap">
    	<h1 class="text-primary text-uppercase text-center mt-3">Start with your notes</h1>
    	<div class="container text-center" >
    	<button class="btn btn-outline-primary text-center" onclick="window.location.href='addNotes.jsp'">Start here</button> <%-- we created a button on home page to go on addNotes --%>
    	</div>
    	
    	
    	</div>
    </div>

     </body>
</html>