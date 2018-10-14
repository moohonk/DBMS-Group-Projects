package com.frontrow;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

class DbManipulator
{
	private String jbdc;

	DbManipulator(final String jbdc)
	{
		this.jbdc = jbdc;

		try
		{
			// Load SQL Server JDBC driver and establish connection.
			System.out.print("Connecting to SQL Server ... ");
			try (Connection connection = getDbConnection())
			{
				System.out.println("Connection established.");
			}
		}
		catch (Exception e)
		{
			System.err.println();
			e.printStackTrace(System.err);
		}
	}

	private Connection getDbConnection() throws SQLException
	{
		return DriverManager.getConnection(this.jbdc);
	}


	void addNewProblem()
	{
		System.err.println("Adding new problem"); // todo: implement this
	}

	void giveRaiseToAuthor()
	{
		System.err.println("Giving raise to author"); // todo: implement this
	}

	void displayProblemsAndAuthors()
	{
		System.err.println("Printing out problems and authors"); // todo: implement this
	}
}
