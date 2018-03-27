package com.fh.service.ams.receivetemp;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.ReceiveTemp;
import com.fh.util.PageData;

/**
 * 
 * @author kioor
 *  2016年5月11日09:20:32
 */
public interface AReceiveTempManager{

	/**新增
	 * @param pd
	 * @return 
	 * @throws Exception
	 */
	public void save(ReceiveTemp receivetemp)throws Exception;
	
	
	/**选择全部列
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;


	
}

