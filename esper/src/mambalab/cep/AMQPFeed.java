package mambalab.cep;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import com.espertech.esper.client.EPServiceProvider;
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

    public AMQPFeed(Rules rules)
    {
	super("AMQP", rules);
	String routingKey = "testroute";
	ConnectionFactory factory = new ConnectionFactory();

	factory.setHost(AMQPFeed.host);
	factory.setUsername(AMQPFeed.user);
	factory.setPassword(AMQPFeed.password);
	factory.setVirtualHost(AMQPFeed.virtualHost);
	factory.setPort(AMQPFeed.port);

	System.out.println("trying to connect to " + factory.getHost());

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
	    System.out.println("*** Failed to connect to " + factory.getHost());
	    // e.printStackTrace();
	}
    }

    public void run_deprecated()
    {

	if (connected == false)
	{
	    System.out.println("*** no queue -- aborting ");
	    return;
	}
	
	try
	{
	    channel.basicConsume(AMQPFeed.queueName, false, consumer);
	}
	catch (IOException e1)
	{
	    // TODO Auto-generated catch block
	    e1.printStackTrace();
	}
		 

	System.out.println("awaiting messages from " + queueName);
	while (isrunning)
	{
	    QueueingConsumer.Delivery delivery;
	    try
	    {
		delivery = consumer.nextDelivery();
	    }
	    catch (InterruptedException ie)
	    {
		continue;
	    }

	    processMessage(delivery.getBody());

	    try
	    {
		channel.basicAck(delivery.getEnvelope().getDeliveryTag(), false);
	    }
	    catch (IOException e)
	    {
		// TODO Auto-generated catch block
		e.printStackTrace();
	    }
	}
	try
	{
	    channel.close();
	    conn.close();
	}
	catch (IOException e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}

	System.out.println("-- done with AMQPFeed -- ");
	isrunning = false;
    }

    public void run()
    {

	if (connected == false)
	{
	    System.out.println("*** no queue -- aborting ");
	    return;
	}

	System.out.println("awaiting messages from " + queueName);

	boolean autoAck = false;

	    try
	    {
		channel.basicConsume(queueName, autoAck, "myConsumerTag", new DefaultConsumer(channel)
		{
		    @Override
		    public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties,
			    byte[] body) throws IOException
		    {

			// String routingKey = envelope.getRoutingKey();
			// String contentType = properties.contentType;
			long deliveryTag = envelope.getDeliveryTag();
			processMessage(body);
			channel.basicAck(deliveryTag, false);
		    }
		});
		while (isrunning)
		{
		   // channel.wait();
		   Simulator.sleep(1); // ˆ remplacer
		}
		
	    }
	    catch (IOException e1)
	    {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	    }
	
	try
	{
	    channel.close();
	    conn.close();
	}
	catch (IOException e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}

	System.out.println("-- done with AMQPFeed -- ");
	isrunning = false;
    }

    public void processMessage(byte[] bs)
    {
	String body = new String(bs);

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

	    Map<String, Object> roomObject = (Map<String, Object>) context.get("room");
	    if (roomObject == null)
		return;

	    int roomId =0;
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

		    ev = new MyEvent(userId, roomId, roomInstance, "CLICK_PANEL", null, contentCode);
		}
		else if (dataType.equals("loaded_room"))
		{
		    ev = new MyEvent(userId, roomId, roomInstance, "ENTER_ROOM", "", null);
		}
		else if (dataType.equals("exit_room"))
		{
		    ev = new MyEvent(userId, roomId, roomInstance, "EXIT_ROOM", "", null);
		}
	    }
	    else if (eventName.equals("Message"))
	    {
		String messageType = data.get("type").toString();
		String messageString = "";
		Object messageObject = data.get("message");
		if (data.get("message") != null)
		    messageString = messageObject.toString();

		// transforme les messages en commande
		if (messageString.startsWith("!!!"))
		    executeCommand(messageString.substring(3), userId, roomId,roomInstance);
		else
		{
		    ev = new MyEvent(userId, roomId, roomInstance, "SAY", messageString, null);
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