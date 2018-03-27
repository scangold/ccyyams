package com.fh.controller.system.archiveproject;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.BootstrapTable;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.KmsFileBox;
import com.fh.entity.amsmodel.Prjtype;
import com.fh.entity.system.Department;
import com.fh.entity.system.Role;
import com.fh.entity.system.User;
import com.fh.service.ams.prjtype.PrjtypeManager;
import com.fh.service.ams.project.ProjectManager;
import com.fh.service.kms.kmsfilebox.KmsfileBoxManager;
import com.fh.service.system.role.RoleManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 
 * @author kioor
 *  2016年5月11日09:09:38
 */
@Controller
@RequestMapping(value="/project")
public class ArchiveProjectController extends BaseController {

	String menuUrl = "project/selectall.do";
	@Resource(name="projectService")
	private ProjectManager projectService;

	@Resource(name="prjtypeService")
	private PrjtypeManager prjtypeService;


	@Resource(name="userService")
	private UserManager userService;
	@Resource(name="roleService")
	private RoleManager roleService;
	

	@Resource(name="kmsfileBoxService")
	private KmsfileBoxManager kmsfileBoxService;


	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/saveP")
	public ModelAndView save() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"Add new project");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);		
		pd.put("USER_ID", user.getUSER_ID());
		projectService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}


	/**删除
	 * @param out
	 * @throws Exception 
	 */
	@RequestMapping(value="/deleteP")
	public void deleteP(PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"Delete project");
		PageData pd = new PageData();
		pd = this.getPageData();

		projectService.delete(pd);
		out.write("success");
		out.close();
	}


	/**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditproject")
	public ModelAndView goEditproject() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		if("1".equals(pd.getString("USER_ID"))){return null;}		//不能修改admin用户
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);	//列出所有系统用户角色

		List<PageData> prjtypeList = prjtypeService.listAllPrjtype(pd);//列出所有项目类型
		mv.addObject("fx", "user");
		int e= Integer.parseInt(pd.getString("PRJ_ID"));
		pd.put("PRJ_ID", e);
		pd = projectService.findById(pd);
		pd.put("PRJ_ID", e);
		mv.setViewName("system/archiveproject/project_edit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		mv.addObject("roleList", roleList);
		mv.addObject("prjtypeList", prjtypeList);
		return mv;
	}
 
	/**
	 * 修改
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Session session = Jurisdiction.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);		
		pd.put("USER_ID", user.getUSER_ID());
		projectService.edit(pd);	//执行修改
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	
	
	
	
	
	/**查看项目
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/viewP")
	public ModelAndView viewP() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		
		pd = projectService.findById(pd);						
		mv.setViewName("system/archiveproject/project_view");
		mv.addObject("msg", "editP");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	
	
	/**选择全部列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/selectall")
	public ModelAndView selectall(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"List all Project");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varAllList = projectService.list(page);	//列出列表
		List<PageData> prjtypeList = prjtypeService.selectAll(pd);//列出所有项目类型


		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varAllList.size();i++){
			PageData vpd = new PageData();
			vpd.put("PRJ_ID", varAllList.get(i).get("PRJ_ID"));	//项目序号 
			////vpd.put("COVERAGE_ID", varAllList.get(i).getString("COVERAGE_ID"));	//覆盖区域序号
			vpd.put("PRJTYPE", varAllList.get(i).get("PRJTYPE"));	//项目类型
			//			vpd.put("PRJTYPE_NAME", varAllList.get(i).getString("PRJTYPE_NAME"));	//项目类型名称
			//			//vpd.put("PRJTYPE_REMARK", varAllList.get(i).getString("PRJTYPE_REMARK"));	//项目类型备注
			vpd.put("PRJ_NAME", varAllList.get(i).getString("PRJ_NAME"));	//项目名称
			vpd.put("PRJ_ORIGIN", varAllList.get(i).getString("PRJ_ORIGIN"));	//项目来源
			vpd.put("PRJ_LEADER", varAllList.get(i).getString("PRJ_LEADER"));	//项目负责人
			vpd.put("PRJ_DEPART", varAllList.get(i).getString("PRJ_DEPART"));	//项目负责单位部门
			////vpd.put("PRJ_STRATTIME", varAllList.get(i).getString("PRJ_STRATTIME"));	//项目开始时间
			////vpd.put("PRJ_ENDTIME", varAllList.get(i).getString("PRJ_ENDTIME"));	//项目结束时间
			////vpd.put("PRJ_PROGRESS", varAllList.get(i).getString("PRJ_PROGRESS"));	//项目进度情况
			////vpd.put("PRJ_REMARK", varAllList.get(i).getString("PRJ_REMARK"));	//项目备注
			////vpd.put("USER_ID", varAllList.get(i).getString("USER_ID"));	//用户序号
			vpd.put("YEAR", varAllList.get(i).getString("YEAR"));	//项目开始年份
			vpd.put("RECORD_LIMIT", varAllList.get(i).getString("RECORD_LIMIT"));	//项目保存时间
			vpd.put("SECURITY_CLASS", varAllList.get(i).getString("SECURITY_CLASS"));	//项目密级
			//vpd.put("PRO_NUM", varAllList.get(i).getString("PRO_NUM"));	//项目编号
			varList.add(vpd);
		}



		mv.setViewName("system/archiveproject/project_list");
		mv.addObject("varList", varList);
		mv.addObject("prjtypeList", prjtypeList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}


	/**选择全部列表2********************************************for 测试
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/selectalltest")
	public ModelAndView selectalltest(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"List all Project");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varAllList = projectService.list(page);	//列出列表
		List<PageData> prjtypeList = prjtypeService.selectAll(pd);//列出所有项目类型


		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varAllList.size();i++){
			PageData vpd = new PageData();
			vpd.put("PRJ_ID", varAllList.get(i).get("PRJ_ID"));	//项目序号 
			////vpd.put("COVERAGE_ID", varAllList.get(i).getString("COVERAGE_ID"));	//覆盖区域序号
			vpd.put("PRJTYPE", varAllList.get(i).get("PRJTYPE"));	//项目类型
			vpd.put("PRJTYPE_NAME", varAllList.get(i).getString("PRJTYPE_NAME"));	//项目类型名称
			//			//vpd.put("PRJTYPE_REMARK", varAllList.get(i).getString("PRJTYPE_REMARK"));	//项目类型备注
			vpd.put("PRJ_NAME", varAllList.get(i).getString("PRJ_NAME"));	//项目名称
			vpd.put("PRJ_ORIGIN", varAllList.get(i).getString("PRJ_ORIGIN"));	//项目来源
			vpd.put("PRJ_LEADER", varAllList.get(i).getString("PRJ_LEADER"));	//项目负责人
			vpd.put("PRJ_DEPART", varAllList.get(i).getString("PRJ_DEPART"));	//项目负责单位部门
			////vpd.put("PRJ_STRATTIME", varAllList.get(i).getString("PRJ_STRATTIME"));	//项目开始时间
			////vpd.put("PRJ_ENDTIME", varAllList.get(i).getString("PRJ_ENDTIME"));	//项目结束时间
			////vpd.put("PRJ_PROGRESS", varAllList.get(i).getString("PRJ_PROGRESS"));	//项目进度情况
			////vpd.put("PRJ_REMARK", varAllList.get(i).getString("PRJ_REMARK"));	//项目备注
			////vpd.put("USER_ID", varAllList.get(i).getString("USER_ID"));	//用户序号
			vpd.put("YEAR", varAllList.get(i).getString("YEAR"));	//项目开始年份
			vpd.put("RECORD_LIMIT", varAllList.get(i).getString("RECORD_LIMIT"));	//项目保存时间
			vpd.put("SECURITY_CLASS", varAllList.get(i).getString("SECURITY_CLASS"));	//项目密级
			vpd.put("PRO_NUM", varAllList.get(i).getString("PRO_NUM"));	//项目编号
			varList.add(vpd);
		}



		mv.setViewName("system/archiveproject/project_jsListtest");
		mv.addObject("varList", varList);
		mv.addObject("prjtypeList", prjtypeList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

	/**选择全部列表3***********************for arch receive bootstrap*******ARproject.jsp******
	 * 
	 * @param pages
	 * @param request
	 * @return
	 * @throws Exception
	 * @date:2016年7月26日 下午3:25:36
	 *
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/showprojectlistpage")
	public BootstrapTable showProjectlistPage(BootstrapTable pages,HttpServletRequest request) throws Exception{
		Page page =new Page();	
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




		List<PageData>	varPrjList = projectService.list(page);	//列出列表
		pages.setRows(varPrjList);
		pages.setTotal(page.getTotalResult());
		return pages;
	}

	/**去新增项目页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAddU(Page page)throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();


		page.setPd(pd);
		List<PageData> prjtypeList = prjtypeService.selectAll(pd);//列出所有项目类型

		List<PageData>	userList = userService.listUsers(page);	//列出用户列表
		pd.put("ROLE_ID", "1");
		List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色


		mv.setViewName("system/archiveproject/project_edit");
		mv.addObject("msg", "saveP");
		mv.addObject("pd", pd);
		mv.addObject("prjtypeList", prjtypeList);
		mv.addObject("userList", userList);
		mv.addObject("roleList", roleList);
		return mv;
	}


	/**批量删除
	 * @param
	 * @throws Exception
	 */


	//	 /**导出到excel
	//	 * @param
	//	 * @throws Exception
	//	 */
	//	@RequestMapping(value="/excel")
	//	public ModelAndView exportExcel() throws Exception{
	//		logBefore(logger, Jurisdiction.getUsername()+"导出Fhbutton到excel");
	//		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
	//		ModelAndView mv = new ModelAndView();
	//		PageData pd = new PageData();
	//		pd = this.getPageData();
	//		Map<String,Object> dataMap = new HashMap<String,Object>();
	//		List<String> titles = new ArrayList<String>();
	//		titles.add("名称");	//1
	//		titles.add("权限标识");	//2
	//		titles.add("备注");	//3
	//		dataMap.put("titles", titles);
	//		List<PageData> varOList = fhbuttonService.listAll(pd);
	//		List<PageData> varList = new ArrayList<PageData>();
	//		for(int i=0;i<varOList.size();i++){
	//			PageData vpd = new PageData();
	//			vpd.put("var1", varOList.get(i).getString("NAME"));	//1
	//			vpd.put("var2", varOList.get(i).getString("QX_NAME"));	//2
	//			vpd.put("var3", varOList.get(i).getString("BZ"));	//3
	//			varList.add(vpd);
	//		}
	//		dataMap.put("varList", varList);
	//		ObjectExcelView erv = new ObjectExcelView();
	//		mv = new ModelAndView(erv,dataMap);
	//		return mv;
	//	}



	/**
	 * 模拟数据
	 * @param page
	 * @param limit
	 * @param offset
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2016年8月9日 上午10:33:42
	 *
	 */
	@ResponseBody
	@RequestMapping(value="/getproTotal")
	public PageData getproTotal(Page page,int limit,int offset)throws Exception{
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		PageData pd  = this.getPageData();
		page.setPd(pd);
		page.setShowCount(limit);
		page.setCurrentPage(offset/limit+1);	
		List<PageData> list=new ArrayList<>();
		//	List<PageData> list=  projectService.getproTotallistPage(page);
		PageData pds; 
		for (int i = 0; i < limit; i++) {
			pds=new PageData();
			pds.put("obj_id", i);
			pds.put("file_count", (i+3)*9);
			pds.put("file_size", (i+100)*5);
			switch (i%5) {
			case 0:
				pds.put("junit", "KB");
				break;
			case 1:
				pds.put("junit", "MB");
				break;

			case 2:
				pds.put("junit", "GB");
				break;

			case 3:
				pds.put("junit", "TB");
				break;
			default:
				pds.put("junit", "其他");
				break;
			}
			System.err.println(i);
			list.add(pds);

		}
		pd.put("rows", list);
		pd.put("total", page.getTotalResult());
		return pd;





	}
	@ResponseBody
	@RequestMapping("getProjiecNameAndId")
	public List<PageData> getProjiecNameAndId(String proname) throws Exception{

		return  projectService.getProjiecNameAndId(proname);

	}

}
