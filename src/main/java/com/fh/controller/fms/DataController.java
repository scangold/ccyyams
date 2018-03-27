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
@RequestMapping(value="/data")
public class DataController extends BaseController {

	String menuUrl = "data/list.do"; //菜单地址(权限用)
	@Resource
	private DataService dataService;
	@Resource(name="roleService")
	private RoleManager roleService;

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
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	dataList = dataService.listData(page);	//列出用户列表
		//pd.put("ROLE_ID", "1");
		//List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
		List<FmsDataDictItem> isValidList = dataService.listDataDictItemDataById("isvalid");	
		mv.setViewName("fms/data/list");
		mv.addObject("dataList", dataList);
		mv.addObject("isValidList", isValidList);
		mv.addObject("pd", pd);		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 保存data
	 * @param dataDict
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2017年8月7日 下午4:31:29
	 *
	 */
	@ControllerOptLog(desc="新增数据字典")
	@RequestMapping(value="/save")
	public ModelAndView save(FmsDataDict dataDict  ) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增tyepe");
		ModelAndView mv = this.getModelAndView();
		PageData pd =  this.getPageData();
	
		try {
			dataDict.setId(get32UUID());			
			dataService.save(dataDict, pd.getString("dataitems"));
			mv.addObject("msg","success");
		} catch (Exception e) {
			// TODO: handle exception
			logBefore(logger, e.getMessage());
			mv.addObject("msg","failed");
		}	
		mv.setViewName("save_result");

		return mv;
	}


	/**去新增用户页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();	
		mv.setViewName("fms/data/edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2017年8月7日 上午10:34:34
	 *
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		FmsDataDict  fmsDataDict = dataService.findById(pd.getString("id"));	
		//根据ID读取		
		pd.put("fmsDataDict", fmsDataDict);
		mv.setViewName("fms/data/edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 
	 * 
	 * 		
	 * 修改
	 */
	@ControllerOptLog(desc="修改数据字典")
	@RequestMapping(value="/edit")
	public ModelAndView edit(FmsDataDict dataDict) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限	
		pd = this.getPageData();
		dataDict.setUpdatetime(new Date());
		try {		
			dataService.update(dataDict,pd.getString("dataitems"));
			mv.addObject("msg","success");
		} catch (Exception e) {
			// TODO: handle exception
		
			logBefore(logger, e.getMessage());
			mv.addObject("msg","failed");
		}	
				
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
		
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}

    @ResponseBody
	@RequestMapping(value="/test")
	public PageData test() throws Exception {
		PageData	pd = this.getPageData();
		List<FmsDataDictItem> isValidList = dataService.listDataDictItemDataById("isvalid");
		pd.put("aa", isValidList);
		
		return pd;

	}

}
