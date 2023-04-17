<%@page import="in.co.online.crime.Ctl.OCRView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<%@include file="Header.jsp"%>

<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%=OCRView.APP_CONTEXT%>/images/010.jpg" class="d-block w-100" alt="..."  width="500" 
     height="700">
    </div>
    <div class="carousel-item">
      <img src="<%=OCRView.APP_CONTEXT%>/images/david-von-diemar-jM6Y2nhsAtk-unsplash.jpg" class="d-block w-100" alt="..."  width="500" 
     height="700">
    </div>
    <div class="carousel-item">
      <img src="<%=OCRView.APP_CONTEXT%>/images/hedi-benyounes-G_gOhJeCpMg-unsplash.jpg" class="d-block w-100" alt="..."  width="500" 
     height="700">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<%@include file="Footer.jsp"%>

</body>
</html>