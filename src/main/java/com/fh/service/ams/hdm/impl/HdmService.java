package com.fh.service.ams.hdm.impl;

import java.util.List;

import javax.annotation.Resource;








import org.springframework.stereotype.Service;

import com.fh.dao.*;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.ams.hdm.HdmManager;

/**
 * 
 * @author kioor
 *	2016年5月31日14:44:27
 */
@Service("hdmService")
public class HdmService implements HdmManager{


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
		return (List<PageData>)dao.findForList("HdmMapper.hdmlistPage", page);
	}
	

	@Override
	public void save(PageData pd) throws Exception {
		dao.save("HdmMapper.save",pd);
	}

	@Override
	public void delete(PageData pd)throws Exception{
		dao.delete("HdmMapper.delete", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("HdmMapper.findById", pd);
	}
	
	
	

	
}

