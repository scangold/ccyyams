package com.fh.controller.system.archivereceive;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;








import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
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
import com.fh.entity.amsmodel.Receive;
import com.fh.entity.system.Role;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.ams.file.impl.FileService;

/** 
 * 说明：CheckFile管理
 * 创建人：Kioor	
 * 创建时间：2016年7月15日15:05:45
 */
@Controller
@RequestMapping(value="/checkfile")
public class CheckFileController extends BaseController {
	@Resource(name = "fileService")
	private FileService fileService;

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/showlist")
	public ModelAndView list(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		Session arfinishsession = Jurisdiction.getSession();
		Receive varreceive = (Receive)arfinishsession.getAttribute("checkExcelfileName");
		int rcid = varreceive.getRcId();
		//selectByRCID//选出文件表 插入的文件集合
		List<PageData>	varCheckFileList = fileService.list(page);
		
		mv.setViewName("system/archive/ARfinish");
		mv.addObject("varCheckFileList", varCheckFileList);
		mv.addObject("pd", pd);

		return mv;
	}
	
	
	@RequestMapping(value="/showchecklist")
	public ModelAndView showChecklist(Page page) throws Exception{		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();		
		page.setPd(pd);
		
		mv.setViewName("system/archive/ARfinish");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/showchecklistpage")
	public BootstrapTable showChecklistPage(BootstrapTable pages,HttpServletRequest request) throws Exception{
		Page page =new Page();	
		ModelAndView mv = this.getModelAndView();
		HttpServletRequest hr= this.getRequest();
		PageData pd = new PageData();
		pd = this.getPageData();		
		pd.put("bootstrapTable", pages);
		

		Session arfinishsession = Jurisdiction.getSession();
		//接收记录
		Receive varreceive = (Receive)arfinishsession.getAttribute("receive");
		int RC_ID = varreceive.getRcId();
		//int RC_ID = 1085;
		
		pd.put("RC_ID", RC_ID);
		if(null != pages.getSearch() && !"".equals(pages.getSearch())){
			pd.put("keywords", pages.getSearch().trim());
		}
		page.setPd(pd);
		page.setShowCount(pages.getLimit());
		page.setOrder(pages.getOrder());
		page.setSort(pages.getSort());
		page.setCurrentPage(pages.getOffset()/pages.getLimit()+1);	
		System.err.println(page);
		List<PageData> list=  fileService.showCheckFilelistPage(page);
		pages.setRows(list);
		pages.setTotal(page.getTotalResult());
		return pages;
	}
	
	
	


}
