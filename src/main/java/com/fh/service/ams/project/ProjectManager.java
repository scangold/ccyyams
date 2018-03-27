package com.fh.service.ams.project;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.Project;
import com.fh.util.PageData;

/**
 * 
 * @author kioor
 *  2016年5月11日09:20:32
 */
public interface ProjectManager{

	/**新增
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**新增
	 * @param project
	 * @return 
	 * @throws Exception
	 */
	public void save(Project project)throws Exception;
	
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
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**通过NAME获取数据
	 * @param prjname
	 * @throws Exception
	 */
	public PageData findByName(String prjname)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
	
	
	
	
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData getProjectCount(String value)throws Exception;
	
	/**
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年8月8日 下午3:30:20
	 *
	 */
	public List<PageData> getproTotallistPage(Page page) throws Exception;
	/**
	 *get all project name and Id 
	 * @param proname 
	 * @return
	 * @throws Exception 
	 * @email:401701706@qq.com
	 * @date:2016年8月26日 上午10:58:53
	 *
	 */
	public List<PageData> getProjiecNameAndId(String proname) throws Exception;
}

