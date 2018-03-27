package com.fh.controller.system.archivereceive;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.fh.amstools.AMSReadExcel;
import com.fh.amstools.AmsEnum.IfArchiveEnum;
import com.fh.controller.ams.CheckFileClass;
import com.fh.controller.ams.KioorTools;
import com.fh.controller.base.BaseController;
import com.fh.entity.BootstrapTable;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.FileDetail;
import com.fh.entity.amsmodel.Receive;
import com.fh.entity.amsmodel.ReceiveTemp;
import com.fh.entity.system.User;
import com.fh.service.ams.cdm.impl.CdmService;
import com.fh.service.ams.fdm.impl.FdmService;
import com.fh.service.ams.file.FileManager;
import com.fh.service.ams.file.impl.FileService;
import com.fh.service.ams.hdm.impl.HdmService;
import com.fh.service.ams.prjtype.PrjtypeManager;
import com.fh.service.ams.prjtype.impl.PrjtypeService;
import com.fh.service.ams.project.ProjectManager;
import com.fh.service.ams.project.impl.ProjectService;
import com.fh.service.ams.receive.AReceiveManager;
import com.fh.service.ams.receive.impl.AReceiveService;
import com.fh.service.system.role.RoleManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FileUpload;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelRead;
import com.fh.util.PageData;
import com.fh.util.PathUtil;



/**
 * 类名称：ArchiveController 成果管理工具 创建人：kioor 修改时间：2016年4月25日15:40:11
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/archive")
public class ArchiveController extends BaseController {

	// for show project
	@Resource(name = "projectService")
	private ProjectManager projectService;
	@Resource(name = "prjtypeService")
	private PrjtypeManager prjtypeService;
	@Resource(name = "userService")
	private UserManager userService;
	@Resource(name = "roleService")
	private RoleManager roleService;

	// for show storage hd
	@Resource(name = "hdmService")
	private HdmService hdmService;
	// for show storage cd
	@Resource(name = "cdmService")
	private CdmService cdmService;
	// for show storage fd(anjuan)
	@Resource(name = "fdmService")
	private FdmService fdmService;


	// for save and show receive table
	@Resource(name = "areceiveService")
	private AReceiveManager areceiveService;
	@Resource(name = "fileService")
	private FileManager fileService;
	
	
	/**
	 * 成果分发页面 ***********************************************************
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/distribute")
	public ModelAndView archiveDistribute() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/archive/ARhandreceive");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 接收档案 提交按钮 接收文件记录及上传文件
	 * @param files
	 * @param request
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年8月24日 上午10:42:57
	 *
	 */	
	@RequestMapping("/upload")  
	public Object addUser( @RequestParam(value = "file", required = false) CommonsMultipartFile[] files, HttpServletRequest request,Model model,Receive re,com.fh.entity.amsmodel.File f,Integer storageIds) throws Exception{  
		HttpSession session= this.getRequest().getSession();
		User user=	(User) session.getAttribute(Const.SESSION_USER);	
		PageData  pd=  fileService.saveFiles(re,f,files,user, storageIds);	
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/archiverecordfile/arfreceivefile");
		mv.addObject("pd", pd);
		return mv;
		
	}  

	/**
	 * 接收档案 提交按钮 接收文件记录及上传文件
	 * @param files
	 * @param request
	 * @return
	 * @throws Exception
	 * @date:2018年2月1日13:51:35
	 *
	 */	
	@RequestMapping("/upload2")  
	public Object upload2( @RequestParam(value = "file", required = false) 
	CommonsMultipartFile[] files, com.fh.entity.amsmodel.File f,HttpServletRequest request,Model model,Integer storageIds) throws Exception{  
		
		HttpSession session= this.getRequest().getSession();
		User user=	(User) session.getAttribute(Const.SESSION_USER);	
		String kboxid = "";
		PageData  pd=  fileService.saveFiles2(files,f, user,kboxid);	
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/archiverecordfile/arfreceivefile");
		mv.addObject("pd", pd);
		return mv;
		
	}  
	
	/**
	 * 接收档案菜单跳转
	 * @return
	 * @email:401701706@qq.com
	 * @date:2016年11月7日 下午3:10:40
	 *
	 */
	@RequestMapping("/goArfreceivefilePage"   )  
	public String goArfreceivefilePage(){

		return "system/archiverecordfile/arfreceivefile";	

	}
	/**
	 * 接收档案菜单跳转
	 * @return
	 * @email:shenyang
	 * @date:2018年2月1日13:07:08
	 *
	 */
	@RequestMapping("/goArfreceivefilePage2"   )  
	public Object goArfreceivefilePage2()throws Exception{
		PageData pd=this.getPageData();
		String kfboxid = pd.getString("kfboxid");

		pd.put("kfboxid", kfboxid);
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/archiverecordfile/arfreceivefile2");
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 
	 * @return
	 * @throws Exception 
	 * @email:401701706@qq.com
	 * @date:2016年9月14日 下午4:22:11
	 * 
	 *
	 */
	@ResponseBody
	@RequestMapping("/getRecivebyPageDate")  
	public List<PageData> getRecivebyPageDate() throws Exception{
		PageData pd=this.getPageData();
		return areceiveService.getRecivebyPageDate(pd);

	}
	
	
	/**
	 * 文件分页列表
	 * 
	 * @param page
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/showRecivelistPage")
	public BootstrapTable showRecivelistPage(BootstrapTable pages,
			HttpServletRequest request) throws Exception {
		Page page = new Page();
		ModelAndView mv = this.getModelAndView();
		HttpServletRequest j = this.getRequest();
		PageData pd = this.getPageData();

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

		List<PageData> list = areceiveService.list(page);

		pages.setRows(list);
		pages.setTotal(page.getTotalResult());
		return pages;
	}
	
	

	

}

// 创建人kioor2016年4月25日16:36:10