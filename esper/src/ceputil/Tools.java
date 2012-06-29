package ceputil;

public class Tools
{
    public static String concat(String a,String b, String separator)
    {
	if (a == null || a.isEmpty())
	    return b;
	else
	    return a+separator+b;
    }
    public static String format(String a,String b)
    {
	return String.format(a,b);
    }
    
    public static String format(String a,String b0, String b1)
    {
	return String.format(a,b0,b1);
    }
    
    public static boolean wordContains(String phrase,String word)
    {
	String[] words = phrase.split(" ");
	for(int i=0;i<words.length;i++)
	    if (words[i].equalsIgnoreCase(word))
		return true;
	return false;
    }
}
