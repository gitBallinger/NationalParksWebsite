<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>National Park Weather Service</title>
  
 <c:url value="/css/nationalpark.css" var="cssHref"/>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="${cssHref}">
</head>

<body>
    <header>
    		<c:url value="/" var="homePageHref"/>
    		<c:url value="/img/logo.png" var="logoSrc"/>
        <a href="${homePageHref}">
        		<img src="${logoSrc}" alt="National Park Geek Logo" />
        </a>
    </header>
    <nav>
        <ul>
	        <li><a href="<c:url value="/"/>">Home</a></li>
	        <li><a href="<c:url value="/survey"/>">Daily Survey</a></li>
	        <li><a href="<c:url value="/surveyResults"/>">Survey Results</a></li>
        </ul>
    </nav>