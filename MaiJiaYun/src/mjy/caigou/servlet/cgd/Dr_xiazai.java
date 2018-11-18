package mjy.caigou.servlet.cgd;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dr_xiazai
 */
@WebServlet("/caigou/servlet/Dr_xiazai")
public class Dr_xiazai extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/msword;charset=utf-8");
		//����.xls��ȡ������
		response.addHeader("content-disposition", "attachment;filename=importCaigouDanTemplete.xls");
		
		String filePath=request.getServletContext().getRealPath("/res/importCaigouDanTemplete.xls");
		
		//��ȡ�ļ���������
		FileInputStream fis=new FileInputStream(new File(filePath));
		
		//��ȡ��Ӧ�������
		OutputStream os=response.getOutputStream();
		
		byte[] buf=new byte[1024];
		int len=0;
		while((len=fis.read(buf))!=-1){
			os.write(buf, 0, len);
		}
		fis.close();
		os.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
