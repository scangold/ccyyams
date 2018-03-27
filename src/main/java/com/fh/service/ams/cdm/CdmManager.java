package com.fh.service.ams.cdm;

import java.util.List;

import com.fh.entity.Page;
import com.fh.util.PageData;

/**
 * 
 * @author kioor
 *  2016年6月16日16:32:31
 */
public interface CdmManager{


	/**新增
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;

	
}

