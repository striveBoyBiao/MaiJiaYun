package mjy.common.filter;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class MyHttpServletRequestWrapper extends HttpServletRequestWrapper {

	public MyHttpServletRequestWrapper(HttpServletRequest request) {
		super(request);
	}

	@Override
	public String getParameter(String name) {

		String value = super.getParameter(name);
		if (value != null) {
			if (this.getMethod().equalsIgnoreCase("get")) {
				try {
					value = new String(value.getBytes("iso-8859-1"), "utf-8");
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return value;
	}

}
