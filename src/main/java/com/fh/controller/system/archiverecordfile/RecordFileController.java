package com.fh.controller.system.archiverecordfile;


import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.Date;

import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
import com.fh.entity.system.Role;
import com.fh.util.PageData;
import com.fh.util.Jurisdiction;
import com.fh.service.ams.file.FileManager;
import com.fh.service.system.role.RoleManager;

/** 
 * 说明：File管理
 * 创建人：Kioor	
 * 创建时间：2016年6月23日22:12:54
 */
@Controller
@RequestMapping(value="/recordfile")
public class RecordFileController extends BaseController {
	@Resource(name="roleService")
	private RoleManager roleService;

	//String menuUrl = "fhbutton/list.do"; //菜单地址(权限用)
	@Resource(name="fileService")
	private FileManager fileService;

	
	

	
	@RequestMapping(value="/goADApplyFormPage")
	public ModelAndView goADApplyFormPage() throws Exception{


		logBefore(logger, Jurisdiction.getUsername()+"list files");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");	//关键词检索条件

	
		List<PageData>  listfile=null;
		if(null != keywords && !"".equals(keywords)){
			keywords.replace("[", "");
			keywords.replace("]", "");
			String[] str=  keywords.split(",");
			String ids="";
			for (String string : str) {
				ids+="'"+string+"',";				
			}			

			pd.put("keywords", ids.substring(0, ids.length()-1).trim());
			mv.addObject("ids", keywords);
			listfile= fileService.getfilelistByIds(pd);
		}	
		mv.setViewName("system/archiverecordfile/ADapply_form");
		mv.addObject("pd", pd);
		mv.addObject("listfile", listfile);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}


	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
