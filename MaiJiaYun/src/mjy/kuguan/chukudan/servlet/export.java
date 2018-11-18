package mjy.kuguan.chukudan.servlet;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
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

import mjy.kuguan.chukudan.dao.IChuKuDanDao;
import mjy.kuguan.chukudan.dao.impl.ChuKuDanImpl;
import mjy.kuguan.chukudan.po.ChuKuDanPO;



/**
 * Servlet implementation class export
 */
@WebServlet("/export")
public class export extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public export() {
        super();
        
    }
    int j=0;
    private IChuKuDanDao chukudao=new ChuKuDanImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 *//**
	 *��ѡ�����Ա����ʽ����
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1 ��ȡ����
				String [] strs=req.getParameterValues("checkOrder");
				
			    
				//2ִ��ҵ��ģ��
				List<ChuKuDanPO> chukus =new ArrayList<>();
				for(int i=0;i<strs.length;i++){
					
//					System.out.println(strs[i]);
					chukus.add(chukudao.querybyId(Integer.parseInt(strs[i])));
				}
				
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
			     cell.setCellValue("���ⵥ����");
			     cell.setCellStyle(style);

			     cell = row.createCell(1);
			     cell.setCellValue("��ص�����");
			     cell.setCellStyle(style);

			     cell = row.createCell(2);
			     cell.setCellValue("����ֿ�");
			     cell.setCellStyle(style);
			     
			     cell = row.createCell(3);
			     cell.setCellValue("��������");
			     cell.setCellStyle(style);
			     
			     cell = row.createCell(4);
			     cell.setCellValue("������");
			     cell.setCellStyle(style);



			 // ѭ��������д��Excel
			     for (int i = 0; i < chukus.size(); i++) {
			       row = sheet.createRow((int) i + 1);

			       // ������Ԫ������ֵ
			       row.createCell(0).setCellValue(chukus.get(i).getChukudanCode());
			       row.createCell(1).setCellValue(chukus.get(i).getChukuxiangguandanCode());
			       row.createCell(2).setCellValue(chukus.get(i).getChukuCangku());
			       row.createCell(3).setCellValue(chukus.get(i).getChukuNum());
			       row.createCell(4).setCellValue(chukus.get(i).getChukudanPeople());
			      
			     }
			    
			     String ste=j+"";
			     String fileName = "�����"+ste;
			     j++;
			      ByteArrayOutputStream os = new ByteArrayOutputStream();
			      wb.write(os);
			      byte[] content = os.toByteArray();
			      InputStream is = new ByteArrayInputStream(content);
			      // ����response���������Դ�����ҳ��
			      resp.reset();
			      resp.setContentType("application/vnd.ms-excel;charset=utf-8");
			      resp.setHeader("Content-Disposition", "attachment;filename="
			          + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
			      ServletOutputStream out = resp.getOutputStream();
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
