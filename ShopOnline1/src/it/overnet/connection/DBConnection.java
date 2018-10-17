package it.overnet.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection(){
		Connection connection = null;
		//andiamo a ricercare all'interno del progetto la classe del driver
		try {
			Class.forName(CostantiConnesione.DB_DRIVER);
			connection = DriverManager.getConnection(CostantiConnesione.DB_URL, CostantiConnesione.DB_USER,
					CostantiConnesione.DB_PASSWORD);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("non hai aggiunto il driver");
		}catch (SQLException e){
			e.printStackTrace();
			System.out.println("non è stato possibile stabilire la connessione");
		}
		
		return connection;
	}
	

}
