import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution{
	// 手机号
	public static boolean correctMobile(String mobile){
	    Pattern pattern = Pattern.compile("^[\\d]{11}$");
		Matcher matcher = pattern.matcher(mobile);
    	return matcher.find();
    }

    // Email
    public static boolean correctEmail(String email){
        Pattern pattern = Pattern.compile("^(\\w)+(\\.\\w+)*@(\\w)+((\\.\\w+)+)$");
        Matcher matcher = pattern.matcher(email);
        return matcher.find();
    }
}