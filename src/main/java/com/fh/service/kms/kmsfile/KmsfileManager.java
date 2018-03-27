package com.fh.service.kms.kmsfile;

import java.util.List;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.KmsAddFile;
import com.fh.entity.amsmodel.KmsFile;
import com.fh.util.PageData;


public interface KmsfileManager{


	/**保存
	 * @param pd
	 * @throws Exception
	 */
	public void save(KmsFile kmsFile)throws Exception;

	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(Integer pdint)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(KmsFile kmsFile,String deletefile)throws Exception;

	
	 /**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public KmsFile findById(PageData pd)throws Exception;
	 /**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public KmsFile findById(Integer kmsfid)throws Exception;
	/**通过boxid列出科技档案
	 * @param pd
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年9月19日 上午11:26:15
	 *
	 */
	public List<PageData> listKmsFileByBoxId(Page page)throws Exception;
	
	/**列出所有科技档案
	 * @param pd
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年9月19日 上午11:27:15
	 *
	 */
	public List<PageData> listKFile(Page page) throws Exception;


	/**查询amsfile年份数量供echart图表数据
	 * @param pd
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年9月19日 上午11:27:15
	 *
	 */
	public List<PageData> getCountAMSYEAR() throws Exception;


	/**查询kmsfile年份数量供echart图表数据
	 * @param pd
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年9月19日 上午11:27:15
	 *
	 */
	public List<PageData> getCountKMSYEAR() throws Exception;

	/**查询kms附件
	 * @param pd
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年9月19日 上午11:27:15
	 *
	 */
	public KmsAddFile findKmsAddFilebyid(String id) throws Exception;



}

