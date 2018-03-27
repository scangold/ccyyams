package com.fh.service.ams.filedetail.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.amsmodel.FileDetail;
import com.fh.service.ams.filedetail.FileDetailManager;

@Service("filedetailService")
public class FileDetailService implements FileDetailManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	public void save(FileDetail filedetail) throws Exception {
		// TODO Auto-generated method stub

		dao.save("FileDetailMapper.savefiledetail",filedetail);
	}

}
