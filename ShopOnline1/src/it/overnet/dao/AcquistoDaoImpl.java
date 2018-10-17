package it.overnet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import it.overnet.connection.DBConnection;
import it.overnet.model.Acquisto;

public class AcquistoDaoImpl implements AcquistoDao {
	
	private Connection connection;

	public AcquistoDaoImpl() {
		connection = DBConnection.getConnection();
	}

	@Override
	public void acquista(Acquisto acquisto) {
		String istruzione = "insert into acquisto values(acquisto_seq.nextval,?,?,?,?,?,?,?)";
		try(PreparedStatement prepared = connection.prepareStatement(istruzione)){
			prepared.setString(1, acquisto.getTipoSpedizione().toString());
			prepared.setDate(2, acquisto.getDataInizio()());
			prepared.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void close() {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public List<Acquisto> getAllAcquisti() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Acquisto> getAllOrdini() {
		// TODO Auto-generated method stub
		return null;
	}
		
		
	}


