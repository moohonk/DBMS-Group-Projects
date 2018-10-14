package com.frontrow;

import java.io.File;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.TreeMap;

public class Main
{

	private static final TreeMap<Integer, String> mainMenuOptionDescriptions = new TreeMap<>();

	private static DbManipulator db;

	static
	{
		mainMenuOptionDescriptions.put(1, "Add a new problem for an author, with auto-computed Max_score");
		mainMenuOptionDescriptions.put(2, "Give a raise to a problem author");
		mainMenuOptionDescriptions.put(3, "Display information about the stored problems and authors");
		mainMenuOptionDescriptions.put(4, "Quit");
	}

	public static void main(String[] args)
	{
		setUpDbConnection(args);

		enterOptionLoop();
	}

	private static void setUpDbConnection(final String[] args)
	{
		for (String arg : args)
		{
			if (arg.equalsIgnoreCase("--help") || arg.equalsIgnoreCase("-h") || arg.equals("/?") /* windows */)
			{
				printHelp();
				System.exit(1);
			}
			else
			{
				db = new DbManipulator(arg);
			}
		}

		if (db == null)
		{
			try
			{
				System.out.println("Loading JDBC string from config.toml resource...");

				File configFile = new File(Main.class.getResource("config.toml").toURI());
				AuthLoader azureAuthLoader = new TomlFileAzureAuthLoader(configFile);

				String jbdc = azureAuthLoader.getJbdc();

				db = new DbManipulator(jbdc);
			}
			catch (URISyntaxException e)
			{
				throw new RuntimeException("Could not load the config.toml resource in the package " + Main.class.getPackage(), e);
			}
		}
	}

	private static void enterOptionLoop()
	{
		while (true)
		{
			printOptions(mainMenuOptionDescriptions);
			int input = getIntegerInRange(1, 4);

			try
			{

				switch (input)
				{
					case 1:
						db.addNewProblem(System.err);
						break;
					case 2:
						db.giveRaiseToAuthor(System.err);
						break;
					case 3:
						db.displayProblemsAndAuthors(System.out);
						break;
					case 4:
						return;
					default: // just in case
						System.err.printf("Unknown option selected: %d%nPlease enter an integer value from 1 to 4.%n", input);
				}
			}
			catch (SQLException e)
			{
				System.err.println("SQL error encountered:");
				e.printStackTrace(System.err);
			}
		}
	}

	private static void printHelp()
	{
		System.err.println("Manipulates a database of competition problems and their authors.");
		System.err.println("Usage: java " + Main.class.getName() + " [<jbdc>]");
		System.err.println("\tConnects to a Transact-SQL database of problem and author data");
		System.err.println("\tusing the given JBDC and prompts the user to view/manipulate");
		System.err.println("\tproblem/author data.");
		System.err.println("\tIf not specified, connection and auth data are loaded");
		System.err.println("\tfrom the program's config.toml resource in " + Main.class.getPackage());
	}

	private static int getIntegerInRange(final int min, final int max)
	{
		Scanner in = new Scanner(System.in);
		while (true)
		{
			System.out.printf("Please enter a number from %d to %d%n", min, max);
			try
			{
				return in.nextInt();
			}
			catch (InputMismatchException e)
			{
				System.err.println("Not a valid number.");
			}
		}
	}

	private static <K, V> void printOptions(TreeMap<K, V> options)
	{
		System.out.println("Please select an option:");
		options.forEach((option, description) -> System.out.printf("\t%s:\t%s%n", option, description));
	}
}
