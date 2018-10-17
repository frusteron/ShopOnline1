package it.overnet.dao;

import java.sql.Connection;
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


