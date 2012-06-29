package mambalab.cep;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.espertech.esper.client.EPServiceProvider;

class SimulatorData
{
    int delay;
    int userId;
    int roomId;
    String roomInstance;
    String eventName;
    String eventParam;
    String eventParam2;
   
    public SimulatorData(String[] ar)
    {
	this.delay = 0;
	try
	{
	    this.delay = Integer.parseInt(ar[0]);
	}
	catch(Exception e) {};
	
	this.userId = 0;
	try
	{
	    this.userId = Integer.parseInt(ar[1]);
	}
	catch(Exception e) {};

	this.roomInstance = "";
	if (ar[2]!=null)
	    this.roomInstance = ar[2].trim();
	
	
	this.roomId = 0;
	
	this.eventName = ar[3].trim();
	if (ar.length > 4)
	    this.eventParam = ar[4].trim();
	if (ar.length > 5)
	    this.eventParam2 = ar[5].trim();
	
//	System.err.println(this.toString());
    }
    
      public String toString() 
      { 
	  return "eventName:" + this.eventName +
    ",userId:" + this.userId + 
    ",roomId:" + this.roomId +
    ",roomInstance:" + this.roomInstance
    + ",eventParam:" +  this.eventParam;
	  }
    
}

class Simulator extends BaseFeed
{

    private List<SimulatorData> SimulatorDatas;

    public Simulator(Rules rules, String filename)
    {

	super("Simulator",rules);

	this.SimulatorDatas = new ArrayList<SimulatorData>();

	BufferedReader SimulatorFile;
	try
	{
	    SimulatorFile = new BufferedReader(new FileReader(filename));

	    String row = SimulatorFile.readLine();// ignore CSV header
	    row = SimulatorFile.readLine();

	    while (row != null)
	    {

		String rowArray[] = row.split(";");
		if (rowArray.length > 3)
		{
		    boolean isComment = false;
		    if (rowArray[0].isEmpty()==false)
		    if (rowArray[0].charAt(0) == '#')
			isComment = true;
		    
		   if (isComment == false)
			SimulatorDatas.add(new SimulatorData(rowArray));
		}
		/*
		 * else System.err.println("--- missing data " + row);
		 */
		row = SimulatorFile.readLine();

	    }
	    SimulatorFile.close();
	}
	catch (FileNotFoundException e)
	{
	    System.err.println("cannot load simulator data " + filename);

	}
	catch (IOException e)
	{
	    System.err.println("cannot read simulator data " + filename);

	}

	System.out.println("---Simulator loaded from " + filename);

    }

    public static void sleep(int duration)
    {
	try
	{
	    Thread.sleep(duration);
	}
	catch (InterruptedException e)
	{

	}
    }

    public void run()
    {
	System.out.println("---Simulator started---");

	Iterator<SimulatorData> safeIter = SimulatorDatas.iterator();

	while (isrunning)
	{

	    if (!safeIter.hasNext())
	    {
		isrunning = false;
		break;
		// safeIter = SimulatorDatas.iterator();

	    }
	    SimulatorData sd = safeIter.next();
	    sleep(sd.delay);
	    
//	    System.err.println("processing :"+sd.toString());

	    if ( sd.eventName.equals("TEST"))
	    {
		boolean b = true;
		if (sd.eventParam2 != null)
		if (sd.eventParam2.equals("false"))
		    b = false;
		rules.addTest(sd.eventParam,b);
	    }
	    else
	    if ( sd.eventName.equals("VALIDATE"))
	    {
		rules.validateTests();
	    }
	    else
	    if ( sd.eventName.equals("SAY") && sd.eventParam.startsWith("!!!"))
	    {
		executeCommand(sd.eventParam.substring(3), sd.userId, sd.roomId,sd.roomInstance);
	    }
	    else
	    {
		MyEvent ev = new MyEvent(sd.userId, sd.roomId, sd.roomInstance, sd.eventName, sd.eventParam,sd.eventParam2);

		if (validateEvent(ev))
		{
		    System.out.println(">>" + ev.toString());
		    rules.service.getEPRuntime().sendEvent(ev);
		}
		else
		    System.out.println("[~~]" + ev.toString());
	    }

	}

	System.out.println("---Simulator ended---");
    }
}
