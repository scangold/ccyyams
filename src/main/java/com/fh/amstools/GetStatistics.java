package com.fh.amstools;

import java.util.List;

import com.fh.util.PageData;

public class GetStatistics {

	public GetStatistics(){
		
	}
	public FileIfArchiveCount getFileIfArchiveCount(List<PageData> pds){
		FileIfArchiveCount count = new FileIfArchiveCount();

		net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray.fromObject(pds);
		
		
		for(int i=0;i<jsonArray.size();i++){
			String s = jsonArray.getJSONObject(i).getString("IFARCHIVE");
			int c = jsonArray.getJSONObject(i).getInt("ARCOUNT");
			switch (s){
			case "1":
				
				count.setArc1Count(c);
				
				break;
			case "2":
				count.setArc2Count(c);
				
				break;
			case "3":
				count.setArc3Count(c);
				
				break;
			case "4":
				count.setArc4Count(c);
				
				break;
			case "5":
				count.setArc5Count(c);
				
				break;
			}
			
		}
		
		return count;
	}
}
