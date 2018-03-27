package com.fh.service.ams.prjtype.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fh.dao.*;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.Prjtype;
import com.fh.entity.system.Role;
import com.fh.util.PageData;
import com.fh.service.ams.prjtype.PrjtypeManager;

/**
 * 
 * @author kioor
 *	2016年5月18日09:46:32
 */
@Service("prjtypeService")
public class PrjtypeService implements PrjtypeManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**列表
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> selectAll(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("PrjtypeMapper.listAll", pd);
	}

	public List<PageData> getproTotallistPage(Page page) throws Exception {
	
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("PrjtypeMapper.getproTotallistPage", page);
	}

	/**列出所有项目类型
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllPrjtype(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("PrjtypeMapper.listAllPrjtype", pd);
	}
	




	
}

