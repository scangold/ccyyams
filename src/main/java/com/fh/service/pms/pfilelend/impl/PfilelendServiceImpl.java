package com.fh.service.pms.pfilelend.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.PmsCertificateAndHonor;
import com.fh.entity.amsmodel.PmsPExperience;
import com.fh.entity.amsmodel.PmsPInformation;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDataDictItem;
import com.fh.entity.system.User;
import com.fh.service.pms.persInfo.PersInfoService;
import com.fh.service.pms.pfilelend.PfilelendService;
import com.fh.util.PageData;

@Service
public class PfilelendServiceImpl  implements PfilelendService{
	@Resource(name = "daoSupport")
	private DaoSupport dao;


	/**根据
	 * 	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAllPlendInfos(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("PmsDocMainMapper.listAllPlendInfoslistPage", page);
	}
	/**根据Pid查询所有工作经历
	 * 	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAllPlendInfosById(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("PmsDocMainMapper.listAllPlendInfosByIdlistPage", page);
	}



}
