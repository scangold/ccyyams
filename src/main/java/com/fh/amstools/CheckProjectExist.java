package com.fh.amstools;

import javax.annotation.Resource;

import com.fh.dao.DaoSupport;
import com.fh.entity.amsmodel.Project;
import com.fh.service.ams.project.ProjectManager;
import com.fh.util.PageData;

public class CheckProjectExist {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Resource(name="projectService")
	private ProjectManager projectService;
	
	public int IfProjectExist(Project hisProject) throws Exception{
		int PRJ_ID =0;
		String prjname = hisProject.getPrjName();
		//查询是否存在同项目名称，若存在同项目名称，则归为同一项目，获取其ID
		PageData getprjpd = projectService.findByName(prjname);
		if(getprjpd==null){
			//不存在该名称项目，则存入
			dao.save("ProjectMapper.saveproject", hisProject);
			
			PRJ_ID = hisProject.getPrjId();
		}else{

			//存在该名称项目,获取项目ID
			PRJ_ID = (int) getprjpd.get("PRJ_ID");
			
		}
		return PRJ_ID;
	}
	
	
	

}
