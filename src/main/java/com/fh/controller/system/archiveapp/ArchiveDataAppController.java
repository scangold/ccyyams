package com.fh.controller.system.archiveapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.ams.file.FileManager;
import com.fh.service.pms.persInfo.PersInfoService;
import com.fh.util.PageData;

/**
 * 类名称：成果应用 创建人：kioor 修改时间：2016年4月25日15:40:11
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/archiveapp")
public class ArchiveDataAppController extends BaseController {
	@Autowired
	private FileManager fileManager;

	/**
	 * 成果接收页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/maps")
	public ModelAndView archiveReceive() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/archiveapp/maps");
		mv.addObject("pd", pd);
		return mv;

	}
	/**
	 * 项目id查询相关资料页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/viewFileDetails")
	public ModelAndView viewFileDetails() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		List<PageData>	dataList = null;
		///dataList = fileManager.listProRelaFiles(page);
		pd=fileManager.getFileDetails(pd);//获取人员的信息
		mv.setViewName("system/archiveapp/viewFileDetails");
		mv.addObject("pd", pd);
		mv.addObject("dataList", dataList);
		return mv;

	}
	/**
	 * 项目id查询相关资料页面
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/viewProRelaFiles")
	public ModelAndView viewProRelaFiles(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData>	dataList = null;
		dataList = fileManager.listProRelaFiles(page);
		
		mv.setViewName("system/archiveapp/proRelaFiles");
		mv.addObject("pd", pd);
		mv.addObject("dataList", dataList);
		return mv;

	}
	/**
	 * 项目名称查询结果页面
	 * 
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping(value = "/viewProNameResult")
	public ModelAndView viewProNameResult() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/archiveapp/viewProNameResult");
		mv.addObject("pd", pd);
		return mv;

	}*/

}

// 创建人kioor2016年4月25日16:36:10