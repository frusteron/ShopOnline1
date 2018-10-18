<%@page import="it.overnet.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js">
</script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js">
</script>
<link rel="stylesheet" href="css/stile.css">
</head>
<body>
<% Utente utente = (Utente) session.getAttribute("utenteLoggato"); %>



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/ShopOnline1">Shop</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/ShopOnline1">Home</a></li>
      <% if (utente == null) { %>
      <li><a href="registrazione.jsp">Registrazione</a></li>
      <li><a href="login.jsp">Login</a></li>
      <% } else { %>
      <li><a href="logout">Logout</a></li>
     <li><a href="listaAcquisti">Lista Acquisti</a></li>
          <li><a href="listaOrdini">Lista Ordini</a></li>
     
      <% } %>
      <li><a href="listaProdotti">Lista Prodotti</a>
            <li><a href="listaOfferta">Lista Offerta</a>
            
      
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="">
        Categorie
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="listaCategoria?categoria=SCARPE">SCARPE</a></li>
          <li><a href="listaCategoria?categoria=PANTALONI">PANTALONI</a></li>
          <li><a href="listaCategoria?categoria=MAGLIERIA">MAGLIERIA</a></li>
          <li><a href="listaCategoria?categoria=ACCESSORI">ACCESSORI</a></li>
        </ul>
      </li>
    </ul>
    
     <form class="navbar-form navbar-left search" action="">
      <div class="form-group" >
        <input type="text" class="form-control" placeholder="Inserisci Testo" name="search">
      </div>
      <button type="submit" class="btn btn-default">Cerca</button>
    </form> 
  </div>
  
</nav>


<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3000">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="img/adidas.jpg" class="img-carousel" >
    </div>

    <div class="item">
      <img src="img/diesel.jpg" class="img-carousel">
    </div>

    <div class="item">
      <img src="img/diesel2.jpg" class="img-carousel">
    </div>
    
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
</div>




</body>
</html>