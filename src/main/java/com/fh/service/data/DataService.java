package com.fh.service.data;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDataDictItem;
import com.fh.entity.system.Role;
import com.fh.util.PageData;

public interface DataService {

	List<PageData> listData(Page page) throws Exception;

/**
 * 根据id查询类型枚举列表
 * @param string
 * @return
 * @throws Exception 
 * @email:401701706@qq.com
 * @date:2017年8月2日 上午11:26:38
 *
 */
	List<FmsDataDictItem> listDataDictItemDataById(String id) throws Exception;

	/**
	 * 新增类型列表以及类型枚举
	 * @param dataDict
	 * @param string 
	 * @throws Exception 
	 * @email:401701706@qq.com
	 * @date:2017年8月3日 上午10:00:07
	 *
	 */
   void save(FmsDataDict dataDict, String string) throws Exception;
/**
 * 保存
 * @param dataDict
 * @throws Exception
 * @email:401701706@qq.com
 * @date:2017年9月22日 上午9:47:52
 *
 */
	void save(FmsDataDict dataDict) throws Exception;

	FmsDataDict findById(String string) throws Exception;
	
	FmsDataDict findByDATAKEY(String DATAKEY) throws Exception;

	void update(FmsDataDict dataDict, String string) throws Exception;

	FmsDataDictItem findFmsDataDictItembyDataKeyAndName(String datakey, String name) throws Exception;





}
