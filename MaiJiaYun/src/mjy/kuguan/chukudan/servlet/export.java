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
	 *将选中行以表格形式导出
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1 获取请求
				String [] strs=req.getParameterValues("checkOrder");
				
			    
				//2执行业务模型
				List<ChuKuDanPO> chukus =new ArrayList<>();
				for(int i=0;i<strs.length;i++){
					
//					System.out.println(strs[i]);
					chukus.add(chukudao.querybyId(Integer.parseInt(strs[i])));
				}
				
				// 1.创建一个workbook，对应一个Excel文件
				 HSSFWorkbook wb=new HSSFWorkbook();
				 
			     // 2.在workbook中添加一个sheet，对应Excel中的一个sheet
			     HSSFSheet sheet=wb.createSheet("bb");
			     // 3.在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
			     HSSFRow row = sheet.createRow(0);
			     // 4.创建单元格，设置值表头，设置表头居中
			     HSSFCellStyle style=wb.createCellStyle();
			     // 居中格式
			 
			     style.setAlignment(HSSFCellStyle.ALIGN_RIGHT);
			     style.setAlignment(HSSFCellStyle.ALIGN_FILL);
			     style.setBorderLeft(HSSFCellStyle.ALIGN_FILL);

			     // 设置表头
			     HSSFCell cell = row.createCell(0);
			     cell.setCellValue("出库单编码");
			     cell.setCellStyle(style);

			     cell = row.createCell(1);
			     cell.setCellValue("相关单编码");
			     cell.setCellStyle(style);

			     cell = row.createCell(2);
			     cell.setCellValue("出库仓库");
			     cell.setCellStyle(style);
			     
			     cell = row.createCell(3);
			     cell.setCellValue("出库数量");
			     cell.setCellStyle(style);
			     
			     cell = row.createCell(4);
			     cell.setCellValue("出库人");
			     cell.setCellStyle(style);



			 // 循环将数据写入Excel
			     for (int i = 0; i < chukus.size(); i++) {
			       row = sheet.createRow((int) i + 1);

			       // 创建单元格，设置值
			       row.createCell(0).setCellValue(chukus.get(i).getChukudanCode());
			       row.createCell(1).setCellValue(chukus.get(i).getChukuxiangguandanCode());
			       row.createCell(2).setCellValue(chukus.get(i).getChukuCangku());
			       row.createCell(3).setCellValue(chukus.get(i).getChukuNum());
			       row.createCell(4).setCellValue(chukus.get(i).getChukudanPeople());
			      
			     }
			    
			     String ste=j+"";
			     String fileName = "出库表"+ste;
			     j++;
			      ByteArrayOutputStream os = new ByteArrayOutputStream();
			      wb.write(os);
			      byte[] content = os.toByteArray();
			      InputStream is = new ByteArrayInputStream(content);
			      // 设置response参数，可以打开下载页面
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
