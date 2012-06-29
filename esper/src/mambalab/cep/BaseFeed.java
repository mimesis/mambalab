package mambalab.cep;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.espertech.esper.client.EPRuntime;
import com.espertech.esper.client.EPServiceProvider;



public class BaseFeed extends Thread
{
    
    private static final Log log = LogFactory.getLog(BaseFeed.class);


    public Rules rules;
//    protected EPRuntime rt;
 //   @SuppressWarnings("unused")
 //   private EPServiceProvider service;
    public boolean isrunning = false;
    public ArrayList<RoomRef>  roomRefs;
    public String type;

    
    RoomRef findRoomRefByRoomInstance(String roomInstance)
    {
	Iterator<RoomRef> safeIter = roomRefs.iterator();

	while (safeIter.hasNext())
	{
	    RoomRef r = safeIter.next();
	    if (r.instance.equals(roomInstance) )
		return r;
	}
	return null;
    }

    
    public BaseFeed(String type,Rules rules)
    {

	this.rules = rules;
	this.type = type;
	this.roomRefs = new ArrayList<RoomRef>();
    }
    


    public void addRoom(int id, String instance,String classname) 
    {
	RoomRef  r = new RoomRef(id,instance,classname);
	roomRefs.add(r);
	log.info("### roomID "+id+"/"+instance+" ruled by "+classname);
    }


    public void clearAllRooms()
    {
	roomRefs.clear();
    }
    /*
    public void removeRoom(String roomId) 
    {
	RoomRef  r = findRoomRefByRoomId(roomId);
	if (r==null)
	{
	    System.err.println("cannot find room ref with id "+roomId);
	    return ;
	}
	r.nbref--;
	if (r.nbref < 0)
	{   
	    System.err.println("negative ref for room id "+roomId);
	}
	if (r.nbref<=0)
	    roomRefs.remove(r);
	
    }
*/
    public boolean validateEvent(MyEvent event)
    {
	/*
	// laise passer les event systmes
	if ( event.eventName.equals("ESPER") )
	    return true;
	*/
	// ˆ optimiser
	RoomRef  r = findRoomRefByRoomInstance(event.roomInstance);
	if (r==null)
	    return false;
	
	return true;
    }
    

    public void executeCommand(String cmd,int userId, int roomId, String roomInstance)
    {
	  
	String[] args = cmd.split(" ");
	String action = args[0];
	String param = null;
	
	if (args.length > 1)
	    param = args[1];
	
	if (action.equals("start"))
	{
	    rules.Load(param);
	    rules.Activate(param, roomId,roomInstance);
/*
	    MyEvent ev = new MyEvent(userId, roomId, null, "init", param,null);
	    System.out.println(">>" + ev.toString());
	    rules.service.getEPRuntime().sendEvent(ev);
	*/
	    return;
	}
	if (action.equals("stop"))
	{
	    MyEvent ev = new MyEvent(userId, roomId, null, "stop", param,null);
	    System.out.println(">>" + ev.toString());
	    rules.service.getEPRuntime().sendEvent(ev);

	    // rules.Suspend(param, roomId);
	    return;
	}
	else if (action.equals("reset"))
	{
	    rules.Reset();
	    return;
	}

	System.err.println("*** command unrecognized " + cmd);
    }

    
    public void StopFeed()
    {
	this.interrupt();
	isrunning = false;
    }
    
    public void StartFeed()
    {
	this.start();
	isrunning = true;
    }
    
    public String getStatus()
    {
	StringBuilder str = new StringBuilder();
	str.append("Feed:"+type+"\n");
	str.append("isRunning:"+isrunning+"\n");
	return str.toString();
    }
    
}
