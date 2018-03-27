package com.fh.controller.pms;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.common.annotation.ControllerOptLog;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.PmsDocMain;
import com.fh.entity.amsmodel.PmsPExperience;
import com.fh.entity.amsmodel.PmsPFileType;
import com.fh.entity.system.Department;
import com.fh.entity.system.Role;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.pms.fileInfo.FileInfoService;
import com.fh.service.pms.persInfo.PersInfoService;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class persInfo
 */
@Controller
@RequestMapping("/pms")
public class FileInfoController extends BaseController {
	String menuUrl = "pms/listFileInfo.do"; //菜单地址(权限用)
	@Autowired
	private	PersInfoService pInfoService;   
	@Autowired
	private FileInfoService fInfoService;
	@RequestMapping(value = "/listFileInfo")
	public ModelAndView listFileInfo(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//人员组织树
		JSONArray arr = JSONArray.fromObject(pInfoService.listAllPersons(pd));
		String json = arr.toString();
		json = json.replaceAll("opened", "open").replaceAll("DEPARTMENT_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "url");
		
		PageData pInfo = new PageData();
		pInfo=fInfoService.getPInfo(pd);//获取人员的信息
		//默认获取第一个人员档案信息
		page.setPd(pd);
		List<PageData>	dataList = null;
		dataList=fInfoService.listPFilesByUserId(page);//获取子列表
		PageData fileBox = new PageData();
		fileBox=fInfoService.getFileBox(pd);//获取盒子的信息
		
		pd.put("newOrNot", "old");//默认显示有档案的人员档案信息（new表示要新建档案盒，old表示显示已有档案）
		mv.addObject("fileBox", fileBox);
		mv.addObject("dataList", dataList);
		mv.addObject("pInfo", pInfo);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("treeNodes", json);
		mv.setViewName("pms/fileInfo/listFileInfo");
		return mv;

	}
	/**根据p_id新增档案
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/newFileInfo")
	public ModelAndView newFileInfo() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//所有档案类型
		List<PmsPFileType> fileTypeList = fInfoService.listAllFileTypes();//列出所有系统用户角色
		mv.addObject("fileTypeList", fileTypeList);
		mv.addObject("pd", pd);
		mv.addObject("msg", "saveNewPFile");
		mv.setViewName("pms/fileInfo/addPerFile");
		return mv;

	}
	/**保存新增档案
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="根据p_id新增档案")
	@RequestMapping(value="/saveNewPFile")
	public ModelAndView saveNewPFile(PmsDocMain pmsDocMain) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		

			try{
				if(StringUtils.isNotEmpty(pd.getString("PmsPfileBoxId"))){//新增档案
					pmsDocMain.setPmsPfileId(pd.getString("PmsPfileBoxId"));
				
				}
				else{//新增盒子
					pmsDocMain.setPmsPfileId("0");
				}
				pmsDocMain.setPfileId(this.get32UUID());
				fInfoService.insertPFile(pmsDocMain);
				mv.addObject("msg","success");
			}catch (Exception e) {
				mv.addObject("msg","failed");
			}	
		mv.setViewName("save_result");
		return mv;

	}
	/**根据pfileId编辑人事档案
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editFileInfo")
	public ModelAndView editFileInfo() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String boxornot=pd.getString("boxornot");
		pd=fInfoService.listFileByPfileId(pd);
		//所有档案类型
		List<PmsPFileType> fileTypeList = fInfoService.listAllFileTypes();//列出所有系统用户角色
		mv.addObject("fileTypeList", fileTypeList);
		pd.put("boxornot", boxornot);
		mv.addObject("pd", pd);
		//mv.addObject("dataList", dataList);
		mv.addObject("msg","saveEditPersFile");
		mv.setViewName("pms/fileInfo/addPerFile");
		return mv;

	}
	/**保存编辑档案
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="保存编辑档案")
	@RequestMapping(value = "/saveEditPersFile")
	public ModelAndView  saveEditPersFile(PmsDocMain pmsDocMain) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		try{
			pmsDocMain.setPfileId(pd.getString("PFile_Id"));
			fInfoService.saveEditFile(pmsDocMain);
			mv.addObject("msg","success");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	/**根据pfileId删除档案信息
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@ControllerOptLog(desc="删除档案信息")
	@RequestMapping(value = "/deletePFile")
	public String  deletePFile() throws Exception {
		String json="";
		PageData pd = new PageData();
		pd = this.getPageData();
		
		try{
			fInfoService.deletePFile(pd);
			json="[{\"msg\":\"成功\"}]";
		}catch (Exception e) {
			// TODO: handle exception
			json="[{\"msg\":\"失败\"}]";
		}

		return json;
	}
	/**根据user_id查看所有的人事档案信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/listPFilesInfo")
	public ModelAndView listPFilesInfo(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		//所有部门
		pd = this.getPageData();
		String json=pd.getString("TREENODES");
		//人员组织树
		/*JSONArray arr = JSONArray.fromObject(pInfoService.listAllPersons(pd));
		String json = arr.toString();
		json = json.replaceAll("opened", "open").replaceAll("DEPARTMENT_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "url");
		*/
		page.setPd(pd);
		List<PageData>	dataList = null;
		dataList=fInfoService.listPFilesByUserId(page);//获取子列表
		PageData fileBox = new PageData();
		fileBox=fInfoService.getFileBox(pd);//获取盒子的信息
		PageData pInfo = new PageData();
		pInfo=fInfoService.getPInfo(pd);//获取人员的信息
		mv.addObject("pd", pd);
		mv.addObject("pInfo", pInfo);
		mv.addObject("dataList", dataList);
		mv.addObject("fileBox", fileBox);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("treeNodes", json);
		mv.setViewName("pms/fileInfo/listFileInfo");
		return mv;

	}
	/**根据pfile_id去查看档案详细
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/viewPFile")
	public ModelAndView viewPFile() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd=fInfoService.listFileByPfileId(pd);
		mv.setViewName("pms/fileInfo/viewPerFile");
		mv.addObject("pd", pd);
		return mv;
	}
}
