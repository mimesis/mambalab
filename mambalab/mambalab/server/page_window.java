
package mambalab.server;

import com.espertech.esper.client.*;
import java.io.IOException;
import java.util.Iterator;
import javax.servlet.http.HttpServletResponse;
import mambalab.cep.Rule;
import mambalab.cep.Rules;


public class page_window
{


    public static void display(Rules cep,HttpServletResponse response, boolean isWindow)
    {

	
        try
        {
            for(Iterator<Rule> safeIter = cep.rules.iterator(); safeIter.hasNext();)
            {
                Rule r = (Rule)safeIter.next();
                if(r.statement != null)
                {
                    Iterator i = r.statement.iterator();
                    int id = 0;
                    if(i.hasNext() && (r.epl.contains("window") && isWindow || !r.epl.contains("window") && !isWindow))
                    {
                        StringBuilder str = new StringBuilder();
                        str.append((new StringBuilder("<b>")).append(r.className).append(".").append(r.name).append("=").append(r.epl).append("</b>\n").toString());
                        str.append("<pre>");
                        String json;
                        for(; i.hasNext(); str.append((new StringBuilder(String.valueOf(json))).append("\n").toString()))
                        {
                            EventBean eb = (EventBean)i.next();
                            json = cep.service.getEPRuntime().getEventRenderer().renderJSON(Integer.toString(id++), eb);
                            json = json.replaceAll("\n", " ");
                        }

                        str.append("</pre>");
                        response.getWriter().println(str);
                    }
                }
            }

        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }

    public static void handle( HttpServletResponse response)
    {
	Rules cep = MambaLab.cep;
	
        try
        {
            response.getWriter().println("<h2>Windows</h2>");
            display(cep, response, true);
            response.getWriter().println("<h2>All</h2>");
            display(cep, response, false);
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
    }
}
