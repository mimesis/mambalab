// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   page_status.java

package mambalab.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletResponse;

import mambalab.cep.AMQPFeed;
import mambalab.cep.DB;
import mambalab.cep.MambalabManager;
import mambalab.cep.RoomRef;
import mambalab.cep.Rules;
import mambalab.cep.Thrift;
import mambalab.cep.WServer;

// Referenced classes of package mambalab:
//            WServer, Thrift, AMQPFeed, Rules, 
//            BaseFeed, RoomRef, DB

public class page_status
{

    public page_status()
    {
    }

    public static void handle( HttpServletResponse response)
    {
	
	
        try
        {
            
                   
            Rules cep = MambaLab.cep;
            
            StringBuilder strc = new StringBuilder();
            strc.append("<h2>Config</h2><pre>");
            strc.append( "server name:"+cep.servername+"\n");
            strc.append( "infra name:"+cep.infraname+"\n");
            
            strc.append((new StringBuilder("Wserver:")).append(WServer.host).append("\n").toString());
            strc.append((new StringBuilder("Thrift:")).append(Thrift.host).append("\n").toString());
            strc.append((new StringBuilder("AMQP:")).append(AMQPFeed.host).append("\n").toString());
            response.getWriter().println(strc);
            StringBuilder strf = new StringBuilder();
            
          
            strf.append("<h2>Feed</h2><pre>");
            strf.append(cep.feed.getStatus());
            strc.append("</pre>");
            response.getWriter().println(strf);
            Iterator ii = cep.feed.roomRefs.iterator();
            StringBuilder strsr = new StringBuilder();
            strsr.append("<h2>Rooms</h2><pre>");
            RoomRef r;
            for(; ii.hasNext(); strsr.append((new StringBuilder(String.valueOf(r.instance))).append("=").append(r.className).append("\n").toString()))
                r = (RoomRef)ii.next();

            StringBuilder strr = new StringBuilder();
            strr.append("<h2>Rules</h2><pre>");
            Iterator files_iter = cep.files.iterator();
            
            while( files_iter.hasNext())
            {
        	String file = (String) files_iter.next();
        	strr.append(file+"\n");
            }
            response.getWriter().println(strr);
            
            
            strsr.append("</pre>");
            response.getWriter().println(strsr);
            StringBuilder strq = new StringBuilder();
            strq.append("<h2>Quizz</h2><pre>");
            strq.append("<table border=\"1\"><tr>");
            strq.append("<td><b>QuizzId</td>");
            strq.append("<td><b>RoomId</b></td>");
            strq.append("<td><b>RoomInstance</b></td>");
            strq.append("<td><b>Enabled</b></td>");
            strq.append("<td><b>Results</b></td>");
            DB db = (DB)cep.dbs.get("esper");
            String sql = "select quizz_id,room_id,room_instance,activated from room_quizz";
            db.statement.execute(sql);
            String quizzId;
            for(ResultSet rs = db.statement.getResultSet(); rs.next(); strq.append((new StringBuilder("<td><a href=\"result?quizzId=")).append(quizzId).append("\">view</a></td>").toString()))
            {
                strq.append("<tr>");
                quizzId = rs.getString(1);
                String roomId = rs.getString(2);
                String roomInstance= rs.getString(3);
                String activated = rs.getString(4);
                strq.append((new StringBuilder("<td><a href=\"quizz?quizzId=")).append(quizzId).append("\">").append(quizzId).append("</a></td>").toString());
                strq.append((new StringBuilder("<td>")).append(roomId).append("</td>").toString());
                strq.append((new StringBuilder("<td>")).append(roomInstance).append("</td>").toString());
                strq.append((new StringBuilder("<td>")).append(activated).append("</td>").toString());
            }
            response.getWriter().println(strq);
            
           
            
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
        catch(SQLException e)
        {
            try
	    {
		response.getWriter().println("ERROR : DATABASE NOT ACCESSIBLE");
	    }
	    catch (IOException e1)
	    {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	    }
            e.printStackTrace();
        }
    }
}
