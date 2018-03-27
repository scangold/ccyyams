package com.fh.service.fmspz;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDocMain;
import com.fh.entity.fms.FmsPZDoc;
import com.fh.entity.fms.FmsPZDocBox;
import com.fh.entity.fms.FmsPZDocVolume;
import com.fh.util.PageData;

public interface FmspzService {

	PageData listData(Page page) throws Exception;
	
	PageData listAlldelete(Page page) throws Exception;
	
	PageData listborrow(Page page) throws Exception;
	
	PageData findById(String string) throws Exception;
	
	PageData findByboxId(String string) throws Exception;
	
	PageData findByacboxId(String string) throws Exception;

	public void eidtPz(PageData pd) throws Exception;
	
	PageData goadd(PageData pd) throws Exception;
	
	PageData godeleteall(PageData pd) throws Exception;
	
	public void save(PageData pd) throws Exception;
	
	public void borrowsave(PageData pd) throws Exception;
	
	public void returnborrow(PageData pd) throws Exception;
	
	public void deletepz(PageData pd) throws Exception;
	
	public void deleteallpz(PageData pd) throws Exception;
	
	PageData num(PageData pd) throws Exception;
	
	List<FmsPZDocBox> findBoxByIds(String ids) throws Exception;
	
	List<PageData> getCountByyear() throws Exception;
}
