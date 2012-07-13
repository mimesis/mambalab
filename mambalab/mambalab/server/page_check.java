
package mambalab.server;

import java.io.*;
import java.util.Date;
import java.sql.*;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import mambalab.cep.DB;

import mambalab.cep.Rule;
import mambalab.cep.Thrift;
import mambalab.cep.WServer;


public class page_check
{
     int nbfailed = 0;
     int nbsucceeded = 0;

	final String OKStr = "OK</li>";
	final String KOStr = "<font color=red>KO</font></li>";

     
    public  void KO(StringBuilder s)
	{
	    s.append(KOStr);
	    nbfailed++;
	}
	
    public  void OK(StringBuilder s)
	{
	    s.append(OKStr);
	    nbsucceeded++;
	}

    
    public  void handle(HttpServletResponse response)
    {
	StringBuilder ret = new StringBuilder();
	nbfailed= 0;
	nbsucceeded=0;
	
	
	 ret.append("<li> Mambalab :");
	if (MambaLab.cep==null)
	    KO(ret); //ret.append(KO);
	else
	{
	    OK(ret);  // ret.append(OK);
	    ret.append("<li> Esper DB :");
	    try
	    {
		DB db = (DB)MambaLab.cep.dbs.get("esper");
		 OK(ret);
		// ret.append(OK);
		String sql = "select count(*) from quizz";
		ret.append("<li> SQL Access :");
		try
	        {
		    OK(ret);// ret.append(OK);
		    ret.append("<li> SQL Query :");
	            db.statement.execute(sql);
	        
	            ResultSet rs = db.statement.getResultSet();
	            rs.next();
	            int nb = Integer.parseInt(rs.getString(1));
	            if (nb<0)
	        	throw new Exception();
	        	
	            OK(ret);// ret.append(OK);
	           	
	        }
		catch (Exception E)
		{
		    KO(ret);// ret.append(KO);
		}           
	    }
	    catch (Exception E)
	    {
		KO(ret);//ret.append(KO);
	    }
	    
	   ret.append("<li>AMQP Feed:");
	   try
	   {
	       if ( MambaLab.cep.feed.isrunning == false )
		   throw new Exception();
	       
	       OK(ret);//ret.append(OK);
	        
	   }
	   catch(Exception e)
	   {
	       KO(ret);//ret.append(KO);
	   }
	   
	   ret.append("<li>Rule:");
	   try
	   {
	       Rule r = MambaLab.cep.findOrCreateRule("mambalab","mambalabroomswindow");
	       Iterator i = r.statement.iterator();
	      if (i.hasNext() == false)
		   throw new Exception();
	      OK(ret);//ret.append(OK);
	   }
	   catch(Exception e)
	   {
	       KO(ret);//ret.append(KO);
	   }
	   
	   ret.append("<li>Thrift:");
	   try
	   {
	      Thrift.client.countAllPlayers();
	      OK(ret);// ret.append(OK);
	   }
	   catch(Exception e)
	   {
	       KO(ret);//ret.append(KO);
	   }
	   ret.append("<li>WServer:");
	   try
	   {
	       WServer.Command("facebook-user-data", "findByFacebookId", "[698084178]");
	       OK(ret);// ret.append(OK);
	   }
	   catch(Exception e)
	   {
	       KO(ret);//ret.append(KO);
	   }

		//ret.append("<br/><li>nb succeeded:"+nbsucceeded+"</li>");
		//ret.append("<li>nb failed:"+nbfailed+"</li>");	
	
	   ret.append("<li>Gateway:");
	   int dif = 0;
	   try
	   {
	
	       if (MambaLab.cep.feed.lastEvent== null)
		   throw new Exception();
	       
	       dif = (int) (new Date().getTime() - MambaLab.cep.feed.lastEvent.getTime());
	       if (dif > 60*1000)
	       {
		   throw new Exception();
	       }
		 
	        ret.append(OKStr);
	   }
	   catch(Exception e)
	   {
	       ret.append(KOStr);	// ne compte pas la gateway
	   }   
	
		if (nbfailed==0)
		    ret.append("<p><font color=green>PASS</font></p>");
	
	
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
