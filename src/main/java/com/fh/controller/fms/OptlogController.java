package com.fh.controller.fms;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.common.annotation.ControllerOptLog;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDataDictItem;
import com.fh.entity.fms.FmsDocMain;
import com.fh.entity.system.Department;
import com.fh.entity.system.Role;
import com.fh.service.data.DataService;
import com.fh.service.log.OptLogService;
import com.fh.service.system.role.RoleManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/** 
 * 类名称：UserController
 * 创建人：
 * 更新时间：
 * @version
 */
@Controller
@RequestMapping(value="/optLog")
public class OptlogController extends BaseController {

	String menuUrl = "optLog/list.do"; //菜单地址(权限用)
	
	@Resource
	private OptLogService optLogService;


	/**显示用户列表
	 * @param page
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView listUsers(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
	
		page.setPd(pd);
		page.setOrder("desc");
		page.setSort("optTime");
		List<PageData>	list = optLogService.listData(page);	
	
		mv.setViewName("log/list");
		mv.addObject("dataList", list);
		mv.addObject("pd", pd);		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	

    @ResponseBody
	@RequestMapping(value="/test")
	public PageData test() throws Exception {
		PageData	pd = this.getPageData();
		
		return pd;

	}

}
