package tags;
import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class SimpleTagTest  extends SimpleTagSupport{
	public void doTag() throws JspException, IOException {
		 getJspContext().getOut().print("THIS IS THE LAMEST USE OF A CUSTOM TAG");
	}
}
