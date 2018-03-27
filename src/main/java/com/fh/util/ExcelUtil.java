package com.fh.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;



public class ExcelUtil{

	public static void downloadJEXLExcelFile(String path,String title ,HttpServletResponse response){
		try {

			//	former.transformXLS(headMap.get("excelpath")+"\\temp\\"+temp, headMap, headMap.get("excelpath")+"\\"+title); 
			File f =new File(path+"\\"+title);
			InputStream is = new FileInputStream(f); 
			// 设置response参数，可以打开下载页面
			response.reset();
			response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8"); 
			response.setHeader("Content-Disposition", "attachment;filename="+ new String((title).getBytes(), "iso-8859-1"));
			ServletOutputStream outputStream = response.getOutputStream();
			BufferedInputStream bis = new BufferedInputStream(is);
			BufferedOutputStream bos = new BufferedOutputStream(outputStream);
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);

			}
			bis.close();
			bos.close();
			outputStream.flush();
			outputStream.close();

			//f.delete();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}





}