<%@page import="java.util.List"%>
<%@ page import="it.overnet.model.Prodotto"%>
<%@page import="it.overnet.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista Offerta</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/stile.css">
<script type="text/javascript" src="js/popover.js"></script>
</head>
<body>
<% Utente utente = (Utente) session.getAttribute ("utenteLoggato");  %>
<% List<Prodotto> listaOfferta =  (List<Prodotto>) request.getAttribute("listaOfferta");%>
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
        </div>
        </nav>
        
        <!-- chiusura navbar -->
<!-- intestazione -->
<div class="page-header text-center"> <!-- page-header o jumbotron -->
<h1>LISTA PRODOTTI</h1>
</div>

<!-- base pagina -->
<div class="container">
<table class="table table-hover">
<thead>
<th>Nome</th>
<th>Marca 
<a href="ordina?sort=regista">
<span class="glyphicon glyphicon-sort-by-alphabet">
</span></a></th>
<th>Prezzo <a href="ordina?sort=quantita">
<span class="glyphicon glyphicon-sort-by-order">
</span></a></th>
<th>Quantita Disponibile <a href="ordina?sort=quantita">
<span class="glyphicon glyphicon-sort-by-order">
</span></a>
</th>
<th>Immagine</th>
</thead>

<!-- lista prodotti effettiva -->
<tbody>
<% for (Prodotto prodotto : listaOfferta) { %>
<tr>
<td><%=prodotto.getNome() %> </td>
<td><%=prodotto.getMarca() %> </td>
<td><%=prodotto.getPrezzo() %> </td>
<td><%=prodotto.getQuantitaDisponibile() %> </td>
<td><img src="<%=prodotto.getImmagine() %>"> </td>
<td>
<form action="Acquista" method="get">
<input type="hidden" name="idProdotto" value="<%= prodotto.getId()%>">
<input type="submit" value="Acquista"
<% if (utente == null || prodotto.getQuantitaDisponibile() < 1){ %>
class="btn btn-warning disabled" onclick="return false"
<% } else { %>
class="btn btn-warning"
<% } %>
<% if (utente == null) { %>
data-toggle="popover" title="Fai<br>la</br>Login"
<% } %>
<% if (prodotto.getQuantitaDisponibile() < 1 && utente != null){%>
data-toggle="popover" title="Attualmente Non Disponibile"
<% } %>
>

<form action="Aggiungi al carrello" method="get">
<input type="hidden" name="idProdotto" value="<%= prodotto.getId()%>">
<input type="submit" value="Agiungi al carrello"
<% if (utente == null || prodotto.getQuantitaDisponibile() < 1){ %>
class="btn btn-warning disabled" onclick="return false"
<% } else { %>
class="btn btn-warning"
<% } %>
<% if (utente == null) { %>
data-toggle="popover" title="Fai<br>la</br>Login"
<% } %>
<% if (prodotto.getQuantitaDisponibile() < 1 && utente != null){%>
data-toggle="popover" title="Attualmente Non Disponibile"
<% } %>
>
</form>
</td>
</tr>
<%}%>

</tbody>
</table>
</div>
</body>
</html>