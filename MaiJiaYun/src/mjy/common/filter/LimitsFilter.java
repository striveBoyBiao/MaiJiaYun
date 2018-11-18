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
		// 获取uri地址
		HttpServletRequest httprequest = (HttpServletRequest) request;
		String uri = httprequest.getRequestURI();
		String ctx = httprequest.getContextPath();
		uri = uri.substring(ctx.length());
		// 判断admin级别网页的浏览权限
		if (uri.startsWith("/dingdan")) {
			if (httprequest.getSession().getAttribute("dingdan") == null) {
				httprequest.setAttribute("message", "您没有这个权限");
				httprequest.getRequestDispatcher("/login").forward(request, response);
				return;
			}
		}
		// 判断manage级别网页的浏览权限
		if (uri.startsWith("/manage")) {
			// 这里省去
		}

		// 下面还可以添加其他的用户权限，省去。

		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
