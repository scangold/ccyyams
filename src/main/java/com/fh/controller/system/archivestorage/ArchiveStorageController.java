package com.fh.controller.system.archivestorage;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

















import javax.annotation.Resource;












import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.BootstrapTable;
import com.fh.entity.Page;
import com.fh.entity.system.Role;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.service.ams.fdm.FdmManager;
import com.fh.service.ams.fdm.impl.FdmService;
import com.fh.service.ams.file.FileManager;
import com.fh.service.ams.hdm.HdmManager;
import com.fh.service.ams.hdm.impl.HdmService;
import com.fh.service.ams.project.ProjectManager;
import com.fh.service.ams.realstorage.RealStorageManager;
import com.fh.service.system.role.RoleManager;


/** 
 * 说明：存储介质管理
 * 创建人：kioor 
 * 创建时间：2016年5月3日15:06:04
 */
@Controller
@RequestMapping(value="/archivestorage")
public class ArchiveStorageController extends BaseController {

	//String menuUrl = "archivestorage/hdm.do"; //菜单地址(权限用)
	@Resource(name="hdmService")
	private HdmManager hdmService;
	
	@Resource(name="fileService")
	private FileManager fileService;
	
	@Resource(name="fdmService")
	private FdmManager fdmService;
	
	@Resource(name="roleService")
	private RoleManager roleService;

	@Resource(name="realstorageService")
	private RealStorageManager realstorageService;

	private String menuUrl;
	
	
	
	/**保存HDM
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveHD")
	public ModelAndView saveHD() throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"Add new project");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//hdmService.saveHD(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**删除HDM
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteHD")
	public void deletehd(PrintWriter out) throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"Delete project");
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//hdmService.deleteHD(pd);
		out.write("success");
		out.close();
	}

	/**保存FDM
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveFD")
	public ModelAndView save() throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"Add new project");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		fdmService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**删除FDM
	 * @param out
	 * @throws Exception 
	 */
/*	@RequestMapping(value="/deleteFD")
	public void deleteP(PrintWriter out) throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"Delete project");
		PageData pd = new PageData();
		pd = this.getPageData();
		
		fdmService.delete(pd);
		out.write("success");
		out.close();
	}*/
	
	
	

	/**案卷管理列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/fdm")
	public ModelAndView listFdm(Page page) throws Exception{

		logBefore(logger, Jurisdiction.getUsername()+"List all Project");		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		//for show project list
		page.setPd(pd);
		List<PageData>	varAllList = fdmService.list(page);	//列出列表
		List<PageData> varFDList = new ArrayList<PageData>();
		for(int i=0;i<varAllList.size();i++){
			PageData vpd = new PageData();
			vpd.put("FD_ID", varAllList.get(i).get("FD_ID"));	//序号 
			vpd.put("FD_S", varAllList.get(i).get("FD_S"));	//
			vpd.put("FD_G", varAllList.get(i).getString("FD_G"));	//
			vpd.put("FD_NAME", varAllList.get(i).getString("FD_NAME"));	//
			vpd.put("FD_YEAR", varAllList.get(i).getString("FD_YEAR"));	//
			vpd.put("PAGE", varAllList.get(i).getString("PAGE"));	//
			vpd.put("FD_LIMIT", varAllList.get(i).getString("FD_LIMIT"));	//
			vpd.put("FD_REMARK", varAllList.get(i).getString("FD_REMARK"));	//
			
			varFDList.add(vpd);
		}//for show project list
		mv.setViewName("system/archivestorage/fdm_list");
		mv.addObject("varList", varFDList);//for show project
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}	
	
	
	

	/**选择全部列表***********************for arch receive bootstrap*******ARstorage.jsp******
	 * 
	 * @param pages
	 * @param request
	 * @return
	 * @throws Exception
	 * @date:2016年7月26日 下午3:25:36
	 *
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/showstoragelistpage")
	public BootstrapTable showStoragelistPage(BootstrapTable pages,HttpServletRequest request) throws Exception{
		Page page =new Page();	
		PageData pd = new PageData();
		pd = this.getPageData();		
		pd.put("bootstrapTable", pages);

		if(null != pages.getSearch() && !"".equals(pages.getSearch())){
			pd.put("keywords", pages.getSearch().trim());
		}


		page.setPd(pd);
		page.setShowCount(pages.getLimit());
		page.setOrder(pages.getOrder());
		page.setSort(pages.getSort());
		page.setCurrentPage(pages.getOffset()/pages.getLimit()+1);	
		System.err.println(page);
		
		
		List<PageData>	varStorageList = realstorageService.list(page);	//列出列表
		pages.setRows(varStorageList);
		pages.setTotal(page.getTotalResult());
		return pages;
	}
	
	
	/**真实存储介质管理列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/realstoragelist")
	public ModelAndView listStorage(Page page) throws Exception{
		
		logBefore(logger, Jurisdiction.getUsername()+"list hdm");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		//for show project list
		page.setPd(pd);
		List<PageData> varList = realstorageService.list(page);	//列出列表
		mv.setViewName("system/archivestorage/realstorage_list");
		mv.addObject("varList", varList);//for show project
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}	


	/**去新增页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(Page page)throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();


		page.setPd(pd);
		mv.setViewName("system/archivestorage/realstorage_edit");
		mv.addObject("msg", "saveS");
		mv.addObject("pd", pd);
		return mv;
	}
	/**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditstorage")
	public ModelAndView goEditstorage() throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if("1".equals(pd.getString("USER_ID"))){return null;}		//不能修改admin用户
		pd.put("ROLE_ID", "1");
		mv.addObject("fx", "user");
		pd = realstorageService.findById(pd);								//根据ID读取
		mv.setViewName("system/archivestorage/realstorage_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		
		return mv;
	}
	
	
	
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		int e= Integer.parseInt(pd.getString("REALSTORAGE_ID"));
		pd.put("REALSTORAGE_ID", e);
		realstorageService.edit(pd);	//执行修改
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	
	
	/**保存STORAGE
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveS")
	public ModelAndView saveS() throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"Add new storage");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		realstorageService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**删除STORAGE
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteS")
	public void deleteS(PrintWriter out) throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"Delete storage");
		PageData pd = new PageData();
		pd = this.getPageData();
		
		realstorageService.delete(pd);
		out.write("success");
		out.close();
	}

	@ResponseBody
	@RequestMapping(value="/getRealstorageby")
	public List<PageData> getRealstorageby() throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd ;
		pd = this.getPageData();
		Page page = this.getPage();
		page.setPd(pd);
		return 	realstorageService.list(page);
		
				
	}
	
	@ResponseBody
	@RequestMapping(value="/getRealstoragecount")
	public List<PageData> getRealstoragecount() throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd ;
		pd = this.getPageData();
		Page page = this.getPage();
		page.setPd(pd);
		return 	realstorageService.showRealstoragecount();

				
	}
	
	
}
