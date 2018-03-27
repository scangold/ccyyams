package com.fh.controller.fms;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
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
import com.fh.entity.fms.FmsDocBox;
import com.fh.entity.fms.FmsDocMain;
import com.fh.entity.system.Department;
import com.fh.entity.system.Role;
import com.fh.service.data.DataService;
import com.fh.service.fms.FmsService;
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
@RequestMapping(value="/official")
public class OfficialController extends BaseController {

	String menuUrl = "official/list.do"; //菜单地址(权限用)
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
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		
		//pd.put("ROLE_ID", "1");
		//List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
		//List<FmsDataDictItem> isValidList = dataService.listDataDictItemDataById("isvalid");
		mv.setViewName("fms/official/list");
		//mv.addObject("dataList", dataList);
		//mv.addObject("isValidList", isValidList);
		mv.addObject("pd", pd);		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/getNodes")
	public List<FmsDocBox> getNodes(FmsDocBox fmsDocBox) throws Exception {
	
		return fmsService.listNodes(fmsDocBox);
		
	}
	@ResponseBody
	@RequestMapping(value="/selectByForeignKey")
	public List<FmsDocBox> selectByForeignKey(String fmsid) throws Exception {
		
		return fmsService.selectByForeignKey(fmsid);
		
	}
	
	
	@RequestMapping(value="/goAddDocBox")
	public ModelAndView goAddDocBox()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();	
		mv.setViewName("fms/official/edit");
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
	@RequestMapping(value="/goEditDocBox")
	public ModelAndView goEddDocBox() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd=this.getPageData();
		//根据ID读取		
		FmsDocBox  fmsDocBox = fmsService.findById(pd.getString("id"));	

		pd.put("fmsDocBox", fmsDocBox);

		mv.setViewName("fms/official/edit");
		mv.addObject("msg", "editDocBox");
		mv.addObject("pd", pd);
		return mv;
	}
	

	
	@ControllerOptLog(desc="新增FmsDocBox")
	@RequestMapping(value="/save")
	public ModelAndView save(FmsDocBox fmsDocBox) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增tyepe");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			fmsDocBox.setId(get32UUID());
			fmsService.save(fmsDocBox);
			mv.addObject("msg","success");
		} catch (Exception e) {
			// TODO: handle exception
			logBefore(logger, e.getMessage());
			mv.addObject("msg","failed");
		}	
		mv.setViewName("save_result");
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
	@ControllerOptLog(desc="修改FmsDocBox")
	@RequestMapping(value="/editDocBox")
	public ModelAndView editDocBox(FmsDocBox fmsDocBox) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增tyepe");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
	
			fmsService.updateDocBox(fmsDocBox);
			mv.addObject("msg","success");
		} catch (Exception e) {
			// TODO: handle exception
			logBefore(logger, e.getMessage());
			mv.addObject("msg","failed");
		}	
		mv.setViewName("save_result");
		return mv;
	}

	
	/**删除目录
	 * @param out
	 * @throws Exception 
	 */
	@ControllerOptLog(desc="删除文书目录")
	@RequestMapping(value="/deleteDocBox")
	public void deleteDoc(FmsDocMain dmsDocMain ,PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除文书目录");
		PageData 	pd = this.getPageData();
		fmsService.deleteDocBox(dmsDocMain.getId());
		out.write("success");
		out.close();
	}

}
