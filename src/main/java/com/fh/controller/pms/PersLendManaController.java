package com.fh.controller.pms;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.PmsBorrowContent;
import com.fh.entity.amsmodel.PmsDocMain;
import com.fh.entity.amsmodel.PmsPInformation;
import com.fh.entity.fms.FmsBorrow;
import com.fh.entity.fms.FmsBorrowContent;
import com.fh.entity.fms.FmsPZDocBox;
import com.fh.entity.system.Department;
import com.fh.service.borrow.BorrowService;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.pms.fileInfo.FileInfoService;
import com.fh.service.pms.persInfo.PersInfoService;
import com.fh.service.pms.pfilelend.PfilelendService;
import com.fh.service.system.role.RoleManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * Servlet implementation class persInfo
 */
@Controller
@RequestMapping("/pms")
public class PersLendManaController extends BaseController {
	
	String menuUrl = "pms/listPersInfo.do"; //菜单地址(权限用)
	@Autowired  
	HttpServletRequest request; //这里可以获取到request
	@Autowired
	private	DepartmentManager departmentManagerService;
	@Autowired
	private RoleManager roleService;
	@Autowired
	private UserManager userService;
	@Autowired
	private PersInfoService pInfoService;
	@Resource
	private BorrowService borrowService;
	@Autowired
	private PfilelendService pfilelendService;
	@Autowired
	private FileInfoService fileInfoService;
	@RequestMapping(value = "/persLendMana")
	public ModelAndView archiveReceive(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String isValid=pd.getString("isValid");
		if(isValid==null){
			isValid="2";
		}
		page.setPd(pd);
		List<PageData>	dataList = null;
		dataList = pfilelendService.listAllPlendInfos(page);
		
		pd.put("isValid",isValid);
		mv.setViewName("pms/lendMana/persLendMana");
		mv.addObject("dataList", dataList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;

	}
	/**去批量借阅
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goborrowall")
	public ModelAndView goborrowall()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd =this.getPageData();
		String ids=pd.getString("ids");
		String[] idsz= ids.split(",");

		List<PmsDocMain> PmsDocMains= fileInfoService.findFileByIds(ids);
		List<PmsPInformation> pInformationList = pInfoService.listAllPerson(pd);//列出所有人员
		mv.setViewName("pms/lendMana/borrowall");
		mv.addObject("PmsDocMains", PmsDocMains);
		mv.addObject("pInformationList", pInformationList);
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	/**保存批量借阅
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value="/saveAllLendInfo")
	public ModelAndView saveAllLendInfo() throws Exception{
		ModelAndView mv = this.getModelAndView();
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		pd.put("borrowid", this.get32UUID());    //借阅ID
		pd.put("isvalid", "1");
		
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    pd.put("starttime", f.format(new Date()));
		try{
			fileInfoService.borrowAllsave(pd);
			mv.addObject("msg","成功");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","失败");
		}	
		mv.setViewName("save_result");

		return mv;
	}
	/**新建历史查询页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/queryLendInfo")
	public ModelAndView queryLendInfo(Page page) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		page.setOrder("DESC");
		page.setSort("STARTTIME");
		page.setPd(pd);
		List<PageData>	dataList = null;
		dataList = pfilelendService.listAllPlendInfosById(page);
		mv.addObject("pd", pd);
		mv.addObject("dataList", dataList);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.setViewName("pms/lendMana/queryLendInfo");
	
		return mv;

	}
	/**新建归还页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/backLendInfo")
	public ModelAndView backLendInfo() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//List<PmsPInformation> pInformationList = pInfoService.listAllPersons(pd);//列出所有人员
		List<PmsPInformation> pInformationList = pInfoService.listAllPerson(pd);//列出所有人员

		//pd=pInfoService.listExsByPryzsId(pd);
		mv.addObject("pd", pd);
		mv.addObject("pInformationList", pInformationList);
		//mv.addObject("msg","saveEditPersHo");
		mv.setViewName("pms/lendMana/returnLendInfo");
		return mv;

	}
	/**保存归还页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveBackInfo")
	public ModelAndView saveBackInfo(FmsBorrow fmsBorrow ) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

	
		try{
			
			fmsBorrow.setNowendtime(new Date());
			fmsBorrow.setIsvalid(0);
			borrowService.savePmsReturn(fmsBorrow);
			mv.addObject("msg","success");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;

	}
	/**新建借阅页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/addLendInfo")
	public ModelAndView addLendInfo() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//List<PmsPInformation> pInformationList = pInfoService.listAllPersons(pd);//列出所有人员
		List<PmsPInformation> pInformationList = pInfoService.listAllPerson(pd);//列出所有人员

		//pd=pInfoService.listExsByPryzsId(pd);
		mv.addObject("pd", pd);
		mv.addObject("pInformationList", pInformationList);
		//mv.addObject("msg","saveEditPersHo");
		mv.setViewName("pms/lendMana/addLendInfo");
		return mv;

	}
	
	/**保存借阅页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveLendInfo")
	public ModelAndView saveLendInfo(FmsBorrow fmsBorrow ) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

	
		try{
			fmsBorrow.setId(get32UUID());
			fmsBorrow.setCreatetime(new Date());
			fmsBorrow.setIsvalid(1);
			PmsBorrowContent pmsBorrowContent=new PmsBorrowContent();
			pmsBorrowContent.setBorrowId(fmsBorrow.getId());
			pmsBorrowContent.setPmsId(pd.getString("PFILE_ID"));
			borrowService.savePmsBorrow(fmsBorrow, pmsBorrowContent);
			mv.addObject("msg","success");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;

	}
	


}
