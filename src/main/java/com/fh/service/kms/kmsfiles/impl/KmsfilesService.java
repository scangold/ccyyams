package com.fh.service.kms.kmsfiles.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.KmsFiles;
import com.fh.entity.system.Department;
import com.fh.util.PageData;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.kms.kmsfiles.KmsfilesManager;

/*//
 * @author kioor
 * @time 2017年8月21日21:52:16
 * @name 科技档案相关
 *  * 
 */
@Service("kmsfilesService")
public class KmsfilesService implements KmsfilesManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	


	
	
	
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("KmsFilesMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("KmsFilesMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("KmsFilesMapper.edit", pd);
	}
	
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("KmsFilesMapper.findById", pd);
	}
	
	/**通过编码获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByBianma(PageData pd)throws Exception{
		return (PageData)dao.findForObject("KmsFilesMapper.findByBianma", pd);
	}
	

	
/*	*//**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param MENU_ID
	 * @return
	 * @throws Exception
	 *//*
	public List<KmsFiles> listAllKmsFiles(String parentId) throws Exception {
		List<KmsFiles> fmsfilesList = this.listSubKmsFilesByParentId(parentId);
		for(KmsFiles depar : departmentList){
			depar.setTreeurl("department/list.do?DEPARTMENT_ID="+depar.getDEPARTMENT_ID());
			depar.setSubKmsFiles(this.listAllKmsFiles(depar.getDEPARTMENT_ID()));
			depar.setTarget("treeFrame");
		}
		return fmsfilesList;
	}*/
	/**
	 * 列出表中所有要素 未作排除父节点
	 */
	@SuppressWarnings("unchecked")
	public List<KmsFiles> listAllKmsFiles2(PageData pd)throws Exception{
		return (List<KmsFiles>)dao.findForList("KmsFilesMapper.listAllKmsFiles2", pd);
	}
	/**列出表中所有要素 返回PageData
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAllKmsFilesPD(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("KmsFilesMapper.listAllKmsFilesPD", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("KmsFilesMapper.datalistPage", page);
	}
	
	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<KmsFiles> listSubKmsFilesByParentId(String parentId) throws Exception {
		return (List<KmsFiles>) dao.findForList("KmsFilesMapper.listSubKmsFilesByParentId", parentId);
	}

	/**
	 * 列出父节点文件
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listSubKmsFilesByLe(PageData pd) throws Exception {
		return (List<PageData>) dao.findForList("KmsFilesMapper.listSubKmsFilesByLe", pd);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<KmsFiles> listByKmsFiles(KmsFiles kmsfiles) throws Exception {
		// TODO Auto-generated method stub
		return (List<KmsFiles>) dao.findForList("KmsFilesMapper.listByKmsFiles", kmsfiles);
	}




	

}


