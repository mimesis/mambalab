package mambalab.cep;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

//WServer.Command("facebook-user-data","findByFacebookId","[698084178]");

public class WServer
{
    public static String host = null;
    public static int port;

    @SuppressWarnings("unchecked")
    static public Map<String, Object> Command(String service, String command, String params) throws Exception
    {

	try
	{

	    StringBuilder json = new StringBuilder();
	    json.append("{");
	    json.append("\"method\" : \"" + command + "\",");
	    json.append("\"params\": " + params + ",");
	    json.append("\"id\": 1");
	    json.append("}");

	    System.out.println(json);
	    if (host==null)
		throw new Exception();

	    String url = "http://" + host + ":" + port + "/service/v1/" + service + "/rpc";

	    HttpURLConnection connection;
	    connection = (HttpURLConnection) new URL(url).openConnection();
	    connection.setDoOutput(true);
	    connection.setRequestMethod("POST");
	    connection.setRequestProperty("Content-Type", "application/json");
	    connection.setRequestProperty("Content-Length", Integer.toString(json.length()));
	    connection.setRequestProperty("Host", host);
	    connection.setConnectTimeout(5000);

	    connection.getOutputStream().write(json.toString().getBytes("UTF-8"));
	    InputStream responseStream = connection.getInputStream();
	    ByteArrayOutputStream responseBytes = new ByteArrayOutputStream();
	    bufferedCopyStream(responseStream, responseBytes);
	    responseBytes.flush();
	    responseBytes.close();
	    ObjectMapper mapper = new ObjectMapper();
	    String json_ret = new String(responseBytes.toByteArray(), "UTF-8");
	    System.out.println("wserver:" + json_ret);
	    Map<String, Object> map_ret = mapper.readValue(json_ret, Map.class);
	    return map_ret;

	}
	catch(Exception e)
	{
	    System.err.println("failed");
	    throw e;
	}
	/*
	catch (MalformedURLException e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
	catch (IOException e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
	catch (Exception e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
	*/
	//return null;
    }

    public static boolean bufferedCopyStream(InputStream inStream, OutputStream outStream) throws Exception
    {
	BufferedInputStream bis = new BufferedInputStream(inStream);
	BufferedOutputStream bos = new BufferedOutputStream(outStream);
	while (true)
	{
	    int data = bis.read();
	    if (data == -1)
	    {
		break;
	    }
	    bos.write(data);
	}
	bos.flush();
	return true;
    }
}
