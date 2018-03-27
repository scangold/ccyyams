package com.fh.amstools;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.fh.util.PageData;


/**
 * 
 * @author kioor
 * @since 2016年7月11日21:46:07
 */
public class AMSReadExcel {
	
	/**
	 * 读取人工处理后的文件excel，记录存储介质信息
	 * 
	 * @param file //文件
	 * @param startrow //开始行号
	 * @param startcol //开始列号
	 * @param sheetnum //sheet
	 * @return list
	 */
	@SuppressWarnings("resource")
	public static List<Object> readManagedStorageExcel(String filepath,String filename, int startrow, int startcol, int sheetnum) {
		List<Object> varList = new ArrayList<Object>();
		InputStream is = null;
		
		try {
//			File target = new File(filepath, filename);
//			FileInputStream fi = new FileInputStream(target);
			filepath = filepath + filename;
			is =new FileInputStream(filepath);
			
			XSSFWorkbook wb = new XSSFWorkbook(is);
			
			XSSFSheet sheet = wb.getSheetAt(sheetnum); 					//sheet表从0行开始
			int rowNum = sheet.getLastRowNum() + 1; 					//取得最后一行的行号
			
			XSSFRow headrow = sheet.getRow(1); 							//表头行
			XSSFCell headcell = null;
			String headname = null;										//表头名称


			for (int i = startrow; i < rowNum; i++) {					//行循环开始
				
				PageData varpd = new PageData();
				XSSFRow row = sheet.getRow(i); 							//行
				//表头为最全列
				int cellNum = headrow.getLastCellNum(); 					//每行的最后一个单元格位置
				
				for (int j = startcol; j < cellNum; j++) {				//列循环开始
					
					//HSSFCell cell = row.getCell(Short.parseShort(j + ""));
					XSSFCell cell = row.getCell(j);
					
					String cellValue = null;
					String result = null;
					if (null != cell) {
						switch (cell.getCellType()) { 					// 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
						case 0:
							String dataform = cell.getCellStyle().getDataFormatString();
							if ( dataform == "m/d/yy h:mm") {// 处理日期格式、时间格式  
								SimpleDateFormat sdf = new SimpleDateFormat(dataform);  
								SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时制  
				                Date date = cell.getDateCellValue();
				                result = sdformat.format(date);
								cellValue = result;
								break;//数值型中的指定日期型
								
							}
							cellValue = String.valueOf((int) cell.getNumericCellValue());
							break;//数值型
						case 1:
							cellValue = cell.getStringCellValue();
							break;//字符串型
						case 2:
							cellValue = cell.getNumericCellValue() + "";
							// cellValue = String.valueOf(cell.getDateCellValue());
							break;//公式型
						case 3:
							cellValue = "";
							break;//空值
						case 4:
							cellValue = String.valueOf(cell.getBooleanCellValue());
							break;//布尔型
						case 5:
							cellValue = String.valueOf(cell.getErrorCellValue());
							break;//错误
						}
					} else {
						cellValue = "";
					}
					
					
					headname = headrow.getCell(j).getStringCellValue();
					if(headname!=null|headname.trim()!=""){

						switch (headname) {
						case "STORAGE_ID":
							
							varpd.put("STORAGE_ID", cellValue);
							break;
						case "STORAGE_NAME":

							varpd.put("STORAGE_NAME", cellValue);
							break;
						case "VOLUME":

							varpd.put("VOLUME", cellValue);
							break;
						case "ACTVOLUME":

							varpd.put("ACTVOLUME", cellValue);
							break;
						case "UNIT":

							varpd.put("UNIT", cellValue);
							break;
						case "PAGE":
							
							varpd.put("PAGE", cellValue);
							break;
						case "LOCATION":
							
							varpd.put("LOCATION", cellValue);
							break;
						case "STORE_TIME":
							
							varpd.put("STORE_TIME", cellValue);
							break;
						case "DETAIL":
							
							varpd.put("DETAIL", cellValue);
							break;
						case "REMARK":
							
							varpd.put("REMARK", cellValue);
							break;
						default:
							varpd.put(headname, cellValue);
							
						}
					}
				}
				varList.add(varpd);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		
		return varList;
	}
	
	/**
	 * 读取人工处理后的文件excel，记录历史数据
	 * 
	 * @param file //文件
	 * @param startrow //开始行号
	 * @param startcol //开始列号
	 * @param sheetnum //sheet
	 * @return list
	 */
	@SuppressWarnings("resource")
	public static List<Object> readManagedFileExcel(String filepath,String filename, int startrow, int startcol, int sheetnum) {
		List<Object> varList = new ArrayList<Object>();
		InputStream is = null;
		
		try {
//			File target = new File(filepath, filename);
//			FileInputStream fi = new FileInputStream(target);
			filepath = filepath + filename;
			is =new FileInputStream(filepath);
			
			XSSFWorkbook wb = new XSSFWorkbook(is);
			
			XSSFSheet sheet = wb.getSheetAt(sheetnum); 					//sheet表从0行开始
			int rowNum = sheet.getLastRowNum() + 1; 					//取得最后一行的行号
			
			XSSFRow headrow = sheet.getRow(1); 							//表头行
			XSSFCell headcell = null;
			String headname = null;										//表头名称


			for (int i = startrow; i < rowNum; i++) {					//行循环开始
				
				PageData varpd = new PageData();
				XSSFRow row = sheet.getRow(i); 							//行
				//表头为最全列
				int cellNum = headrow.getLastCellNum(); 					//每行的最后一个单元格位置
				
				for (int j = startcol; j < cellNum; j++) {				//列循环开始
					
					//HSSFCell cell = row.getCell(Short.parseShort(j + ""));
					XSSFCell cell = row.getCell(j);
					
					String cellValue = null;
					String result = null;
					if (null != cell) {
						switch (cell.getCellType()) { 					// 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
						case 0:
							
							String dataform = cell.getCellStyle().getDataFormatString();
							
							Double doubleVal = cell.getNumericCellValue();

							long longVal = Math.round(cell.getNumericCellValue());

							if ( dataform == "yyyy/m/d"|dataform == "m/d/yy") {// 处理日期格式
								SimpleDateFormat sdf = new SimpleDateFormat(dataform);  
								SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd");//24小时制  
				                Date date = cell.getDateCellValue();
				                result = sdformat.format(date);
								cellValue = result;
								break;//数值型中的指定日期型
								
							}else if ( dataform == "m/d/yy h:mm") {// 处理日期格式、时间格式  
								SimpleDateFormat sdf = new SimpleDateFormat(dataform);  
								SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时制  
				                Date date = cell.getDateCellValue();
				                result = sdformat.format(date);
								cellValue = result;
								break;//数值型中的指定日期型
								
							}else if(Double.parseDouble(longVal+".0")==doubleVal){
								
								cellValue = String.valueOf(longVal);
								break;//数值int型	
							}else{
								
								cellValue = String.valueOf(doubleVal);
								break;//数值型double型
							}

						case 1:
							cellValue = cell.getStringCellValue();
							break;//字符串型
						case 2:
							cellValue = cell.getNumericCellValue() + "";
							// cellValue = String.valueOf(cell.getDateCellValue());
							break;//公式型
						case 3:
							cellValue = "";
							break;//空值
						case 4:
							cellValue = String.valueOf(cell.getBooleanCellValue());
							break;//布尔型
						case 5:
							cellValue = String.valueOf(cell.getErrorCellValue());
							break;//错误
						}
					} else {
						cellValue = "";
					}
					
					
					headname = headrow.getCell(j).getStringCellValue().toString().trim();
					if(headname!=null|headname.trim()!=""|!headname.equals("")|headname.length()>0){
						switch (headname) {
						case "FILE_ID":
							
							varpd.put("FILE_ID", cellValue);
							break;
						case "FILE_NAME":

							varpd.put("FILE_NAME", cellValue);
							break;
						case "EXTENSION":

							varpd.put("DATAFORM", cellValue);
							break;
						case "FILE_TYPE":

							varpd.put("FILE_TYPE", cellValue);
							break;
						case "CREATIONDATE":

							varpd.put("CREATIONDATE", cellValue);
							break;
						case "COVERAGE_ID":
							
							varpd.put("COVERAGE", cellValue);
							break;
						case "YEAR":
							
							varpd.put("YEAR", cellValue);
							break;
						case "PRJ_ID":
							
							varpd.put("PRJ_ID", cellValue);
							break;
						case "PRJ_NAME":
							
							varpd.put("PRJ_NAME", cellValue);
							break;
						case "STORAGE_ID":
							
							varpd.put("STORAGE_ID", cellValue);
							break;
						case "FILE_URL":
							
							varpd.put("FILE_URL", cellValue);
							break;
						case "VOLUME":
							
							varpd.put("VOLUME", cellValue);
							break;
						case "UNIT":
							
							varpd.put("UNIT", cellValue);
							break;
						case "DEPARTMENT":
							
							varpd.put("PRODEPART", cellValue);
							break;
						case "PRESENTER":
							
							varpd.put("TRANSFNAME", cellValue);
							break;
						case "RECIPIENT":
							
							varpd.put("RC_NAME", cellValue);
							break;
						case "RECIPIENT_TIME":
							
							varpd.put("RC_TIME", cellValue);
							break;
						case "PERMISSION_CLASS":
							
							varpd.put("PERMISSION_CLASS", cellValue);
							break;
						case "STORE_TIME":
							
							varpd.put("STORAGE_REMARK", cellValue);
							break;
						case "DETAIL":
							
							varpd.put("DETAIL", cellValue);
							break;
						case "REMARK":
							
							varpd.put("FILE_REMARK", cellValue);
							break;
							
						default:
							varpd.put(headname, cellValue);
							
						}
					}
				}
				varList.add(varpd);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		
		return varList;
	}
	/**
	 * 
	 * @param file //文件
	 * @param startrow //开始行号
	 * @param startcol //开始列号
	 * @param sheetnum //sheet
	 * @return list
	 */
	@SuppressWarnings("resource")
	public static List<Object> readExcel(String filepath,String filename, int startrow, int startcol, int sheetnum) {
		List<Object> varList = new ArrayList<Object>();
		InputStream is = null;
		
		try {
//			File target = new File(filepath, filename);
//			FileInputStream fi = new FileInputStream(target);
			filepath = filepath + filename;
			is =new FileInputStream(filepath);
			
			XSSFWorkbook wb = new XSSFWorkbook(is);
			
			XSSFSheet sheet = wb.getSheetAt(sheetnum); 					//sheet表从0行开始
			int rowNum = sheet.getLastRowNum() + 1; 					//取得最后一行的行号

			for (int i = startrow; i < rowNum; i++) {					//行循环开始
				
				PageData varpd = new PageData();
				XSSFRow row = sheet.getRow(i); 							//行
				int cellNum = row.getLastCellNum(); 					//每行的最后一个单元格位置

				for (int j = startcol; j < cellNum; j++) {				//列循环开始
					
					//HSSFCell cell = row.getCell(Short.parseShort(j + ""));
					XSSFCell cell = row.getCell(j);
					
					String cellValue = null;
					String result = null;
					if (null != cell) {
						switch (cell.getCellType()) { 					// 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
						case 0:
							String dataform = cell.getCellStyle().getDataFormatString();
							if ( dataform == "m/d/yy h:mm") {// 处理日期格式、时间格式  
								SimpleDateFormat sdf = new SimpleDateFormat(dataform);  
								SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//24小时制  
				                Date date = cell.getDateCellValue();
				                result = sdformat.format(date);
								cellValue = result;
								break;//数值型中的指定日期型
								
							}
							cellValue = String.valueOf((int) cell.getNumericCellValue());
							break;//数值型
						case 1:
							cellValue = cell.getStringCellValue();
							break;//字符串型
						case 2:
							cellValue = cell.getNumericCellValue() + "";
							// cellValue = String.valueOf(cell.getDateCellValue());
							break;//公式型
						case 3:
							cellValue = "";
							break;//空值
						case 4:
							cellValue = String.valueOf(cell.getBooleanCellValue());
							break;//布尔型
						case 5:
							cellValue = String.valueOf(cell.getErrorCellValue());
							break;//错误
						}
					} else {
						cellValue = "";
					}
					
					switch (j) {
					case 0:

						varpd.put("FILE_ID", cellValue);
						break;
					case 1:

						varpd.put("FILE_NAME", cellValue);
						break;
					case 2:

						varpd.put("FILE_REMARK", cellValue);
						break;
					case 3:

						varpd.put("VOLUME", cellValue);
						break;
					case 4:

						varpd.put("FILE_URL", cellValue);
						break;
						
					}
						
					
				}
				varList.add(varpd);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		
		return varList;
	}
}

