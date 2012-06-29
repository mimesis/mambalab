package mambalab.cep;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collections;
import java.util.Enumeration;
import java.util.LinkedHashSet;
import java.util.Properties;

class LinkedProperties extends Properties
{

    private static final long serialVersionUID = 1L;
    private final LinkedHashSet<Object> keys = new LinkedHashSet<Object>();

    public Enumeration<Object> keys()
    {
	return Collections.<Object> enumeration(keys);
    }

    public Object put(Object key, Object value)
    {
	keys.add(key);
	return super.put(key, value);
    }

    public LinkedProperties(String filename)
    {
	FileInputStream fis;
	try
	{
	    fis = new FileInputStream(filename);
	    this.load(fis);
	    fis.close();
	}
	catch (FileNotFoundException e)
	{
	    System.err.println("cannot load  " + filename);
	}
	catch (IOException e)
	{
	    System.err.println("cannot parse properties " + filename);
	}
    }
    
}