package it.overnet.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.overnet.dao.ProdottoDaoImpl;
import it.overnet.model.Prodotto;
import it.overnet.model.Utente;

public class Carrello extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		ProdottoDaoImpl prodottoDao = new ProdottoDaoImpl();
		Prodotto prodotto = prodottoDao.getProdottoById(idProdotto);
		prodottoDao.close();
		HashSet<Prodotto> carrello = new HashSet<>();
		carrello.add(prodotto);
		HttpSession sessione = req.getSession();
		sessione.setAttribute("carrello", carrello);
		RequestDispatcher dispatcher = req.getRequestDispatcher("carrello.jsp");
		dispatcher.forward(req, resp);
		
		}
	}
