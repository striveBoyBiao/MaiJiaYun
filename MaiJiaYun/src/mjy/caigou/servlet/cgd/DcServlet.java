package mjy.caigou.servlet.cgd;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;

import mjy.caigou.dao.impl.PurchaseDaoImpl;
import mjy.caigou.po.PurchasePO;
import mjy.caigou.vo.PurchaseVO;

/**
 * Servlet implementation class DcServlet
 */
@WebServlet("/caigou/servlet/DcServlet")
public class DcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ��ȡ����  ���ܴ������Ĳ���
		
		String [] strs=request.getParameterValues("checkOrder");	
		// �Դ������Ĳ��������ж�
		if(strs!=null&&!strs.equals("")){
		//��������
		 PurchaseDaoImpl ps= new  PurchaseDaoImpl();
		 PurchasePO purchasePo=new PurchasePO();
		 
		//ִ��ҵ���
		for (String str : strs) {
			
			purchasePo.setPurchaseCode(str);
			//���ݴ������Ĳɹ�����Ų������
			List<PurchaseVO> list=ps.listByCom(purchasePo, str);
			
			
			
			// 1.����һ��workbook����Ӧһ��Excel�ļ�
			 HSSFWorkbook wb=new HSSFWorkbook();
			 
		     // 2.��workbook�����һ��sheet����ӦExcel�е�һ��sheet
		     HSSFSheet sheet=wb.createSheet("bb");
		     // 3.��sheet����ӱ�ͷ��0�У��ϰ汾poi��excel��������������short
		     HSSFRow row = sheet.createRow(0);
		     // 4.������Ԫ������ֵ��ͷ�����ñ�ͷ����
		     HSSFCellStyle style=wb.createCellStyle();
		     // ���и�ʽ
		     style.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
		     style.setAlignment(HSSFCellStyle.ALIGN_FILL);
		     style.setBorderLeft(HSSFCellStyle.ALIGN_FILL);
		     
		     
		     

		     // ���ñ�ͷ
		     HSSFCell cell = row.createCell(0);
		     cell.setCellValue("�ɹ������");
		     cell.setCellStyle(style);

		     cell = row.createCell(1);
		     cell.setCellValue("��Ӧ��");
		     cell.setCellStyle(style);

		     cell = row.createCell(2);
		     cell.setCellValue("�ֿ�");
		     cell.setCellStyle(style);
		     
		     cell = row.createCell(3);
		     cell.setCellValue("�ɹ�����");
		     cell.setCellStyle(style);
		     
		     cell = row.createCell(4);
		     cell.setCellValue("���������");
		     cell.setCellStyle(style);

		     cell = row.createCell(5);
		     cell.setCellValue("�ϼƽ��");
		     cell.setCellStyle(style);

		     cell = row.createCell(6);
		     cell.setCellValue("����ʱ��");
		     cell.setCellStyle(style);
		     
		     cell = row.createCell(7);
		     cell.setCellValue("�Ƶ���");
		     cell.setCellStyle(style);
		     
		     cell = row.createCell(8);
		     cell.setCellValue("�ɹ������");
		     cell.setCellStyle(style);
		     
		     cell = row.createCell(9);
		     cell.setCellValue("��ע");
		     cell.setCellStyle(style);
		     

			 // ѭ��������д��Excel
			     for (int i = 0; i < list.size(); i++) {
			       row = sheet.createRow((int) i + 1);

			       // ������Ԫ������ֵ
			       row.createCell(0).setCellValue(list.get(i).getPurchaseCode());
			       row.createCell(1).setCellValue(list.get(i).getSupplierCName());
			       row.createCell(2).setCellValue(list.get(i).getWareHouseName());
			       row.createCell(3).setCellValue(list.get(i).getPurchaseNumber());
			       row.createCell(4).setCellValue(list.get(i).getState());
			       row.createCell(5).setCellValue(list.get(i).getPurchaseSum());
			       row.createCell(6).setCellValue(list.get(i).getCreatTime());
			       row.createCell(7).setCellValue(list.get(i).getUserType());
			       row.createCell(8).setCellValue(list.get(i).getUserType());
			       row.createCell(9).setCellValue(list.get(i).getRemark());
			      
			     }
			     
			     String fileName = "һ�ű�";
			     
			      ByteArrayOutputStream os = new ByteArrayOutputStream();
			      wb.write(os);
			      byte[] content = os.toByteArray();
			      InputStream is = new ByteArrayInputStream(content);
			      // ����response���������Դ�����ҳ��
			      response.reset();
			      response.setContentType("application/vnd.ms-excel;charset=utf-8");
			      response.setHeader("Content-Disposition", "attachment;filename="
			          + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
			      ServletOutputStream out = response.getOutputStream();
			      BufferedInputStream bis = null;
			      BufferedOutputStream bos = null;
			      
			      try {
			        bis = new BufferedInputStream(is);
			        bos = new BufferedOutputStream(out);
			        byte[] buff = new byte[2048];
			        int bytesRead;
			        // Simple read/write loop.
			        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			          bos.write(buff, 0, bytesRead);
			        }
			      } catch (Exception e) {
			        // TODO: handle exception
			        e.printStackTrace();
			      } finally {
			        if (bis != null)
			          bis.close();
			        if (bos != null)
			          bos.close();
			      }


			
		}
		
		
		
		
	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
