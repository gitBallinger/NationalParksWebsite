<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>National Park Weather Service</title>
  
 <c:url value="/css/survey.css" var="cssHref"/>
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
        
        
        <nav>
        	<a id="picture" href="${homePageHref}"><img id="logoPic" src="${logoSrc}" alt="National Park Geek Logo" /></a>
        <ul class="nav">
          <li> <button type="button" class="btn btn-light fixMe btn-lg"><a id="postMessage" href="${home}">HOME</a></button></li>
           <li><button type="button" class="btn btn-light fixMe btn-lg"><a id="postMessage" href="${survey}">Daily Survey</a></button></li>
          <li> <button type="button" class="btn btn-light fixMe btn-lg lastButton"><a id="postMessage" href="${surveyResults}">Survey Results</a></button></li>
	     </ul>   
	        
	     
    </nav>
    </header>


<c:url var="surveyUrl" value ="/survey" />

<style>
	.error {
		color:red;
	}
</style>
<body>
<div id="main-content">
<h1>Survey Page</h1>


<form:form id="form" action="${surveyUrl}" method="POST" modelAttribute="survey">

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1">Email Address</span>
  </div>
  <form:input path="emailAddress" class="form-control" aria-describedby="basic-addon1" />
  <form:errors path="emailAddress" class="error"/>
</div>

	<div class="input-group mb-3">
  		<div class="input-group-prepend">
   			<span class="input-group-text" for="inputGroupSelect01">Park</span>
  		</div>
  		<form:select path="parkCode" class="custom-select" id="inputGroupSelect01" name="parkCode">
  		
  		<c:forEach items="${parks}" var="park">
  			
  			<option value="${park.parkCode}">${park.parkName}</option>

		</c:forEach>

    	</form:select>
  		<form:errors path="parkCode" class="error" />
	</div>

	<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" for="inputGroupSelect01">State</span>
  </div>
  <form:select path="state" class="custom-select" id="inputGroupSelect01" name="state">
   	<option value="AL">Alabama</option>
	<option value="AK">Alaska</option>
	<option value="AZ">Arizona</option>
	<option value="AR">Arkansas</option>
	<option value="CA">California</option>
	<option value="CO">Colorado</option>
	<option value="CT">Connecticut</option>
	<option value="DE">Delaware</option>
	<option value="DC">District Of Columbia</option>
	<option value="FL">Florida</option>
	<option value="GA">Georgia</option>
	<option value="HI">Hawaii</option>
	<option value="ID">Idaho</option>
	<option value="IL">Illinois</option>
	<option value="IN">Indiana</option>
	<option value="IA">Iowa</option>
	<option value="KS">Kansas</option>
	<option value="KY">Kentucky</option>
	<option value="LA">Louisiana</option>
	<option value="ME">Maine</option>
	<option value="MD">Maryland</option>
	<option value="MA">Massachusetts</option>
	<option value="MI">Michigan</option>
	<option value="MN">Minnesota</option>
	<option value="MS">Mississippi</option>
	<option value="MO">Missouri</option>
	<option value="MT">Montana</option>
	<option value="NE">Nebraska</option>
	<option value="NV">Nevada</option>
	<option value="NH">New Hampshire</option>
	<option value="NJ">New Jersey</option>
	<option value="NM">New Mexico</option>
	<option value="NY">New York</option>
	<option value="NC">North Carolina</option>
	<option value="ND">North Dakota</option>
	<option value="OH">Ohio</option>
	<option value="OK">Oklahoma</option>
	<option value="OR">Oregon</option>
	<option value="PA">Pennsylvania</option>
	<option value="RI">Rhode Island</option>
	<option value="SC">South Carolina</option>
	<option value="SD">South Dakota</option>
	<option value="TN">Tennessee</option>
	<option value="TX">Texas</option>
	<option value="UT">Utah</option>
	<option value="VT">Vermont</option>
	<option value="VA">Virginia</option>
	<option value="WA">Washington</option>
	<option value="WV">West Virginia</option>
	<option value="WI">Wisconsin</option>
	<option value="WY">Wyoming</option>
	<option value="AS">American Samoa</option>
	<option value="GU">Guam</option>
	<option value="MP">Northern Mariana Islands</option>
	<option value="PR">Puerto Rico</option>
	<option value="UM">United States Minor Outlying Islands</option>
	<option value="VI">Virgin Islands</option>
  </form:select>
  <form:errors path="state" class="error" />
</div>

	<div class="input-group mb-3">
  		<div class="input-group-prepend">
   			<span class="input-group-text" for="inputGroupSelect01">Physical Activity Level</span>
  		</div>
  		<form:select path="activityLevel" class="custom-select" id="inputGroupSelect01" name="state">
  			<option value="Inactive">Inactive</option>
			<option value="Sedentary">Sedentary</option>
			<option value="Active">Active</option>
			<option value="Extremely Active">Extremely Active</option>
    	</form:select>
  		<form:errors path="state" class="error" />
	</div>
	<button class="btn btn-success btn-lg" type="submit" value="submit">Submit Survey</button>
</form:form>
</div>

</body>
</html>