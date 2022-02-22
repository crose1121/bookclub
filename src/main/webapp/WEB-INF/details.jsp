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
<link rel="stylesheet" href="/css/style.css" />
<title>Book Details</title>
</head>
<body>
	<div class="container">
		<h1 class="text-secondary">${book.title}</h1>
		<c:if test="${book.user.id==loggedInUser.id}">
   			<h5><span style="color:blue">${book.user.username}</span> read <span style="color:purple">${book.title}</span> by <span style="color:yellowgreen">${book.authorName}.</span> Here are your thoughts on the book:</h5>
   		<hr />
   		<p class="textarea">${book.description}</p>
   		<hr />
   		</c:if>
   		<c:if test="${book.user.id!=loggedInUser.id}">
   			<h5>Author: <span style="color:blue">${book.title}</span></h5>
   			<h5>Posted by: <span style="color:purple">${book.user.username}</span></h5>
   			<h5>Below is <span style="color:red">${book.user.username}'s </span>description:</h5>
   		<hr />
   		<p class="textarea">${book.description}</p>
   		<hr />
   		</c:if>
			<a href="/books">Return to shelves</a>
			
			<c:if test="${book.user.id==loggedInUser.id}">
   			|| <a href="/books/${book.id}/edit">Edit This Entry</a>
   		</c:if>
	</div>
</body>
</html>