package com.frontrow;

import java.io.File;

import com.moandjiezana.toml.Toml;

public class TomlFileAzureAuthLoader implements AuthLoader
{
	private File file;

	public TomlFileAzureAuthLoader(final File file)
	{
		this.file = file;
		ensureFileIsReadable(file);
	}

	private void ensureFileIsReadable(final File file)
	{
		if (!(file.exists() && file.isFile() && file.canRead()))
		{
			throw new IllegalArgumentException("Cannot read from file " + file.toPath());
		}
	}

	@Override public String getJbdc()
	{
		ensureFileIsReadable(file);
		Toml toml = new Toml().read(file).getTable("database");
		String hostName = toml.getString("hostname");
		String dbName = toml.getString("db");
		String user = toml.getString("user");
		String password = toml.getString("password");
		// see https://docs.microsoft.com/en-us/azure/sql-database/sql-database-connect-query-java
		return String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;hostNameInCertificate=*.database.windows.net;loginTimeout=30;", hostName, dbName, user, password);
	}
}
