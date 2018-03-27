package com.fh.service.ams.receive;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.Receive;
import com.fh.util.PageData;

/**
 * 
 * @author kioor
 *  2016年5月11日09:20:32
 */
public interface AReceiveManager{

	/**新增
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	public void save(Receive receive)throws Exception;
	
	
	/**选择全部列
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;


	public List<PageData> getRecivebyPageDate(PageData pd) throws Exception;


	public PageData getReciveExport(int reciveId) throws Exception;


	
}

