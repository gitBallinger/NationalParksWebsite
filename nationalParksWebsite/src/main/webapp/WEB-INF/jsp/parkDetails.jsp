<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>National Park Weather Service</title>
  
 <c:url value="/css/parkDetails.css" var="cssHref"/>
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
   

	<div class="main-content">

		<div id="parkDetailsParent">
			<div id="parkDetailsParentBox1">
				<c:url value="/img/parks/${fn:toLowerCase(park.parkCode)}.jpg" var="parkSrc" />
				<img src="${parkSrc}" id="parkDetailsParkImage">
			</div>
			<div id="parkDetailsParentBox2">
				<h1 class="parkDetailsParkName">${park.parkName}</h1>
				<h3 id="parkDetailsInspirationalQuote">"${park.inspirationalQuote}"</h3>
				<h4 id="parkDetailsInspirationalQuoteSource">~${park.inspirationalQuoteSource}</h4>
			</div>
		</div>

		<h1 id="parkDetailsParkInformation">Park Information</h1>

		<div id="parkDetailsUnorderedListParent">

			<ul id="parkDetailsUnorderedListBox1">
				<li><span class="bold">State:</span> ${park.state}</li>
				<li><span class="bold">Acreage:</span> <fmt:formatNumber pattern="#,##0" value="${park.acreage}" /></li>
			</ul>

			<ul id="parkDetailsUnorderedListBox2">
				<li><span class="bold">Elevation In Feet: </span><fmt:formatNumber pattern="#,##0" value="${park.elevationInFeet}" /></li>
				<li><span class="bold">Miles of Trail: <fmt:formatNumber type="number"  minFractionDigits="0" value="${park.milesOfTrail}" /></span></li>
			</ul>
			<ul id="parkDetailsUnorderedListBox3">
				<li><span class="bold">Number of Campsites:</span>
					${park.numberOfCampsites}</li>
				<li><span class="bold">Climate:</span> ${park.climate}</li>
			</ul>
			<ul id="parkDetailsUnorderedListBox4">
				<li><span class="bold">Year Founded:</span> ${park.yearFounded}</li>
				<li><span class="bold">Annual Visitor Count: </span><fmt:formatNumber pattern="#,##0" value="${park.annualVisitorCount}" /></li>
			</ul>
			<ul id="parkDetailsUnorderedListBox5">
				<li><span class="bold">Entry Fee: $</span> ${park.entryFee}</li>
				<li><span class="bold">Number of Species:</span>
					${park.numberOfAnimalSpecies}</li>
			</ul>

		</div>

		<p id="parkDetailsparkDescription">${park.parkDescription}</p>

		</div>
		
		<div class="main-content">

		<div id="parkWeatherParent">

			<div id="parkWeatherBox">
			
				<h1 id="parkWeatherBoxWeatherReport">5-Day Weather Forecast</h1>
				<div id="parkWeatherButtonBox">
					<form action="parkDetails">
						<button type="submit" class="btn btn-light fixMe btn-lg" value="fahrenheit" name="temperature">Fahrenheit</button>
						<input type="hidden" name="parkCode" value="${park.parkCode}">
					</form>
					<form action="parkDetails">
						<button type="submit" class="btn btn-light fixMe btn-lg" value="celsius" name="temperature">Celsius</button>
						<input type="hidden" name="parkCode" value="${park.parkCode}">
					</form>
				</div>
			</div>
			
			<div id="parkWeatherBox2">
			
				<c:forEach items="${weather}" var="weather"><c:url
						value="/img/weather/${fn:toLowerCase(fn:replace(weather.forecast,' ', ''))}.gif" var="weatherSrc" />

					<div class="parkWeatherChild">

						<img src="${weatherSrc}" class="weatherImg">
						<p class="parkWeatherHighAndLow bold">
						
						<c:if test= "${temperature == 'fahrenheit'}">
							<span class="high">High: ${weather.highInF}</span> / <span
								class="low">Low: ${weather.lowInF}</span>
						</c:if>
						
						<c:if test= "${temperature == 'celsius'}">
							<span class="high">High: ${weather.highInC}</span> / <span
								class="low">Low: ${weather.lowInC}</span>
						</c:if>
						</p>
						
						
						<div class="weatherWarnings">
							<ul>
								<c:choose>

									<c:when test="${weather.forecast == 'snow'}">
										<li>- Pack snowshoes.</li>
									</c:when>

									<c:when test="${weather.forecast == 'rain'}">
										<li>- Pack rain gear</li>
										<li>- Wear waterproof shoes</li>
									</c:when>

									<c:when test="${weather.forecast == 'thunderstorms'}">
										<li>- Seek shelter</li>
										<li>- Avoid hiking on exposed ridges</li>
									</c:when>

									<c:when test="${weather.forecast == 'sunny'}">
										<li>- Wear sunblock</li>
									</c:when>

									<c:otherwise>

									</c:otherwise>

								</c:choose>

								<c:if test="${weather.highInF > 75}">
									<li>- Pack extra water</li>
								</c:if>

								<c:if test="${weather.highInF - weather.lowInF > 20}">
									<li>- Wear breathable layers</li>
								</c:if>

								<c:if test="${weather.lowInF < 20}">
									<li>- Wear extra layers </li>
									<li>- Avoid exposed skin</li>
								</c:if>

							</ul>

						</div>

					</div>

				</c:forEach>

			</div>
		</div>

	</div>


</body>
</html>