
package mambalab.server;

import java.io.IOException;
import java.util.Iterator;
import javax.servlet.http.HttpServletResponse;

import mambalab.cep.Rule;
import mambalab.cep.Rules;

public class page_rules
{

    
    public static void handle(HttpServletResponse response)
    {
	
	Rules cep = MambaLab.cep;
	
        try
        {
            Iterator<Rule> safeIter = cep.rules.iterator();
            StringBuilder str = new StringBuilder();
            str.append("<h2>Rules</h2><pre>");
            while(safeIter.hasNext()) 
            {
                Rule r = (Rule)safeIter.next();
                if(r.statement != null)
                    str.append((new StringBuilder(String.valueOf(r.className))).append(".").append(r.name).append("=").append(r.epl).append("\n").toString());
            }
            str.append("</pre>");
            response.getWriter().println(str);
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }
}
