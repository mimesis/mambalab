// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://www.kpdus.com/jad.html
// Decompiler options: packimports(3) 
// Source File Name:   page_detail.java

package mambalab.server;

import java.io.*;
import java.sql.*;
import java.util.HashMap;
import javax.servlet.http.HttpServletResponse;

import mambalab.cep.DB;
import mambalab.cep.Rules;

// Referenced classes of package mambalab:
//            Rules, DB

public class page_detail
{

    public page_detail()
    {
    }

    public static void handle(Rules cep, HttpServletResponse response, String userId, String quizzId)
    {
        try
        {
            StringBuilder strq = new StringBuilder();
            strq.append((new StringBuilder("<h1>Detail ")).append(userId).append(" / ").append(quizzId).append("</h1>").toString());
            strq.append("<table border=\"1\"><tr>");
            strq.append("<td><b>QuestionId</b></td>");
            strq.append("<td><b>Question Name</b></td>");
            strq.append("<td><b>Answered At</b></td>");
            strq.append("<td><b>Answers</b></td>");
            strq.append("</tr>");
            DB db = (DB)cep.dbs.get("esper");
            String sql_answers = (new StringBuilder(" select answers.question_id, question_name,answers.updated_at,answers from answers left join quizz on quizz.quizz_id=answers.quizz_id and answers.question_id=quizz.question_id where answers.quizz_id='")).append(quizzId).append("' and user_id=").append(userId).append(" order by answers.question_id").toString();
            System.err.println(sql_answers);
            try
            {
                db.statement.execute(sql_answers);
                ResultSet rs;
                for(rs = db.statement.getResultSet(); rs.next(); strq.append("</tr>"))
                {
                    strq.append("<tr>");
                    for(int i = 1; i <= 4; i++)
                        strq.append((new StringBuilder("<td>")).append(rs.getString(i)).append("</td>").toString());

                }

                rs.close();
            }
            catch(SQLException e)
            {
                System.err.println((new StringBuilder("query failed: ")).append(sql_answers).toString());
                System.err.println((new StringBuilder("exception ")).append(e.toString()).toString());
            }
            strq.append("</table>");
            response.getWriter().println(strq);
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }
}
