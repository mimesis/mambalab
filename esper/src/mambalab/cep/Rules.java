package mambalab.cep;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.espertech.esper.client.EPAdministrator;
import com.espertech.esper.client.EPServiceProvider;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

class StartupRule
{
    public String name;
    public ArrayList<String> roomIds;
    public ArrayList<String> roomClasses;
    public ArrayList<Integer> userIds;  

    public StartupRule(String name,ArrayList<String> roomIds,ArrayList<String> roomClasses,ArrayList<Integer> userIds)
    {
	this.name = name;
	this.roomIds= roomIds;
	this.roomClasses = roomClasses;
	this.userIds = userIds;
    }
}


public class Rules
{

    private static final Log log = LogFactory.getLog(Rules.class);
    
    public EPServiceProvider service ;
    public BaseFeed feed;

    public List<Rule> rules;
    public ArrayList<UnitTest> tests;
    private List<String> files; 
    public HashMap<String,DB> dbs;
   
    public ArrayList<StartupRule> startupRules;
    public String path;
    public int nbtest=0;
    public int nbfailed=0;

    public String servername;
    public String infraname;
    
    void addTest(String test,boolean mode)
    {
	log.debug("Adding test :"+test +"("+mode+")");
	tests.add(new UnitTest(test,mode));
	nbtest++;
    }
    
    void validateTests()
    {
	Iterator<UnitTest> safeIter = tests.iterator();
	while (safeIter.hasNext())
	{
	    UnitTest t = safeIter.next();
	    if (t.present == true)
	    {
		System.err.println("*** DID NOT FIND: "+t.rule_name+ "****");
		nbfailed++;
	    }
	}

	tests.clear();
    }
    
    boolean validate(String _classname)
    {

	Iterator<UnitTest> safeIter = tests.iterator();
	while (safeIter.hasNext())
	{
	    UnitTest t = safeIter.next();
	    if (t.rule_name.equals(_classname) )
	    {

		if (t.present == false)
		{
		    System.err.println("*** UNEXPECTED: "+_classname+ "****");
		    nbfailed++;
		}
		else
		    log.info("*** SUCCEEDED: "+_classname+ "****");
		 
		tests.remove(t);
		return false;
		
	    }
	}
	return false;
	
    }
    
    void addStartup(String name,ArrayList<String> roomIds,ArrayList<String> roomClasses,ArrayList<Integer> userIds)
    {
	StartupRule sr = new StartupRule(name,roomIds,roomClasses,userIds);
	startupRules.add(sr);
	
    }
    
    Rule findOrCreateRule(String className, String name)
    {
	Iterator<Rule> safeIter = rules.iterator();

	while (safeIter.hasNext())
	{
	    Rule r = safeIter.next();
	    if (r.className.equals(className) && r.name.equals(name))
		return r;
	}

	Rule r = new Rule(className, name);
	rules.add(r);
	return r;
    }
    
    String getFilenameFromClassname(String classname)
    {
	return path+"/"+classname+".properties";
    }
    
    boolean findFilename(String filename)
    {
	if (files.contains(filename))
	    return true;
	else
	    return false;
    }

    void show()
    {
	Iterator<Rule> safeIter = rules.iterator();

	while (safeIter.hasNext())
	{
	    Rule r = safeIter.next();
	    System.out.println(r.className + "--" + r.name + "=" + r.epl);
	}
    }

    Rules()
    {
	
	try
	{
	    Class.forName("com.mysql.jdbc.Driver");
	}
	catch (ClassNotFoundException e)
	{
	    System.err.println("Cannot load jdbc driver");
	}
	
	this.rules = new ArrayList<Rule>();
	this.files = new ArrayList<String>();
	this.tests = new ArrayList<UnitTest>();
	this.dbs = new HashMap<String,DB>();
	this.startupRules = new ArrayList<StartupRule>();
	
    }
   
    void SetService(EPServiceProvider service)
    {
	this.service = service;
    }
	    
    void SetFeed(String feedType, String feedParam)
    {

	BaseFeed produce;
	if (feedType.equals("amqp"))
	    produce = new AMQPFeed(this);
	else
	    produce = new Simulator(this,feedParam);

	this.feed = produce;
    }

    boolean Load(String rulename)
    {
	
	String filename = getFilenameFromClassname(rulename);
   
	if (findFilename(filename))
	{
	    log.info(filename + " already loaded");
	    return true;
	}
	files.add(filename);

	
	LinkedProperties props = new LinkedProperties(filename);// order is important
	
	Enumeration<Object> e = props.keys();

	while (e.hasMoreElements())
	{
	    String key = (String) e.nextElement();

	    String[] ar = key.split("\\.");
	    String c = rulename ; //ar[0].trim();
	    String n = ar[0].trim();
	    String p = ar[1].trim();

	    String prop = props.getProperty(key).trim();
	    Rule r = findOrCreateRule(c, n);
	    if (p.equals("epl"))
	    {
		if (r.epl == null)
		    r.epl = prop;
		else
		    System.err.println(key + " already assigned");
	    }
	    else if (p.equals("description"))
		r.description = prop;
	    else if (p.equals("log"))
		r.loglevel = prop;
	    else if (p.equals("action"))
		r.action = prop;
	    /*
	    else if (p.equals("listener"))
		r.listener = prop;
		*/
	    else if (p.equals("sql"))
		r.sql = prop;
	}

	return true;
	// show();
    }

    void Reset( )
    {
	

	Iterator<Rule> safeIter = rules.iterator();

	while (safeIter.hasNext())
	{
	    Rule r = safeIter.next();
	    if (r.statement != null)
	    {
    		log.debug("x " + r.description + " = " + r.epl);
    		r.statement.destroy();
	    }
	    safeIter.remove();
	    
	}

	// clear the file list to force reload
	files.clear();
	
	// clear the filter list
	feed.clearAllRooms();
	
	// reload the startup rules
	 Iterator<StartupRule> iter =startupRules.iterator();
	 while (iter.hasNext())
	 {
	     StartupRule sr = iter.next();
	     String cn = sr.name;
	     Load(cn);
	     Activate(cn,0,"*");
	 }
    }
    
    void Activate( String className, int roomId, String roomInstance)
    {

	EPAdministrator admin = service.getEPAdministrator();
	System.out.println("-- Activating " + className);
	Iterator<Rule> safeIter = rules.iterator();

	while (safeIter.hasNext())
	{
	    Rule r = safeIter.next();
	    if (r.className.equals(className))
	    {
		if (r.statement == null)
		{
		    log.info("+ " + r.description + " = " + r.epl);	
		    r.statement = admin.createEPL(r.epl);
		    r.statement.addListener(new GenericListener(service, this, r));
		}
		r.statement.start();

	    }
	}
	
	// GŽnre un event pour initialiser la rule
	MyEvent ev = new MyEvent(0, roomId, roomInstance, "start", className,null);
	 System.out.println(">>" + ev.toString());
	 this.service.getEPRuntime().sendEvent(ev);
	//feed.addRoom(roomId);
    }

    
    
    public void addDatabase(String name,String host,String dbname,String user,String password)
    {
	String url = "jdbc:mysql://"+host+"/"+dbname+"?user="+user+"&password="+password;
	log.debug(url);
	DB db = new DB();
	
	// Setup the connection with the DB
	try
	{
	    db.connect = DriverManager.getConnection(url);
	    db.statement = db.connect.createStatement();
	    dbs.put(name, db);
	    log.info("db:"+name+" added....");
	}
	catch (SQLException e)
	{

	    System.err.println("Cannot connect to "+url);

	}
	
    }
    
    public void StartFeed()
    {
	this.feed.StartFeed();
    }
    public void StopFeed()
    {
	this.feed.StopFeed();
    }
    
    
    public void executeSQL(String name,String sql)
    {
	
	DB db = dbs.get(name);
	if (db==null)
	{
	    System.err.println("db: " + name+" not found");
	    return ;
	}
	try
	{
	    log.debug("SQL: " + sql);
	    db.statement.executeUpdate(sql);
	}  
	
	catch (SQLException e)
	{	    
	    System.err.println("query failed: "+sql);   
	}
    }
        
}
