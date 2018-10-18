package it.overnet.dao;

import java.util.List;

import it.overnet.model.Acquisto;
import it.overnet.model.Prodotto;

public interface AcquistoDao {

	
	public void acquista (Acquisto acquisto);
	
	public List<Acquisto> getAllAcquisti(int idUtente);
	
	public List<Acquisto> getAllOrdini(int idUtente);
	
	public void close();
}
