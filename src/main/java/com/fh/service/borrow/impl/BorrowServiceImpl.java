package com.fh.service.borrow.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.PmsBorrowContent;
import com.fh.entity.fms.FmsBorrow;
import com.fh.entity.fms.FmsBorrowContent;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDataDictItem;
import com.fh.entity.fms.FmsDocMain;
import com.fh.service.borrow.BorrowService;
import com.fh.service.data.DataService;
import com.fh.util.PageData;
@Service
public class BorrowServiceImpl implements BorrowService  {
	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public List<PageData> listData(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("FmsBorrowMapper.datalistPage", page);
	}
	@Override
	public void save(FmsBorrow fmsBorrow, PageData pd) throws Exception {
		// TODO Auto-generated method stub


		dao.save("FmsBorrowMapper.insertSelective", fmsBorrow);
		List<FmsBorrowContent> s=new ArrayList<FmsBorrowContent>();
		String ids= pd.getString("ids");
		if(StringUtils.isNotEmpty(ids)) {
			FmsBorrowContent fmsBorrowContent;
			FmsDocMain fmsDocMain=new FmsDocMain();			
				String[] idsz=	ids.split(",");
				for (String string : idsz) {
					fmsBorrowContent=new FmsBorrowContent();
					fmsBorrowContent.setFmsId(fmsBorrow.getId());
					fmsBorrowContent.setId(string);
					fmsDocMain.setId(string);
					if(fmsBorrow.getIsvalid()==1) {
						fmsDocMain.setIsvalid((short)2);
						dao.update("FmsDocMainMapper.updateByPrimaryKeySelective",fmsDocMain);
						}
					
					s.add(fmsBorrowContent);
				}
				dao.batchSave("FmsBorrowContentMapper.insertByBatch", s);
			}
			
			
	}
	@Override
	public void savePmsBorrow(FmsBorrow fmsBorrow, PmsBorrowContent pmsBorrowContent) throws Exception {
		// TODO Auto-generated method stub
		dao.save("FmsBorrowMapper.insertSelective", fmsBorrow);		
		dao.save("FmsBorrowContentMapper.insertPmsborrowContent", pmsBorrowContent);
	}
	@Override
	public void savePmsReturn(FmsBorrow fmsBorrow) throws Exception {
		// TODO Auto-generated method stub
		dao.update("FmsBorrowMapper.updateByPrimaryKeySelective", fmsBorrow);		

	}
	@Override
	public int deleteByBorrowId(String string) throws Exception {
		// TODO Auto-generated method stub
		FmsBorrow fmsBorrow=new FmsBorrow();
		fmsBorrow.setId(string);
		fmsBorrow.setNowendtime(new Date());
		fmsBorrow.setIsvalid(0);

		List<FmsBorrowContent> ls=	(List<FmsBorrowContent>) dao.findForList("FmsBorrowContentMapper.selectByid", string);
		for (FmsBorrowContent act : ls) {		
	
			FmsDocMain fmsDocMain=new FmsDocMain();
			fmsDocMain.setIsvalid((short)1);				
			fmsDocMain.setId(act.getId());
		
				dao.update("FmsDocMainMapper.updateByPrimaryKeySelective",fmsDocMain);
		
		};



		return (int) dao.update("FmsBorrowMapper.updateByPrimaryKeySelective", fmsBorrow);
	}

	@Override
	public FmsBorrow findbyid(String string) throws Exception {
		// TODO Auto-generated method stub
		FmsBorrow 	FmsBorrow=(FmsBorrow) dao.findForObject("FmsBorrowMapper.selectByPrimaryKey", string);
		List<FmsDocMain>  fmsDocMains=(List<FmsDocMain>) dao.findForList("FmsDocMainMapper.selectByBorrowPrimaryKey", string);

		FmsBorrow.setFmsDocMains(fmsDocMains);
		return FmsBorrow;
	}

}
