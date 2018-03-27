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
import com.fh.entity.Result;
import com.fh.entity.amsmodel.ArchDistribute;
import com.fh.entity.system.Role;
import com.fh.entity.system.User;
import com.fh.util.PageData;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.service.ams.apply.ApplyManager;
import com.fh.service.ams.cdm.CdmManager;
import com.fh.service.ams.file.FileManager;
import com.fh.service.system.menu.MenuManager;
import com.fh.service.system.role.RoleManager;
import com.fh.service.system.user.UserManager;


@Controller
@RequestMapping(value="/recordfiledistribute")
public class RecordfiledistributeController extends BaseController {

	//String menuUrl = "fhbutton/list.do"; //菜单地址(权限用)
	@Resource
	private ApplyManager applySerVice;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="userService")
	private UserManager userService;

	@Resource(name="fileService")
	private FileManager fileService;	

	
	@RequestMapping(value="/goADDistributeFormpage")
	public ModelAndView goADDistributeFormpage() throws Exception{


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

		pd.put("ROLE_ID", 1);
		List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色	
		if(roleList.size()>0){

			pd.put("ROLE_ID", roleList.get(0).getROLE_ID());
		}else{
			pd.put("ROLE_ID", 1);
		}
		pd.put("ROLE_ID", roleList.get(0).getROLE_ID());
		List<PageData>  listuser=	userService.listAllUserByRoldId(pd);
		mv.addObject("listuser", listuser);
		mv.addObject("roleList", roleList);
		mv.setViewName("system/archiverecordfile/ADarchdistribute");
		mv.addObject("pd", pd);
		mv.addObject("listfile", listfile);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	/**
	 * 分发档案
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年7月26日 上午10:11:21
	 *
	 */
	@ResponseBody
	@RequestMapping(value="/saveArchdistribute")
	public Result saveArchdistribute() throws Exception{
		Result r;
		/*	if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){
		 r=new Result<>();
		 r.setResult(false);
		 r.setDesc("没有权限");
		 return r;
	}*/ //校验权限

		ArchDistribute a=new ArchDistribute();
		PageData pd=this.getPageData();
		 String userIds= pd.getString("userIds");
		 String desc= pd.getString("desc");
		 String files= pd.getString("keywords");
		 System.err.println(userIds+"---"+desc+"----"+files);
		 if(null==userIds||"".equals(userIds)||null==desc||"".equals(desc)){			 
				r=new Result<>();
				r.setResult(false);
				r.setDesc("禁止非法数据");
				return r;
		 }
		User user = (User)this.getRequest().getSession().getAttribute(Const.SESSION_USER);

		r= applySerVice.saveArchdistribute(userIds,user.getUSER_ID(),desc,files,null);

		return r;
	

	}
	
	

	@ResponseBody
	@RequestMapping(value="/showArchdistributelistPage")
	public BootstrapTable showArchdistributelistPage(BootstrapTable pages,HttpServletRequest request) throws Exception{
		Page page =new Page();	
		ModelAndView mv = this.getModelAndView();
		HttpServletRequest j= this.getRequest();
		PageData pd = new PageData();
		pd = this.getPageData();		
		pd.put("bootstrapTable", pages);
		if(null != pages.getSearch() && !"".equals(pages.getSearch())){
			pd.put("keywords", pages.getSearch().trim());
		}
		page.setPd(pd);
		page.setShowCount(pages.getLimit());
		page.setOrder(pages.getOrder());
		page.setSort(pages.getSort());
		page.setCurrentPage(pages.getOffset()/pages.getLimit()+1);	
		System.err.println(page);
		List<PageData> list=  applySerVice.showArchdistributelistPage(page);
		pages.setRows(list);
		pages.setTotal(page.getTotalResult());
		return pages;
	}
	@RequestMapping(value="/gotoarchiverecordfile")
	public String  gotoarchiverecordfile(){
		
		return "system/archiverecordfile/archiverecordfilelist";
		
	}
	

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
