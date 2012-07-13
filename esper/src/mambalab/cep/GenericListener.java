package mambalab.cep;

import com.espertech.esper.client.EPServiceProvider;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.thrift.TException;

import net.blackmamba.thrift.ltt.LTTException;
import net.blackmamba.thrift.ltt.UserDontExistException;

import com.espertech.esper.client.PropertyAccessException;
import com.espertech.esper.client.UpdateListener;
import com.espertech.esper.client.EventBean;

public class GenericListener implements UpdateListener
{
    private static final Log log = LogFactory.getLog(GenericListener.class);

    public static String picture_server_name;

    public static String getURLFromString(String alt)
    {

	if (alt.startsWith("http"))
	    return alt;

	StringBuilder textgenerator = new StringBuilder();

	textgenerator.append(picture_server_name);
	textgenerator.append("/pic/");

	try
	{
	    String line = alt.replaceAll("\n", " ").replaceAll("\r", " ");
	    textgenerator.append(URLEncoder.encode(line, "UTF-8"));
	}
	catch (UnsupportedEncodingException e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}

	return textgenerator.toString();

    }

    private Rule rule;
    private Rules rules;
    private EPServiceProvider service;

    void log2(String _msg)
    {
	if (rule.loglevel != null)
	{
	    if (rule.loglevel.equals("info"))
	    {
		log.info(_msg);
		return;
	    }
	    if (rule.loglevel.equals("warn"))
	    {
		log.warn(_msg);
		return;
	    }
	    if (rule.loglevel.equals("err"))
	    {
		System.err.println(_msg);
		return;
	    }

	    if (rule.loglevel.equals("out"))
	    {
		System.out.println(_msg);
		return;
	    }
	}
	log.info(_msg);

    }

    GenericListener(EPServiceProvider service, Rules rules, Rule rule)
    {
	this.rule = rule;
	this.rules = rules;
	this.service = service;
    }

    public void update(EventBean[] newEvents, EventBean[] oldEvents)
    {

	rules.validate(this.rule.name);

	if (newEvents != null && newEvents.length > 0)
	{
	    EventBean eb = newEvents[0];

	    String json = service.getEPRuntime().getEventRenderer().renderJSON(rule.description, eb);
	    json = json.replaceAll("\n", " ");
	    json = json.replaceAll("\r", " ");

	    log2("NEW:" + json.toString());
	}

	if (oldEvents != null && oldEvents.length > 0)
	{
	    EventBean eb = oldEvents[0];
	    String json = service.getEPRuntime().getEventRenderer().renderJSON(rule.description, eb);
	    json = json.replaceAll("\n", " ");
	    json = json.replaceAll("\r", " ");
	    log.debug("OLD:" + json.toString());
	}

	if (rule.sql != null)
	{
	    String[] ar = rule.sql.split(":");
	    if (ar.length == 1)
	    {
		System.err.println("missing database name in query");
		return;
	    }
	    String name = ar[0];
	    String formatSQL = rule.sql.substring(name.length() + 1).trim();

	    if (newEvents.length == 1)
	    {

		EventBean eb = newEvents[0];
		@SuppressWarnings("unchecked")
		HashMap<String, Object> hashMap = (HashMap<String, Object>) eb.getUnderlying();
		for (String mapKey : hashMap.keySet())
		{
		    String key = "\\$\\{" + mapKey + "\\}";
		    String value;
		    Object ovalue = hashMap.get(mapKey);
		    if (ovalue == null)
			value = "NULL";
		    else
		    {
			value = ovalue.toString();
			String cl = ovalue.getClass().toString();
			if (cl.equals("class java.lang.String"))
			    value = "'" + value + "'";
		    }
		    formatSQL = formatSQL.replaceAll(key, value);
		}

	    }
	    System.out.println(formatSQL);
	    this.rules.executeSQL(name, formatSQL);

	}
	if (rule.action != null)
	{

	    if (rule.action.equals("ActivateRooms"))
	    {
		if (newEvents != null)
		{
		    int l = newEvents.length;
		    for (int i = 0; i < l; i++)
		    {
			int roomId = 0;
			String roomInstance = "";
			String roomName = "";

			try
			{
			    roomId = Integer.parseInt(newEvents[i].get("roomId").toString());
			}
			catch (Exception e)
			{
			}

			try
			{
			    roomInstance = newEvents[i].get("roomInstance").toString();
			}
			catch (Exception e)
			{
			}
			try
			{
			    roomName = newEvents[i].get("roomName").toString();
			}
			catch (Exception e)
			{
			}

			rules.feed.addRoom(roomId, roomName, roomInstance, rule.className);

		    }
		}
		if (oldEvents != null)
		{
		    int l = oldEvents.length;
		    for (int i = 0; i < l; i++)
		    {
			String roomId = "";
			String roomClass = "";

			Object roomIdObject = oldEvents[i].get("roomId");
			if (roomIdObject != null)
			    roomId = roomIdObject.toString().trim();

			Object roomClassObject = oldEvents[i].get("roomClass");
			if (roomClassObject != null)
			    roomClass = roomClassObject.toString().trim();

			// rules.feed.removeRoom(roomId, rule.className);
			log.warn("NOT IMPLEMENTED *** removing ... roomid :" + roomId + ", roomclass :" + roomClass);
		    }
		}

	    }

	    else if (rule.action.equals("ShowUsers"))
	    {
		Rule users = rules.findOrCreateRule(rule.className, "users");
		ShowUsers.action(service, users);
	    }
	    else if (rule.action.equals("SendMessage"))
	    {
		String message = newEvents[0].get("message").toString();
		String roomInstance = newEvents[0].get("roomInstance").toString();
		int userId = Integer.parseInt(newEvents[0].get("userId").toString());
		String type = "Alert"; // par dŽfault
		String title = "";
		try
		{
		    type = newEvents[0].get("type").toString();
		}
		catch (PropertyAccessException e)
		{

		}
		try
		{
		    title = newEvents[0].get("title").toString();
		}
		catch (PropertyAccessException e)
		{

		}
		String message_noln = message.replace("\n", "|").replace("\r", "");
		System.out.println("*** SendMessage to " + userId + " [" + title + "]" + message_noln);

		try
		{
		    ArrayList<String> titleArgs = new ArrayList<String>();
		    ArrayList<String> msgArgs = new ArrayList<String>();
		    if (Thrift.client != null && userId != 0)
			Thrift.client.notifyToUser(type, userId, title, titleArgs, message, msgArgs, "", "");
		}
		catch (LTTException e)
		{
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		}
		catch (UserDontExistException e)
		{
		    System.err.println("user does not exist : sending EXIT_ROOM event");
		
		    MyEvent ev = new MyEvent(userId,0, "",roomInstance, "EXIT_ROOM","","");
		    rules.service.getEPRuntime().sendEvent(ev);
	
		}
		catch (TException e)
		{
		    // TODO Auto-generated catch block
		    e.printStackTrace();
		}
	    }
	    else if (rule.action.equals("ChangeContent"))
	    {
		String url = "";
		Object urlObject = newEvents[0].get("url");
		if (urlObject != null)
		{
		    url = urlObject.toString();
		}
		String formattedurl = "";
		if (url.startsWith("http") == false)
		{
		    Object panelObject = newEvents[0].get("panelId");
		    Object quizzObject = newEvents[0].get("quizzId");
		    Object questionidObject = newEvents[0].get("questionId");
		    formattedurl = picture_server_name + "/pq/" + quizzObject.toString() + "/" + questionidObject.toString() + "/" + panelObject.toString();
		    // System.err.println(formattedurl);
		}
		else
		    formattedurl = url; // GenericListener.getURLFromString(url);

		Object targetObject = newEvents[0].get("target");
		if (targetObject == null)
		{
		    System.err.println("missing target in ChangeContent");
		    return;
		}

		String target = targetObject.toString();

		int roomId = 0;
		try
		{
		    roomId = Integer.parseInt(newEvents[0].get("roomId").toString());
		}
		catch (java.lang.NumberFormatException e)
		{
		}

		String roomInstance = newEvents[0].get("roomInstance").toString();

		System.out.println("*** ChangeContent *** for pannel:" + target + ", in room " + roomId + "/" + roomInstance + ", with content " + formattedurl);
		if (roomId == 0)
		    return;

		// Method updateDecor
		/*
		 * StringBuilder str = new StringBuilder(); str.append("[");
		 * str.append(roomId); str.append(","); str.append("\"" + target
		 * + "\""); // decorcode str.append(","); str.append("[\"" +
		 * formattedurl + "\"],"); // playlist str.append("null"); //
		 * volume str.append("]");
		 * 
		 * WServer.Command("room-decor", "updateDecor", str.toString());
		 */
		// Method updateDecorForRoomInstance(roomId, instanceName, code,
		// playlist, volume)

		StringBuilder str = new StringBuilder();
		str.append("[");
		str.append(roomId);
		str.append(",");
		str.append("\"" + roomInstance + "\"");
		str.append(",");
		str.append("\"" + target + "\""); // decorcode
		str.append(",");
		str.append("[\"" + formattedurl + "\"],"); // playlist
		str.append("null"); // volume
		str.append("]");

		if (WServer.host != null)
		{
		try
		{
		    WServer.Command("room-decor", "updateDecorForRoomInstance", str.toString());
		}
		catch (Exception e)
		{
		    System.err.println("wserver failed :"+e.toString());
		}
		}
	    }

	    else
		System.err.println("*** " + rule.action);
	}
    }

}