// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   page_status.java

package mambalab.server;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.http.HttpServletResponse;

import mambalab.cep.AMQPFeed;
import mambalab.cep.DB;

import mambalab.cep.RoomRef;
import mambalab.cep.Rules;
import mambalab.cep.Thrift;
import mambalab.cep.WServer;



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
            
            strc.append("</pre>");
      
            response.getWriter().println(strc);
            StringBuilder strf = new StringBuilder();
            
          
            strf.append("<h2>Feed</h2><pre>");
            strf.append(cep.feed.getStatus());
            strf.append("</pre>");
            response.getWriter().println(strf);
            
            StringBuilder strsr = new StringBuilder();
            strsr.append("<h2>Rooms</h2><pre>");
            RoomRef r;
            Iterator<RoomRef> ii = cep.feed.roomRefs.iterator();
            while( ii.hasNext() )
            {
        	r = (RoomRef)ii.next();
        	strsr.append( r.roomName+ "=" + r.ruleName+ "\n");
            }   

            StringBuilder strr = new StringBuilder();
            strr.append("<h2>Rules</h2><pre>");
            Iterator<String> files_iter = cep.files.iterator();
            
            while( files_iter.hasNext())
            {
        	String file = (String) files_iter.next();
        	strr.append(file+"\n");
            }
            strr.append("</pre>");
            response.getWriter().println(strr);
            
                
            StringBuilder strq = new StringBuilder();
            strq.append("<h2>Room Configuration</h2>");
            strq.append("<table border=\"1\"><tr>");
            strq.append("<td><b>QuizzId</td>");
            strq.append("<td><b>RoomId</b></td>");
            strq.append("<td><b>RoomName</b></td>");
            strq.append("<td><b>Enabled</b></td>");
           // strq.append("<td><b>Results</b></td>");
            DB db = (DB)cep.dbs.get("esper");
            String sql = "select quizz_id,room_id,room_name,activated from room_quizz";
            db.statement.execute(sql);
            String quizzId;
            for(ResultSet rs = db.statement.getResultSet(); rs.next(); )
            {
                strq.append("<tr>");
                quizzId = rs.getString(1);
                String roomId = rs.getString(2);
                String roomName= rs.getString(3);
                String activated = rs.getString(4);
                strq.append( "<td><a href=\"quizz?quizzId="+quizzId+"\">"+quizzId+"</a></td>");
                strq.append( "<td>" + roomId + "</td>");
                strq.append( "<td>" + roomName+ "</td>");
                strq.append( "<td>" + activated + "</td>");
            }
            strq.append("</table>");
            response.getWriter().println(strq);
            
            strq = new StringBuilder();
            strq.append("<h2>Quizz</h2>");
            strq.append("<table border=\"1\"><tr>");
            strq.append("<td><b>QuizzId</td>");
            strq.append("<td><b>Nb Results</b></td>");
            strq.append("<td><b>Results</b></td>");
         //   DB db = (DB)cep.dbs.get("esper");
            sql = "select quizz_id,count(distinct(user_id)),quizz_id from  answers group by quizz_id";
            db.statement.execute(sql);
           // String quizzId;
            for(ResultSet rs = db.statement.getResultSet(); rs.next(); )
            {
                strq.append("<tr>");
                quizzId = rs.getString(1);
                String nb = rs.getString(2);
                strq.append( "<td><a href=\"quizz?quizzId="+quizzId+"\">"+quizzId+"</a></td>");
                strq.append( "<td>" + nb + "</td>");
                strq.append("<td><a href=\"result?quizzId="+quizzId+"\">view</a></td>");
            }
            strq.append("</table>");
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
