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
  
 <c:url value="/css/home.css" var="cssHref"/>
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
   

<div id="main-content">

	<div class="parkItemParent">
	<c:forEach items="${parks}" var="park">
	
		<div class="parkItem">
	
			<div class="parkItemBox1">
			<c:url value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg" var="parkSrc"/>
	
			
			<a href='./parkDetails?parkCode=${park.parkCode}'><img src="${parkSrc}" class="parkItemImg"></a>
			</div>
			<div class="parkItemBox2">
			<h3 class="parkItemParkName"><a href="./parkDetails?parkCode=${park.parkCode}">${park.parkName}</a></h3>
			<p class="parkDescription">${park.parkDescription}</p>
			</div>
		</div>
	
	</c:forEach>

	</div>

</div>


</body>
</html>