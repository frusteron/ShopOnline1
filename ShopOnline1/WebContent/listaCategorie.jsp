<%@page import="it.overnet.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="it.overnet.model.Utente"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista Film</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js">
</script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js">
</script>
<link rel="stylesheet" href="css/stile.css">
</head>
<body>

<% Utente utente =
(Utente) session.getAttribute("utenteLoggato"); %>
<% List<Prodotto> listaCategorie = (List<Prodotto>)
request.getAttribute("listaCategoria"); %>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/ShopOnline1">ShopOnline1</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/ShopOnline1">Home</a></li>
      <% if (utente == null) { %>
      <li><a href="registrazione.jsp">Registrazione</a></li>
      <li><a href="login.jsp">Login</a></li>
      <% } else { %>
      <li><a href="logout">Logout</a></li>
      <li><a href="listaProdotti">Lista Prodotti</a></li>
      <% } %>
      
   
      
      
      <!-- menu a tendina -->
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="">
      
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="listaCategorie?categorie=SCARPE">SCARPE</a></li>
          <li><a href="listaCategorie?categorie=PANTALONI">PANTALONI</a></li>
          <li><a href="listaCategorie?categorie=MAGLIERIA">MAGLIERIA</a></li>
          <li><a href="listaCategorie?categorie=ACCESSORI">ACCESSORI</a></li>
        </ul>
      </li> <!-- chiusura dropdown -->
    </ul>
  </div>
</nav>
<!-- chiusura navbar -->
<!-- intestazione -->
<div class="jumbotron text-center">
	<h1>Lista Categorie</h1>
</div>

<!-- chiusura intestazione -->
<div class="container">
<table class="table table-hover">
<thead>

<th>Quantita 
<a href="ordina?sort=quantita">
<span class="glyphicon glyphicon-sort-by-order">
</span></a></th>
<th>Acquista</th>
</thead>
<tbody>
<% for (Prodotto prodotto : listaCategorie) { %>
<tr>

<td>
<form action="acquista" method="get">
<input type="hidden" name="idProdotto" value="<%= prodotto.getId()%>">
<input type="submit" value="Acquista" 
<% if (utente == null || prodotto.getQuantitaDisponibile() < 1) { %>
class="btn btn-primary disabled" onclick="return false"
<% } else { %>
class="btn btn-primary"
<% } %>
<% if (utente == null) { %>
data-toggle="popover" title="Effettua <br>la <br>Login"
<% } %>
<% if (prodotto.getQuantitaDisponibile() < 1 && utente != null) { %>
data-toggle="popover" title="Attualmente non disponibile"
<% } %>
>
</form>
</td>
</tr>
<% } %>
</tbody>
</table>
</div>
<script type="text/javascript" src="js/popover.js"></script>



</body>
</html>