package com.fh.service.pms.pfilelend;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.PmsCertificateAndHonor;
import com.fh.entity.amsmodel.PmsDocMain;
import com.fh.entity.amsmodel.PmsPExperience;
import com.fh.entity.amsmodel.PmsPInformation;
import com.fh.entity.system.User;
import com.fh.util.PageData;

public interface PfilelendService {

	List<PageData> listAllPlendInfos(Page page) throws Exception;

	List<PageData> listAllPlendInfosById(Page page)throws Exception;

}
