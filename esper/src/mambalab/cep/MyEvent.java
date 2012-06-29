package mambalab.cep;
public class MyEvent
{

    public String eventName;
    public int userId;
    public int roomId;
    public String roomInstance;
    public String eventParam;
    public String eventParam2;
    

    public MyEvent( int userId, int roomId, String roomInstance, String eventName,String eventParam, String eventParam2)
    {
	this.eventName = eventName;
	this.eventParam = eventParam;
	this.eventParam2 = eventParam2;
	this.roomId = roomId;
	this.roomInstance = roomInstance;
	this.userId = userId;
    }

    public String getEventName()
    {
	return this.eventName;
    }

    public String getEventParam()
    {
	return this.eventParam;
    }


    public String getEventParam2()
    {
	return this.eventParam2;
    }

    
    public int getRoomId()
    {
	return this.roomId;
    }

    public String getRoomInstance()
    {
	return this.roomInstance;
    }

    
    public int getUserId()
    {
	return this.userId;
    }
    
    public String toString()
    {
	return "eventName:" + this.eventName + ",userId:" + this.userId + ",roomId:" + this.roomId+",roomInstance:" + this.roomInstance + ",eventParam:" + this.eventParam+" ,eventParam2:" + this.eventParam2;
    }
}
