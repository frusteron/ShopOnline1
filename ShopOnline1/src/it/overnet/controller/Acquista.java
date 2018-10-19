package it.overnet.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashSet;

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
import it.overnet.model.TipoSpedizione;
import it.overnet.model.Utente;

public class Acquista extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession sessione = req.getSession();
		Utente utente = (Utente) sessione.getAttribute("utenteLoggato");
		int idUtente = utente.getId();
		int idProdotto = Integer.parseInt(req.getParameter("idProdotto"));
		TipoSpedizione tipoSp = TipoSpedizione.valueOf(req.getParameter("tipoSpedizione"));
		LocalDate dataInizio = LocalDate.now();
		LocalDate dataFine = 
				LocalDate.now().plusDays(tipoSp.getNumeroGiorni());
		double prezzoSpedizione = tipoSp.getPrezzo();
		int quantitaAcquistata = Integer.parseInt(req.getParameter("quantitaAcquistata"));
		Acquisto acquisto = new Acquisto();
		acquisto.setId(acquisto.getId());
		acquisto.setTipoSpedizione(tipoSp);
		acquisto.setDataInizio(dataInizio);
		acquisto.setDataFine(dataFine);
		acquisto.setPrezzoDiSpedizione(prezzoSpedizione);
		acquisto.setQuantitaAcquistata(quantitaAcquistata);
		acquisto.setIdUtente(idUtente);
		acquisto.setIdProdotto(idProdotto);
		AcquistoDaoImpl acquistoDao = new AcquistoDaoImpl();
		acquistoDao.acquista(acquisto);
		System.out.println(acquisto);
		ProdottoDaoImpl prodottoDao = new ProdottoDaoImpl();
		prodottoDao.updateQuantita(idProdotto, quantitaAcquistata);
		prodottoDao.close();
		acquistoDao.close();
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaProdotti");
		dispatcher.forward(req, resp);
		
		
	
		}

		}
		
		

