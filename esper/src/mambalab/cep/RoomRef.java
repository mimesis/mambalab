package mambalab.cep;

public class RoomRef
{
    public String instance;
    public String className;
    public int id;
    public RoomRef(int id, String instance,String className)
    {
	this.className = className;
	this.instance =instance;
	this.id = id;
    }
}