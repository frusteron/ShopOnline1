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

public class Search extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		ProdottoDaoImpl prodottoDao = new ProdottoDaoImpl();
		List<Prodotto> listaProdotto = prodottoDao.getProdottoByNomeOMarca(nome);
		prodottoDao.close();
		req.setAttribute("listaProdotto", listaProdotto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("searchBar.jsp");
		dispatcher.forward(req, resp);
		
	}
}
