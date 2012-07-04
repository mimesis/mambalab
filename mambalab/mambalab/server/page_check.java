
package mambalab.server;

import java.io.*;
import java.sql.*;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import mambalab.cep.DB;
import mambalab.cep.GenericListener;
import mambalab.cep.Rule;
import mambalab.cep.Rules;
import mambalab.cep.Thrift;
import mambalab.cep.WServer;

import net.blackmamba.thrift.ltt.LTTException;
import org.apache.thrift.TException;

public class page_check
{

  
    public static void handle(HttpServletResponse response)
    {
	StringBuilder ret = new StringBuilder();
	final String OK = "OK</li>";
	final String KO = "<font color=red>KO</font></li>";
	
	 ret.append("<li> Mambalab :");
	if (MambaLab.cep==null)
	    ret.append(KO);
	else
	{
	    ret.append(OK);
	    ret.append("<li> Esper DB :");
	    try
	    {
		DB db = (DB)MambaLab.cep.dbs.get("esper");
		ret.append(OK);
		String sql = "select count(*) from quizz";
		ret.append("<li> SQL Access :");
		try
	        {
		    ret.append(OK);
		    ret.append("<li> SQL Query :");
	            db.statement.execute(sql);
	        
	            ResultSet rs = db.statement.getResultSet();
	            rs.next();
	            int nb = Integer.parseInt(rs.getString(1));
	            if (nb<0)
	        	throw new Exception();
	        	
	            ret.append(OK);
	           	
	        }
		catch (Exception E)
		{
		    ret.append(KO);
		}           
	    }
	    catch (Exception E)
	    {
		ret.append(KO);
	    }
	    
	   ret.append("<li>AMQP Feed:");
	   try
	   {
	       if ( MambaLab.cep.feed.isrunning == false )
		   throw new Exception();
	       
	       ret.append(OK);
	        
	   }
	   catch(Exception e)
	   {
	       ret.append(KO);
	   }
	   
	   ret.append("<li>Rule:");
	   try
	   {
	       Rule r = MambaLab.cep.findOrCreateRule("mambalab","mambalabroomswindow");
	       Iterator i = r.statement.iterator();
	      if (i.hasNext() == false)
		   throw new Exception();
	       ret.append(OK);
	   }
	   catch(Exception e)
	   {
	       ret.append(KO);
	   }
	   
	   ret.append("<li>Thrift:");
	   try
	   {
	       int nb = Thrift.client.countAllPlayers();
	       ret.append(OK);
	   }
	   catch(Exception e)
	   {
	       ret.append(KO);
	   }
	   ret.append("<li>WServer:");
	   try
	   {
	       WServer.Command("facebook-user-data", "findByFacebookId", "[698084178]");
	       ret.append(OK);
	   }
	   catch(Exception e)
	   {
	       ret.append(KO);
	   }
	 
	}
	
	
	
	try
	{
	    response.getWriter().println(ret);
	}
	catch (IOException e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
        
    }

  
}
