import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution{
	public static void main(String[] args){
		Scanner scan = new Scanner(System.in);
		String input = scan.nextLine();

		// The character class [ ] matchers only one out of several characters placed inside the square brackets.
		// Matching the word include vowel characters.
		Pattern p1 = Pattern.compile("[aeiouAEIOU]");
		Mathcer m1 = p1.matcher(input);
		System.out.println(m1.find());

		// The negated character class [^] matchers any character that is not in the square brackets.
		// Matching the character which is not lowercase vowel.
		Pattern p2 = Pattern.compile("[^aeiou]");
		Matcher m2 = p2.matcher(input);
		System.out.println(m2.find());

		// A hyphen (-) inside a character class specifies a range of characters where the left and right operands are the respective lower and upper bounds of the range.
		// Matching the character which is lowercase English alphabetic character.
		Pattern p3 = Pattern.compile("[a-z]");
		Matcher m3 = p3.matcher(input);
		System.out.println(m3.find());

	}
}