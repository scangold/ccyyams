package com.fh.service.kms.kmsfiles;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.KmsFiles;
import com.fh.util.PageData;


public interface KmsfilesManager{

	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;

	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;

	/**通过编码获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByBianma(PageData pd)throws Exception;
	

	
/*	*//**
	 * 获取所有数据并填充每条数据的子级列表(递归处理)
	 * @param 
	 * @return
	 * @throws Exception
	 *//*
	public List<KmsFiles> listAllKmsFiles(String parentId) throws Exception;*/

	/**列出所有列
	 * @param page
	 * @throws Exception
	 */
	public List<KmsFiles> listAllKmsFiles2(PageData pd) throws Exception;
	
	
	/**列出表中所有要素 返回PageData
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listAllKmsFilesPD(PageData pd) throws Exception;
	
	/**列出表中所有要素 返回PageData
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page) throws Exception;
	
	/**
	 * 通过ID获取其子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public List<KmsFiles> listSubKmsFilesByParentId(String parentId) throws Exception;
	
	/**
	 * 通过Le(即parentid)获取子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listSubKmsFilesByLe(PageData pd) throws Exception;
	
	
	/**
	 * 通过le获取子级列表
	 * @param parentId
	 * @return
	 * @throws Exception
	 */
	public List<KmsFiles> listByKmsFiles(KmsFiles kmsfiles) throws Exception;	
	
}

