package com.fh.service.kms.kmsfilebox.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.ObjectUtils.Null;
import org.aspectj.weaver.ast.Var;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.KmsFileBox;
import com.fh.entity.amsmodel.KmsFiles;
import com.fh.entity.fms.FmsDocBox;
import com.fh.entity.system.Department;
import com.fh.util.PageData;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.kms.kmsfilebox.KmsfileBoxManager;
import com.fh.service.kms.kmsfiles.KmsfilesManager;

/**
 * @author shenyang
 * @time 2017年8月21日21:52:16
 * @name 科技档案盒操作相关
 *  * 
 */
@Service("kmsfileBoxService")
public class KmsfileBoxService implements KmsfileBoxManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@SuppressWarnings("unchecked")
	@Override
	public List<KmsFileBox> listFileBox(KmsFileBox kmsFileBox) throws Exception {
		return (List<KmsFileBox>) dao.findForList("KmsFileBoxMapper.selectByKmsFileBox", kmsFileBox);	
	}
	@Override
	public KmsFileBox findById(String id) throws Exception {
		return (KmsFileBox)dao.findForObject("KmsFileBoxMapper.selectByPrimaryKey", id);
	}
	@Override
	public void editBox(KmsFileBox kmsfilebox) throws Exception {
		dao.update("KmsFileBoxMapper.updateByPrimaryKey", kmsfilebox);
	}
	@Override
	public void saveKBOX(KmsFileBox kmsFileBox) throws Exception {
		dao.save("KmsFileBoxMapper.insertSelective", kmsFileBox);
	}
	

	

}


