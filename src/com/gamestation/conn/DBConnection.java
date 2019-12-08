package com.gamestation.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private volatile static DBConnection dbConnectionInstance;
	private Connection connection;
	private String url;
	private String username;
	private String password;

	private DBConnection() {

		url = "jdbc:mysql://localhost:3306/gamestation";
		username = "root";
		password = null;

	}

	public Connection getConnection() {

		try {

			Class.forName("com.mysql.jdbc.Driver");
			this.connection = DriverManager.getConnection(this.url, this.username, this.password);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return this.connection;
	}

	public static synchronized DBConnection getDBConnectionInstance() throws SQLException {

		if (dbConnectionInstance == null) {

			synchronized (DBConnection.class) {

				if (dbConnectionInstance == null) {
					dbConnectionInstance = new DBConnection();
					
				} else if (dbConnectionInstance.getConnection().isClosed()) {
					dbConnectionInstance = new DBConnection();
				}
			}
		}

		return dbConnectionInstance;
	}
}
