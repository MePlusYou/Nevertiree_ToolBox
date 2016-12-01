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
		Pattern p1 = Pattern.compile("\\w{45}");
		Matcher m1 = p1.matcher(input);


		// Matching zero or more Repetitions


		// Matching one or more Reptitions

		// Matching Ending Items

	}
}