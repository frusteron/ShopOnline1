package it.overnet.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.overnet.dao.ProdottoDaoImpl;
import it.overnet.model.Prodotto;

public class ListaProdotti extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProdottoDaoImpl prodottoDao = new ProdottoDaoImpl();
		List<Prodotto> listaProdotto = prodottoDao.getAllDisponibili();
		System.out.println("n prodotti : " + listaProdotto.size());
		prodottoDao.close();
		req.setAttribute("listaProdotti", listaProdotto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaProdotti.jsp");
		dispatcher.forward(req, resp);
		
	}
}