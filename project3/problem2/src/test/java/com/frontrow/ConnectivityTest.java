package com.frontrow;

import java.io.File;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

class ConnectivityTest
{
	@Test
	void testConnection() throws URISyntaxException, SQLException
	{
		File configFile = new File(getClass().getResource("config.toml").toURI());
		AuthLoader azureAuthLoader = new TomlFileAzureAuthLoader(configFile);

		// Load SQL Server JDBC driver and establish connection.
		System.out.print("Connecting to SQL Server ... ");
		try (Connection connection = DriverManager.getConnection(azureAuthLoader.getJbdc()))
		{
			System.out.println("Connection established.");
		}
	}
}
