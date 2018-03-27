package com.fh.service.ams.receive.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.*;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.File;
import com.fh.entity.amsmodel.Receive;
import com.fh.util.PageData;
import com.fh.service.ams.receive.AReceiveManager;

/**
 * 
 * @author kioor
 *	2016年5月11日09:34:19
 */
@Service("areceiveService")
public class AReceiveService implements AReceiveManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;



	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("ReceiveMapper.datalistPage", page);
	}



	public void save(Receive receive) throws Exception {
		dao.save("ReceiveMapper.savewithgraph",receive);



	}


	@SuppressWarnings("unchecked")
	public List<PageData> getRecivebyPageDate(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return 	(List<PageData>) dao.findForList("ReceiveMapper.getRecivebyPageDate", pd);
	}



	@Override
	public PageData getReciveExport(int rcId) throws Exception {
		// TODO Auto-generated method stub
		PageData pd=  (PageData) dao.findForObject("ReceiveMapper.getRcNameAndUserName",rcId);
	
		   List<PageData> k=  (List<PageData>) dao.findForList("FileMapper.selectMeByrcIds", rcId);
		   pd.put("file", k);
		return pd;
	}










}

