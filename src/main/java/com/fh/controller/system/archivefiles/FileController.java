package com.fh.controller.system.archivefiles;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.INITIALIZE;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.BootstrapTable;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.File;
import com.fh.entity.amsmodel.FileDetail;
import com.fh.entity.system.Role;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.ams.file.FileManager;
import com.fh.service.ams.filedetail.FileDetailManager;
import com.fh.service.system.role.RoleManager;

/**
 * 说明：File管理 创建人：Kioor 创建时间：2016年6月23日22:12:54
 */
@Controller
@RequestMapping(value = "/file")
public class FileController extends BaseController {
	String menuUrl = "file/list.do";
	@Resource(name = "roleService")
	private RoleManager roleService;

	// String menuUrl = "fhbutton/list.do"; //菜单地址(权限用)
	@Resource(name = "fileService")
	private FileManager fileService;
	@Resource(name = "filedetailService")
	private FileDetailManager filedetailService;

	// savefile;

	/**
	 * 去新增项目页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goAddF")
	public ModelAndView goAddF(Page page) throws Exception {

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		page.setPd(pd);
		pd.put("ROLE_ID", "1");
		/*
		 * List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
		 */
		mv.setViewName("system/archivefiles/file_edit");
		mv.addObject("msg", "saveF");
		mv.addObject("pd", pd);
		/* mv.addObject("roleList", roleList); */
		return mv;
	}

	/**
	 * 保存
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value = "/saveF")
	public ModelAndView save() throws Exception {

		
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限

		logBefore(logger, Jurisdiction.getUsername() + "Add new file");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		// 1存入FILEDETAIL表
		FileDetail filedetail = new FileDetail();
		filedetail.setDetail(pd.getString("DETAIL"));

		filedetailService.save(filedetail);

		// 2存入FILE表 FILE表中FILEATTR1字段存入ams_receive_temp_ID
		File filetempentity = new File();
		filetempentity.setFileName(pd.getString("FILE_NAME"));
		filetempentity.setIfdigit(pd.getString("IFDIGIT"));
		filetempentity.setDataform(pd.getString("DATAFORM"));
		filetempentity.setFileUrl(pd.getString("FILE_URL"));
		filetempentity.setVolume(pd.getString("VOLUME"));
		filetempentity.setUnit(pd.getString("UNIT"));
		filetempentity.setIfarchive(pd.getString("IFARCHIVE"));
		filetempentity.setFileType(pd.getString("FILE_TYPE"));
		filetempentity.setScale(pd.getString("SCALE"));
		filetempentity.setFileRemark(pd.getString("FILE_REMARK"));
		filetempentity.setPermissionClass(pd.getString("PERMISSION_CLASS"));
		filetempentity.setCreationdate(pd.getString("CREATIONDATE"));
		filetempentity.setCoverage(pd.getString("COVERAGE"));
		filetempentity.setYear(pd.getString("YEAR"));
		filetempentity.setFiledetailId(filedetail.getFiledetailId());
		filetempentity.setFileattr1(pd.getString("RCTEMP_ID"));// rctempid

		// SAVE FILE
		fileService.save(filetempentity);

		mv.addObject("msg", "success");
		mv.setViewName("save_result");
		return mv;
	}

	/**
	 * 删除
	 * 
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value = "/deleteF")
	public void deleteF(PrintWriter out) throws Exception {
		
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限

		logBefore(logger, Jurisdiction.getUsername() + "Delete file");
		PageData pd = new PageData();
		pd = this.getPageData();

		fileService.delete(pd);
		out.write("success");
		out.close();
	}

	/**
	 * 去修改页面
	 * 
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditFile")
	public ModelAndView goEditFile() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = fileService.findById(pd);								//根据ID读取
		mv.setViewName("system/archivefiles/file_edit");
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
		int e= Integer.parseInt(pd.getString("FILE_ID"));
		pd.put("FILE_ID", e);
		fileService.edit(pd);	//执行修改
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}






	/**
	 * 文件查询列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Page page, String file_Id) throws Exception {

		logBefore(logger, Jurisdiction.getUsername()+"List files");

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData> varList = fileService.list(page); // 列出file列表
		mv.setViewName("system/archivefiles/file_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}


	/**列表 级联查询 项目、文件、存储介质
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/listpfs")
	public ModelAndView listpfs(Page page) throws Exception{

		logBefore(logger, Jurisdiction.getUsername()+"List fps files");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = fileService.listpfs(page);	//列出file列表
		mv.setViewName("system/archivefiles/fpslist");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 文件分页列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/showFilelistPage")
	public BootstrapTable showFilelistPage(BootstrapTable pages, HttpServletRequest request) throws Exception {
		Page page = new Page();
		ModelAndView mv = this.getModelAndView();
		HttpServletRequest j = this.getRequest();
		PageData pd = this.getPageData();
		String ifarchive = pd.getString("ifarchve");
		String[] ifarchives = null;
		Integer[] a = null;
		if(ifarchive!=null&&ifarchive!=""){
			ifarchives = ifarchive.split(",");
			a = new Integer[ifarchives.length];
			for (int i = 0; i < ifarchives.length; i++) {
				a[i] = Integer.parseInt(ifarchives[i]);

			}
		}
		pd.put("ifarchives", a);
		ifarchive.split(",");
		pd.put("bootstrapTable", pages);
		if (null != pages.getSearch() && !"".equals(pages.getSearch())) {
			pd.put("keywords", pages.getSearch().trim());
		}
		page.setPd(pd);
		page.setShowCount(pages.getLimit());
		page.setOrder(pages.getOrder());
		page.setSort(pages.getSort());
		page.setCurrentPage(pages.getOffset() / pages.getLimit() + 1);
		System.err.println(page);

		List<PageData> list = fileService.listPage(page);

		pages.setRows(list);
		pages.setTotal(page.getTotalResult());
		return pages;
	}

	/**
	 * 手动上传Temp文件分页列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/showFileTemplistPage")
	public BootstrapTable showFileTemplistPage(BootstrapTable pages, HttpServletRequest request) throws Exception {
		Page page = new Page();
		ModelAndView mv = this.getModelAndView();
		HttpServletRequest j = this.getRequest();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("bootstrapTable", pages);
		if (null != pages.getSearch() && !"".equals(pages.getSearch())) {
			pd.put("keywords", pages.getSearch().trim());
		}
		page.setPd(pd);
		page.setShowCount(pages.getLimit());
		page.setOrder(pages.getOrder());
		page.setSort(pages.getSort());
		page.setCurrentPage(pages.getOffset() / pages.getLimit() + 1);
		System.err.println(page);

		List<PageData> list = fileService.fileTemplistPage(page);
		pages.setRows(list);
		pages.setTotal(page.getTotalResult());
		return pages;
	}

	/**
	 * 成果申请
	 * 
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年9月19日 下午3:03:00
	 *
	 */
	@RequestMapping(value = "/gotolistpage")
	public ModelAndView gotolistpage() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "list-------------- files");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		mv.setViewName("system/archivefiles/filelist");
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限

		System.err.println(Jurisdiction.getHC().toString());

		return mv;
	}

	/**
	 * 
	 * @return档案
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年9月19日 下午2:59:05
	 *
	 */
	@RequestMapping(value = "/gotolistArchiveRecordFilepage")
	public ModelAndView gotolistArchiveRecordFilepage() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "list files");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		mv.setViewName("system/archivefiles/archiveRecordfilelist");
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}
	/**
	 * 
	 * @return电子档案列表
	 *
	 */
	@RequestMapping(value = "/gotolistArchiveRecordFilepage2")
	public ModelAndView gotolistArchiveRecordFilepage2() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "list files");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		mv.setViewName("system/archivefiles/archiveRecordfilelist2");
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}
	@RequestMapping(value = "/goApplyFormPage")
	public ModelAndView goApplyFormPage() throws Exception {

		logBefore(logger, Jurisdiction.getUsername() + "list files");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		List<PageData> listfile = null;
		if (null != keywords && !"".equals(keywords)) {
			keywords.replace("[", "");
			keywords.replace("]", "");
			String[] str = keywords.split(",");
			String ids = "";
			for (String string : str) {
				ids += "'" + string + "',";
			}
			pd.put("keywords", ids.substring(0, ids.length() - 1).trim());
			mv.addObject("ids", keywords);
			listfile = fileService.getfilelistByIds(pd);
		}

		mv.setViewName("system/apply/apply_form");
		mv.addObject("pd", pd);
		mv.addObject("listfile", listfile);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/getFilecount")
	public List<PageData> getFilecount() throws Exception {
		PageData pd=this.getPageData();


		return fileService.getFilecount(pd);

	}




	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}
}
