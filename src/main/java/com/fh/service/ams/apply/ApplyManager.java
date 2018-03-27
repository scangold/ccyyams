package com.fh.service.ams.apply;

import java.util.List;


import com.fh.entity.Page;
import com.fh.entity.Result;
import com.fh.entity.amsmodel.Apply;
import com.fh.entity.amsmodel.ApplyStute;
import com.fh.util.PageData;

public interface ApplyManager {

	List<Apply> getApplyList() throws Exception;

	List<PageData> showApplylistpage(Page page) throws Exception;

	/**
	 * 获取申请 表详细信息
	 * @param apply_id
	 * @return
	 */
	PageData getApplyDesc(int apply_id);

	Result save(Apply apply,String fileIds);

	Result saveapplyStute(ApplyStute applyStute);
	
	/**
	 * 分发文件
	 * @param userIds
	 * @param user_ID
	 * @param desc
	 * @param files
	 * @return
	 * @throws Exception 
	 * @email:401701706@qq.com
	 * @date:2016年7月26日 上午10:32:49
	 *
	 */
	Result saveArchdistribute(String userIds, String user_ID, String desc, String files,Integer applyId) throws Exception;

	List<PageData> showArchdistributelistPage(Page page);

	PageData getArchiverecordDesc(Integer dpd);

	List<PageData> showApplyStutecount();




}
