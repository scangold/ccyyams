package com.fh.controller.ams;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fh.util.PageData;

public class CheckFileClass {

	public String[][] getCheckFileDetails(MultipartFile file) {
		// 用来保存每行读取的内容
		String line; 
		//利用array动态存储所有行
		ArrayList<String> arrayList = new ArrayList<String>();
		//array2为二维数组
		String[][] array2 = null;
		int arraysize;
		try {
			InputStream inputStream = file.getInputStream();

			BufferedReader reader = new BufferedReader(new InputStreamReader(
					inputStream));

			line = reader.readLine(); // 读取第一行
			while (line != null && line.length()>0) { // 如果 line 为空说明读完了
				arrayList.add(line);
				line = reader.readLine(); // 读取下一行
			}
			reader.close();
			inputStream.close();
			
			//根据每行的标识符 将array转为二维数组
			arraysize = arrayList.size();
			array2 = new String[arraysize][3]; 
			for(int i=0;i<arraysize;i++){
				String[] arrayline = arrayList.get(i).split("###");
				array2[i][0]= arrayline[0];
				array2[i][1]= arrayline[1];
				array2[i][2]= arrayline[2];
			}
			System.out.println("文本行数："+arraysize);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return array2;
	}
	
	//txt
	public List<PageData> getCheckFileToList(MultipartFile file) {
		// 用来保存每行读取的内容
		String line; 
		//利用array动态存储所有行
		ArrayList<String> arrayList = new ArrayList<String>();
		
		List<PageData> varHDList = new ArrayList<PageData>();
		int arraysize;
		try {
			InputStream inputStream = file.getInputStream();

			BufferedReader reader = new BufferedReader(new InputStreamReader(
					inputStream));

			line = reader.readLine(); // 读取第一行
			while (line != null && line.length()>0) { // 如果 line 为空说明读完了
				arrayList.add(line);
				line = reader.readLine(); // 读取下一行
			}
			reader.close();
			inputStream.close();
			
			//根据每行的标识符 将array转为二维数组
			arraysize = arrayList.size();
			
			for (int j = 0; j < arraysize; j++) {
				String[] arrayline = arrayList.get(j).split("###");
				
				PageData vpd = new PageData();
				vpd.put("FILE_ID", arrayline[0]); // 文件id
				vpd.put("FILE_NAME", arrayline[1]); // 文件名
				vpd.put("DATAFORM", arrayline[2]); // 文件格式
				vpd.put("FILE_URL", arrayline[3]); // 文件路径
				vpd.put("VOLUME", arrayline[4]); // 文件容量
				vpd.put("UNIT", arrayline[5]); // 文件容量单位

				varHDList.add(vpd);
			}// for show HDlist
			
			System.out.println("文本行数："+arraysize);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return varHDList;
	}
	/*//txt
	public List<PageData> listAddRCID(List<PageData> varHDList,int RC_ID,String IFARCHIVE,String IFDIGIT) {
		
		for(int k=0;k<varHDList.size();k++)
		{
			
			varHDList.get(k).put("RC_ID", RC_ID); // 文件id
			varHDList.get(k).put("IFARCHIVE", IFARCHIVE); // 是否成果
			varHDList.get(k).put("IFDIGIT", IFDIGIT); // 是否电子
			
		}
		
		return varHDList;

	}*/
	

	//EXCEL
	public List<PageData> listAddRCID(List<PageData> varCKList,int RC_ID,String IFDIGIT,String IFARCHIVE) {
		
		for(int k=0;k<varCKList.size();k++)
		{
			
			varCKList.get(k).put("RC_ID", RC_ID); // 文件id
			varCKList.get(k).put("IFDIGIT", IFDIGIT); // 是否电子
			varCKList.get(k).put("IFARCHIVE", IFARCHIVE); // 是否成果
			
			/*varHDList.get(k).put("PERMISSION_CLASS", PERMISSION_CLASS); // 密级
			varHDList.get(k).put("FILE_TYPE", FILE_TYPE); // 文件类型
			varHDList.get(k).put("UNIT", UNIT); // 容量单位
*/			
			
		}
		
		return varCKList;

	}
	
	
}
