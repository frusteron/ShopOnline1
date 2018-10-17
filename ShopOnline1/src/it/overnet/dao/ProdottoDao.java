package it.overnet.dao;

import java.util.List;

import it.overnet.model.Categoria;

import it.overnet.model.Prodotto;

public interface ProdottoDao {
	
	public List<Prodotto> getAllDisponibili();
	
	public List<Prodotto> getAllByCategoria(Categoria categoria);
	
	public List<Prodotto> getAllInOfferta(boolean offerta);
	
	public void updateQuantita(int idProdotto);
	
	public void close();
}