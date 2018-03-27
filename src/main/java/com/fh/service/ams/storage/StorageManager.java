package com.fh.service.ams.storage;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.Storage;
import com.fh.util.PageData;

/**
 * 
 * @author kioor
 *  2016年5月11日09:20:32
 */
public interface StorageManager{

	/**新增
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;

	public void save(Storage storage)throws Exception;
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
//	
//	/**修改
//	 * @param pd
//	 * @throws Exception
//	 */
//	public void editHD(PageData pd)throws Exception;
	

	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	

	/**根据realstorageid判断记录是否存在
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getStorageByRealStorageid(PageData pd)throws Exception;
	
	
	
	
//	/**通过id获取数据
//	 * @param pd
//	 * @throws Exception
//	 */
//	public PageData findById(PageData pd)throws Exception;
//	
//	/**批量删除
//	 * @param ArrayDATA_IDS
//	 * @throws Exception
//	 */
//	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
}

