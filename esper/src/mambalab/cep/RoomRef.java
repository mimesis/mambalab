package mambalab.cep;

public class RoomRef
{
    public int roomId;
    public String roomName;
    public String roomInstance;
    public String ruleName;
    
    public RoomRef(int roomId, String roomName, String roomInstance,String ruleName)
    {
	this.roomId = roomId;
	this.roomName = roomName;
	this.roomInstance = roomInstance;
	this.ruleName = ruleName;
    }
}