package mjy.kuguan.ruku.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import mjy.kuguan.ruku.po.DiaoborukuPO;
import mjy.kuguan.ruku.service.DiaoborukuService;
import mjy.login.beans.vo.UserInfoVO;

@WebServlet("/servlet/ExportExcelServlet")
public class ExportExcelServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String exportType = req.getParameter("exportType");
		String codeArr[] = req.getParameterValues("codeList[]");
		
		UserInfoVO userInfoVO = (UserInfoVO)req.getSession().getAttribute("userInfoVO");
		int bossId = userInfoVO.getBossPO().getUserID();
		
		switch(exportType){
		case "caigou":
			break;
		case "tuihuo":
			break;
		case "diaobo":
			DiaoborukuService diaoborukuService = new DiaoborukuService();
			List<DiaoborukuPO> list = new ArrayList<DiaoborukuPO>();
			String type = "调拨入库";
			
			if(codeArr[0].equals("all")){
				list.addAll(diaoborukuService.selectAll(bossId, 1, diaoborukuService.allCount(bossId)));
			}else{
				for (int i = 0; i < codeArr.length; i++) {
					list.add(diaoborukuService.selectByCode(bossId, 1, 1, codeArr[i]).get(0));
				}
			}
			
			
			exportExcel(list, type);
			
			break;
		}
	}
	
	//导出Excel
	private void exportExcel(List<DiaoborukuPO> list, String type) {

		// 第一步，创建一个webbook，对应一个Excel文件  
        HSSFWorkbook wb = new HSSFWorkbook();  
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet  
        HSSFSheet sheet = wb.createSheet("入库导出");  
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short  
        HSSFRow row = sheet.createRow((int) 0);  
        // 第四步，创建单元格，并设置值表头 设置表头居中  
        HSSFCellStyle style = wb.createCellStyle();  
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式  
  
        HSSFCell cell = row.createCell((short) 0);  
        cell.setCellValue("入库单编号");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 1);  
        cell.setCellValue("相关单据号");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 2);  
        cell.setCellValue("入库单据");  
        cell.setCellStyle(style);  
        cell = row.createCell((short) 3);  
        cell.setCellValue("创建人");  
        cell.setCellStyle(style); 
        cell = row.createCell((short) 4);  
        cell.setCellValue("审核人");  
        cell.setCellStyle(style); 
        cell = row.createCell((short) 5);  
        cell.setCellValue("审核时间");  
        cell.setCellStyle(style); 
        cell = row.createCell((short) 6);  
        cell.setCellValue("状态");  
        cell.setCellStyle(style); 
        cell = row.createCell((short) 7);  
        cell.setCellValue("仓库编号");  
        cell.setCellStyle(style); 
        cell = row.createCell((short) 8);  
//        cell.setCellValue("货号");  
//        cell.setCellStyle(style); 
//        cell = row.createCell((short) 9);  
//        cell.setCellValue("条形码");  
//        cell.setCellStyle(style); 
//        cell = row.createCell((short) 10);  
//        cell.setCellValue("属性");  
//        cell.setCellStyle(style);
//        cell = row.createCell((short) 11);  
//        cell.setCellValue("商品名称");  
//        cell.setCellStyle(style);
//        cell = row.createCell((short) 12);  
//        cell.setCellValue("商品数量");  
//        cell.setCellStyle(style);
//        cell = row.createCell((short) 13);  
//        cell.setCellValue("备注");  
//        cell.setCellStyle(style);
        
        // 第五步，写入实体数据 实际应用中这些数据从数据库得到，  
        for (int i = 0; i < list.size(); i++)  
        {  
            row = sheet.createRow((int) i + 1);  
            DiaoborukuPO po = list.get(i);  
            // 第四步，创建单元格，并设置值  
            row.createCell((short) 0).setCellValue(po.getDiaoboCode());  
            row.createCell((short) 1).setCellValue(po.getDiaoboDiaobodanCode());  
            row.createCell((short) 2).setCellValue(type);
            row.createCell((short) 3).setCellValue(po.getDiaoboAuthor());
            row.createCell((short) 4).setCellValue("");
            row.createCell((short) 5).setCellValue("");
            row.createCell((short) 6).setCellValue("未完成");
            row.createCell((short) 7).setCellValue(po.getDiaoboWarehouse());
           
        }  
        // 第六步，将文件存到指定位置  
        try  
        {  
            FileOutputStream fout = new FileOutputStream("E:/maijiayun_export_" + System.currentTimeMillis() + ".xls");  
            wb.write(fout);  
            fout.close();  
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();  
        }  
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
