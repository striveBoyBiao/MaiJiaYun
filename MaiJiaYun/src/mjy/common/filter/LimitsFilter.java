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

@WebFilter("/LimitsFilter")

public class LimitsFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public LimitsFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// ��ȡuri��ַ
		HttpServletRequest httprequest = (HttpServletRequest) request;
		String uri = httprequest.getRequestURI();
		String ctx = httprequest.getContextPath();
		uri = uri.substring(ctx.length());
		// �ж�admin������ҳ�����Ȩ��
		if (uri.startsWith("/dingdan")) {
			if (httprequest.getSession().getAttribute("dingdan") == null) {
				httprequest.setAttribute("message", "��û�����Ȩ��");
				httprequest.getRequestDispatcher("/login").forward(request, response);
				return;
			}
		}
		// �ж�manage������ҳ�����Ȩ��
		if (uri.startsWith("/manage")) {
			// ����ʡȥ
		}

		// ���滹��������������û�Ȩ�ޣ�ʡȥ��

		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
