package mambalab.cep;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

import com.espertech.esper.client.Configuration;
import com.espertech.esper.client.ConfigurationDBRef;
import com.espertech.esper.client.EPServiceProvider;
import com.espertech.esper.client.EPServiceProviderManager;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.blackmamba.thrift.ltt.LTTException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.thrift.TException;

public class MambalabManager
{
    private static final Log log = LogFactory.getLog(MambalabManager.class);

    public static void main(String[] args)
    {
	// String config_filename ;
	if (args.length < 1)
	{
	    System.err.println("missing config file");
	    return;
	}
	// config_filename = args[0];

	Rules rules = launch(args);
	System.out.println("...press enter to stop simulation...");
	try
	{
	    System.in.read();
	}
	catch (IOException e)
	{
	    log.error("Exception reading keyboard input: " + e.getMessage(), e);
	}

	terminate(rules);
    }

    public static void loadConfigFile(String config_filename, Configuration configuration, Rules rules)
    {
	// Load config file

	ObjectMapper mapper = new ObjectMapper();
	mapper.configure(Feature.ALLOW_COMMENTS, true);
	try
	{
	    
	    Map<String, Object> config = mapper.readValue(new File(config_filename), Map.class);

	    Object servernameObject = config.get("server");
	    if (servernameObject!=null)
		rules.servername  = servernameObject.toString();
	
	    Object infranameObject = config.get("infra");
	    if (infranameObject!=null)
		rules.infraname  = config.get("infra").toString();
	    
	    
	    // WebService
	    Map<String, Object> wserver = (Map<String, Object>) config.get("wserver");
	    if (wserver != null)
	    {
		WServer.host = wserver.get("host").toString();
		int wserver_port = Integer.parseInt(wserver.get("port").toString());
		WServer.port = wserver_port;
		log.info("wserver :" + WServer.host + ":" + WServer.port);

		// Test la connnection
		WServer.Command("facebook-user-data", "findByFacebookId", "[698084178]");
		
	    }

	    // Thrift

	    Map<String, Object> thrift = (Map<String, Object>) config.get("thrift");
	    if (thrift != null)
	    {
		String thrift_host = thrift.get("host").toString();
		int thrift_port = Integer.parseInt(thrift.get("port").toString());
		Thrift.Init(thrift_host, thrift_port);

		try
		{
		    if (Thrift.client != null)
		    {
			int nb = Thrift.client.countAllPlayers();
			System.out.println(nb);
		    }
		}
		catch (LTTException e)
		{
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		}
		catch (TException e)
		{
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		}

	    }

	    
	    // Rules
	    Map<String, Object> jrules = (Map<String, Object>) config.get("rules");
	    if (jrules != null)
	    {
		rules.path = jrules.get("path").toString();

		ArrayList<Map<String, Object>> startups = (ArrayList<Map<String, Object>>) jrules.get("startup");
		Iterator<Map<String, Object>> iter = startups.iterator();
		while (iter.hasNext())
		{
		    Map<String, Object> startup = iter.next();
		    String name = startup.get("name").toString();
		    rules.addStartup(name, null, null, null);
		}
	    }
	    // AMQP
	    Map<String, Object> amqp = (Map<String, Object>) config.get("amqp");
	    if (amqp != null)
	    {
		AMQPFeed.exchangeName = amqp.get("exchangeName").toString();
		AMQPFeed.queueName = amqp.get("queueName").toString();
		AMQPFeed.user = amqp.get("user").toString();
		AMQPFeed.password = amqp.get("password").toString();
		AMQPFeed.virtualHost = amqp.get("virtualHost").toString();
		AMQPFeed.port = Integer.parseInt(amqp.get("port").toString());
		AMQPFeed.host = amqp.get("host").toString();
	    }

	    // Databases
	    ArrayList<Map<String, Object>> databases = (ArrayList<Map<String, Object>>) config.get("databases");
	    if (databases != null)
	    {
		Iterator<Map<String, Object>> safeIter = databases.iterator();
		while (safeIter.hasNext())
		{
		    Map<String, Object> database = safeIter.next();
		    String name = database.get("name").toString();
		    String host = database.get("host").toString();
		    String dbname = null; 
		    Object dbnameObject = database.get("dbname");
		    if (dbnameObject !=null)
			dbname = dbnameObject.toString();
		    else
		    {
			String dbprefix = database.get("dbprefix").toString();
			dbname = dbprefix + "_" + rules.infraname ;
			
		    }
		    String user = database.get("user").toString();
		    String password = database.get("password").toString();
		    ConfigurationDBRef ref = new ConfigurationDBRef();
		    ref.setDriverManagerConnection("com.mysql.jdbc.Driver", "jdbc:mysql://" + host + "/" + dbname + "?autoReconnect=true", user, password);
		//    ref.setConnectionLifecycleEnum(ConfigurationDBRef.ConnectionLifecycleEnum.RETAIN);
		    ref.setConnectionLifecycleEnum(ConfigurationDBRef.ConnectionLifecycleEnum.POOLED);
		    ref.setConnectionReadOnly(true);
		    ref.setConnectionTransactionIsolation(1);
		    configuration.addDatabaseReference(name, ref);

		    rules.addDatabase(name, host, dbname, user, password);
		}
	    }
	 // Feed
	    Map<String, Object> feed = (Map<String, Object>) config.get("feed");
	    if (feed != null)
	    {
		String feedType = feed.get("type").toString();
		String feedParam = null;
		Object param = feed.get("param");
		if (param != null)
		    feedParam = param.toString();
		rules.SetFeed(feedType, feedParam);
	    }


	}
	catch (JsonParseException e1)
	{
	    // TODO Auto-generated catch block
	    e1.printStackTrace();
	}
	catch (JsonMappingException e1)
	{
	    // TODO Auto-generated catch block
	    e1.printStackTrace();
	}
	catch (IOException e1)
	{
	    // TODO Auto-generated catch block
	    e1.printStackTrace();
	}

    }

    public static int terminate(Rules rules)
    {
	// cleanp
	rules.StopFeed();
	Thrift.Close();
	System.out.println("--done--");
	
	if(rules.nbfailed>0)
	    System.err.println("********* Nb failed tests :"+rules.nbfailed+" (out of "+rules.nbtest+")");
	else
	    System.out.println("********* Nb failed tests :"+rules.nbfailed+" (out of "+rules.nbtest+")");
	return rules.nbfailed;
    }

    public static Rules launch(String[] config_filenames)
    {

	System.out.println("--starting--");

	Configuration configuration = new Configuration();
	configuration.getEngineDefaults().getExecution().setPrioritized(true); // required for drop
	configuration.addEventType("MyEvent", MyEvent.class.getName());
	configuration.addImport("ceputil.*");

	Rules rules = new Rules();
	int server_port = 8080;
	String server_name = "http://localhost";
	for(int i=0;i<config_filenames.length;i++)
	{
	    if (config_filenames[i].startsWith("-"))
	    {
		 if (config_filenames[i].equals("-port"))
		 {
		       server_port = Integer.parseInt(config_filenames[i+1]);
		 }
		 else
		 if (config_filenames[i].equals("-server"))
		 {
		       server_name = config_filenames[i+1];
		 }
		i++;
	    }
	    else
		loadConfigFile(config_filenames[i], configuration, rules);
	}
	
	
	GenericListener.picture_server_name = server_name+":"+server_port;
	EPServiceProvider epService = EPServiceProviderManager.getProvider("mambalabs", configuration);
	rules.SetService(epService);

	rules.StartFeed();
	rules.Reset();
	
	System.err.println("*** launched *** ");
	return rules;

    }

}
