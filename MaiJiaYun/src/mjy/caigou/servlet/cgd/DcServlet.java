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
		// 获取请求  接受传过来的参数
		
		String [] strs=request.getParameterValues("checkOrder");	
		// 对传过来的参数进行判断
		if(strs!=null&&!strs.equals("")){
		//创建对象
		 PurchaseDaoImpl ps= new  PurchaseDaoImpl();
		 PurchasePO purchasePo=new PurchasePO();
		 
		//执行业务层
		for (String str : strs) {
			
			purchasePo.setPurchaseCode(str);
			//根据传过来的采购单编号查出数据
			List<PurchaseVO> list=ps.listByCom(purchasePo, str);
			
			
			
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
		     cell.setCellValue("采购单编号");
		     cell.setCellStyle(style);

		     cell = row.createCell(1);
		     cell.setCellValue("供应商");
		     cell.setCellStyle(style);

		     cell = row.createCell(2);
		     cell.setCellValue("仓库");
		     cell.setCellStyle(style);
		     
		     cell = row.createCell(3);
		     cell.setCellValue("采购数量");
		     cell.setCellStyle(style);
		     
		     cell = row.createCell(4);
		     cell.setCellValue("已入库数量");
		     cell.setCellStyle(style);

		     cell = row.createCell(5);
		     cell.setCellValue("合计金额");
		     cell.setCellStyle(style);

		     cell = row.createCell(6);
		     cell.setCellValue("创建时间");
		     cell.setCellStyle(style);
		     
		     cell = row.createCell(7);
		     cell.setCellValue("制单人");
		     cell.setCellStyle(style);
		     
		     cell = row.createCell(8);
		     cell.setCellValue("采购审核人");
		     cell.setCellStyle(style);
		     
		     cell = row.createCell(9);
		     cell.setCellValue("备注");
		     cell.setCellStyle(style);
		     

			 // 循环将数据写入Excel
			     for (int i = 0; i < list.size(); i++) {
			       row = sheet.createRow((int) i + 1);

			       // 创建单元格，设置值
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
			     
			     String fileName = "一张表";
			     
			      ByteArrayOutputStream os = new ByteArrayOutputStream();
			      wb.write(os);
			      byte[] content = os.toByteArray();
			      InputStream is = new ByteArrayInputStream(content);
			      // 设置response参数，可以打开下载页面
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
