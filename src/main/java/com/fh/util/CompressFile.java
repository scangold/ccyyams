package com.fh.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;
import org.apache.tools.zip.ZipOutputStream;

import com.github.junrar.Archive;
import com.github.junrar.rarfile.FileHeader;

/**
 * <p>
 * Title: 解压缩文件
 * </p>
 * <p>
 * Copyright: Copyright (c) 2010
 * </p>
 * <p>
 * Company: yourcompany
 * </p>
 * 
 * @author yourcompany
 * @version 1.0
 */
public class CompressFile {


	/**
	 * 压缩文件
	 * 
	 * @param srcfile
	 *            File[] 需要压缩的文件列表
	 * @param zipfile
	 *            File 压缩后的文件
	 */
	public static void ZipFiles(java.io.File[] srcfile, java.io.File zipfile) {
		byte[] buf = new byte[1024];
		try {
			ZipOutputStream out = new ZipOutputStream(new FileOutputStream(
					zipfile));
			for (int i = 0; i < srcfile.length; i++) {
				FileInputStream in = new FileInputStream(srcfile[i]);
				out.putNextEntry(new ZipEntry(srcfile[i].getName()));
				String str = srcfile[i].getName();
				int len;
				while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
				out.closeEntry();
				in.close();
			}
			out.close();
			System.out.println("压缩完成.");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * zip解压缩
	 * 
	 * @param zipfile
	 *            File 需要解压缩的文件
	 * @param descDir
	 *            String 解压后的目标目录
	 */
	/*public static void unZipFiles(java.io.File zipfile, String descDir) {
        try {
            ZipFile zf = new ZipFile(zipfile);
            for (Enumeration entries = zf.getEntries(); entries
                    .hasMoreElements();) {
                ZipEntry entry = ((ZipEntry) entries.nextElement());
                String zipEntryName = entry.getName();
                InputStream in = zf.getInputStream(entry);
                OutputStream out = new FileOutputStream(descDir + zipEntryName);
                byte[] buf1 = new byte[1024];
                int len;
                while ((len = in.read(buf1)) > 0) {
                    out.write(buf1, 0, len);
                }
                in.close();
                out.close();
                //System.out.println("解压缩完成.");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	 */


	/** 
	 * 根据原始rar路径，解压到指定文件夹下.      
	 * @param srcRarPath 原始rar路径 
	 * @param dstDirectoryPath 解压到的文件夹      
	 */
	 public static void unRarFile(String srcRarPath, String dstDirectoryPath) {
         if (!srcRarPath.toLowerCase().endsWith(".rar")) {
             System.out.println("非rar文件！");
             return;
         }
         File dstDiretory = new File(dstDirectoryPath);
         if (!dstDiretory.exists()) {// 目标目录不存在时，创建该文件夹
             dstDiretory.mkdirs();
         }
         Archive a = null;
         try {
             a = new Archive(new File(srcRarPath));
             if (a != null) {
                 //a.getMainHeader().print(); // 打印文件信息.
                 FileHeader fh = a.nextFileHeader();
                 while (fh != null) {
                          //防止文件名中文乱码问题的处理
                
String fileName = fh.getFileNameW().isEmpty()?fh.getFileNameString():fh.getFileNameW();
                     if (fh.isDirectory()) { // 文件夹 
                    File fol = new File(dstDirectoryPath + File.separator + fileName);
                         fol.mkdirs();
                     } else { // 文件
                    File out = new File(dstDirectoryPath + File.separator + fileName.trim());
                         try { 
                             if (!out.exists()) {
                                 if (!out.getParentFile().exists()) {// 相对路径可能多级，可能需要创建父目录. 
                                     out.getParentFile().mkdirs();
                                 }
                                 out.createNewFile();
                             }
                             FileOutputStream os = new FileOutputStream(out);
                             a.extractFile(fh, os);
                             os.close();
                         } catch (Exception ex) {
                             ex.printStackTrace();
                         }
                     }
                     fh = a.nextFileHeader();
                 }
                 a.close();
             }
         } catch (Exception e) {
             e.printStackTrace();
         }

	 }
	public static void unZipFiles(String zipPath,String descDir)throws IOException{  
		unZipFiles(new File(zipPath), descDir);  
	}  
	/** 
	 * 解压文件到指定目录 
	 * @param zipFile 
	 * @param descDir 
	 * @author isea533 
	 */  

	public static void unZipFiles(File zipFile,String descDir)throws IOException{  
		File pathFile = new File(descDir);  
		if(!pathFile.exists()){  
			pathFile.mkdirs();  
		}  
		ZipFile zip = new ZipFile(zipFile);  
		for(Enumeration entries = zip.getEntries();entries.hasMoreElements();){  
			ZipEntry entry = (ZipEntry)entries.nextElement();  
			String zipEntryName = entry.getName();  
			InputStream in = zip.getInputStream(entry);  
			String outPath = (descDir +"/"+zipEntryName).replaceAll("\\*", "/");;  
			//判断路径是否存在,不存在则创建文件路径  
			File file = new File(outPath.substring(0, outPath.lastIndexOf('/')));  
			if(!file.exists()){  
				file.mkdirs();  
			}  
			//判断文件全路径是否为文件夹,如果是上面已经上传,不需要解压  
			if(new File(outPath).isDirectory()){  
				continue;  
			}  
			//输出文件路径信息  
			System.out.println(outPath);  

			OutputStream out = new FileOutputStream(outPath);  
			byte[] buf1 = new byte[1024];  
			int len;  
			while((len=in.read(buf1))>0){  
				out.write(buf1,0,len);  
			}  
			in.close();  
			out.close();  
		}  
		System.out.println("******************解压完毕********************");  
	}  


}