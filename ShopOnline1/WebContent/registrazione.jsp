<%@page import="it.overnet.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrazione</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js">
</script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js">
</script>
<script type="text/javascript" src="js/gestioneForm.js"></script>
<script type="text/javascript" src="js/occhiolino.js"></script>
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
    <form class="navbar-form navbar-left search" action="carrello.jsp" style="margin: 0px;">
      <button class=" bottone-carrello"><img src="img/carrello8.png"></button>
    </form> 
    
     <form class="navbar-form navbar-left search" action="search">
      <div class="form-group" >
        <input type="text" class="form-control" placeholder="Cerca" name="search">
      </div>
      <button type="submit" class="btn btn-default">Cerca</button>
    </form> 
    
  </div>
</nav>

<div class="page-header text-center">
<h1>Registrazione</h1>
</div>

<!-- form reg -->
<form action="registrazione" method="post" class="form-horizontal"
	onsubmit="return validazioneRegistrazione()">

<div class="form-group">
<label for="nome" class="control-label col-lg-4">Nome</label>
<div class="col-lg-5">
<input type="text" name="nome" id="nome" class="form-control">
</div>
<span class="col-lg-3"></span>
</div>

<div class="form-group">
<label for="cognome" class="control-label col-lg-4">Cognome</label>
<div class="col-lg-5">
<input type="text" name="cognome" id="cognome" class="form-control">
</div>
<span class="col-lg-3"></span>
</div>

<div class="form-group">
<label for="username" class="control-label col-lg-4">Username</label>
<div class="col-lg-5">
<input type="text" name="username" id="username" class="form-control">
</div>
<span class="col-lg-3"></span>
</div>

<div class="form-group">
<label for="password" class="control-label col-lg-4">Password</label>
<div class="col-lg-5">
<input type="password" name="password" id="password" class="form-control">
</div>
<div class="col-lg-1">
<button onclick="return cambia()" class="botton-occhiolino"><img src="img/eye.png" class="occhiolino"></button>
</div>
<span class="col-lg-2"></span>
</div>

<div class="form-group">
<label for="indirizzo" class="control-label col-lg-4">Indirizzo</label>
<div class="col-lg-5">
<input type="text" name="indirizzo" id="indirizzo" class="form-control">
</div>
<span class="col-lg-3"></span>
</div>

<div class="form-group">
<span class="col-lg-4"></span>
<div class="col-lg-5">
<input type="submit" value="Registrati" class="btn btn-success">
<input type="reset" value="Ripristina" class="btn btn-danger">
</div>
<span class="col-lg-3"></span>
</div>

</form>

<div class="alert alert-danger" id="alert" style="display:none">
<p class="text-center">Non hai rispettato i campi del Form</p>
</div>

<% if (request.getAttribute("inserito") != null) {%>
<div class="alert alert-success">
<p class="text-center">Registrazione avvenuta sul cesso</p>
</div>
<% } %>
 
</body>
</html>