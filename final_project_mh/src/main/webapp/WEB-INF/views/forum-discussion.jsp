<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link href="/style.css" rel="stylesheet" />

<meta charset="ISO-8859-1">
<title>${discussion}</title>
</head>
<body>

<!-- Header -->
<section class="header">
<%@ include file="partials/header.jsp" %>
</section>

<!-- MainBody -->
<main class="container">

<div id="forum-discussion">

	<a href="/forum">Back to Main Forum</a>
	
	<article class="card" id="threads" style="width: 50rem;">
		
		<section class="card-header">
			<h1>${discussion.topic}</h1>
			
		</section>
		<section class="card-body">
		
			<!-- If logged in, let them create new thread -->
			<c:if test="${loggedin}">
				<a href="/thread/add?id=${discussion.id}">Create a New Thread</a>
			</c:if>
		
			<table  id="table2" class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col">Topic</th>
			      <th scope="col">Replies</th>
			      <th scope="col">Author</th>
			      <th scope="col">Latest Post</th>
			    </tr>
			  </thead>
			  
			  <tbody>
			  
			  	<!-- For Each loop here, connect to thread database -->
			  	<c:forEach var= "thread" items="${threads }">
			  	<c:if test="${thread.discussionId == discussion.id }">
			    <tr>
			      <td>
			      	<a href="/thread?id=${thread.id}"><c:out value="${thread.threadTitle }"></c:out></a>
			      </td>
			      <td>*number of posts*</td>
			      <td><c:out value="${thread.username }" /></td>
			      <c:forEach end= "1" var = "post" items="${ posts}">
			      <c:if test="${post.threadId == thread.id }">
			      <td>
			      	*<a href=""></a>*add post title*<br>
			      	 <sup><a href=""><c:out value="${post.username }" /></a>${post.datetime}</sup>
			      </td>
			      </c:if>
			      </c:forEach>
			    </tr>
			    </c:if>
			    </c:forEach>
			    
			    <!-- for the sake of an example, take this out later -->
			    
			  </tbody>
			</table>
		
			
		</section>
	</article>
</div>



</main>

</body>
</html>