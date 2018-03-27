package com.fh.controller.system.archivesearch;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;


/** 
 * 类名称：ArchiveController 成果管理工具
 * 创建人：kioor
 * 修改时间：2016年4月25日15:40:11
 * @version
 */
@Controller
@RequestMapping(value="/archivesearch")
public class ArchiveSearchController extends BaseController {
	
	/**成果和档案 文件查询页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/file")
	public ModelAndView fileSearch() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/archivesearch/file_list");
		mv.addObject("pd", pd);
		return mv;
	}

	/**统计图表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/charts")
	public ModelAndView charts() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/archivesearch/statistical-charts");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	
	/**
	 * 接收页面
	 * 
	 * @return
	 * @throws Exception
	 * @author：Kioor
	 * @date:2016年9月26日11:16:53
	 *
	 */
	@RequestMapping(value = "/receivelistpage")
	public ModelAndView receivelistpage() throws Exception {
		logBefore(logger, Jurisdiction.getUsername() + "list receivelist");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		
		
		mv.setViewName("system/archivesearch/receivelist");
		mv.addObject("pd", pd);
		mv.addObject("QX", Jurisdiction.getHC()); // 按钮权限

		System.err.println(Jurisdiction.getHC().toString());

		return mv;
	}
	
	
	
	
	
	
	
//	预留待编辑2016年5月26日21:32:42
//	/**成果查询页面
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value="/archivefile")
//	public ModelAndView archivefileSearch() throws Exception{
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		mv.setViewName("system/archiveproject/project_list");
//		mv.addObject("pd", pd);
//		return mv;
//	}
//	
//	
//	/**档案查询页面
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping(value="/recordfile")
//	public ModelAndView recordfileSearch() throws Exception{
//		ModelAndView mv = this.getModelAndView();
//		PageData pd = new PageData();
//		pd = this.getPageData();
//		mv.setViewName("system/archive/searchrecord");
//		mv.addObject("pd", pd);
//		return mv;
//	}	

	
	
	
	
	
	
	
	
	
	
	
	
	
}















//创建人kioor2016年4月25日16:36:10