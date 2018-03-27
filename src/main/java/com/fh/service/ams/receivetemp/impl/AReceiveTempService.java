package com.fh.service.ams.receivetemp.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.*;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.ReceiveTemp;
import com.fh.util.PageData;
import com.fh.service.ams.receivetemp.AReceiveTempManager;

/**
 * 
 * @author kioor
 *	2016年5月11日09:34:19
 */
@Service("areceiveTempService")
public class AReceiveTempService implements AReceiveTempManager{

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


	/**保存
	 * @param page
	 * @throws Exception
	 */
	public void save(ReceiveTemp receivetemp) throws Exception {
		dao.save("ReceiveTempMapper.save",receivetemp);
		
		
		
	}


	
	
	
	
	
	

	
}

