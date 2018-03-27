package com.fh.service.ams.project.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.*;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.Project;
import com.fh.util.PageData;
import com.fh.service.ams.project.ProjectManager;

/**
 * 
 * @author kioor
 *	2016年5月11日09:34:19
 */
@Service("projectService")
public class ProjectService implements ProjectManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public void save(PageData pd) throws Exception {
		dao.save("ProjectMapper.save", pd);
	}

	public void save(Project project) throws Exception {
		dao.save("ProjectMapper.saveproject", project);
	}

	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("ProjectMapper.delete", pd);
		
	}

	@Override
	public void edit(PageData pd) throws Exception {
		 dao.update("ProjectMapper.edit", pd);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("ProjectMapper.datalistPage", page);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listAll(PageData pd) throws Exception {
		return (List<PageData>)dao.findForList("ProjectMapper.listAll", pd);

	}

	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("ProjectMapper.findById", pd);
	}

	@Override
	public void deleteAll(String[] ArrayDATA_IDS) throws Exception {
		// TODO Auto-generated method stub
		
	}
	


	
	
	

	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData getProjectCount(String value)throws Exception{
		return (PageData)dao.findForObject("ProjectMapper.getProjectCount", value);
	}

	
	
	@Override
	public PageData findByName(String prjname) throws Exception {
		
		return (PageData)dao.findForObject("ProjectMapper.findPDByName", prjname);
	}

	@Override
	public List<PageData> getproTotallistPage(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForObject("ProjectMapper.getproTotallistPage", page);
		
	}
	@Override
	public List<PageData> getProjiecNameAndId(String prjName) throws Exception {
		// TODO Auto-generated method stub

				return (List<PageData>)dao.findForList("ProjectMapper.getProjiecNameAndId", prjName);
		
	}


	
}

