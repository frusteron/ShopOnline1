package it.overnet.dao;

import java.util.List;

import it.overnet.model.Categoria;

import it.overnet.model.Prodotto;

public interface ProdottoDao {
	
	public List<Prodotto> getAllDisponibili();
	
	public List<Prodotto> getAllByCategoria(Categoria categoria);
	
	public List<Prodotto> getAllProdottiAcquistati(int idUtente);
	
	public List<Prodotto> getAllProdottiOrdinati(int idUtente);
	
	public List<Prodotto> getAllInOfferta();
	
	public void updateQuantita(int idProdotto,int quantità);
	
	public Prodotto getProdottoById(int id);
	
	public List<Prodotto> getProdottoByNomeOMarca(String nome);
	
	public void close();
}