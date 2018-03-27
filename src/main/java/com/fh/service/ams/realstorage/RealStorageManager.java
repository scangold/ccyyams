package com.fh.service.ams.realstorage;

import java.util.List;

import net.sf.json.JSONArray;

import org.apache.ibatis.annotations.Param;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.Project;
import com.fh.entity.amsmodel.RealStorage;
import com.fh.util.PageData;

/**
 * 
 * @author kioor
 *  2016年5月11日09:20:32
 */
public interface RealStorageManager{

	/**新增
	 * @param pd
	 * @return 
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
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	

	/**类型列表
	 * @param page 
	 * @param storage_type
	 * @throws Exception
	 */
	public List<PageData> typelist(Page page)throws Exception;

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**通过NAME获取数据
	 * @param namestring
	 * @throws Exception
	 */
	public int findByName(String namestring)throws Exception;

	public PageData findEntityByName(String namestring) throws Exception;
	
	/**根据类型字段删除记录
	 * @param pd
	 * @throws Exception
	 */
	public void deleteByType(PageData pd)throws Exception;

	/**根据类型插入pd数据 
	 * @param rs
	 * @throws Exception
	 */
	public void saveByType(PageData pd) throws Exception;

/*	public List<PageData> getRealstorageby(PageData pd);*/

	public Boolean saveRAID(JSONArray jsonArrayRAID);

	/**插入数据或更新数据 
	 * @param rs
	 * @throws Exception
	 */
	public void saveOrUpdate(RealStorage rt) throws Exception;

	/**插入新对象realstorage到表中 xml逆向生成 
	 * @param rs
	 * @throws Exception
	 */
	public void insertSelective(RealStorage rs) throws Exception;
	
	
	/**根据id更新realstorage
	 * @param rs
	 * @throws Exception
	 */
	public void updateByPrimaryKeySelective(RealStorage rs) throws Exception;



	/**通过STORAGETYPENAME判断是否存在记录 并用pd获取ID
	 * @param rs
	 * @throws Exception
	 */
	public PageData whetherTypeNameExist(RealStorage rs) throws Exception;

	public List<PageData> showRealstoragecount() throws Exception;



}

