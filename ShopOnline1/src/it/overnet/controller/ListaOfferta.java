package it.overnet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.overnet.dao.ProdottoDaoImpl;
import it.overnet.model.Categoria;
import it.overnet.model.Prodotto;

public class ListaOfferta extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	ProdottoDaoImpl prodottoDao = new ProdottoDaoImpl();
	Prodotto prodotto = new Prodotto();
	double prezzoTotale = prodotto.getPrezzo() - ( prodotto.getPrezzo()* prodotto.getSconto()/100);
	List<Prodotto> listaOfferta = prodottoDao.getAllInOfferta();
	System.out.println("n prodotti : " + listaOfferta.size());
	prodottoDao.close();
	req.setAttribute("prezzoTotale", prezzoTotale);
	req.setAttribute("listaOfferta", listaOfferta);
	RequestDispatcher dispatcher = req.getRequestDispatcher("listaOfferta.jsp");
	dispatcher.forward(req, resp);
}

}
