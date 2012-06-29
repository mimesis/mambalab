package mambalab.cep;
import java.util.Iterator;

import com.espertech.esper.client.EPServiceProvider;
import com.espertech.esper.client.EventBean;

public class ShowUsers {

	public static void action(EPServiceProvider service, Rule r) {
		Iterator<EventBean> i = r.statement.iterator();
		int id=0;
		while (i.hasNext()) {
			EventBean eb = i.next();
			String json = service.getEPRuntime().getEventRenderer().renderJSON(Integer.toString(id++),eb);
    		json = json.replaceAll("\n"," ");
			System.out.println(json);
		}

	}
}