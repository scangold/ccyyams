package com.fh.service.ams.file;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.File;
import com.fh.entity.amsmodel.FileDetail;
import com.fh.entity.amsmodel.Receive;
import com.fh.entity.amsmodel.ReceiveTemp;
import com.fh.entity.system.User;
import com.fh.util.PageData;

/**
 * 
 * @author kioor
 *  2016年6月16日16:32:31
 */
public interface FileManager{

	/**新增2
	 * @param pd
	 * @throws Exception
	 */
	public void savecheckArray(List<PageData> varHDListadd)throws Exception;

	public void handsave(PageData pd)throws Exception;
	public void save(File file)throws Exception;
	

	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;

	
	/**
	 * 
	 * @param page
	 * @return
	 * @throws Exception
	 * @date:2016年7月20日 下午4:54:00
	 *
	 */
	List<PageData> showCheckFilelistPage(Page page) throws Exception;

	/**
	 * 
	 * @param page
	 * @return
	 * @throws Exception 
	 * @email:401701706@qq.com
	 * @date:2016年7月20日 下午6:56:39
	 *
	 */
	public List<PageData> listPage(Page page) throws Exception;


	public List<PageData> getfilelistByIds(PageData pd) throws Exception;



	public void saveHistoryArchiveDataToFILES(List<PageData> pdFileList) throws Exception;

	public PageData seveFiles(PageData pd, String user_ID, CommonsMultipartFile[] files) throws IllegalStateException, IOException, Exception;
	public void saveHistoryArchiveStorage(List<PageData> pdStorageList) throws Exception;

	public List<PageData> fileTemplistPage(Page page) throws Exception;


	public void delete(PageData pd) throws Exception;

	/**接收
	 * 提交保存档案目录及文件
	 * @param re
	 * @param f
	 * @param files
	 * @param user
	 * @param storageId
	 * @return
	 * @email:401701706@qq.com
	 * @date:2016年11月9日 上午9:53:39
	 *
	 */
	public PageData saveFiles(Receive re, File f, CommonsMultipartFile[] files, User user, Integer storageId);
	
	/**
	 * 上传电子档案
	 * @param re
	 * @param f
	 * @param files
	 * @param user
	 * @param storageId
	 * @return
	 * @author:jttl
	 * @date:2018年2月1日 下午1:54:18
	 *
	 */
	public PageData saveFiles2(CommonsMultipartFile[] files, File f,User user, String kboxid);
	
	public PageData findById(PageData pd) throws Exception;

	public List<PageData> listpfs(Page page)throws Exception;
	
	/**接收
	 * 接收手动输入的成果目录相关内容
	 * @param rctemp
	 * @param rc
	 * @param f
	 * @param fdetail
	 * @param user
	 * @return
	 * @email:1106135420@qq.com
	 * @date:2016年10月14日 上午9:25:39
	 *
	 */
	public PageData saveHandRCFiles(CommonsMultipartFile[] files,ReceiveTemp rctemp, Receive rc, File f,FileDetail fdetail, User user);

	public List<PageData> arCountlistPage() throws Exception;

	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**
	 * 获取部门每段时间内移交的成果数量及容量
	 * @param pd
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年11月3日 下午4:47:33
	 *
	 */
	public List<PageData> getFilecount(PageData pd) throws Exception;
    
	/**项目相关档案列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> listProRelaFiles(Page page)throws Exception;

	/**获取档案详细信息
	 * @param page
	 * @throws Exception
	 */
	public PageData getFileDetails(PageData pd)throws Exception;
}

