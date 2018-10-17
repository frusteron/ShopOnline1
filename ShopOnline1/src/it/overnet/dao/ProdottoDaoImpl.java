package it.overnet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
		String query = "select * from film where genere = ?";
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
	public void updateQuantita(int idProdotto) {
		String query = "update film set quantita_disponibile = quantita_disponibile - 1 where id = ?";
		try (PreparedStatement prepared = connection.prepareStatement(query)) {
			prepared.setInt(1, idProdotto);
			prepared.executeUpdate();
			System.out.println("quantit� aggiornata");
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
		
	}


