package mjy.order.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HeBing
 */
@WebServlet("/servlet/order/heBing")
public class HeBing extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 实现思路：
		 * 1.当页面请求跳转到合并页面时，首先第一件事就是检查订单状态为审单的订单，查看审单中是否存在用户名相同，
		 * 		手机号相同，物流相同的快递（即订单为同一人的），如果有，则将该列订单显示在下方，并且将
		 * 		页面实现的跟卖家云中的页面相同（订单商品可以不同）
		 * 2.同样的，将查询的结果以转发的方式发送到对应的jsp
		 * 3.先实现查询，后续的再说
		 */
		request.getRequestDispatcher("/Order/jsp/daiHeBing.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
