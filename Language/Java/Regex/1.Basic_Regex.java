import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution{
	public static void main(String[] args){
		Scanner scan = new Scanner(System.in);
		String input = scan.nextLine();

		// Matching specific string using a sequence of characters that define a search pattern.
		// Matching the string "example_regex".
		Pattern p1 = Pattern.compile("example_regex");
		Matcher m1 = p1.matcher(input);
		if(m1.find())
			System.out.format("Find a string contain 'example_regex' !!!");

		// Matching anything using '.'
		// Match the pattern abc.def.jhi.jkx ,where each variable can be any single character except the newline.
		Pattern p2 = Pattern.compile("...\\....\\....\\....");
		Matcher m2 = p2.matcher(input);

		boolean isMather = m2.matches();
		System.out.println("%s",isMather);

		// Matching Digit & Non-Digit Characters
		// Matching the pattern xxXxxXxxxx. Here x denotes a digit character, and X denotes a non-digit character.
		Pattern p3 = Pattern.compile("\\d{2}\\D\\d{2}\\D\\d{4}");
		Matcher m3 = p3.matcher(input);
		System.out.println(m3.find());

		// Matching Whitespace & Non-Whitespace Character
		// Matching the pattern XXxXXxXX. Here, x denotes whitespace characters, and X denotes non-white space characters.
		Pattern p4 = Pattern.compile("\\S{2}\\s\\S{2}\\s\\S{2}");
		Matcher m4 = p4.matcher(input);
		System.out.println(m4.find());

		// Matching Word & Non-Word Character
		// Matching the pattern xxxXxxxxxxxxxxXxx. Here, x denotes any word character and X denotes any non-word character.
		Pattern p5 = Pattern.compile("\\w{3}\\W\\w{10}\\W\\w{2}");
		Matcher m5 = p5.matcher(input);
		System.out.println(m5.find());

		// Matching Start and end
		// Matching the pattern Xxxxx. Here, x denotes a word character, and X denotes a digit.
		// S must start with a digit X and end with . symbol.
		// S should be 6 characters long only.
		Pattern p6 = Pattern.compile("^\\d\\w{4}\\.$");
		Matcher m6 = p6.matcher(input);
		System.out.println(m6.find());
	}
}