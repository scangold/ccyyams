package com.fh.service.ams.fdm.impl;

import java.util.List;

import javax.annotation.Resource;







import org.springframework.stereotype.Service;

import com.fh.dao.*;
import com.fh.entity.Page;
import com.fh.util.PageData;
import com.fh.service.ams.fdm.FdmManager;

/**
 * 
 * @author kioor
 *	2016年5月31日14:44:27
 */
@Service("fdmService")
public class FdmService implements FdmManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;


	/**列表
	 * @param pd
	 * @throws Exception
	 */
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("FdmMapper.fdmlistPage", page);
	}
	
	/**保存
	 * @param page
	 * @throws Exception
	 */
	public void save(PageData pd) throws Exception {
		dao.save("FdmMapper.save",pd);
	}
	/**删除
	 * @param pd
	 * @throws Exception
	 */
/*	public void delete(PageData pd)throws Exception{
		dao.delete("FdmMapper.delete", pd);
	}*/



	
	
	
	
	
	

	
}

