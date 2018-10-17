package it.overnet.model;

import java.time.LocalDate;

public class Acquisto {

	private int id;
	private TipoSpedizione tipoSpedizione;
	private LocalDate dataInizio;
	private LocalDate dataFine;
	private double prezzoDiSpedizione;
	private int quantitaAcquistata;
	private int idUtente;
	private int idProdotto;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public TipoSpedizione getTipoSpedizione() {
		return tipoSpedizione;
	}
	public void setTipoSpedizione(TipoSpedizione tipoSpedizione) {
		this.tipoSpedizione = tipoSpedizione;
	}
	public LocalDate getDataInizio() {
		return dataInizio;
	}
	public void setDataInizio(LocalDate dataInizio) {
		this.dataInizio = dataInizio;
	}
	public LocalDate getDataFine() {
		return dataFine;
	}
	public void setDataFine(LocalDate dataFine) {
		this.dataFine = dataFine;
	}
	
	
	public double getPrezzoDiSpedizione() {
		return prezzoDiSpedizione;
	}
	public void setPrezzoDiSpedizione(double prezzoDiSpedizione) {
		this.prezzoDiSpedizione = prezzoDiSpedizione;
	}
	public int getQuantitaAcquistata() {
		return quantitaAcquistata;
	}
	public void setQuantitaAquistata(int quantitaAcquistata) {
		this.quantitaAcquistata = quantitaAcquistata;
	}
	public int getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}
	public int getIdProdotto() {
		return idProdotto;
	}
	public void setIdProdotto(int idProdotto) {
		this.idProdotto = idProdotto;
	}
	@Override
	public String toString() {
		return "Acquisto [id=" + id + ", dataInizio=" + dataInizio + ", dataFine=" + dataFine + ", prezzoDiSpedizione="
				+ prezzoDiSpedizione + ", quantitaAcquistata=" + quantitaAcquistata + ", idUtente=" + idUtente
				+ ", idProdotto=" + idProdotto + "]";
	}
	
	
	
}
