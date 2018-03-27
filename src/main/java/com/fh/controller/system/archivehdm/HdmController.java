package com.fh.controller.system.archivehdm;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.ams.file.FileManager;
import com.fh.service.ams.hdm.HdmManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;






/** 
 * 说明：File管理
 * 创建人：Kioor	
 * 创建时间：2016年6月23日22:12:54
 */
@Controller
@RequestMapping(value="/hdm")
public class HdmController extends BaseController {
	
	@Resource(name="hdmService")
	private HdmManager hdmService;
	
	
	/**硬盘管理列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView listHdm(Page page) throws Exception{
		
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
		List<PageData> varList = hdmService.list(page);	//列出列表
		mv.setViewName("system/archivestorage/hdm_list");
		mv.addObject("varList", varList);//for show project
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}	
	

}
