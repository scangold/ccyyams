package com.fh.service.ams.statistics.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.service.ams.statistics.StatisticsManager;
import com.fh.util.PageData;
@Service
public class StatisticsService implements StatisticsManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Override
	public PageData getAllProject() throws Exception {
		// TODO Auto-generated method stub
	
		return 	(PageData) dao.findForObject("ProjectMapper.getProjectCount", null);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getProjectFilelist() throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("ProjectMapper.getProjectFilelist", null);
	}
	

}
