import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution{
	public static void main(String[] args){
		Scanner scan = new Scanner(System.in);
		String input = scan.nextLine();

		// Matching {x} Repetitions
		// Matching a string whose length equal to 45 and all char should consist of letters.
		Pattern p1 = Pattern.compile("\\w{45}");
		Matcher m1 = p1.matcher(input);
		System.out.println(m1.find());

		// Matching {x,y} Repetitions
		// Matching string which end with 0 to 3 . symbol(s), inclusively.
		Pattern p2 = Pattern.compile("[\\\\.]{0,3}");
		Matcher m2 = p2.matcher(input);
		System.out.println(m2.find());

		// Matching zero or more Repetitions
		// Matching string which have 0 or more lowercase letters.
		Pattern p3 = Pattern.compile("[a-z]*");
		Matcher m3 = p3.matcher(input);
		System.out.println(m3.find());

		// Matching one or more Reptitions
		// Matching string with 1 or more uppercase letters
		Pattern p3 = Pattern.compile("[A-Z]+");
		Matcher m3 = p3.matcher(input);
		System.out.println(m3.find());

		// Matching Ending Items
		// Matching string which end in s.
		Pattern p4 = Pattern.compile("s$");
		Matcher m4 = p4.matcher(input);
		System.out.println(m4.find());

	}
}