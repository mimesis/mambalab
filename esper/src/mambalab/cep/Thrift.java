package mambalab.cep;

import net.blackmamba.thrift.ltt.LiveTeamToolsExtended.Client;

import org.apache.thrift.protocol.TBinaryProtocol;
//import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TFramedTransport;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TTransportException;

public class Thrift
{
    static public TSocket socket;
    static public TTransport transport = null;
    static public TBinaryProtocol protocol;
    static public Client client;
    static public String host;

    public static void Init(String host, int port)
    {
	Thrift.host = host;
	System.out.println("thrift " + host + ":" + port);
	try
	{
	    socket = new TSocket(host, port);
	    socket.setTimeout(10000);
	    socket.open();
	    protocol = new TBinaryProtocol(socket);
	    client = new Client(protocol);
	    System.out.println("thrift " + host + ":" + port + " initialized.");

	}
	catch (TTransportException e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}

    }

    public static void Close()
    {
	if (transport != null)
	    transport.close();
    }

}
