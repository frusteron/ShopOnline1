<%@page import="java.util.HashSet"%>
<%@page import="it.overnet.model.Utente"%>
<%@page import="it.overnet.model.Prodotto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acquista</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/stile.css">
</head>
<body background="img/grey.jpg">
<%int idProdotto = (int)Integer.parseInt(request.getParameter("idProdotto"));%>
<% Utente utente = (Utente) session.getAttribute ("utenteLoggato");  %>
<% HashSet<Prodotto> carrello = (HashSet<Prodotto>)session.getAttribute("carrello"); %>

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

 </div>
</nav>


<div class="page-header text-center">
<h2>SELEZIONA IL TIPO DI SPEDIZIONE</h2>
</div>
<form action="acquista" method="get" class="form-horizontal">
<input type="hidden" name="idProdotto" value="<%= idProdotto%>">
<div class="form-group">
<span class="col-lg-4"></span>
<div class="col-lg-5">
<input  type="radio" name="tipoSpedizione" value="PREMIUM" checked >Premium
<br>
<input type="radio" name="tipoSpedizione" value="ORDINARIA">Ordinaria
<br>
<input type="radio" name="tipoSpedizione" value="LUNGO_TERMINE">Lungo Termine
<br>
</div>
<span class="col-lg-3"></span>
</div>

<div class="form-group">
<label class="control-label col-lg-4"></label>
<div class="col-lg-5">
<input class="form-control" type="number" name ="quantitaAcquistata" placeholder="Inserisci Quantita" min="1" max ="10" style="width: 150px">
</div>
<span class="col-lg-3"></span>
</div>

<div class="form-group">
<span class="col-lg-4"></span>
<div class="col-lg-5">
<input  style="border-radius: 20px " type="submit" value="Invia" class="btn btn-success" >
<input  style="border-radius: 20px " type="reset" value="Reset" class="btn btn-danger">
</div>
<span class="col-lg-3"></span>
</div>
</form>






</body>
</html>
