// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   page_quizz.java

package mambalab.server;

import java.io.*;
import java.sql.*;
import java.util.HashMap;
import javax.servlet.http.HttpServletResponse;

import mambalab.cep.DB;
import mambalab.cep.GenericListener;
import mambalab.cep.Rules;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

// Referenced classes of package mambalab:
//            Rules, DB, GenericListener

public class page_quizz
{

    public page_quizz()
    {
    }

    public static void handle(HttpServletResponse response, String quizzId)
    {
	
	Rules cep = MambaLab.cep;
        try
        {
            StringBuilder strq = new StringBuilder();
            strq.append("<h2>Quizz</h2>");
            strq.append("<table border=\"1\"><tr>");
            strq.append("<td><b>Quizz</td>");
            strq.append("<td><b>Question Id</b></td>");
            strq.append("<td><b>Name</b></td>");
            strq.append("<td><b>Type</b></td>");
            strq.append("<td><b>Expected Answers</b></td>");
            strq.append("<td><b>Notification</b></td>");
            strq.append("<td><b>P1</b></td>");
            strq.append("<td><b>P2</b></td>");
            strq.append("</tr>");
            DB db = (DB)cep.dbs.get("esper");
            String sql = (new StringBuilder("select quizz_id,question_id,question_name,quizz_type, answer,notification,panneau1,panneau2 from quizz where quizz_id='")).append(quizzId).append("' order by quizz_id,question_id").toString();
            System.err.println(sql);
            try
            {
                db.statement.execute(sql);
                ResultSet rs;
                for(rs = db.statement.getResultSet(); rs.next(); strq.append("</tr>"))
                {
                    strq.append("<tr>");
                    for(int i = 1; i <= 6; i++)
                        strq.append((new StringBuilder("<td>")).append(rs.getString(i)).append("</td>").toString());

                    String p1 = rs.getString(7);
                    String url1 = "";
                    if(p1 != null && !p1.isEmpty())
                        url1 = GenericListener.getURLFromString(p1);
                    int w = 512;
                    int h = 288;
                    if(url1.startsWith("http://www.dailymotion.com"))
                        strq.append((new StringBuilder("<td><iframe frameborder=\"0\" width=\"512\" height=\"288\" src=\"")).append(url1).append("\"></iframe></td>").toString());
                    else
                        strq.append((new StringBuilder("<td><img width=\"")).append(w).append("\" height=\"").append(h).append("\" src=\"").append(url1).append("\" /></td>").toString());
                    String p2 = rs.getString(8);
                    String url2 = "";
                    if(p2 != null && !p2.isEmpty())
                        url2 = GenericListener.getURLFromString(p2);
                    strq.append((new StringBuilder("<td><img width=\"")).append(w).append("\" height=\"").append(h).append("\" src=\"").append(url2).append("\" /></td>").toString());
                }

                rs.close();
            }
            catch(SQLException e)
            {
                System.err.println((new StringBuilder("query failed: ")).append(sql).toString());
            }
            strq.append("</table>");
            response.getWriter().println(strq);
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }

    private static final Log log = LogFactory.getLog("mambalab/page_quizz");

}
