// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   MambaLab.java

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

// Referenced classes of package mambalab:
//            picture, picture_quizz, page_quizz, page_rules, 
//            page_window, page_result, page_detail, page_status, 
//            MambalabManager, Rules

public class MambaLab extends AbstractHandler
{

    public MambaLab()
    {
    }

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
            picture_quizz.handle(cep, params[2], params[3], params[4], response);
            return;
        }
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().println("<h1>MambaLab Control Panel</h1>");
        response.getWriter().println("<a href=\"/\">Status</a> ");
        response.getWriter().println("<a href=\"/result\">Results</a> ");
        response.getWriter().println(" --  ");
        response.getWriter().println("<a href=\"/rules\">Rules</a> ");
        response.getWriter().println("<a href=\"/window\">Window</a> ");
        response.getWriter().println("<a href=\"/clearcache\">Clear Cache</a> ");
        String userId = baseRequest.getParameter("userId");
        String quizzId = baseRequest.getParameter("quizzId");
        if(target.equals("/quizz"))
            page_quizz.handle(cep, response, quizzId);
        else
        if(target.equals("/rules"))
            page_rules.handle(cep, response);
        else
        if(target.equals("/window"))
            page_window.handle(cep, response);
        else
        if(target.equals("/result"))
            page_result.handle(cep, response, quizzId);
        else
        if(target.equals("/clearcache"))
            picture.clearcache(response);
        else
        if(target.equals("/detail"))
            page_detail.handle(cep, response, userId, quizzId);
        else
            page_status.handle(cep, response);
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

        cep = MambalabManager.launch(args);
        System.out.println((new StringBuilder("*** Server about to start ")).append(server_port).toString());
        Server server = new Server(server_port);
        server.setHandler(new MambaLab());
        System.out.println((new StringBuilder("*** Server starting ")).append(server_port).toString());
        server.start();
        System.out.println((new StringBuilder("*** Server started ")).append(server_port).toString());
        server.join();
        System.out.println("...press enter to stop simulation...");
        try
        {
            System.in.read();
        }
        catch(IOException e)
        {
            log.error((new StringBuilder("Exception reading keyboard input: ")).append(e.getMessage()).toString(), e);
        }
    }

    static Rules cep;
    private static final Log log = LogFactory.getLog("mambalab/MambaLab");

}
