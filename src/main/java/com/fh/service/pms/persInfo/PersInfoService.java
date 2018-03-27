package com.fh.service.pms.persInfo;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.PmsCertificateAndHonor;
import com.fh.entity.amsmodel.PmsDocMain;
import com.fh.entity.amsmodel.PmsPExperience;
import com.fh.entity.amsmodel.PmsPInformation;
import com.fh.entity.system.User;
import com.fh.util.PageData;

public interface PersInfoService {
	List<PageData> listAllDepartment() throws Exception;
	//查看人事信息
	List<PageData> viewPerinfo(PageData pd) throws Exception;
    //增加人事信息
    public void insertP(PmsPInformation pmsPInformation,PageData pd) throws Exception;
    //增加工作经历
    public void insertPEx(PmsPExperience pmsPExperience) throws Exception;
  //增加获奖荣誉
    public void insertPHo(PmsCertificateAndHonor pmsCertificateAndHonor) throws Exception;
    //列出所有人事的人
    public List<PageData> listAllPersons(PageData pd)throws Exception;
    
  //编辑人事信息
  	void eidtPerinfo(PageData pd,PmsPInformation pmsPInformation) throws Exception;
  //删除人事信息
	void deletePinfo(PageData pd) throws Exception;
	//删除工作经历
	void deletePEx(PageData pd) throws Exception;
	//删除获奖荣誉
	void deletePHo(PageData pd) throws Exception;
	//列出所有人事信息
	List<PageData> listAllPers(Page page) throws Exception;
	//列出第一级人员
	List<PageData> listAllPersByOne(Page page) throws Exception;
	//列出第二级人员
	List<PageData> listAllPersByTwo(Page page) throws Exception;
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData viewPerinfoById(PageData pd)throws Exception;
	//根据PID列出所有工作经历
	List<PageData> listAllExsByPid(Page page) throws Exception;
	//根据PExId列出所有工作经历
	public PageData listExsByPExId(PageData page) throws Exception;
	//根据PryzsId列出所有获奖荣誉
	public PageData listExsByPryzsId(PageData page) throws Exception;
	//保存编辑工作经历信息
  	void saveEditPersEx(PmsPExperience pmsPExperience) throws Exception;
    //保存编辑获奖荣誉信息
  	void saveEditPersHo(PmsCertificateAndHonor pmsCertificateAndHonor) throws Exception;
    //根据PID列出所有获奖荣誉
  	List<PageData> listAllHonorsByPid(Page page) throws Exception;
	List<PmsPInformation> listAllPerson(PageData page) throws Exception;
	List<PageData> getCountByDegree()throws Exception;
	List<PageData> getCountByPtitle()throws Exception;
	List<PageData> getCountByDepartment()throws Exception;
	
}