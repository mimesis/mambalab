package mambalab.cep;
import com.espertech.esper.client.EPStatement;

public class Rule
{
	public EPStatement statement;
	public String epl;
	public String name;
	public String className;
	String description;
	String action;
	String sql;
	String loglevel;

	
	Rule(String className, String name)
	{
		this.className =className;
		this.name =name;
		this.description = name;
	}
}
