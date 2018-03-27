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
import com.fh.entity.fms.FmsBorrow;
import com.fh.entity.fms.FmsDataDict;

import com.fh.entity.fms.FmsDocMain;

import com.fh.service.borrow.BorrowService;
import com.fh.service.data.DataService;
import com.fh.service.fms.FmsService;
import com.fh.service.system.role.RoleManager;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/** 
 * 类名称：BorrowController
 * 创建人：
 * 更新时间：
 * @version
 */
@Controller
@RequestMapping(value="/borrow")
public class BorrowController extends BaseController {

	String menuUrl = "borrow/list.do"; //菜单地址(权限用)
	@Resource
	private DataService dataService;
	@Resource
	private BorrowService borrowService;
/*	@Resource(name="roleService")
	private RoleManager roleService;*/
	@Resource
	private FmsService fmsService;

	/**显示用户列表
	 * @param page
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd =  this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setOrder("DESC");
		page.setSort("CREATETIME");
		page.setPd(pd);
		
		List<PageData>	dataList = borrowService.listData(page);	//列出用户列表
		//pd.put("ROLE_ID", "1");
		//List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
		FmsDataDict isreturn =   dataService.findByDATAKEY("isreturn");	
		mv.setViewName("fms/borrow/list");
		mv.addObject("dataList", dataList);
		mv.addObject("isreturn", isreturn);
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
	public ModelAndView save(FmsBorrow fmsBorrow  ) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增tyepe");
		ModelAndView mv = this.getModelAndView();
		PageData pd =  this.getPageData();	
		try {
			fmsBorrow.setId(get32UUID());
			fmsBorrow.setCreatetime(new Date());
		String endtime=	pd.getString("endtime");
		
			if(org.apache.commons.lang.StringUtils.isEmpty(endtime)) {
				fmsBorrow.setIsvalid(0);
				
				
			}else {
				fmsBorrow.setIsvalid(1);
			
			}
			borrowService.save(fmsBorrow, pd);
			mv.addObject("msg","success");
		} catch (Exception e) {
			// TODO: handle exception
			logBefore(logger, e.getMessage());
			mv.addObject("msg","failed");
		}	
		mv.setViewName("redirect:/borrow/list");

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
		PageData pd =this.getPageData();
		String ids=pd.getString("ids");
		String[] idsz= ids.split(",");

		List<FmsDocMain> fmsDocMains= fmsService.findDocByIds(ids);
		mv.setViewName("fms/borrow/edit");
		mv.addObject("fmsDocMains", fmsDocMains);
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
	@ResponseBody
	@RequestMapping(value="/returndoc")
	public String returndoc() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		
		PageData pd = new PageData();
		pd = this.getPageData();
		int   fmsDataDict = borrowService.deleteByBorrowId(pd.getString("id"));	
		//根据ID读取		
		pd.put("fmsDataDict", fmsDataDict);
	
		return "success";
	}

	@RequestMapping(value="/goView")
	public ModelAndView goView() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		FmsBorrow   fmsBorrow= borrowService.findbyid(pd.getString("id"));
		//根据ID读取		
		mv.setViewName("fms/borrow/view");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("fmsBorrow", fmsBorrow);
		return mv;
	}
	

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}



}
