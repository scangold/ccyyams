package com.fh.service.pms.fileInfo.impl;



import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.PmsCertificateAndHonor;
import com.fh.entity.amsmodel.PmsDocMain;
import com.fh.entity.amsmodel.PmsPExperience;
import com.fh.entity.amsmodel.PmsPFileType;
import com.fh.entity.amsmodel.PmsPInformation;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDataDictItem;
import com.fh.entity.fms.FmsPZDocBox;
import com.fh.service.pms.fileInfo.FileInfoService;
import com.fh.service.pms.persInfo.PersInfoService;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;

@Service
public class FileInfoServiceImpl  implements FileInfoService{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	public PageData getFileBox(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		if(pd.getString("USER_ID")!=null&&pd.getString("USER_ID")!=""){//根据user_id查询
			return (PageData) dao.findForObject("PmsDocMainMapper.getFileBoxByUserId", pd);
		}
		else{//默认显示
			return (PageData) dao.findForObject("PmsDocMainMapper.getDefaultFileBox", pd);
		}
		
	}
	//根据User_Id查看人员信息
	public PageData getPInfo(PageData pd)throws Exception{
		if(pd.getString("USER_ID")!=""&&pd.getString("USER_ID")!=null){
		return (PageData)dao.findForObject("PmsDocMainMapper.selectPinfoByUserId", pd);
		}
		else{
			return (PageData)dao.findForObject("PmsDocMainMapper.selectPinfoByDefault", pd);	
		}
	}
	/**根据pfileId查询档案
	 * 	 * @param pd
	 * @throws Exception
	 */
	public PageData listFileByPfileId(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (PageData)dao.findForObject("PmsDocMainMapper.selectByPrimaryKey", pd);
	}
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> listPFilesByUserId(Page page)throws Exception{
		if(page.getPd().getString("USER_ID")!=""&&page.getPd().getString("USER_ID")!=null){
		return (List<PageData>)dao.findForList("PmsDocMainMapper.listPFilesByUserIdlistPage", page);
		}
		else{
		return (List<PageData>)dao.findForList("PmsDocMainMapper.listPFilesDefaultlistPage", page);	
		}
	}
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PmsPFileType> listAllFileTypes() throws Exception{
		return(List<PmsPFileType>)dao.findForList("PmsDocMainMapper.listAllFileTypes", null);
	}
	public void saveEditFile(PmsDocMain pmsDocMain)throws Exception{
		 dao.update("PmsDocMainMapper.updateByPrimaryKeySelective", pmsDocMain);//人事表
	}
	/**保存新建档案
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	 public void insertPFile(PmsDocMain pmsDocMain)throws Exception{
		 dao.save("PmsDocMainMapper.insertSelective", pmsDocMain);
	 }
	
	 /**删除人事档案
		 * @param pd
		 * @throws Exception
		 */
		public void deletePFile(PageData pd) throws Exception {
			dao.delete("PmsDocMainMapper.deleteByPrimaryKey", pd);//人事经历表	
		}
/**
 *根据ids获取档案盒信息 
 */
		public List<PmsDocMain> findFileByIds(String ids)throws Exception{
			return   (List<PmsDocMain>) dao.findForList("PmsDocMainMapper.findFileByIds", ids.split(","));

		}
		/**
		 * 保存批量借阅
		 */
		public void borrowAllsave(PageData pd)throws Exception{
			String ids=pd.getString("file_ids");
			if(StringUtils.isNotEmpty(ids)){
			String[] idz=	ids.split(",");
			for (String id : idz) {
				pd.put("borrowid", UuidUtil.get32UUID());    //借阅ID
				pd.put("isvalid", "1");	
				pd.put("pfile_id", id);
				//dao.update("FmsPZDocBoxMapper.updateBybox", pd);
				dao.save("PmsDocMainMapper.insertborrow", pd);
				dao.save("PmsDocMainMapper.insertborrowFile", pd);
			}
				
			}
		}
	/**编辑工作经历信息
	 * @param pd
	 * @throws Exception
	 */

	/*@SuppressWarnings("unchecked")
	public List<PageData> listAllPersons(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("PmsPInformationMapper.listAllPersons", pd);
		
	}*/
	


}
