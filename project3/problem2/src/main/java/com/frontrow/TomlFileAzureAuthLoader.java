package com.frontrow;

import java.io.File;

import com.moandjiezana.toml.Toml;

public class TomlFileAzureAuthLoader implements AuthLoader
{
	private static final String DATABASE_GROUP = "database";

	private File file;

	TomlFileAzureAuthLoader(final File file)
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
		Toml toml = new Toml().read(file).getTable(DATABASE_GROUP);
		String hostName = getStringOrThrow(toml, "hostname");
		String dbName = getStringOrThrow(toml, "db");
		String user = getStringOrThrow(toml, "user");
		String password = getStringOrThrow(toml, "password");
		// see https://docs.microsoft.com/en-us/azure/sql-database/sql-database-connect-query-java
		return String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;hostNameInCertificate=*.database.windows.net;loginTimeout=30;", hostName, dbName, user, password);
	}

	private String getStringOrThrow(final Toml toml, final String key)
	{
		if (!toml.contains(key))
		{
			throw new MissingTomlKeyException(key);
		}
		return toml.getString(key);
	}

	private class MissingTomlKeyException extends IllegalStateException
	{
		MissingTomlKeyException(String key)
		{
			super(String.format("Key %s is not specified in group [%s] in %s", key, DATABASE_GROUP, file.getPath()));
		}
	}
}