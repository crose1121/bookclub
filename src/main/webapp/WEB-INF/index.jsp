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
<meta charset="UTF-8">
<title>Book Club</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">

</head>
<div class="container">
        <h1 class="text-secondary">Welcome to the Book Club, Friend.</h1>
        <hr />
        <div class="row">
            <div class="col">
                <h3 class="text-secondary">Register</h3>
                <form:form action="/register" method="post" modelAttribute="newUser">
                    <div>
                        <form:label path="username">User Name</form:label>
                        <form:errors path="username" class="text-danger"/>
                        <form:input path="username" type="text" class= "form-control text-light bg-secondary"/>
                    </div>
                    <div>
                        <form:label path="email">Email</form:label>
                        <form:errors path="email" class="text-danger"/>
                        <form:input path="email" type="email" class= "form-control text-light bg-secondary"/>
                    </div>
                    <div>
                        <form:label path="password">Password</form:label>
                        <form:errors path="password" class="text-danger"/>
                        <form:input path="password" type="password" class= "form-control text-light bg-secondary"/>
                    </div>
                    <div>
                        <form:label path="confirm">Confirm Password</form:label>
                        <form:errors path="confirm" class="text-danger"/>
                        <form:input path="confirm" type="password" class= "form-control text-light bg-secondary"/>
                    </div>
                    
                    <input type="submit" value="Register" class= "btn btn-info mt-3"/>
                </form:form>   
            </div>
            <div class="col">
                <h3 class="text-secondary">Login:</h3>
                <form:form action="/login" method="post" modelAttribute="newLogin">

                    <div>
                        <form:label path="email">Email</form:label>
                        <form:errors path="email" class="text-danger"/>
                        <form:input path="email" type="email" class= "form-control text-light bg-secondary"/>
                    </div>
                    <div>
                        <form:label path="password">Password</form:label>
                        <form:errors path="password" class="text-danger"/>
                        <form:input path="password" type="password" class= "form-control text-light bg-secondary"/>
                    </div>
                    
                    <input type="submit" value="Login" class= "btn btn-info mt-3"/>
                </form:form>   
            </div>
        </div>
    </div>
</body>
</html>