package com.fh.util;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.channels.FileChannel.MapMode;
import java.util.Date;

import org.apache.log4j.chainsaw.Main;

/**	文件处理
 *  创建人：FH Q313596790
 * 创建时间：2014年12月23日
 */
public class FileUtil {


	/**获取文件大小 返回 KB 保留3位小数  没有文件时返回0
	 * @param filepath 文件完整路径，包括文件名
	 * @return
	 */
	public static Double getFilesize(String filepath){
		File backupath = new File(filepath);
		return Double.valueOf(backupath.length())/1000.000;
	}

	/**
	 * 创建目录
	 * @param destDirName目标目录名
	 * @return 
	 */
	public static Boolean createDir(String destDirName) {
		File dir = new File(destDirName);
		if(!dir.getParentFile().exists()){				//判断有没有父路径，就是判断文件整个路径是否存在
			return dir.getParentFile().mkdirs();		//不存在就全部创建
		}
		return false;
	}

	/**
	 * 删除文件
	 * @param filePathAndName
	 *            String 文件路径及名称 如c:/fqf.txt
	 * @param fileContent
	 *            String
	 * @return boolean
	 */
	public static void delFile(String filePathAndName) {
		try {
			String filePath = filePathAndName;
			filePath = filePath.toString();
			java.io.File myDelFile = new java.io.File(filePath);
			myDelFile.delete();
		} catch (Exception e) {
			System.out.println("删除文件操作出错");
			e.printStackTrace();
		}
	}

	/**
	 * 读取到字节数组0
	 * @param filePath //路径
	 * @throws IOException
	 */
	public static byte[] getContent(String filePath) throws IOException {
		File file = new File(filePath);
		long fileSize = file.length();
		if (fileSize > Integer.MAX_VALUE) {
			System.out.println("file too big...");
			return null;
		}
		FileInputStream fi = new FileInputStream(file);
		byte[] buffer = new byte[(int) fileSize];
		int offset = 0;
		int numRead = 0;
		while (offset < buffer.length
				&& (numRead = fi.read(buffer, offset, buffer.length - offset)) >= 0) {
			offset += numRead;
		}
		// 确保所有数据均被读取
		if (offset != buffer.length) {
			throw new IOException("Could not completely read file " + file.getName());
		}
		fi.close();
		return buffer;
	}

	/**
	 * 读取到字节数组1
	 * 
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray(String filePath) throws IOException {

		File f = new File(filePath);
		if (!f.exists()) {
			throw new FileNotFoundException(filePath);
		}
		ByteArrayOutputStream bos = new ByteArrayOutputStream((int) f.length());
		BufferedInputStream in = null;
		try {
			in = new BufferedInputStream(new FileInputStream(f));
			int buf_size = 1024;
			byte[] buffer = new byte[buf_size];
			int len = 0;
			while (-1 != (len = in.read(buffer, 0, buf_size))) {
				bos.write(buffer, 0, len);
			}
			return bos.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			bos.close();
		}
	}

	/**
	 * 读取到字节数组2
	 * 
	 * @param filePath
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray2(String filePath) throws IOException {
		File f = new File(filePath);
		if (!f.exists()) {
			throw new FileNotFoundException(filePath);
		}
		FileChannel channel = null;
		FileInputStream fs = null;
		try {
			fs = new FileInputStream(f);
			channel = fs.getChannel();
			ByteBuffer byteBuffer = ByteBuffer.allocate((int) channel.size());
			while ((channel.read(byteBuffer)) > 0) {
				// do nothing
				// System.out.println("reading");
			}
			return byteBuffer.array();
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				channel.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				fs.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * Mapped File way MappedByteBuffer 可以在处理大文件时，提升性能
	 * 
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	public static byte[] toByteArray3(String filePath) throws IOException {

		FileChannel fc = null;
		RandomAccessFile rf = null;
		try {
			rf = new RandomAccessFile(filePath, "r");
			fc = rf.getChannel();
			MappedByteBuffer byteBuffer = fc.map(MapMode.READ_ONLY, 0,
					fc.size()).load();
			//System.out.println(byteBuffer.isLoaded());
			byte[] result = new byte[(int) fc.size()];
			if (byteBuffer.remaining() > 0) {
				// System.out.println("remain");
				byteBuffer.get(result, 0, byteBuffer.remaining());
			}
			return result;
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				rf.close();
				fc.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 复制文件
	 * 古老的方式
	 * @param f1
	 * @param f2
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年7月26日 下午3:30:29
	 *
	 */
	public static long copyFileforJava(File f1,File f2) throws Exception{
		if(!new File(f2.getParent()).exists()){
			new File(f2.getParent()).mkdirs();
		}
		long time=new Date().getTime();
		int length=2097152;
		FileInputStream in=new FileInputStream(f1);
		FileOutputStream out=new FileOutputStream(f2);
		byte[] buffer=new byte[length];
		while(true){
			int ins=in.read(buffer);
			if(ins==-1){
				in.close();
				out.flush();
				out.close();
				return new Date().getTime()-time;
			}else
				out.write(buffer,0,ins);
		}
	}
	/**
	 * 参数分别是原始文件,和拷贝的目的文件
	 * 
	 * 复制文件
	 * @param f1
	 * @param f2
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年7月26日 下午3:34:32
	 *
	 */
	public static long copyFileforTransfer(File f1,File f2) throws Exception{
		System.err.println("-------------------------------------"+f2.getParent());
		if(!new File(f2.getParent()).exists()){
			
			System.err.println("**8");
			new File(f2.getParent()).mkdirs();
		}
		long time=new Date().getTime();
		int length=2097152;
		FileInputStream in=new FileInputStream(f1);
		FileOutputStream out=new FileOutputStream(f2);
		FileChannel inC=in.getChannel();
		FileChannel outC=out.getChannel();
		int i=0;
		while(true){
			if(inC.position()==inC.size()){
				inC.close();
				outC.close();
				return new Date().getTime()-time;
			}
			if((inC.size()-inC.position())<20971520)
				length=(int)(inC.size()-inC.position());
			else
				length=20971520;
			inC.transferTo(inC.position(),length,outC);
			inC.position(inC.position()+length);
			i++;
		}
	}
	/**
	 * 复制文件
	 * 内存文件景象写
	 * @param f1
	 * @param f2
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年7月26日 下午3:33:26
	 *
	 */
	public static long copyFileforImage(File f1,File f2) throws Exception{
		if(!new File(f2.getParent()).exists()){
			new File(f2.getParent()).mkdirs();
		}
		long time=new Date().getTime();
		int length=2097152;
		FileInputStream in=new FileInputStream(f1);
		RandomAccessFile out=new RandomAccessFile(f2,"rw");
		FileChannel inC=in.getChannel();
		MappedByteBuffer outC=null;
		MappedByteBuffer inbuffer=null;
		byte[] b=new byte[length];
		while(true){
			if(inC.position()==inC.size()){
				inC.close();
				outC.force();
				out.close();
				return new Date().getTime()-time;
			}
			if((inC.size()-inC.position())<length){
				length=(int)(inC.size()-inC.position());
			}else{
				length=20971520;
			}
			b=new byte[length];
			inbuffer=inC.map(MapMode.READ_ONLY,inC.position(),length);
			inbuffer.load();
			inbuffer.get(b);
			outC=out.getChannel().map(MapMode.READ_WRITE,inC.position(),length);
			inC.position(b.length+inC.position());
			outC.put(b);
			outC.force();
		}
	}

	/**
	 * 复制文件
	 * 管道对管道
	 * @param f1
	 * @param f2
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年7月26日 下午3:32:40
	 *
	 */
	public static long copyFIleforChannel(File f1,File f2) throws Exception{
		if(!new File(f2.getParent()).exists()){
			new File(f2.getParent()).mkdirs();
		}
		long time=new Date().getTime();
		int length=2097152;
		FileInputStream in=new FileInputStream(f1);
		FileOutputStream out=new FileOutputStream(f2);
		FileChannel inC=in.getChannel();
		FileChannel outC=out.getChannel();
		ByteBuffer b=null;
		while(true){
			if(inC.position()==inC.size()){
				inC.close();
				outC.close();
				return new Date().getTime()-time;
			}
			if((inC.size()-inC.position())<length){
				length=(int)(inC.size()-inC.position());
			}else
				length=2097152;
			b=ByteBuffer.allocateDirect(length);
			inC.read(b);
			b.flip();
			outC.write(b);
			outC.force(false);
		}
	}

	public static void copy(String file1,String tag,String filepath) throws Exception{
		System.out.println("file1="+file1+"tag="+tag+"filepath"+filepath);
       File file=new File(file1);
		if(file.isDirectory()){
			File[] files=  file.listFiles();
			for (File file2 : files) {				
				FileUtil.copy(file2.getPath(), tag,filepath);
			}

		}else{
			String path;
			if(file1==filepath){
				path=tag+file.getName();
			}else{
				path=tag+"/"+file.getPath().replace(new File(filepath).getPath(), "");
			}

			FileUtil.copyFileforTransfer(file, new File(path));
			
			//2016年11月11日02:46:22kioor
			/*File f=new File(path+"--suceess.o");
			f.createNewFile();*/
		}

	}
   public static void main(String[] args) throws Exception {
	//E:/成果项目/49测试项目/測試111/20161021tag=D:\共享目录\七中队filepathE:/成果项目/49测试项目/測試111/20161021
	   copy("E:/成果项目/49测试项目/測試111/20161021", "D:\\共享目录\\七中队", "E:/成果项目/49测试项目/測試111/20161021");
}
}