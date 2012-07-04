package mambalab.cep;

import java.io.IOException;
import java.util.Map;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rabbitmq.client.Connection;

import com.rabbitmq.client.*;

public class AMQPFeed extends BaseFeed
{

    ConnectionFactory factory;
    Connection conn;
    Channel channel;
    QueueingConsumer consumer;

    public static String exchangeName = "brm-a";
    public static String queueName;
    public static String user;
    public static String password;
    public static String host;
    public static String virtualHost;
    public static int port;
    public static boolean connected = false;
    public static boolean hasbeeninterrupted = false;
    public static final String routingKey = "testroute";

    public AMQPFeed(Rules rules)
    {
	super("AMQP", rules);

	factory = new ConnectionFactory();

	factory.setHost(AMQPFeed.host);
	factory.setUsername(AMQPFeed.user);
	factory.setPassword(AMQPFeed.password);
	factory.setVirtualHost(AMQPFeed.virtualHost);
	factory.setPort(AMQPFeed.port);

	System.out.println("will connect to " + factory.getHost());

    }
/*
    public void run_deprecated()
    {

	connected = false;
	try
	{

	    conn = factory.newConnection();
	    channel = conn.createChannel();
	    channel.queueBind(AMQPFeed.queueName, AMQPFeed.exchangeName, routingKey);
	    consumer = new QueueingConsumer(channel);

	    channel.basicConsume(AMQPFeed.queueName, false, consumer);

	    System.out.println("Connected " + factory.getHost());
	    connected = true;
	}
	catch (IOException e1)
	{
	    System.err.println("Failed to connect to " + factory.getHost());
	}

	System.out.println("awaiting messages from " + queueName);
	while (isrunning && connected)
	{
	    QueueingConsumer.Delivery delivery;
	    try
	    {
		delivery = consumer.nextDelivery();
		// immediat ack
		channel.basicAck(delivery.getEnvelope().getDeliveryTag(), false);
		processMessage(delivery.getBody());

	    }
	    catch (Exception ie)
	    {
		System.err.println("AMQP Interrupted");
		connected = false;
	    }
	}
	try
	{
	    channel.close();
	    conn.close();
	}
	catch (IOException e)
	{
	    System.err.println("Failed to close");
	}

	System.out.println("-- done with AMQPFeed -- ");
	isrunning = false;
    }
*/
    public void run()
    {

	// AMQPFeed.hasbeeninterrupted = false;

	try
	{
	    conn = factory.newConnection();
	    channel = conn.createChannel();
	    channel.queueBind(AMQPFeed.queueName, AMQPFeed.exchangeName, routingKey);
	    consumer = new QueueingConsumer(channel);
	    System.out.println("Connected " + factory.getHost());
	    connected = true;

	}
	catch (IOException e)
	{
	    System.err.println("*** Failed to connect to " + factory.getHost());
	    isrunning = false;
	    return;
	}

	System.out.println("awaiting messages from " + queueName);

	try
	{
	    channel.basicConsume(queueName, true /* autoAck */, "myConsumerTag", new DefaultConsumer(channel)
	    {
		@Override
		public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties,
			byte[] body)
		{

		    processMessage(body);
		}

		@Override
		public void handleShutdownSignal(java.lang.String consumerTag, ShutdownSignalException sig)
		{
		    System.err.println("handleShutdownSignal");
		    connected = false;
		}
	    });

	    while (isrunning && connected)
	    {
		Simulator.sleep(100);
	    }
	    isconnected = false;

	}
	catch (IOException e1)
	{
	    System.err.println("failed to create default consumer");
	}

	try
	{
	    channel.close();
	    conn.close();
	}
	catch (IOException e)
	{
	    System.err.println("could not close connection");
	}

	System.out.println("-- done with AMQPFeed -- ");
	isrunning = false;
    }

    @SuppressWarnings("unchecked")
    public void processMessage(byte[] body)
    {

	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> config;
	try
	{
	    String token = new String(body);
	    config = mapper.readValue(token, Map.class);
	    Map<String, Object> metaData = (Map<String, Object>) config.get("metaData");
	    Map<String, Object> data = (Map<String, Object>) config.get("data");
	    Map<String, Object> context = (Map<String, Object>) config.get("context");

	    if (data == null || context == null)
		return;

	    Map<String, Object> agent = (Map<String, Object>) data.get("agent");
	    if (agent == null)
		return;

	    MyEvent ev = null;
	    String eventName = metaData.get("eventName").toString();
	    int userId = 0;
	    try
	    {
		userId = Integer.parseInt(agent.get("id").toString());
	    }
	    catch (Exception e)
	    {
		System.out.println("malformed token : " + token);
		return;
	    }

	    String roomInstance = "";
	    String roomName = "";

	    int roomId = 0;

	    Map<String, Object> roomObject = (Map<String, Object>) context.get("room");
	    if (roomObject == null)
		return;

	    Object roomIdObject = roomObject.get("id");
	    if (roomIdObject != null)
		try
		{
		    roomId = Integer.parseInt(roomIdObject.toString());
		}
		catch (Exception e)
		{
		    System.out.println("malformed roomNumberObject : " + token);
		    return;
		}

	    Object roomInstanceObject = roomObject.get("instance");
	    if (roomInstanceObject != null)
		roomInstance = roomInstanceObject.toString();

	    Object roomNameObject = roomObject.get("name");
	    if (roomNameObject != null)
		roomName = roomNameObject.toString();

	    String dataType = "";
	    Object dataTypeObject = data.get("type");
	    if (dataTypeObject != null)
		dataType = dataTypeObject.toString();

	    if (eventName.equals("Action"))
	    {
		if (dataType.equals("click_content"))
		{
		    String contentCode = "";
		    Object contentCodeObject = context.get("contentCode");
		    if (contentCodeObject != null)
			contentCode = contentCodeObject.toString();

		    ev = new MyEvent(userId, roomId, roomName, roomInstance, "CLICK_PANEL", null, contentCode);
		}
		else if (dataType.equals("loaded_room"))
		{
		    ev = new MyEvent(userId, roomId, roomName, roomInstance, "ENTER_ROOM", "", null);
		}
		else if (dataType.equals("exit_room"))
		{
		    ev = new MyEvent(userId, roomId, roomName, roomInstance, "EXIT_ROOM", "", null);
		}
	    }
	    else if (eventName.equals("Message"))
	    {
		;
		String messageString = "";
		Object messageObject = data.get("message");
		if (data.get("message") != null)
		    messageString = messageObject.toString();

		// transforme les messages en commande
		if (messageString.startsWith("!!!"))
		    executeCommand(messageString.substring(3), userId, roomId, roomName, roomInstance);
		else
		{
		    ev = new MyEvent(userId, roomId, roomName, roomInstance, "SAY", messageString, null);
		}

	    }

	    if (ev != null && validateEvent(ev))
	    {
		System.out.println(">>" + token);

		System.out.println(">>" + ev.toString());
		rules.service.getEPRuntime().sendEvent(ev);
	    }
	    else
	    {
		// if (userId == 15)
		System.out.println(userId + " >> " + token);
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
}