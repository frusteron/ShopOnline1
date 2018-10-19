<%@page import="it.overnet.model.Prodotto" %>
<%@page import="java.util.List"%>
<%@page import="it.overnet.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LISTA ORDINI</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/stile.css">
</head>
<body>

<% Utente utente = (Utente) session.getAttribute ("utenteLoggato");  %>
<% List<Prodotto> listaOrdini = (List<Prodotto>)
request.getAttribute("listaOrdini");%>


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
        
        <!-- chiusura navbar -->
<!-- intestazione -->

<div class="page-header text-center"> <!-- page-header o jumbotron -->
<h1>LISTA ORDINI</h1>
</div>

<div class="container">
<table class="table table-hover">
<thead>
<th>Nome</th>
<th>Categoria</th>
<th>Marca</th>
<th>Prezzo</th>
<th>Immagine</th>
</thead>
<tbody>
<% for (Prodotto prodotto : listaOrdini) { %>
<tr>
<td><%=prodotto.getNome() %> </td>
<td><%=prodotto.getCategoria() %> </td>
<td><%=prodotto.getMarca() %> </td>
<td><%=prodotto.getPrezzo() %> </td>
<td>
<div class="zoom">
<img src="<%=prodotto.getImmagine() %>"></div> </td>
<td>
<%}%>
</tbody>
</table>
</div>


</body>
</html>