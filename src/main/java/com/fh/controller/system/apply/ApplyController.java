package com.fh.controller.system.apply;



import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.BootstrapTable;
import com.fh.entity.Page;
import com.fh.entity.Result;
import com.fh.entity.amsmodel.Apply;
import com.fh.entity.amsmodel.ApplyStute;
import com.fh.entity.system.Role;
import com.fh.entity.system.User;
import com.fh.util.PageData;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.internal.bind.JsonAdapterAnnotationTypeAdapterFactory;

import net.sf.json.JSONArray;


import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.service.ams.apply.ApplyManager;
import com.fh.service.system.menu.MenuManager;
import com.fh.service.system.role.RoleManager;
import com.fh.service.system.user.UserManager;

/** 
 * 说明：审批申请
 * 创建人：kioor 
 * 创建时间：2016年5月26日22:16:53
 */
@Controller
@RequestMapping(value="/apply")
public class ApplyController extends BaseController {
	String menuUrl="apply/showApplylist.do";
	@Resource
	private ApplyManager applySerVice;
	@Resource(name="roleService")
	private RoleManager roleService;
	@Resource(name="menuService")
	private MenuManager menuService;
	@Resource(name="userService")
	private UserManager userService;

	/**分发审批申请页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/distribute")
	public ModelAndView distributeApply() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/apply/distributeapply");
		mv.addObject("pd", pd);
		return mv;
	}

	/**借阅审批申请页面
	 * @returna
	 * @throws Exception
	 */
	@RequestMapping(value="/borrow")
	public ModelAndView borrowApply() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/apply/borrowapply");
		mv.addObject("pd", pd);
		return mv;
	}	
	@RequestMapping(value="/showApplylist")
	public ModelAndView showApplylist(Page page) throws Exception{		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();		
		page.setPd(pd);
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色

		mv.setViewName("system/apply/applylist");
		mv.addObject("roleList", roleList);
		mv.addObject("pd", pd);
		System.out.println(Jurisdiction.getHC());
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
		//列出用户列表		
	}

	@RequestMapping(value="/showApplyDesc")
	public ModelAndView showApplyDesc(int  apply_id) throws Exception{		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();	
		pd.put("ROLE_ID", 1);
		List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色	
		if(roleList.size()>0){

			pd.put("ROLE_ID", roleList.get(0).getROLE_ID());
		}else{
			pd.put("ROLE_ID", 1);
		}
		pd.put("ROLE_ID", roleList.get(0).getROLE_ID());
		List<PageData>  listuser=	userService.listAllUserByRoldId(pd);
		pd=  applySerVice.getApplyDesc(apply_id);	
		mv.setViewName("system/apply/apply_Desc");

		mv.addObject("listuser", listuser);
		mv.addObject("roleList", roleList);
		mv.addObject("pd", pd);
		System.out.println(Jurisdiction.getHC());
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;		
	}

	@ResponseBody
	@RequestMapping(value="/showApplylistPage")
	public BootstrapTable showApplylistPage(BootstrapTable pages,HttpServletRequest request) throws Exception{
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
		List<PageData> list=  applySerVice.showApplylistpage(page);
		pages.setRows(list);
		pages.setTotal(page.getTotalResult());
		return pages;
		
		
	}


	@ResponseBody
	@RequestMapping(value="/saveApplyStute")
	public Result saveApplyStute(ApplyStute applyStute)throws Exception{
		Result r =null;
		/*	if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){
			 r=new Result<>();
			 r.setResult(false);
			 r.setDesc("没有权限");
			return r;
		}*/ //校验权限
		if("".equals(applyStute.getStute())){

			r=new Result<>();
			r.setResult(false);
			r.setDesc("禁止非法数据");
			return r;
		}

		User user = (User)this.getRequest().getSession().getAttribute(Const.SESSION_USER);
		applyStute.setUserId(user.getUSER_ID());
		applyStute.setStuteTime(new Date());
		
	
		r= applySerVice.saveapplyStute(applyStute);
		if(applyStute.getStute()==1){
			r= 	applySerVice.saveArchdistribute(null,user.getUSER_ID(),applyStute.getStuteDesc(),null,applyStute.getApplyId());
					
		}	
		System.err.println(applyStute.getStute());
				 return r;	   
	}

	/**
	 * 
	 * 
	 * 添加申请
	 * @param apply
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年7月18日 下午4:46:35
	 *
	 */
	@ResponseBody
	@RequestMapping(value="/addApplys")
	public Result addApplys()throws Exception{
		Result r ;
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){
			r=new Result<>();
			r.setResult(false);
			r.setDesc("没有权限");
			return r;
		} //校验权限
		PageData pd= this.getPageData();
		Apply apply=new Apply();
		if(pd.get("applyWhy")==null||pd.get("applyWhy")==""||pd.get("applyWhy").equals(null)||"".equals(pd.get("applyWhy"))){
			r=new Result<>();
			r.setResult(false);
			r.setDesc("数据格式不对");
			return r;}
		apply.setApplyWhy((String) pd.get("applyWhy"));
		apply.setDescs( (String) pd.get("descs"));
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		try {

			String eL = "[0-9]{4}-[0-9]{2}-[0-9]{2}";
			Pattern p = Pattern.compile(eL);
			Matcher m = p.matcher(pd.get("returntime").toString());
			if(m.matches()){
				apply.setReturntime(format.parse((String) pd.get("returntime")));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		User user = (User)this.getRequest().getSession().getAttribute(Const.SESSION_USER);		
		System.out.println(user.getUSER_ID());
		apply.setUserId(user.getUSER_ID());
		apply.setApplyTime(new Date());
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		r= applySerVice.save(apply,pd.getString("fileIds"));
		return r;	   
	}
	
	@ResponseBody
	@RequestMapping(value="/getApplyStutecount")
	public List<PageData> getApplyStutecount()throws Exception{
		
	return	applySerVice.showApplyStutecount();
	}
	
	



}
