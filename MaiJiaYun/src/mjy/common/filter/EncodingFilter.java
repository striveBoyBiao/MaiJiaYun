package mjy.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebFilter("/*")
public class EncodingFilter implements Filter {

	String filterEncoding="utf-8";

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {

		HttpServletRequest httpRequest = (HttpServletRequest) arg0;
		HttpServletResponse httpResponse = (HttpServletResponse) arg1;

		// post��ʽ���봦��
		httpRequest.setCharacterEncoding("utf-8");
		httpResponse.setCharacterEncoding("utf-8");
		//httpResponse.setContentType("text/html;charset=" + filterEncoding);

		// �������Ӧ�Ĵ���
		arg2.doFilter(httpRequest, arg1);
		//tomcat7get��ʽ���봦��  
		//arg2.doFilter(new MyHttpServletRequestWrapper(httpRequest), arg1);
		//arg2.doFilter(arg0, arg1);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

		filterEncoding = arg0.getInitParameter("encoding");

		String ContextEncoding = arg0.getServletContext().getInitParameter("encoding");

	}

}
