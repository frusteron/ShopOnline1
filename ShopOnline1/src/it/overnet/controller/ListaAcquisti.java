package it.overnet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.overnet.dao.AcquistoDaoImpl;
import it.overnet.dao.ProdottoDaoImpl;
import it.overnet.model.Acquisto;
import it.overnet.model.Prodotto;
import it.overnet.model.Utente;

public class ListaAcquisti extends HttpServlet{

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession sessione = req.getSession();
		Utente utente = (Utente) sessione.getAttribute("utenteLoggato");
		int idUtente = utente.getId();
		ProdottoDaoImpl prodottoDao = new ProdottoDaoImpl();
		List<Prodotto> listaAcquisti = prodottoDao.getAllProdottiAcquistati(idUtente);
		prodottoDao.close();
		req.setAttribute("listaAcquisti", listaAcquisti);
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaAcquisti.jsp");
		dispatcher.forward(req, resp);
		
	}
}
