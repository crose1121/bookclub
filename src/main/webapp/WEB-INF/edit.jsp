<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">
<title>Edit Book</title>
</head>
<body>
	<div class="container">
		<h3 class="text-secondary">Edit your book here.</h3>
		
				<form:form action="/books/${book.id}/update" method="post" modelAttribute="book" style="width: 50%">
				<input type="hidden" name="_method" value="put">
			<div class="form-group">
				<p>
					<form:label path="title">Title</form:label>
					<br /><form:errors path="title" class="text-danger"/>
					<form:input path="title" class="form-control"/>
				</p>
				<p>	
					<form:label path="authorName">Author</form:label>
					<br /><form:errors path="authorName" class="text-danger"/>
					<form:input path="authorName" class="form-control"/>
				</p>
				<p>	
					<form:label path="description">Your Thoughts:</form:label>
					<br /><form:errors path="description" class="text-danger"/>
					<form:textarea path="description" id="" cols="75" rows="5"></form:textarea>
				</p>
				<hr />
				
				<input type="submit" value="Submit" class="btn btn-info"/>
				<a href="/books" class="m-3 btn btn-warning">Back to the shelves</a>
				
			</div>
		</form:form>
	</div>
</body>
</html>