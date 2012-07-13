
package mambalab.server;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mambalab.cep.MambalabManager;
import mambalab.cep.Rules;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.eclipse.jetty.server.Request;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.AbstractHandler;

public class MambaLab extends AbstractHandler
{

    public void handle(String target, Request baseRequest, HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException
    {
        response.setStatus(200);
        baseRequest.setHandled(true);
        if(target.startsWith("/pic"))
        {
            String param = baseRequest.getParameter("text");
            if(param == null || param.isEmpty())
                param = target.substring(5);
            String nocache = baseRequest.getParameter("nocache");
            picture.handle(param, nocache, response);
            return;
        }
        if(target.startsWith("/pq"))
        {
            String params[] = target.split("/");
            picture_quizz.handle( params[2], params[3], params[4], response);
            return;
        }
        response.setContentType("text/html;charset=utf-8");
        if(target.equals("/check"))
        {
            page_check pc = new page_check();
            pc.handle( response);
            return ;
        }
        
    
        StringBuilder title = new StringBuilder();
        title.append("Mambalab Control Panel");
        if (MambaLab.cep != null)
            title.append(" <font color=red>"+cep.infraname+"</font>");
        
        response.getWriter().println("<h1>"+title+"</h1>");
        response.getWriter().println("<a href=\"/\">Status</a> ");
        response.getWriter().println("<a href=\"/result\">Results</a> ");
        response.getWriter().println("<a href=\"/check\">Check</a> ");
        response.getWriter().println(" --  ");
        response.getWriter().println("<a href=\"/rules\">Rules</a> ");
        response.getWriter().println("<a href=\"/window\">Window</a> ");
        response.getWriter().println(" --  ");
        response.getWriter().println("<a href=\"/clearcache\">Clear Cache</a> ");
        String userId = baseRequest.getParameter("userId");
        String quizzId = baseRequest.getParameter("quizzId");
        String mode= baseRequest.getParameter("mode");
        
        if (mode !=null)
        {
        if (MambaLab.cep != null &&  mode.equals("stop"))
	    {
		MambalabManager.terminate(MambaLab.cep);
		MambaLab.cep = null;
		response.getWriter().println("server stopped...");		        		
	    }
        
        if (MambaLab.cep == null && mode.equals("start"))
    	{
    	    
    	    response.getWriter().println("server restarted...");
       	    MambaLab.cep = MambalabManager.launch(MambaLab.cep_args);
    	}
        }
        
    	
        
     if (MambaLab.cep == null)
	{
	 String strstop = "<input style=\"font-size:32px\" type=\"button\" value=\"start\" onclick=\"window.location='?mode=start'\" /input>";
	 response.getWriter().println(strstop);
	 return;
	}
        else
        {
		String strstop = "<input  style=\"font-size:32px\" type=\"button\" value=\"stop\" onclick=\"window.location='?mode=stop'\" /input>";
		response.getWriter().println(strstop);
	    }


        
        
        if(target.equals("/quizz"))
            page_quizz.handle(response, quizzId);
        else
        if(target.equals("/rules"))
            page_rules.handle( response);
        else
        if(target.equals("/window"))
            page_window.handle( response);
        else
        if(target.equals("/result"))
            page_result.handle( response, quizzId);
        else
        if(target.equals("/clearcache"))
            picture.clearcache(response);
        else
        if(target.equals("/detail"))
            page_detail.handle( response, userId, quizzId);
        else
        {
            page_status.handle(response);
        }
    }

    public static void main(String args[])
        throws Exception
    {
       
        System.err.println("---- MAMBALAB SERVER ----");
        int server_port = 8080;
        if(args.length < 1)
        {
            System.err.println("missing config file");
            return;
        }
        for(int i = 0; i < args.length; i++)
            if(args[i].startsWith("-"))
            {
                if(args[i].equals("-port"))
                    server_port = Integer.parseInt(args[i + 1]);
                i++;
            }

   
        MambaLab.cep_args = args;
        cep = MambalabManager.launch(args);
        Server server = new Server(server_port);
        server.setHandler(new MambaLab());
        server.start();
        System.out.println((new StringBuilder("*** Server started ")).append(server_port).toString());
        server.join();
        
    }

    static Rules cep = null;
    static String[] cep_args = null;
   // private static final Log log = LogFactory.getLog("mambalab/MambaLab");

}
