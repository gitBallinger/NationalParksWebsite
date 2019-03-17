<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>National Park Weather Service</title>
  
 <c:url value="/css/surveyResults.css" var="cssHref"/>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 <link href="https://fonts.googleapis.com/css?family=Bangers" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:300" rel="stylesheet">
    <link rel="stylesheet" href="${cssHref}">
</head>

    <header>
    		<c:url value="/" var="homePageHref"/>
    		<c:url value="/img/NPG1.png" var="logoSrc"/>
    		<c:url value="/" var="home"/>
	        <c:url value="/survey" var="survey"/>
	        <c:url value="/surveyResults" var="surveyResults"/>
        
        
        <nav id="nav">
        	<a id="picture" href="${homePageHref}"><img id="logoPic" src="${logoSrc}" alt="National Park Geek Logo" /></a>
	        <ul class="nav">
	           <li> <button type="button" class="btn btn-light fixMe btn-lg"><a id="postMessage" href="${home}">HOME</a></button></li>
	           <li><button type="button" class="btn btn-light fixMe btn-lg"><a id="postMessage" href="${survey}">Daily Survey</a></button></li>
	           <li> <button type="button" class="btn btn-light fixMe btn-lg lastButton"><a id="postMessage" href="${surveyResults}">Survey Results</a></button></li>
		     </ul>   
    	</nav>
    </header>
   

<h1 class="surveyConfirmation">${confirmation}</h1>

<div id="main-content">
	
	<c:forEach items="${map}" var="entry">
	    Key = ${entry.key}, value = ${entry.value}<br>
	</c:forEach>
	
	<c:forEach items="${parkMap}" var="surveyPark">
		
		<div class="surveyResultsParkItem">
		
			<c:url value="/img/parks/${fn:toLowerCase(surveyPark.key)}.jpg" var="parkSrc"/>
		
			<div class="surveyResultsBox1">
			
			<img src="${parkSrc}">
			
			</div>
			
			<div class="surveyResultsBox2">
			
			<c:forEach items="${parks}" var="park">
				<c:if test="${park.parkCode == surveyPark.key}">
					<h1>${park.parkName}</h1>
				</c:if>
			</c:forEach>
			<c:choose>
				
			<c:when test="${surveyPark.value < 2}">
				<h3>${surveyPark.value} survey</h3>
			</c:when>
			<c:otherwise>
				<h3>${surveyPark.value} surveys</h3>
			</c:otherwise>
			
			</c:choose>
			
			</div>
					
		</div>
		
	</c:forEach>
		
</div>

</body>
</html>