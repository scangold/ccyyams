package com.fh.service.borrow;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.PmsBorrowContent;
import com.fh.entity.fms.FmsBorrow;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDataDictItem;
import com.fh.entity.fms.FmsDocMain;
import com.fh.entity.system.Role;
import com.fh.util.PageData;

public interface BorrowService {

	List<PageData> listData(Page page) throws Exception;

	void save(FmsBorrow fmsBorrow, PageData pd) throws Exception;

	int deleteByBorrowId(String string) throws Exception;

	FmsBorrow findbyid(String string) throws Exception;

	void savePmsBorrow(FmsBorrow fmsBorrow, PmsBorrowContent fmsBorrowContent) throws Exception;

	void savePmsReturn(FmsBorrow fmsBorrow)throws Exception;

	



}
