package com.fh.service.pms.persInfo.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.PmsCertificateAndHonor;
import com.fh.entity.amsmodel.PmsPExperience;
import com.fh.entity.amsmodel.PmsPInformation;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDataDictItem;
import com.fh.entity.system.Department;
import com.fh.entity.system.User;
import com.fh.service.pms.persInfo.PersInfoService;
import com.fh.util.PageData;

@Service
public class PersInfoServiceImpl  implements PersInfoService{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	public List<PageData> listAllDepartment() throws Exception {
		// TODO Auto-generated method stub
		
		return (List<PageData>) dao.findForList("DepartmentMapper.listAllDepartmentPD", null);
	}
	/**根据Pid查询所有工作经历
	 * 	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAllExsByPid(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("PmsPExperienceMapper.listAllExsByPidlistPage", page);
	}
	/**根据Pid查询所有获奖荣誉
	 * 	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAllHonorsByPid(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("PmsCertificateAndHonorMapper.listAllHonorssByPidlistPage", page);
	}
	/**根据PExId查询工作经历
	 * 	 * @param pd
	 * @throws Exception
	 */
	public PageData listExsByPExId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData)dao.findForObject("PmsPExperienceMapper.listExsByPExId", pd);
	}
	/**根据PryzsId查询获奖荣誉
	 * 	 * @param pd
	 * @throws Exception
	 */
	public PageData listExsByPryzsId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData)dao.findForObject("PmsCertificateAndHonorMapper.listExsByPryzsId", pd);
	}
	/**查询所有人事信息
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAllPers(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("PmsPInformationMapper.listAllPerslistPage", page);
	}
	/**查询所有智能部门人事信息
	 * 	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAllPersByOne(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("PmsPInformationMapper.listOnePerslistPage", page);
	}
	/**查询所分院人事信息
	 * 	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAllPersByTwo(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("PmsPInformationMapper.listTwoPerslistPage", page);
	}
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData viewPerinfoById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PmsPInformationMapper.listSelectedPer", pd);
	}
	/**删除人员
	 * @param pd
	 * @throws Exception
	 */
	public void deletePinfo(PageData pd) throws Exception {
		dao.update("PmsPInformationMapper.deleteSelectedPer", pd);//人事表
		dao.update("PmsPInformationMapper.deleteSelectedUser", pd);//用户表
	}
	/**删除工作经历
	 * @param pd
	 * @throws Exception
	 */
	public void deletePEx(PageData pd) throws Exception {
		dao.delete("PmsPExperienceMapper.deleteByPrimaryKey", pd);//人事经历表	
	}
	/**删除获奖荣誉
	 * @param pd
	 * @throws Exception
	 */
	public void deletePHo(PageData pd) throws Exception {
		dao.delete("PmsCertificateAndHonorMapper.deleteByPrimaryKey", pd);//荣誉证书表	
	}
	/**编辑人事信息
	 * @param pd
	 * @throws Exception
	 */
	public	void eidtPerinfo(PageData pd,PmsPInformation pmsPInformation)throws Exception{
		 dao.update("PmsPInformationMapper.editSelectedUser", pd);//用户表
		 dao.update("PmsPInformationMapper.updateByUserId", pmsPInformation);//人事信息表
		 
	}
	

	/**查看人事信息
	 * @param pd
	 * @throws Exception
	 */
	public	List<PageData> viewPerinfo(PageData pd)  throws Exception{
		return (List<PageData>) dao.findForList("PmsPInformationMapper.listSelectedPer", pd);
	}
	/**新添人员
	 * @param pd
	 * @throws Exception
	 */
	public void insertP(PmsPInformation pmsPInformation,PageData pd) throws Exception {
		dao.save("UserMapper.saveU", pd);
		dao.save("PmsPInformationMapper.insert", pmsPInformation);
	}
	/**新添工作经历
	 * @param pd
	 * @throws Exception
	 */
	public void insertPEx(PmsPExperience pmsPExperience) throws Exception {
		// TODO Auto-generated method stub
		dao.save("PmsPExperienceMapper.insert", pmsPExperience);

	}
	/**新添获奖荣誉
	 * @param pd
	 * @throws Exception
	 */
	public void insertPHo(PmsCertificateAndHonor pmsCertificateAndHonor) throws Exception {
		// TODO Auto-generated method stub
		dao.save("PmsCertificateAndHonorMapper.insert", pmsCertificateAndHonor);

	}
	/**保存编辑工作经历信息
	 * @param pd
	 * @throws Exception
	 */
	public	void saveEditPersEx(PmsPExperience pmsPExperience)throws Exception{
		//dao.update("PmsPInformationMapper.editSelectedPer", pd);
		 dao.update("PmsPExperienceMapper.updateByPrimaryKeySelective", pmsPExperience);//人事表
	}
	/**保存编辑的获奖荣誉信息
	 * @param pd
	 * @throws Exception
	 */
	public	void saveEditPersHo(PmsCertificateAndHonor pmsCertificateAndHonor)throws Exception{
		 dao.update("PmsCertificateAndHonorMapper.updateByPrimaryKeySelective", pmsCertificateAndHonor);//人事表
	}
	@SuppressWarnings("unchecked")
	public List<PageData> listAllPersons(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PmsPInformationMapper.listAllPersons", pd);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<PmsPInformation> listAllPerson(PageData pd)throws Exception{
		return (List<PmsPInformation>)dao.findForList("PmsPInformationMapper.listAllPerson", pd);
	}
	
	@Override
	public List<PageData> getCountByDegree() throws Exception {
		// TODO Auto-generated method stub
		
		return   (List<PageData>) dao.findForList("PmsPInformationMapper.getCountByDegree",null);
	}
	@Override
	public List<PageData> getCountByPtitle() throws Exception {
		// TODO Auto-generated method stub
		
		return   (List<PageData>) dao.findForList("PmsPInformationMapper.getCountByPtitle",null);
	}
	@Override
	public List<PageData> getCountByDepartment() throws Exception {
		// TODO Auto-generated method stub
		
		return   (List<PageData>) dao.findForList("PmsPInformationMapper.getCountByDepartment",null);
	}
	/*@Override*/
	/*public void insertP(PageData pd, PmsPInformation pmsPInformation) throws Exception {
		// TODO Auto-generated method stub
		dao.save("UserMapper.saveU", pd);
		//dao.save("PmsPInformationMapper.insertP", pd);
		
		dao.save("PmsPInformationMapper.insertSelective", pmsPInformation);
	}*/

}
