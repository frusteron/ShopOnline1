package it.overnet.dao;

import it.overnet.model.Acquisto;

public interface AcquistoDao {

	
	public void acquista (Acquisto acquisto);
	
	public void close();
}
