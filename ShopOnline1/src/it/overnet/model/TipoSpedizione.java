package it.overnet.model;

public enum TipoSpedizione {
	

	PREMIUM(1,6),
	ORDINARIA(5,1),
	LUNGO_TERMINE(7,0);
	
	private int numeroGiorni;
	private double prezzo;
	private TipoSpedizione(int numeroGiorni, double prezzo) {
		this.numeroGiorni = numeroGiorni;
		this.prezzo = prezzo;
	}
	public int getNumeroGiorni() {
		return numeroGiorni;
	}
	public void setNumeroGiorni(int numeroGiorni) {
		this.numeroGiorni = numeroGiorni;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	
	
	
}
