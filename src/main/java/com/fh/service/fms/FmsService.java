package com.fh.service.fms;

import java.util.Date;
import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.fms.FmsAddFile;
import com.fh.entity.fms.FmsDocBox;
import com.fh.entity.fms.FmsDocMain;
import com.fh.util.PageData;

public interface FmsService {


	List<FmsDocBox> listNodes(FmsDocBox fmsDocBox) throws Exception;

	void save(FmsDocBox fmsDocBox) throws Exception;

	FmsDocBox findById(String id) throws Exception;

	void updateDocBox(FmsDocBox fmsDocBox) throws Exception;

	PageData getData(PageData pd) throws Exception;

	void saveFmsDocMain(FmsDocMain dmsDocMain) throws Exception;

	/**
	 * 获取文书列表数据
	 * @param page
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2017年8月25日 上午9:29:29
	 *
	 */
	List<PageData> listDoc(Page page) throws Exception;
	/**
	 * 根据id查询FmsDocMain详细信息
	 * @param string
	 * @return
	 * @throws Exception 
	 * @email:401701706@qq.com
	 * @date:2017年8月25日 上午9:26:56
	 *
	 */
	FmsDocMain findDocById(String string) throws Exception;

	Long findAllCount() throws Exception;
/**
 * 根据id查询FmsAddFile
 * @param id
 * @return
 * @throws Exception 
 * @email:401701706@qq.com
 * @date:2017年8月29日 下午2:44:55
 *
 */
	FmsAddFile findFmsAddFilebyid(String id) throws Exception;
/**
 * 修改
 * @param dmsDocMain
 * @throws Exception 
 * @email:401701706@qq.com
 * @date:2017年8月29日 下午5:07:20
 *
 */
void updateFmsDocMain(FmsDocMain dmsDocMain,String deletefile) throws Exception;
/**
 * 删除doc
 * @param pd
 * @throws Exception 
 * @email:401701706@qq.com
 * @date:2017年9月8日 上午11:38:28
 *
 */
void deleteDoc(PageData pd) throws Exception;

List<FmsDocBox> selectByForeignKey(String fmsid) throws Exception;

/**
 * 删除文书目录 和下面的文件
 * @param id
 * @throws Exception
 * @email:401701706@qq.com
 * @date:2017年9月8日 下午4:56:14
 *
 */
void deleteDocBox(String id) throws Exception;


/**
 * 根据月份查询文书
 * @param date
 * @return
 * @throws Exception 
 * @email:401701706@qq.com
 * @date:2017年9月18日 上午10:09:36
 *
 */
List<PageData> findDocLogByMouth(Date date) throws Exception;
/**
 * 文件目录 
 * excel
 * @return
 * @throws Exception 
 * @email:401701706@qq.com
 * @date:2017年9月18日 下午2:12:52
 *
 */
List<PageData> findDocLog() throws Exception;

List<FmsDocBox> selectAllDocBox() throws Exception;

List<FmsDocMain> findDocByIds(String ids) throws Exception;

List<PageData> getCountByyear() throws Exception;

List<PageData> getCountByyearAndcarrier() throws Exception;

List<PageData> getCountBycarrier() throws Exception;

}
