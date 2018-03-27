package com.fh.service.data.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDataDictItem;
import com.fh.service.data.DataService;
import com.fh.util.PageData;
@Service
public class DataServiceImpl implements DataService  {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	public List<PageData> listData(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("FmsDataDictMapper.datalistPage", page);
	}
	@Override
	public List<FmsDataDictItem> listDataDictItemDataById(String id) throws Exception {
		// TODO Auto-generated method stub
		return (List<FmsDataDictItem>)dao.findForList("FmsDataDictItemMapper.listDataDictItemDataById", id);
	}
	@Override
	public void save(FmsDataDict dataDict) throws Exception {
		dao.save("FmsDataDictMapper.insertSelective", dataDict);
	}
	@Override
	public void save(FmsDataDict dataDict, String string) throws Exception {
		// TODO Auto-generated method stub
		dao.save("FmsDataDictMapper.insertSelective", dataDict);
		
		if(StringUtils.isNotEmpty(string)) {
			String[] 	str=string.split(",row,");
			FmsDataDictItem dataItem;	
			for (String string2 : str) {
				String[] 	data=string2.split(",col,");
				dataItem=new FmsDataDictItem();
				dataItem.setId(dataDict.getId());
				dataItem.setDatakey(dataDict.getDatakey());
				dataItem.setName(data[0]);
				dataItem.setValue(data[1]);	
				dataItem.setSorts(Integer.parseInt(data[2]));
				dao.save("FmsDataDictItemMapper.insertSelective", dataItem);
			}
		}
	}
	@Override
	public FmsDataDict findById(String id) throws Exception {
		// TODO Auto-generated method stub
		return (FmsDataDict) dao.findForObject("FmsDataDictMapper.selectByPrimaryKey", id);
	}


	@Override
	public void update(FmsDataDict dataDict, String string) throws Exception {
		// TODO Auto-generated method stub		
		dao.update("FmsDataDictMapper.updateByPrimaryKeySelective", dataDict);
			if(StringUtils.isNotEmpty(string)) {
			String[] 	str=string.split(",row,");
			FmsDataDictItem dataItem;	
		
			for (String string2 : str) {
				String[] 	data=string2.split(",col,");
				dataItem=new FmsDataDictItem();
				dataItem.setId(dataDict.getId());
				dataItem.setName(data[0]);
				dataItem.setValue(data[1]);	
				dataItem.setDatakey(dataDict.getDatakey());
				dataItem.setSorts(Integer.parseInt(data[2]));
				dataItem.setIsvalid(Short.parseShort(data[3]));
				Object object=	 dao.update("FmsDataDictItemMapper.updateByPrimaryKeySelective", dataItem);
				if(object.toString().equals("0")) {
				dao.save("FmsDataDictItemMapper.insertSelective", dataItem);
			}}
		}
	}
	
	@Override
	public FmsDataDict findByDATAKEY(String selectByDATAKEY) throws Exception {
		// TODO Auto-generated method stub
		
		return (FmsDataDict) dao.findForObject("FmsDataDictMapper.selectByDATAKEY", selectByDATAKEY);
	}


	@Override
	public FmsDataDictItem findFmsDataDictItembyDataKeyAndName(String datakey, String name) throws Exception {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		map.put("name", name);
		map.put("datakey", datakey);

		return (FmsDataDictItem) dao.findForObject("FmsDataDictMapper.selectByPrimaryKey", map);
	}





	






}
