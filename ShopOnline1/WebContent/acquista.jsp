<%@page import="it.overnet.model.Prodotto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acquista</title>
</head>
<body>
<%Prodotto prodotto = (Prodotto)request.getAttribute("idProdotto"); %>
<label>Seleziona Tipo di Spedizione</label>
<div>
<form action="Acquista" method="get">
<input type="radio" name="tipoSpedizione" value="PREMIUM" checked>Premium
<br>
<input type="radio" name="tipoSpedizione" value="ORDINARIA">Ordinaria
<br>
<input type="radio" name="tipoSpedizione" value="LUNGO_TERMINE">Lungo Termine
</div>
<label>Insrerisci data inizio</label>
<input type="date" name="dataInizio">
<br>
<label>Insrerisci data fine</label>
<input type="date" name="dataFine">

</form>
</body>
</html>

<!--  tipo di spedizione, data inizio, data arrivo, prezzo di spedizione, quantità acquistata -->