package com.fh.controller.system.archiverecordfile;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.util.PageData;

/** 
 * 类名称：ArchiveController 档案管理工具
 * 创建人：kioor
 * 修改时间：2016年4月26日20:06:18
 * @version
 */
@Controller
@RequestMapping(value="/archiverecordfile")
public class ArchiveRecordfileController extends BaseController {
	
	
	/**档案接收页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/recordfilereceive")
	public ModelAndView archiveReceive() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/archiverecordfile/ADproject");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	/**档案分发页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/recordfileborrow")
	public ModelAndView archiveDistribute() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/archiverecordfile/ADborrow");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**档案管理页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/manage")
	public ModelAndView archiveManage() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/archive/archmanage");
		mv.addObject("pd", pd);
		return mv;
	}	
	
}


//创建人kioor2016年4月25日16:36:10