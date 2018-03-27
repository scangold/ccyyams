package com.fh.service.fms.impl;


import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.fms.FmsAddFile;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDataDictItem;
import com.fh.entity.fms.FmsDocBox;
import com.fh.entity.fms.FmsDocMain;
import com.fh.service.fms.FmsService;
import com.fh.util.PageData;


@Service
public class FmsServiceImpl implements FmsService  {
	@Resource(name = "daoSupport")
	private DaoSupport dao;


	@Override
	public List<FmsDocBox> listNodes(FmsDocBox fmsDocBox) throws Exception {
		// TODO Auto-generated method stub

		return (List<FmsDocBox>) dao.findForList("FmsDocBoxMapper.selectByFmsDocBox", fmsDocBox);

	}


	@Override
	public void save(FmsDocBox fmsDocBox) throws Exception {
		// TODO Auto-generated method stub
		dao.save("FmsDocBoxMapper.insertSelective", fmsDocBox);
	}


	@Override
	public FmsDocBox findById(String id) throws Exception {
		// TODO Auto-generated method stub
		return (FmsDocBox)dao.findForObject("FmsDocBoxMapper.selectByPrimaryKey", id);
	}


	@Override
	public void updateDocBox(FmsDocBox fmsDocBox) throws Exception {
		// TODO Auto-generated method stub
		dao.update("FmsDocBoxMapper.updateByPrimaryKeySelective", fmsDocBox);
	}


	@Override
	public PageData getData(PageData pd) throws Exception {
		// TODO Auto-generated method stub

		pd.put("zrdepartment" ,  dao.findForList("DepartmentMapper.listCcyyzrDepartmentPD", null));
		pd.put("cbdepartment" ,  dao.findForList("DepartmentMapper.listCcyycbDepartmentPD", null));
		pd.put("fmsDocBox" ,  dao.findForObject("FmsDocBoxMapper.selectByPrimaryKey", pd.getString("fmsid")));

		return pd;
	}


	@Override
	public void saveFmsDocMain(FmsDocMain dmsDocMain) throws Exception {
		// TODO Auto-generated method stub
		dao.save("FmsDocMainMapper.insertSelective", dmsDocMain);
		for (FmsAddFile iterable_element : dmsDocMain.getFmsAddFiles()) {

			dao.save("FmsAddFileMapper.insertSelective", iterable_element);
		}  
	}


	@Override
	public List<PageData> listDoc(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("FmsDocMainMapper.listPage", page);
	}


	@Override
	public FmsDocMain findDocById(String id) throws Exception {
		// TODO Auto-generated method stub
		FmsDocMain fmsDocMain=	(FmsDocMain) dao.findForObject("FmsDocMainMapper.selectByPrimaryKey", id);
		Map map =new HashMap();
		if(fmsDocMain!=null) {
			map.put("datakey","classtype");	
			map.put("name", fmsDocMain.getClasstype());	

			FmsDataDictItem calsstype=	(FmsDataDictItem) dao.findForObject("FmsDataDictItemMapper.selectByPrimaryKey", map);
			if(calsstype==null) {
				
				FmsDataDict	 datadict=(FmsDataDict) dao.findForObject("FmsDataDictMapper.selectByDATAKEY", "classtype");
				calsstype=	datadict.getFmsDataDictItems().get(0);
			}
			fmsDocMain.setClasstypeFmsDataDictItem(calsstype);


			map.put("datakey",calsstype.getName()+"superordinateclass");  		  
			map.put("name", fmsDocMain.getSuperordinateclass());		  
			fmsDocMain.setSuperordinateclassFmsDataDictItem((FmsDataDictItem) dao.findForObject("FmsDataDictItemMapper.selectByPrimaryKey", map));

			map.put("datakey",calsstype.getName()+"medianclass");  			  
			map.put("name", fmsDocMain.getMedianclass());		  
			fmsDocMain.setMedianclassFmsDataDictItem((FmsDataDictItem) dao.findForObject("FmsDataDictItemMapper.selectByPrimaryKey", map));

			map.put("datakey",calsstype.getName()+"subordinateclass"); 		 
			map.put("name", fmsDocMain.getSubordinateclass());		  
			fmsDocMain.setSubordinateclassFmsDataDictItem((FmsDataDictItem) dao.findForObject("FmsDataDictItemMapper.selectByPrimaryKey", map));


			map.put("datakey","dense"); 
			map.put("name", fmsDocMain.getSecretlevel());		  
			fmsDocMain.setSecretlevelFmsDataDictItem((FmsDataDictItem) dao.findForObject("FmsDataDictItemMapper.selectByPrimaryKey", map));


			map.put("datakey","spec");	  
			map.put("name", fmsDocMain.getSpec());		  
			fmsDocMain.setSpecFmsDataDictItem((FmsDataDictItem) dao.findForObject("FmsDataDictItemMapper.selectByPrimaryKey", map));


			map.put("datakey","sumnumber");	
			map.put("name", fmsDocMain.getSumnumber());		 
			fmsDocMain.setSumnumberFmsDataDictItem((FmsDataDictItem) dao.findForObject("FmsDataDictItemMapper.selectByPrimaryKey", map));
			//文本类型

			map.put("datakey","doctype");	
			map.put("name", fmsDocMain.getDoclevel());		 
			fmsDocMain.setDoclevelFmsDataDictItem((FmsDataDictItem) dao.findForObject("FmsDataDictItemMapper.selectByPrimaryKey", map));



			//文件来源
			map.put("datakey","carrier");		 
			map.put("name", fmsDocMain.getCarrier());		  
			fmsDocMain.setCarrierDataDictItem((FmsDataDictItem) dao.findForObject("FmsDataDictItemMapper.selectByPrimaryKey", map));

		}
		return fmsDocMain;

	}


	@Override
	public Long findAllCount() throws Exception {
		// TODO Auto-generated method stub
		return  (Long) dao.findForObject("FmsDocMainMapper.selectByCount", null);
	}


	@Override
	public FmsAddFile findFmsAddFilebyid(String id) throws Exception {
		// TODO Auto-generated method stub
		return (FmsAddFile) dao.findForObject("FmsAddFileMapper.selectByPrimaryKey", id);
	}


	@Override
	public void updateFmsDocMain(FmsDocMain dmsDocMain,String deletefile) throws Exception {
		// TODO Auto-generated method stub
		dao.save("FmsDocMainMapper.updateByPrimaryKeySelective", dmsDocMain);
		for (FmsAddFile iterable_element : dmsDocMain.getFmsAddFiles()) {
			dao.save("FmsAddFileMapper.insertSelective", iterable_element);
		} 
		if(StringUtils.isNotEmpty(deletefile)) {
			String[] deletefi=	deletefile.split(",");
			for (String id : deletefi) {
				dao.save("FmsAddFileMapper.deleteByPrimaryKey", id);

			}}
	}


	@Override
	public void deleteDoc(PageData pd) throws Exception {
		// TODO Auto-generated method stub				
		
		FmsDocMain fmsDocMain=	(FmsDocMain) dao.findForObject("FmsDocMainMapper.selectByPrimaryKey", pd.getString("id"));
		dao.update("FmsDocMainMapper.updateDocISVALID", pd);
		List<FmsAddFile> ls=fmsDocMain.getFmsAddFiles();
		
		for (FmsAddFile fmsAddFile : ls) {
			File file=new File(fmsAddFile.getPath());
			file.delete();
		}
			
		
	}

	@Override
	public List<FmsDocBox> selectByForeignKey(String id) throws Exception {
		// TODO Auto-generated method stub
		return (List<FmsDocBox>) dao.findForList("FmsDocBoxMapper.selectByForeignKey", id);
	}


	@Override
	public void deleteDocBox(String id) throws Exception {
		// TODO Auto-generated method stub	

		deleteDocbosById(id);

	}

	void deleteDocbosById(String id) throws Exception {
		dao.update("FmsDocMainMapper.updateDocISVALIDbyfmsid", id);
		dao.update("FmsDocBoxMapper.updateDocBoxISVALIDbyfmsid", id);
		List<FmsDocBox> list= (List<FmsDocBox>) dao.findForList("FmsDocBoxMapper.selectByForeignKey", id);
		for (FmsDocBox fmsDocBox : list) {
			deleteDocbosById(fmsDocBox.getId());

		}
	}


	@Override
	public List<PageData> findDocLogByMouth(Date date) throws Exception {
		// TODO Auto-generated method stub
		return 	(List<PageData>) dao.findForList("FmsDocMainMapper.findDocLogByMouth", date);
	}


	@Override
	public List<PageData> findDocLog() throws Exception {
		// TODO Auto-generated method stub
		return 	(List<PageData>) dao.findForList("FmsDocMainMapper.findDocLog", null);
	}


	@Override
	public List<FmsDocBox> selectAllDocBox() throws Exception {
		// TODO Auto-generated method stub
		return (List<FmsDocBox>) dao.findForList("FmsDocBoxMapper.selectAllFmsDocBox", null);
	}


	@Override
	public List<FmsDocMain> findDocByIds(String ids) throws Exception {
		// TODO Auto-generated method stub
		
		return   (List<FmsDocMain>) dao.findForList("FmsDocMainMapper.findDocByIds", ids.split(","));
	}


	@Override
	public List<PageData> getCountByyear() throws Exception {
		// TODO Auto-generated method stub
		
		return   (List<PageData>) dao.findForList("FmsDocMainMapper.getCountByyear",null);
	}
	@Override
	public List<PageData> getCountByyearAndcarrier() throws Exception {
		// TODO Auto-generated method stub
		
		return   (List<PageData>) dao.findForList("FmsDocMainMapper.getCountByyearAndcarrier",null);
	}
	public List<PageData> getCountBycarrier() throws Exception {
		// TODO Auto-generated method stub
		
		return   (List<PageData>) dao.findForList("FmsDocMainMapper.getCountBycarrier",null);
	}





}
