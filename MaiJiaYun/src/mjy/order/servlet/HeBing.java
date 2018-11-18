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
		 * ʵ��˼·��
		 * 1.��ҳ��������ת���ϲ�ҳ��ʱ�����ȵ�һ���¾��Ǽ�鶩��״̬Ϊ�󵥵Ķ������鿴�����Ƿ�����û�����ͬ��
		 * 		�ֻ�����ͬ��������ͬ�Ŀ�ݣ�������Ϊͬһ�˵ģ�������У��򽫸��ж�����ʾ���·������ҽ�
		 * 		ҳ��ʵ�ֵĸ��������е�ҳ����ͬ��������Ʒ���Բ�ͬ��
		 * 2.ͬ���ģ�����ѯ�Ľ����ת���ķ�ʽ���͵���Ӧ��jsp
		 * 3.��ʵ�ֲ�ѯ����������˵
		 */
		request.getRequestDispatcher("/Order/jsp/daiHeBing.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
