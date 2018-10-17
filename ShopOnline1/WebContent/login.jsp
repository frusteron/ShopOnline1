<%@page import ="it.overnet.model.Utente" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js">
</script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/gestioneForm.js"></script>
</head>
<body>

<% Utente utente = (Utente) session.getAttribute ("utenteLoggato"); %>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/Shop">Shop</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/Shop">Home</a></li>
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
        Generi
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
       <li><a href="listaCategoria?categoria=SCARPE">SCARPE</a></li>
          <li><a href="listaCategoria?categoria=PANTALONI">PANTALONI</a></li>
          <li><a href="listaCategoria?categoria=MAGLIERIA">MAGLIERIA</a></li>
          <li><a href="listaCategoria?categoria=ACCESSORI">ACCESSORI</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>
  
  
  <!-- chiusura navbar -->
<!-- intestazione -->
<div class="page-header text-center"> <!-- page-header o jumbotron -->
<h1>Login</h1>
</div>

<!--  form registrazione -->
<form action="login" method="post" class="form-horizontal" onsubmit="return validazioneLogin()">
<div class="form-group">
</div>


<!-- BARRE USENAME E PASSWORD -->
<div class="form-group">
<label for="username" class="control-label col-lg-4">Inserisci Username</label>
<div class="col-lg-5">
<input type="text" name="username" id="username" class="form-control">
</div>
<span class="col-lg-3"></span>
</div>

<div class="form-group">
<label for="password" class="control-label col-lg-4">Inserisci Password</label>
<div class="col-lg-5">
<input type="password" name="password" id="password" class="form-control">
</div>
<span class="col-lg-3"></span>
</div>


<!-- BOTTONI -->
<div class="form-group">
<span class="col-lg-4"></span>
<div class="col-lg-5">
<input type="submit" value="Login " class="btn btn-success">
<input type="reset" value="Ripristina" class="btn btn-danger">
</div>
<span class="col-lg-3"></span>
</div>
</form>


<div class="alert alert-danger" id="alert" style="display: none" >
<p class="text-center">NON HAI RISPETTATO I CAMPI DEL FORM</p>
</div>
<%if (request.getAttribute("login") != null) {%>
<% boolean controllo = (boolean) request.getAttribute("login");%>

<!--  LOGIN GIUSTO E LOGIN ERRATO -->
<% if ((boolean)request.getAttribute("login")) { %>
<div class="alert alert-success" >
<p class="text-center">Login avvenuta con successo</p>
</div>
<%}else if (!(boolean)request.getAttribute("login")) {%>
<div class="alert alert-danger">
<p class="text-center">Username o Password sbagliati </p> 
</div>

<% } %>
<% } %>







</body>
</html>