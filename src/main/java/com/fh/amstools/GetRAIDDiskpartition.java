package com.fh.amstools;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.filechooser.FileSystemView;
import com.fh.entity.amsmodel.Storage;

public class GetRAIDDiskpartition {
/*	public static void main(String[] args) {
		getRAIDDiskpartion();
	}
	
	*/
	
	@SuppressWarnings({ "null", "unchecked" })
	public List<Map> getRAIDDiskpartion (){
		
		FileSystemView fileSystemView = FileSystemView.getFileSystemView();// 获取FileSystemView对象
		double unit = 1024 * 1024 * 1024;
		File[] roots = File.listRoots();
		
        List<Map> list = new ArrayList<Map>();
		for (File file : roots) {
			if(roots!=null){
				
				Map raidmap = new HashMap<String, Object>();
				String path = file.getPath();
				String pathName = path.substring(0, path.length()-1);;// 获取磁盘的路径名称
				String diskName = fileSystemView.getSystemTypeDescription(file);// 获取磁盘的类型描述信息
				long usableSpace = file.getUsableSpace();// 获取磁盘的可用空间
				long totalSpace = file.getTotalSpace();// 获取磁盘的总空间
				
				double usableSpaceG = usableSpace/ unit;
				double totalSpaceG = totalSpace/ unit;/*
				System.out.println("磁盘名称为：" + diskName + pathName);
				System.out.println("总空间为：" + totalSpaceG + "可用空间为："  + usableSpaceG);*/
				raidmap.put("pathName", pathName);
				raidmap.put("diskName", diskName);
				raidmap.put("usableSpaceG", usableSpaceG);
				raidmap.put("totalSpaceG", totalSpaceG);

		        list.add(raidmap);
			}
		}
		return list;
	}
	
}
