package it.overnet.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.overnet.dao.ProdottoDaoImpl;
import it.overnet.model.Prodotto;

public class Ordina extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProdottoDaoImpl prodottoDao = new ProdottoDaoImpl();
		List<Prodotto> listaProdotti = prodottoDao.getAllDisponibili();
		System.out.println("n prodotti : " + listaProdotti.size());
		prodottoDao.close();
		String sort = req.getParameter("sort");
		if (sort.equals("marca")){
			Comparator<Prodotto> comparatoreMarca = new Comparator<Prodotto>() {
				
				@Override
				public int compare(Prodotto p1, Prodotto p2) {
					
					return p1.getMarca().compareTo(p2.getMarca());
					
				}
			};
			
			Collections.sort(listaProdotti, comparatoreMarca);
		} else if (sort.equals("quantita")){
			Comparator<Prodotto> comparatoreQuantita = new
					Comparator<Prodotto>() { 

						@Override
						public int compare(Prodotto p1, Prodotto p2) {
						     if (p1.getQuantitaDisponibile() > p2.getQuantitaDisponibile()){
						    	 return 1;
						     }else if (p1.getQuantitaDisponibile() < p2.getQuantitaDisponibile()){
						         return -1;
						     }else {    
						         return 0;
						     }
							
						}
				
				
					};			
					Collections.sort(listaProdotti, comparatoreQuantita);
					
		} else if (sort.equals("prezzo")){
			Comparator<Prodotto> comparatorePrezzo = new
					Comparator<Prodotto>() { 

						@Override
						public int compare(Prodotto p1, Prodotto p2) {
						     if (p1.getPrezzo() > p2.getPrezzo()){
						    	 return 1;
						     }else if (p1.getPrezzo() < p2.getPrezzo()){
						         return -1;
						     }else {    
						         return 0;
						     }
							
						}
				
				
					};			
					Collections.sort(listaProdotti, comparatorePrezzo);		

					
		}
		req.setAttribute("listaProdotti", listaProdotti);
		RequestDispatcher dispatcher = req.getRequestDispatcher("listaProdotti.jsp");
		dispatcher.forward(req, resp);
		
		
		
		
		
	}

}
