package com.fh.controller.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.service.ams.apply.ApplyManager;
import com.fh.service.ams.receive.AReceiveManager;
import com.fh.util.ExcelUtil;
import com.fh.util.PageData;


@Controller
@RequestMapping(value="/excel")
public class ExcelController extends BaseController  {
	
	//导出接受表
	@RequestMapping("/reciveExport")
	@ResponseBody
	public void reciveExport(int reciveId,HttpServletResponse response,HttpSession session) throws Exception{
	
		
		String title = reciveId+"-成果档案移交输出表格.xlsx";
		PageData 	pd=  areceiveService.getReciveExport(reciveId);
		pd.put("excelpath", session.getServletContext().getRealPath("excel"));	
		XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(pd.get("excelpath")+"\\temp\\"+"recive.xlsx"));
		XSSFSheet sheet=  workbook.getSheetAt(0);
		
		XSSFCellStyle cellStyle=workbook.createCellStyle();    
		cellStyle.setWrapText(true);    	
		cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN); //下边框    
		cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);//左边框    
		cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);//上边框    
		cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);//右边框  		  	  
		cellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 居中   
		cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		
		sheet.getRow(2).getCell(1).setCellValue(pd.get("RCID").toString());		
		sheet.getRow(2).getCell(4).setCellValue(pd.get("RCTIME").toString());
		sheet.getRow(3).getCell(1).setCellValue(pd.get("prjname").toString());
		sheet.getRow(4).getCell(1).setCellValue(pd.get("PRODEPART").toString());
		sheet.getRow(4).getCell(4).setCellValue(pd.get("TRANSFNAME").toString());
		sheet.getRow(5).getCell(1).setCellValue(pd.get("dname").toString());
		sheet.getRow(5).getCell(4).setCellValue(pd.get("rcname").toString());
		List<PageData> listfile= (List<PageData>) pd.get("file");
		short num=8;
		for (PageData pageData : listfile) {						
					int lastRowNo = sheet.getLastRowNum();  
					sheet.shiftRows(num, lastRowNo, 1);
					XSSFRow	row = sheet.createRow(num);  
					
					XSSFCell cell=row.createCell((short) 0) ; 
					cell.setCellStyle(cellStyle);					
					cell.setCellValue(pageData.get("FILEID")+""); 
					
					cell=row.createCell((short) 1) ; 
					cell.setCellStyle(cellStyle);	
					cell.setCellValue(pageData.getString("FILENAME"));  
					
					cell=row.createCell((short) 2) ; 
					cell.setCellStyle(cellStyle);	
					cell.setCellValue(pageData.getString("VOLUME")+pageData.getString("UNIT"));  
					
					cell=row.createCell((short) 3) ; 
					cell.setCellStyle(cellStyle);	
					cell.setCellValue(pageData.getString("FILEREMARK")); 
					
					cell=row.createCell((short) 4) ; 
					cell.setCellStyle(cellStyle);	
					cell.setCellValue(pageData.getString("DETAIL"));  						
				
				}
		workbook.write(new FileOutputStream(pd.get("excelpath")+"\\"+title));		
		workbook.close();
		ExcelUtil.downloadJEXLExcelFile(pd.get("excelpath").toString(),title,response);
		new File(pd.get("excelpath")+"\\"+title).delete();
	}


	
	private static XSSFRow createRow(XSSFSheet sheet, Integer rowIndex) {  
		XSSFRow row = null;  
		if (sheet.getRow(rowIndex) != null) {  
			int lastRowNo = sheet.getLastRowNum();  
			sheet.shiftRows(rowIndex, lastRowNo, 1);  
		}  
		row = sheet.createRow(rowIndex);  
		return row;  
	}  
	private XSSFCell createCell(XSSFRow row) {  
		XSSFCell cell = row.createCell((short) 0);  
		cell.setCellValue(999999);  

		return cell;  
	}  

	//导出分发列表
	@RequestMapping("/distributeExport")
	@ResponseBody
	public void distributeExport(int id,HttpServletResponse response,HttpSession session) throws Exception{
		String title = id+"-成果档案发放记录表.xlsx";
		PageData 	pd=  applySerVice.getArchiverecordDesc(id);
		pd.put("excelpath", session.getServletContext().getRealPath("excel")); 
		XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(pd.get("excelpath")+"\\temp\\"+"distribute.xlsx"));
		XSSFSheet sheet=  workbook.getSheetAt(0);	
		XSSFCellStyle cellStyle=workbook.createCellStyle();    
		cellStyle.setWrapText(true); 
		  
		cellStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN); //下边框    
		cellStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);//左边框    
		cellStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);//上边框    
		cellStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);//右边框    
		cellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 居中   
		cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
	  
		  
		  
		cellStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 居中    
		PageData archDistribute=(PageData) pd.get("archDistribute");
		sheet.getRow(2).getCell(1).setCellValue(archDistribute.get("DISTRIBUTE_ID").toString());
		sheet.getRow(2).getCell(4).setCellValue(archDistribute.get("DISTRIBUTE_TIME")+"");
		//sheet.getRow(2).getCell(1).setCellValue(archDistribute.getString("name"));
		sheet.getRow(3).getCell(1).setCellValue(archDistribute.getString("departmentname"));
		sheet.getRow(3).getCell(4).setCellValue(archDistribute.getString("name"));
		sheet.getRow(4).getCell(1).setCellValue(archDistribute.getString("departmentname2"));
		sheet.getRow(4).getCell(4).setCellValue(archDistribute.getString("name2"));
		
		List<PageData> listfile= (List<PageData>) pd.get("listf");
		int num=7;
		for (PageData pageData : listfile) {
			
			int lastRowNo = sheet.getLastRowNum();  
			sheet.shiftRows(num, lastRowNo, 1);
			XSSFRow	row = sheet.createRow(num);  
			
			XSSFCell cell=row.createCell((short) 0) ; 
			cell.setCellStyle(cellStyle);		 
			cell.setCellValue(pageData.get("FILE_ID").toString());  
			
			cell=row.createCell((short) 1) ; 
			cell.setCellStyle(cellStyle);		 
			cell.setCellValue(pageData.getString("FILE_NAME"));  
			
			cell=row.createCell((short) 2) ; 
			cell.setCellStyle(cellStyle);		 
			cell.setCellValue(pageData.getString("VOLUME")+pageData.get("UNIT"));  
			
			cell=row.createCell((short) 3) ; 
			cell.setCellStyle(cellStyle);		 
			cell.setCellValue(pageData.getString("prjname"));  
			
			cell=row.createCell((short) 4) ; 
			cell.setCellStyle(cellStyle);		 
			cell.setCellValue(pageData.getString("fileremark"));  

		}
		workbook.write(new FileOutputStream(pd.get("excelpath")+"\\"+title));		
		workbook.close();
		ExcelUtil.downloadJEXLExcelFile(pd.get("excelpath").toString(),title,response);
		new File(pd.get("excelpath")+"\\"+title).delete();
	}

	
	


	@Resource
	private ApplyManager applySerVice;
	@Resource(name = "areceiveService")
	private AReceiveManager areceiveService;
}
