package com.fh.service.pms.fileInfo;

import java.util.List;

import com.fh.entity.Page;
import com.fh.entity.amsmodel.PmsDocMain;
import com.fh.entity.amsmodel.PmsPExperience;
import com.fh.entity.amsmodel.PmsPFileType;
import com.fh.entity.amsmodel.PmsPInformation;
import com.fh.util.PageData;

public interface FileInfoService {

	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	//public PageData viewPFileByUserId(PageData pd)throws Exception;
	/*List<PageData> listAllDepartment() throws Exception;*/
	
    //根据user_id列出所有的人事档案
    public List<PageData> listPFilesByUserId(Page page)throws Exception;
  //列出人事档案盒
	public PageData getFileBox(PageData pd) throws Exception;
    //列出所有人事档案类型
	public List<PmsPFileType> listAllFileTypes() throws Exception;
    //新加人事档案
	 void insertPFile(PmsDocMain pmsDocMain)throws Exception;
	//删除人事档案
	void deletePFile(PageData pd) throws Exception;
	//根据PfileId展示人事档案
	public PageData listFileByPfileId(PageData pd)throws Exception;
	public void saveEditFile(PmsDocMain pmsDocMain)throws Exception;
	//根据User_Id查看人员信息
	public PageData getPInfo(PageData pd)throws Exception;
	//根据Ids查看档案盒信息
	public List<PmsDocMain> findFileByIds(String ids)throws Exception;
	//批量借阅
	public void borrowAllsave(PageData pd)throws Exception;

	

  
}