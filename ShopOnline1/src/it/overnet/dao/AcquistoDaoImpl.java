package it.overnet.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import it.overnet.connection.DBConnection;
import it.overnet.model.Acquisto;
import it.overnet.model.Prodotto;
import it.overnet.model.TipoSpedizione;

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
			prepared.setDate(2, Date.valueOf(acquisto.getDataInizio()));
			prepared.setDate(3, Date.valueOf(acquisto.getDataFine()));
			prepared.setDouble(4, acquisto.getPrezzoDiSpedizione());
			prepared.setInt(5, acquisto.getQuantitaAcquistata());
			prepared.setInt(6, acquisto.getIdUtente());
			prepared.setInt(7, acquisto.getIdProdotto());
			prepared.executeUpdate();
			System.out.println();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

	

	@Override
	public List<Acquisto> getAllAcquisti() {
		List<Acquisto> listaAcquisti = new ArrayList<>();
		String query = "select * from acquisto where data_fine < sysdate";
		try(Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(query)){
				while(rs.next()){
					Acquisto acquisto = new Acquisto();
					acquisto.setId(rs.getInt(1));
					acquisto.setTipoSpedizione(TipoSpedizione.valueOf(rs.getString(2)));
					acquisto.setDataInizio(rs.getDate(3).toLocalDate());
					acquisto.setDataFine(rs.getDate(4).toLocalDate());
					acquisto.setPrezzoDiSpedizione(rs.getDouble(5));
					acquisto.setQuantitaAquistata(rs.getInt(6));
					acquisto.setIdUtente(rs.getInt(7));
					acquisto.setIdProdotto(rs.getInt(8));
					listaAcquisti.add(acquisto);
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listaAcquisti;
	}
	@Override
	public List<Acquisto> getAllOrdini() {
		// TODO Auto-generated method stub
		return null;
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
		
	}


