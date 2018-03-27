package test;

import java.io.File;
import java.util.Date;

import com.fh.util.FileUtil;


public class file {


	public static void main(String[] args) {
		final File f=new File("E:/迅雷下载/android-ndk-master.zip");
		
		new Thread(new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
			      Date  date=new Date();
					FileUtil.copyFIleforChannel(f, new File("E:/share/share4/CentOS-7-x86_64-Everything-1511.iso"));
					System.out.println(this.toString()+"copyFIleforChannel");
					System.out.println((new Date().getTime())-date.getTime());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				

			}
		}).start();

		new Thread(new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
			      Date  date=new Date();
					FileUtil.copyFileforJava(f, new File("E:/share/share3/CentOS-7-x86_64-Everything-1511.iso"));
					System.out.println(this.toString()+"copyFileforJava");
					System.out.println((new Date().getTime())-date.getTime());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				

			}
		}).start();
		new Thread(new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
			      Date  date=new Date();
					FileUtil.copyFileforImage(f, new File("E:/share/share2/CentOS-7-x86_64-Everything-1511.iso"));
					System.out.println(this.toString()+"copyFileforImage");
					System.out.println((new Date().getTime())-date.getTime());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				

			}
		}).start();
		new Thread(new Runnable() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
			      Date  date=new Date();
					FileUtil.copyFileforTransfer(f, new File("E:/share/share1/CentOS-7-x86_64-Everything-1511.iso"));
				System.out.println(this.toString()+"copyFileforTransfer");
					System.out.println((new Date().getTime())-date.getTime());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				

			}
		}).start();

		

	}
}
