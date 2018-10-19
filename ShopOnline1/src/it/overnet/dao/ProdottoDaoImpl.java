package it.overnet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import it.overnet.connection.DBConnection;
import it.overnet.model.Categoria;
import it.overnet.model.Prodotto;

public class ProdottoDaoImpl implements ProdottoDao {
	
	private Connection connection;

	public ProdottoDaoImpl() {
		connection = DBConnection.getConnection();
	}

	@Override
	public List<Prodotto> getAllDisponibili() {
		List<Prodotto> lista = new ArrayList<>();
		String query = "select * from prodotto";
		try (Statement statement = connection.createStatement(); ResultSet rs = statement.executeQuery(query)) {
			while (rs.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setId(rs.getInt(1));
				prodotto.setNome(rs.getString(2));
				prodotto.setCategoria(Categoria.valueOf(rs.getString(3)));
				prodotto.setMarca(rs.getString(4));
				prodotto.setPrezzo(rs.getDouble(5));
				prodotto.setOfferta(rs.getBoolean(6));
				prodotto.setSconto(rs.getInt(7));
				prodotto.setQuantitaDisponibile(rs.getInt(8));
				prodotto.setImmagine(rs.getString(9));
				lista.add(prodotto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lista;
	}

	@Override
	public List<Prodotto> getAllByCategoria(Categoria categoria) {
		List<Prodotto> listaCategoria = new ArrayList<>();
		String query = "select * from prodotto where categoria = ?";
		ResultSet rs = null;
		try (PreparedStatement prepared = connection.prepareStatement(query)) {
			prepared.setString(1, categoria.toString());
			rs = prepared.executeQuery();
			while (rs.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setId(rs.getInt(1));
				prodotto.setNome(rs.getString(2));
				prodotto.setCategoria(Categoria.valueOf(rs.getString(3)));
				prodotto.setMarca(rs.getString(4));
				prodotto.setPrezzo(rs.getDouble(5));
				prodotto.setOfferta(rs.getBoolean(6));
				prodotto.setSconto(rs.getInt(7));
				prodotto.setQuantitaDisponibile(rs.getInt(8));
				prodotto.setImmagine(rs.getString(9));
				listaCategoria.add(prodotto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return listaCategoria;
	}
	@Override
	public List<Prodotto> getAllInOfferta() {
		List<Prodotto> listaOfferta = new ArrayList<>();
		String query = "select * from prodotto where offerta = 1";
		ResultSet rs = null;
		try (PreparedStatement prepared = connection.prepareStatement(query)) {
			rs = prepared.executeQuery();
			while (rs.next()) {
			  Prodotto prodotto = new Prodotto();
				prodotto.setId(rs.getInt(1));
				prodotto.setNome(rs.getString(2));
				prodotto.setCategoria(Categoria.valueOf(rs.getString(3)));
				prodotto.setMarca(rs.getString(4));
				prodotto.setPrezzo(rs.getDouble(5));
				prodotto.setOfferta(rs.getBoolean(6));
				prodotto.setSconto(rs.getInt(7));
				prodotto.setQuantitaDisponibile(rs.getInt(8));
				prodotto.setImmagine(rs.getString(9));
				listaOfferta.add(prodotto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return listaOfferta;
	}

	@Override
	public void updateQuantita(int idProdotto, int quantità) {
		String query = "update prodotto set quantita_disponibile = quantita_disponibile - ? "
				+ "where id_prodotto = ?";
		try (PreparedStatement prepared = connection.prepareStatement(query)) {
			prepared.setInt(1, quantità);
			prepared.setInt(2, idProdotto);
			prepared.executeUpdate();
			System.out.println("quantità aggiornata");
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
	public List<Prodotto> getAllProdottiAcquistati(int idUtente) {
		List<Prodotto> listaProdotti = new ArrayList<>();
		String query = "select * from prodotto p inner join acquisto a on p.id_prodotto = a.id_prodotto "
				+ "where data_fine < sysdate";
		try(Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(query)){
			while (rs.next()) {
				  Prodotto prodotto = new Prodotto();
					prodotto.setId(rs.getInt(1));
					prodotto.setNome(rs.getString(2));
					prodotto.setCategoria(Categoria.valueOf(rs.getString(3)));
					prodotto.setMarca(rs.getString(4));
					prodotto.setPrezzo(rs.getDouble(5));
					prodotto.setOfferta(rs.getBoolean(6));
					prodotto.setSconto(rs.getInt(7));
					prodotto.setQuantitaDisponibile(rs.getInt(8));
					prodotto.setImmagine(rs.getString(9));
					listaProdotti.add(prodotto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listaProdotti;
	}

	@Override
	public List<Prodotto> getAllProdottiOrdinati(int idUtente) {
		List<Prodotto> listaProdotti = new ArrayList<>();
		String query = "select * from prodotto inner join acquisto on prodotto.id_prodotto = acquisto.id_prodotto "
				+ "where data_fine >= sysdate";
		try(Statement statement = connection.createStatement();
				ResultSet rs = statement.executeQuery(query)){
			while (rs.next()) {
				  Prodotto prodotto = new Prodotto();
					prodotto.setId(rs.getInt(1));
					prodotto.setNome(rs.getString(2));
					prodotto.setCategoria(Categoria.valueOf(rs.getString(3)));
					prodotto.setMarca(rs.getString(4));
					prodotto.setPrezzo(rs.getDouble(5));
					prodotto.setOfferta(rs.getBoolean(6));
					prodotto.setSconto(rs.getInt(7));
					prodotto.setQuantitaDisponibile(rs.getInt(8));
					prodotto.setImmagine(rs.getString(9));
					listaProdotti.add(prodotto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listaProdotti;
	}

	@Override
	public Prodotto getProdottoById(int id) {
		Prodotto prodotto = new Prodotto();
		String query = "select * from Prodotto where id_prodotto = ?";
		ResultSet rs = null;
		try (PreparedStatement prepared = connection.prepareStatement(query)) {
			prepared.setInt(1, id);
			rs = prepared.executeQuery();
			while (rs.next()) {
				prodotto.setId(rs.getInt(1));
				prodotto.setNome(rs.getString(2));
				prodotto.setCategoria(Categoria.valueOf(rs.getString(3)));
				prodotto.setMarca(rs.getString(4));
				prodotto.setPrezzo(rs.getDouble(5));
				prodotto.setOfferta(rs.getBoolean(6));
				prodotto.setSconto(rs.getInt(7));
				prodotto.setQuantitaDisponibile(rs.getInt(8));
				prodotto.setImmagine(rs.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return prodotto;
	}

	@Override
	public List<Prodotto> getProdottoByNomeOMarca(String nome) {
		List<Prodotto> listaProdotti = new ArrayList<>();
		String query = "select * from Prodotto where nome=? or marca=?";
		ResultSet rs = null;
		try (PreparedStatement prepared = connection.prepareStatement(query)) {
			prepared.setString(1, nome);
			prepared.setString(2, nome);
			rs = prepared.executeQuery();
			while (rs.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setId(rs.getInt(1));
				prodotto.setNome(rs.getString(2));
				prodotto.setCategoria(Categoria.valueOf(rs.getString(3)));
				prodotto.setMarca(rs.getString(4));
				prodotto.setPrezzo(rs.getDouble(5));
				prodotto.setOfferta(rs.getBoolean(6));
				prodotto.setSconto(rs.getInt(7));
				prodotto.setQuantitaDisponibile(rs.getInt(8));
				prodotto.setImmagine(rs.getString(9));
				listaProdotti.add(prodotto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return listaProdotti;
	}
	
}
		



