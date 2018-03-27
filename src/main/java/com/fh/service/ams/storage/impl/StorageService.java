package com.fh.service.ams.storage.impl;

import java.util.List;

import javax.annotation.Resource;










import org.springframework.stereotype.Service;

import com.fh.dao.*;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.Storage;
import com.fh.util.PageData;
import com.fh.service.ams.hdm.HdmManager;
import com.fh.service.ams.storage.StorageManager;

/**
 * 
 * @author kioor
 *	2016年5月31日14:44:27
 */
@Service("storageService")
public class StorageService implements StorageManager{


	@Resource(name = "daoSupport")
	private DaoSupport dao;


	/**用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("StorageMapper.storagelistPage", page);
	}
	

	@Override
	public void save(PageData pd) throws Exception {
		dao.save("StorageMapper.save",pd);
	}
	public void save(Storage storage) throws Exception {
		dao.save("StorageMapper.insertSelective",storage);
	}

	public PageData getStorageByRealStorageid(PageData pd) throws Exception {
		return pd = (PageData) dao.findForList("StorageMapper.getStorageInfo",pd);
		
	}
	
	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("StorageMapper.delete", pd);
	}

	
	
	
	

	
}

