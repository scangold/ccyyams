package com.fh.service.kms.kmsfile.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.KmsAddFile;
import com.fh.entity.amsmodel.KmsFile;
import com.fh.entity.fms.FmsAddFile;
import com.fh.entity.fms.FmsDocMain;
import com.fh.util.PageData;
import com.fh.service.kms.kmsfile.KmsfileManager;

/*//
 * @author kioor
 * @time 2017年8月21日21:52:16
 * @name 科技档案相关
 *  * 
 */
@Service("kmsfileService")
public class KmsfileService implements KmsfileManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(KmsFile kmsFile)throws Exception{
		dao.save("KmsFileMapper.save", kmsFile);

		for (KmsAddFile everyaddfile : kmsFile.getKmsAddFiles()) {

			dao.save("KmsAddFileMapper.insertSelective", everyaddfile);
		}  
		
	}
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(Integer pdint)throws Exception{
		dao.delete("KmsFileMapper.deleteByPrimaryKey", pdint);
	}
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(KmsFile kmsFile,String deletefile)throws Exception{
		dao.update("KmsFileMapper.updateByPrimaryKeySelective", kmsFile);

		for (KmsAddFile everyaddfile : kmsFile.getKmsAddFiles()) {

			dao.save("KmsAddFileMapper.insertSelective", everyaddfile);
		}
		if(StringUtils.isNotEmpty(deletefile)) {
			String[] deletefi=	deletefile.split(",");
			for (String id : deletefi) {
				dao.save("KmsAddFileMapper.deleteByPrimaryKey", id);
				}
		}  
		
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public KmsFile findById(PageData pd)throws Exception{
		return (KmsFile)dao.findForObject("KmsFileMapper.selectByPrimaryKey", pd);
	}

	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public KmsFile findById(Integer kmsfid)throws Exception{
		KmsFile kmsFile=		(KmsFile)dao.findForObject("KmsFileMapper.selectByPrimaryKey1", kmsfid);
		
		
		return kmsFile;
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listKmsFileByBoxId(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("KmsFileMapper.listKmsFileByBoxId", page);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listKFile(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("KmsFileMapper.listPage", page);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getCountAMSYEAR() throws Exception {
		return   (List<PageData>) dao.findForList("KmsFileMapper.countAMSYEAR",null);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getCountKMSYEAR() throws Exception {
		return   (List<PageData>) dao.findForList("KmsFileMapper.countKMSYEAR",null);
	}
	
	
	@Override
	public KmsAddFile findKmsAddFilebyid(String id) throws Exception {
		// TODO Auto-generated method stub
		return (KmsAddFile) dao.findForObject("KmsAddFileMapper.selectByPrimaryKey", id);
	}
}


