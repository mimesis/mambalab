package mambalab.cep;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class BaseFeed extends Thread
{    
    private static final Log log = LogFactory.getLog(BaseFeed.class);

    public Rules rules;
    public boolean isrunning = false;
    public boolean isconnected = false;
    public ArrayList<RoomRef>  roomRefs;
    public String type;
    
    public BaseFeed(String type,Rules rules)
    {

	this.rules = rules;
	this.type = type;
	this.roomRefs = new ArrayList<RoomRef>();
    }
    


    public void addRoom(int roomId, String roomName, String roomInstance,String ruleName) 
    {
	RoomRef  r = new RoomRef(roomId,roomName,roomInstance,ruleName);
	roomRefs.add(r);
	log.info("### roomID "+roomId+"/"+roomName+"/"+roomInstance+ " ruled by "+ruleName);
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
	
	Iterator<RoomRef> safeIter = roomRefs.iterator();

	while (safeIter.hasNext())
	{
	    RoomRef r = safeIter.next();
	    if (r.roomName.equals(event.roomName))
		return true;  
	    if (r.roomInstance.equals(event.roomInstance) )
		return true;
	    if (r.roomId == event.roomId )
		return true;   
	}
	
	return false;
    }
    

    public void executeCommand(String cmd,int userId, int roomId, String roomName, String roomInstance)
    {
	  
	String[] args = cmd.split(" ");
	String action = args[0];
	String param = null;
	
	if (args.length > 1)
	    param = args[1];
	
	if (action.equals("start"))
	{
	    rules.Load(param);
	    rules.Activate(param, roomId,roomName,roomInstance);
/*
	    MyEvent ev = new MyEvent(userId, roomId, null, "init", param,null);
	    System.out.println(">>" + ev.toString());
	    rules.service.getEPRuntime().sendEvent(ev);
	*/
	    return;
	}
	if (action.equals("stop"))
	{
	    MyEvent ev = new MyEvent(userId, roomId, null, null, "stop", param,null);
	    System.out.println(">>" + ev.toString());
	    rules.service.getEPRuntime().sendEvent(ev);

	    rules.Deactivate(param);
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
	isrunning = true;
	System.err.println("startfeed");
	this.start();

    }
    
    public String getStatus()
    {
	StringBuilder str = new StringBuilder();
	str.append("Feed:"+type+"\n");
	str.append("isRunning:"+isrunning+"\n");
	return str.toString();
    }
    
}
