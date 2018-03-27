package com.fh.service.ams.prjtype;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.Prjtype;
import com.fh.util.PageData;

/**
 * 
 * @author kioor
 *  2016年5月11日09:20:32
 */
public interface PrjtypeManager{


	/**选择全部列
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> selectAll(PageData pd)throws Exception;

	public List<PageData> listAllPrjtype(PageData pd) throws Exception;

}

