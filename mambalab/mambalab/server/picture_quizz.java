
package mambalab.server;

import java.sql.*;
import javax.servlet.http.HttpServletResponse;

import mambalab.cep.DB;
import mambalab.cep.Rules;


public class picture_quizz
{

    public picture_quizz()
    {
    }

    public static void handle(String quizzId, String questionId, String panelId, HttpServletResponse response)
    {
	Rules cep = MambaLab.cep;
	
        DB db = (DB)cep.dbs.get("esper");
        String sql = (new StringBuilder("select panneau")).append(panelId).append(" from quizz where quizz_id='").append(quizzId).append("' and question_id='").append(questionId).append("'").toString();
        String text = "[MB]";
        try
        {
            db.statement.execute(sql);
            ResultSet rs = db.statement.getResultSet();
            Boolean b = Boolean.valueOf(rs.next());
            if(b.booleanValue())
                text = rs.getString(1);
            rs.close();
        }
        catch(SQLException e)
        {
            System.err.println((new StringBuilder("query failed: ")).append(sql).toString());
        }
        picture.handle(text, null, response);
    }
}
