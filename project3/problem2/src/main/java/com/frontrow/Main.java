package com.frontrow;

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
			System.out.println("Please provide a JBDC string to connect to a Transact-SQL database: ");
			String jbdc = new Scanner(System.in).nextLine();
			db = new DbManipulator(jbdc);
		}
	}

	private static void printHelp()
	{
		System.err.println("Manipulates a database of competition problems and their authors.");
		System.err.println("Usage:");

		System.err.println("java " + Main.class.getName() + " [<jbdc>]");
		System.err.println("\tConnects to a Transact-SQL database of problem and author data");
		System.err.println("\tusing the given JBDC and prompts the user to view/manipulate");
		System.err.println("\tproblem/author data.");
		System.err.println("\tIf not specified, the user is prompted on program start.");
	}

	private static void enterOptionLoop()
	{
		printOptions(mainMenuOptionDescriptions);

		while (true)
		{
			int input = getIntegerInRange(1, 4);

			switch (input)
			{
				case 1:
					db.addNewProblem();
					break;
				case 2:
					db.giveRaiseToAuthor();
					break;
				case 3:
					db.displayProblemsAndAuthors();
					break;
				case 4:
					return;
				default: // just in case
					System.err.printf("Unknown option selected: %d%nPlease enter an integer value from 1 to 4.%n", input);
			}
		}
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
