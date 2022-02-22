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
<title>Dashboard</title>
</head>
<body>
	<div class="container">	
		<h1 class="text-secondary m-3">Welcome ${loggedInUser.username}</h1>
		<hr />
		<p class="text-secondary m-3">Here are the books from everyone's shelves.</p>
			<div>
				<table class="table table-secondary container">
					<thead>
						<tr>
							<th>Title</th>
							<th>Author</th>
							<th>Posted By</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="book" items="${allBooks}">
							<tr>
								<td ><a href="/books/${book.id}">${book.title}</a></td>
								<td>${book.authorName}</td>
								<td>${book.user.username}</td>
							<!-- <td>${dojo.ninjas.size()}</td> --> 
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		<a href="/logout" class="m-3">Logout</a>
		<a href="/books/new">Add a book to your shelf</a>
	</div>
</body>
</html>