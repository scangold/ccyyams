package com.fh.controller.excel;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.util.Date;
import java.lang.String;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDocBox;
import com.fh.entity.fms.FmsDocMain;
import com.fh.service.fms.FmsService;
import com.fh.util.ExcelUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

@Controller
@RequestMapping("test")
public class test  extends BaseController {
	@Resource
	private FmsService fmsService;


	//导出分发列表
	@RequestMapping("/test")
	@ResponseBody
	public void test(HttpServletResponse response,HttpSession session ) throws Exception{
		XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream("F:\\a\\交接文据1.xlsx"));
		XSSFSheet sheet=  wb.getSheetAt(0); 
		XSSFCellStyle cellStyle=wb.createCellStyle();    
		cellStyle.setWrapText(true);    	
		cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN); //下边框    
		cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);//左边框    
		cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);//上边框    
		cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);//右边框  		  	  
		cellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 居中   
		cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);

		List<FmsDocBox>	list=  fmsService.listNodes(null);
		for (int i = 0; i < list.size(); i++) {
			System.err.println(list.get(i).getName());
			XSSFRow 	 row = sheet.createRow(1+i);    //创建第二行    

			XSSFCell      cell = row.createCell(i);  
			cell.setCellValue(list.get(0).getName());  

			cell.setCellStyle(cellStyle); // 样式，居中
			sheet.setColumnWidth(i, 20 * 256);
			cell = row.createCell(i+1);  
			cell.setCellValue(list.get(0).getId()); 
		}  	




		response.setContentType("application/vnd.ms-excel");  
		response.setHeader("Content-disposition", "attachment;filename=交接文据.xls");  
		OutputStream ouputStream = response.getOutputStream();  
		wb.write(ouputStream);  
		ouputStream.flush();  
		ouputStream.close(); 
	}



	/**导出
	 * 分月文件登记簿.xlt
	 * @param response
	 * @param session
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2017年9月15日 下午4:22:33
	 *
	 */
	@RequestMapping("/exportDocLogByMouth")
	@ResponseBody
	public void exportDocLogByMouth(HttpServletResponse response,HttpSession session,  String dates) throws Exception{
		String path= session.getServletContext().getRealPath("excel")+"\\分月文件登记簿.xlsx";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date=simpleDateFormat.parse(dates);
		XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream(path));
		XSSFSheet sheet=  wb.getSheetAt(0); 
		XSSFCellStyle cellStyle=wb.createCellStyle();    
		cellStyle.setWrapText(true);    	
		cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN); //下边框    
		cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);//左边框    
		cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);//上边框    
		cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);//右边框  		  	  
		cellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 居中   
		cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		XSSFRow 	 row = sheet.getRow(1);    //创建第二行    
		XSSFCell      cell =row.getCell(4);
		cell.setCellValue(dates);; 
		List<PageData>	list=  fmsService.findDocLogByMouth(date);
		System.err.println(list.size());
		for (int i = 0; i < list.size(); i++) {
			row = sheet.getRow(i+3);    //创建第二行    
			if(row==null) {
				row = sheet.createRow(i+3); 
			}


			cell = row.createCell(0);  
			cell.setCellValue(i+1);  

			cell = row.createCell(1);  
			cell.setCellValue(list.get(i).getString("SFTIIME"));

			cell = row.createCell(3);  
			cell.setCellValue(list.get(i).getString("docid"));

			cell = row.createCell(4);  
			cell.setCellValue(list.get(i).getString("TITLE"));

			cell = row.createCell(5);  
			cell.setCellValue(list.get(i).get("PAGES").toString());  


			cell = row.createCell(7);  
			cell.setCellValue(list.get(i).getString("VALUE"));  
			cell = row.createCell(8);  
			cell.setCellValue(list.get(i).getString("NAME"));  

			cell = row.createCell(9);  
			cell.setCellValue(list.get(i).getString("USERNAME"));  


		}  	


		response.setContentType("application/vnd.ms-excel");  
		response.setHeader("Content-disposition", "attachment;filename=exportDocLogByMouth.xlsx");  
		OutputStream ouputStream = response.getOutputStream();  
		wb.write(ouputStream);  
		ouputStream.flush();  
		ouputStream.close(); 
	}



	/**导出
	 * 分月文件登记簿.xlt
	 * @param response
	 * @param session
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2017年9月15日 下午4:22:33
	 *
	 */
	@RequestMapping("/exportDoc")
	@ResponseBody
	public void exportDoc(HttpServletResponse response,HttpSession session ) throws Exception{
		String path= session.getServletContext().getRealPath("excel")+"\\文件目录.xlsx";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream(path));
		XSSFSheet sheet=  wb.getSheetAt(0); 
		XSSFCellStyle cellStyle=wb.createCellStyle();    
		cellStyle.setWrapText(true);    	
		cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN); //下边框    
		cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);//左边框    
		cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);//上边框    
		cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);//右边框  		  	  
		cellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 居中   
		cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		XSSFRow 	 row ;   //创建第二行    
		XSSFCell      cell;

		List<PageData>	list=  fmsService.findDocLog();
		System.err.println(list.size());
		for (int i = 0; i < list.size(); i++) {
			row = sheet.getRow(i+3);    //创建第二行    
			if(row==null) {
				row = sheet.createRow(i+3); 
			}


			cell = row.createCell(0);  
			cell.setCellValue(i+1);  

			cell = row.createCell(1);  

			cell.setCellValue(list.get(i).getString("docid"));


			cell = row.createCell(2);  			
			cell.setCellValue(list.get(i).getString("dpname"));


			cell = row.createCell(3);  

			cell.setCellValue(list.get(i).getString("TITLE"));
			cell = row.createCell(4);  
			cell.setCellValue(list.get(i).getString("SFTIIME"));


			cell = row.createCell(5);  
			cell.setCellValue(list.get(i).getString("NAME"));  




		}  	


		response.setContentType("application/vnd.ms-excel");  
		response.setHeader("Content-disposition", "attachment;filename=exportDoc.xlsx");  
		OutputStream ouputStream = response.getOutputStream();  
		wb.write(ouputStream);  
		ouputStream.flush();  
		ouputStream.close(); 
	}
	
	/**导出
	 * 文件处理单.xlsx
	 * @param response
	 * @param session
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2017年9月15日 下午4:22:33
	 *
	 */
	@RequestMapping("/exportDocDeal")
	@ResponseBody
	public void exportDocDeal(HttpServletResponse response,HttpSession session ) throws Exception{
		PageData pd=this.getPageData();
		String path= session.getServletContext().getRealPath("excel")+"\\文件处理单.xlsx";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream(path));
		XSSFSheet sheet=  wb.getSheetAt(0); 
		XSSFCellStyle cellStyle=wb.createCellStyle();    
		cellStyle.setWrapText(true);    	
		cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN); //下边框    
		cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);//左边框    
		cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);//上边框    
		cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);//右边框  		  	  
		cellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 居中   
		cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		XSSFRow 	 row ;   //创建第二行    
		XSSFCell      cell;
		FmsDocMain	list=  fmsService.findDocById(pd.getString("id"));	
	
		
			row = sheet.getRow(2);    
			cell = row.getCell(0);  
			cell.setCellValue(list.getTitle());  

			row = sheet.getRow(1);   
			cell = row.getCell(0);  
			cell.setCellValue(list.getMedianclassFmsDataDictItem().getValue());  

			row = sheet.getRow(3);    
			cell = row.getCell(2);  
			cell.setCellValue(list.getKeyword());  
			
			
			
			row = sheet.getRow(4);    
			cell = row.getCell(2);  
			cell.setCellValue(list.getSuperordinateclassFmsDataDictItem().getValue()); 
			
			row = sheet.getRow(6);  
			row.getCell(2).setCellValue(list.getDocid()); 
			//页数
			row = sheet.getRow(10);  
			row.getCell(7).setCellValue(list.getPagination());
			SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
		
			//文件处理日期
			row = sheet.getRow(13);  
			row.getCell(0).setCellValue("文件处理日期:"+f.format(list.getCreatetime()));  
			//责任部门ownerDepartment.NAME
			row = sheet.getRow(14);  
			row.getCell(1).setCellValue(list.getOwnerDepartment().getNAME());  
			//文号.docid
			row = sheet.getRow(14);  
			row.getCell(4).setCellValue(list.getDocid()); 
			//提要.precise
			row = sheet.getRow(15);  
			row.getCell(0).setCellValue("提要："+list.getPrecise()); 
			//文件份数.precise
			row = sheet.getRow(15);  
			row.getCell(8).setCellValue(list.getPages()+""); 
			//附件份数份数.precise
			row = sheet.getRow(16);  
			row.getCell(8).setCellValue(list.getSubcopies()); 
			//密级.secretlevelFmsDataDictItem.value
			row = sheet.getRow(17);  
			row.getCell(8).setCellValue(list.getSecretlevelFmsDataDictItem().getValue());
			//文本doclevelFmsDataDictItem.value
			row = sheet.getRow(18);  
			row.getCell(8).setCellValue(list.getDoclevelFmsDataDictItem().getValue());
			
			//载体类型carrierDataDictItem.value
			row = sheet.getRow(19);  
			row.getCell(8).setCellValue(list.getCarrierDataDictItem().getValue());
			//规    格 .specFmsDataDictItem.value 
			row = sheet.getRow(20);  
			row.getCell(8).setCellValue(list.getSpecFmsDataDictItem().getValue());
			
			
			
		/*	row = sheet.getRow(4);    
			cell = row.getCell(1);  
			cell.setCellValue(list.getKeyword());  */


		response.setContentType("application/vnd.ms-excel");  
		response.setHeader("Content-disposition", "attachment;filename=exportDocDeal.xlsx");  
		OutputStream ouputStream = response.getOutputStream();  
		wb.write(ouputStream);  
		ouputStream.flush();  
		ouputStream.close(); 
	}
	
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd =  this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setOrder("DESC");
		page.setSort("CREATETIME");
		page.setPd(pd);		
	
		mv.setViewName("fms/excel/list");
	
		mv.addObject("pd", pd);		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

}
