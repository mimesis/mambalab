package mambalab.server;

import java.io.*;
import java.sql.*;
import javax.servlet.http.HttpServletResponse;

import mambalab.cep.DB;
import mambalab.cep.Rules;

public class page_result
{

    public page_result()
    {
    }

    public static void handle(HttpServletResponse response, String _quizzId)
    {
	
	Rules cep = MambaLab.cep;
	
        try
        {
            StringBuilder strq = new StringBuilder();
            strq.append("<h2>Result</h2>");
            strq.append("<table border=\"1\"><tr>");
            strq.append("<td><b>Recorded_at</td>");
            strq.append("<td><b>User</b></td>");
            strq.append("<td><b>QuizzId</b></td>");
            strq.append("<td><b>Nb question answered</b></td>");
            strq.append("<td><b>Answers</b></td>");
            strq.append("</tr>");
            DB db = (DB)cep.dbs.get("esper");
            String filterquizz = "";
            if(_quizzId != null)
                filterquizz = (new StringBuilder(" where quizz_id='")).append(_quizzId).append("'").toString();
            String sql = (new StringBuilder("select max(updated_at) as recorded_at,user_id,quizz_id,count(*) as nb from answers ")).append(filterquizz).append(" group by quizz_id,user_id order by recorded_at desc").toString();
            try
            {
                db.statement.execute(sql);
                ResultSet rs;
                for(rs = db.statement.getResultSet(); rs.next(); strq.append("</tr>"))
                {
                    strq.append("<tr>");
                    for(int i = 1; i <= 4; i++)
                        strq.append((new StringBuilder("<td>")).append(rs.getString(i)).append("</td>").toString());

                    String userId = rs.getString(2);
                    String quizzId = rs.getString(3);
                    strq.append((new StringBuilder("<td><a href=\"/detail?userId=")).append(userId).append("&quizzId=").append(quizzId).append("\">Detail</a></td>").toString());
                }

                rs.close();
            }
            catch(SQLException e)
            {
                System.err.println((new StringBuilder("query failed: ")).append(sql).toString());
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
