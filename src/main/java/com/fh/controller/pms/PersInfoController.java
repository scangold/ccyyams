package com.fh.controller.pms;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.common.annotation.ControllerOptLog;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.PmsCertificateAndHonor;
import com.fh.entity.amsmodel.PmsPExperience;
import com.fh.entity.amsmodel.PmsPInformation;

import com.fh.entity.system.Department;
import com.fh.entity.system.Role;
import com.fh.entity.system.User;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.service.pms.persInfo.PersInfoService;
import com.fh.service.system.role.RoleManager;
import com.fh.service.system.user.UserManager;

import com.fh.util.Jurisdiction;
import com.fh.util.PageData;


import net.sf.json.JSONArray;

import sun.misc.BASE64Encoder;

/**
 * Servlet implementation class persInfo
 */
@Controller
@RequestMapping("/pms")
public class PersInfoController extends BaseController {
	String menuUrl = "pms/listPersInfo.do"; //菜单地址(权限用)
	@Autowired  
	HttpServletRequest request; //这里可以获取到request
	@Autowired
	private	DepartmentManager departmentManagerService;
	@Autowired
	private RoleManager roleService;
	@Autowired
	private UserManager userService;
	@Autowired
	private PersInfoService pInfoService;
	/**显示人事列表页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/listPersInfo")
	public ModelAndView listPersInfo(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();

		pd = this.getPageData();
		
		String isValid=pd.getString("isValid");
		if(isValid==null){
			isValid="1";
		}
		pd.put("isValid",isValid);
		//人员组织树
		
		String json=pd.getString("TREENODES");
		if(json==""||json==null||json.isEmpty()){
		JSONArray arr = JSONArray.fromObject(pInfoService.listAllPersons(pd));
		json = arr.toString();
		json = json.replaceAll("opened", "open").replaceAll("DEPARTMENT_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "url");
		}
		//所有部门
		List<Department> departmentList = departmentManagerService.listAllDepartment2(pd);//列出所有部门
		//所有角色
		List<Role> roleList = roleService.listAllRoles(pd);//列出所有系统用户角色
		//所有人员（表格显示）
		page.setOrder("DESC");
		page.setSort("HIRED");
		page.setPd(pd);	
		List<PageData>	dataList = null;
		String parameter=request.getParameter("LEVEL");
		if(parameter==null||parameter==""){//一院
			dataList = pInfoService.listAllPers(page);	
		}
		else if(Integer.parseInt(parameter)==1){//生产部门
			dataList = pInfoService.listAllPersByOne(page);
		}
		else if(Integer.parseInt(parameter)==2){//工程中心
			dataList = pInfoService.listAllPersByTwo(page);
		}
		
		//List<PmsPInformation> PersList = pInfoService.listAllPers("0");//根据department_id列出所有用户信息
		mv.addObject("treeNodes", json);
		mv.addObject("departmentList", departmentList);
		mv.addObject("roleList", roleList);
		mv.addObject("dataList", dataList);
		mv.addObject("pd", pd);
		mv.setViewName("pms/persInfo/listPersInfo");
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		
		return mv;
	}
	/**去修改人事信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goEditP")
	public ModelAndView goEditP(HttpServletResponse response) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
	
		//所有部门
		List<Department> departmentList = departmentManagerService.listAllDepartment2(pd);//列出所有部门
		//pd = userService.findById(pd);	
		pd=pInfoService.viewPerinfoById(pd);//根据ID读取
		String path=pd.getString("PHOTOPATH");
		if(path!=null){
		if(path!=""&&!path.isEmpty()){
		InputStream in = null;  
        byte[] data = null;  
        // 读取图片字节数组  
        try {  
            in = new FileInputStream(path);  
            data = new byte[in.available()];  
            in.read(data);  
            in.close();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        // 对字节数组Base64编码  
        BASE64Encoder encoder = new BASE64Encoder();
        // 返回Base64编码过的字节数组字符串  
        String newpath= encoder.encode(data);
        pd.put("newpath", newpath);
		}
		}
		mv.setViewName("pms/persInfo/editPersInfo");
		mv.addObject("pd", pd);
		mv.addObject("departmentList", departmentList);
		//mv.addObject("roleList", list);
		return mv;
	}
	/**去查看人事信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/viewPinfo")
	public ModelAndView viewPinfo(HttpServletResponse response) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd=pInfoService.viewPerinfoById(pd);//根据ID读取
		
		String path=pd.getString("PHOTOPATH");
		if(path!=null){
		if(path.trim()!=""&&!path.isEmpty()){
		InputStream in = null;  
        byte[] data = null;  
        // 读取图片字节数组  
        try {  
            in = new FileInputStream(path);  
            data = new byte[in.available()];  
            in.read(data);  
            in.close();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        // 对字节数组Base64编码  
        BASE64Encoder encoder = new BASE64Encoder();  
        // 返回Base64编码过的字节数组字符串  
        String newpath= encoder.encode(data);
        pd.put("newpath", newpath);
		}
		}
		mv.setViewName("pms/persInfo/viewPersInfo");
		mv.addObject("pd", pd);
		return mv;
	}
	/**新增用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/newPersInfo")
	public ModelAndView newPersInfo() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		//所有部门
		List<Department> departmentList = departmentManagerService.listAllDepartment2(pd);//列出所有部门
		//所有角色
		List<Role> roleList = roleService.listAllRoles(pd);//列出所有系统用户角色

		mv.addObject("departmentList", departmentList);
		mv.addObject("roleList", roleList);
		mv.setViewName("pms/persInfo/addPersInfo");
		return mv;

	}
	
	/**查看人事经历
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/viewPersEx")
	public ModelAndView viewPersEx(Page page) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//所有人员（表格显示）
		page.setPd(pd);
			List<PageData>	dataList = pInfoService.listAllExsByPid(page);
		mv.addObject("dataList", dataList);
		mv.addObject("pd",pd);
		mv.setViewName("pms/persInfo/viewPersEx");
		return mv;

	}
	/**查看人事获奖荣誉
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/viewPersHonor")
	public ModelAndView viewPersHonor(Page page) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//所有人员（表格显示）
		page.setPd(pd);
		List<PageData>	dataList = pInfoService.listAllHonorsByPid(page);
		mv.addObject("dataList", dataList);
		mv.addObject("pd",pd);
		mv.setViewName("pms/persInfo/viewPersHonor");
		return mv;

	}
	/**编辑获奖荣誉
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editPersHo")
	public ModelAndView editPersHo() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd=pInfoService.listExsByPryzsId(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg","saveEditPersHo");
		mv.setViewName("pms/persInfo/addPersHonor");
		return mv;

	}
	/**保存编辑的获奖荣誉
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="新增获奖荣誉")
	@RequestMapping(value="/saveEditPersHo")
	public ModelAndView saveEditPersHo(PmsCertificateAndHonor pmsCertificateAndHonor) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			pInfoService.saveEditPersHo(pmsCertificateAndHonor);
			mv.addObject("msg","success");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;

	}
	/**编辑人事经历
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/editPersEx")
	public ModelAndView editPersEx() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd=pInfoService.listExsByPExId(pd);
		mv.addObject("pd", pd);
		//mv.addObject("dataList", dataList);
		mv.addObject("msg","saveEditPersEx");
		mv.setViewName("pms/persInfo/addPersEx");
		return mv;

	}
	/**保存修改的人事经历
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="修改人事经历")
	@RequestMapping(value="/saveEditPersEx")
	public ModelAndView saveEditPersEx(PmsPExperience pmsPExperience) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			pInfoService.saveEditPersEx(pmsPExperience);
			mv.addObject("msg","success");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;

	}
	/**新增人事经历
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/newPersEx")
	public ModelAndView newPersEx() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		mv.addObject("pd", pd);
		mv.addObject("msg","savePersEx");
		mv.setViewName("pms/persInfo/addPersEx");
		return mv;

	}
	/**新增人事获奖荣誉
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/newPersHo")
	public ModelAndView newPersHo() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.addObject("msg", "savePersHo");
		mv.addObject("pd", pd);
		mv.setViewName("pms/persInfo/addPersHonor");
		return mv;

	}
	/**保存新增获奖荣誉
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="新增获奖荣誉")
	@RequestMapping(value="/savePersHo")
	public ModelAndView savePersHo(PmsCertificateAndHonor pmsCertificateAndHonor) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			pmsCertificateAndHonor.setPryzsId(this.get32UUID());
			pInfoService.insertPHo(pmsCertificateAndHonor);
			mv.addObject("msg","success");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;

	}
	/**保存新增人事经历
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="新增人事经历")
	@RequestMapping(value="/savePersEx")
	public ModelAndView savePersEx(PmsPExperience pmsPExperience) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try{
			pmsPExperience.setpExId(this.get32UUID());
			pInfoService.insertPEx(pmsPExperience);
			mv.addObject("msg","success");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;

	}
	/**保存新增用户
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="新增用户")
	@RequestMapping(value="/savePersInfo")
	public ModelAndView savePersInfo(PmsPInformation pmsPInformation,User user,@RequestParam( required = false,value="files")CommonsMultipartFile[] files) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增user");
		
		ModelAndView mv = this.getModelAndView();

		PageData pd = this.getPageData();
		//用户表
		/*user.setUSER_ID(this.get32UUID());
	    user.setLAST_LOGIN("");
	    user.setIP("");
	    user.setSTATUS("0");
	    user.setSKIN("default");
	    user.setRIGHTS("");
	    user.setPASSWORD(new SimpleHash("SHA-1",user.getUSERNAME(), user.getPASSWORD()).toString());*/
	    
		pd.put("USER_ID", this.get32UUID());	//ID 主键
		pd.put("LAST_LOGIN", "");				//最后登录时间
		pd.put("IP", "");						//IP
		pd.put("STATUS", "0");					//状态
		pd.put("SKIN", "default");
		pd.put("RIGHTS", "");		
		pd.put("PASSWORD", new SimpleHash("SHA-1", user.getUSERNAME(), user.getPASSWORD()).toString());	//密码加密
		pd.put("P_ID", this.get32UUID());	//ID 主键
		pd.put("USERNAME",user.getUSERNAME());	
		pd.put("NAME",user.getNAME());
		pd.put("ROLE_ID",user.getROLE_ID());
		pd.put("DEPARTMENT_ID",user.getDEPARTMENT_ID());
		pd.put("PHONE",pmsPInformation.getTelephone());
		pd.put("BZ",user.getBZ());
		pd.put("EMAIL",user.getEMAIL());
		pd.put("NUMBER",user.getNUMBER());
		//人事信息表
		
		pmsPInformation.setpId(this.get32UUID());
	    pmsPInformation.setUserId(pd.getString("USER_ID"));
	    pmsPInformation.setName(user.getNAME());
	    
		String path="D:/filedata/" + System.currentTimeMillis()+"/";

		File f=new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		if(files!=null) {
			for (CommonsMultipartFile commonsMultipartFile : files) {
				if(!commonsMultipartFile.isEmpty()){  
					pmsPInformation.setPhotopath( path + commonsMultipartFile.getOriginalFilename());
					//pd.put("PHOTOPATH", path + commonsMultipartFile.getOriginalFilename());
					int pre = (int) System.currentTimeMillis();  
					try {  

						//拿到输出流，同时重命名上传的文件                  
						FileOutputStream os = new FileOutputStream(path + commonsMultipartFile.getOriginalFilename());  
						//拿到上传文件的输入流  
						FileInputStream in = (FileInputStream) commonsMultipartFile.getInputStream();    


						//以写字节的方式写文件  
						int b = 0;  
						while((b=in.read()) != -1){  
							os.write(b);  
						}  
						os.flush();  
						os.close();  
						in.close();  
						int finaltime = (int) System.currentTimeMillis();  
						System.out.println(finaltime - pre);  

					} catch (Exception e) {  
						e.printStackTrace();  
						System.out.println("上传出错");  
					}  
				}
			}
		}
		
		try{
			pInfoService.insertP(pmsPInformation,pd);
			mv.addObject("msg","success");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");

		return mv;
	}

	/**保存编辑用户
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="编辑用户")
	@RequestMapping(value = "/editPinfo")
	public ModelAndView  editPinfo(PmsPInformation pmsPInformation,User user,@RequestParam( required = false,value="files")CommonsMultipartFile[] files) throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		Date date=new Date();
		/*DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);*/
		pd.put("EMAIL",user.getEMAIL());
		pd.put("USER_ID",user.getUSER_ID());
		pd.put("BZ",user.getBZ());
		pd.put("DEPARTMENT_ID",user.getDEPARTMENT_ID());
		pd.put("NAME",user.getNAME());
		pd.put("PHONE",pmsPInformation.getTelephone());
		
		pmsPInformation.setRefreshtime(date);
		pmsPInformation.setUserId(user.getUSER_ID());
		pmsPInformation.setName(user.getNAME());
		String existPath=pmsPInformation.getPhotopath();
		if(existPath!=""&&existPath!=null&&!existPath.isEmpty()){
		String path="D:/filedata/" + new Date().getTime()+"/";

		File f=new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		if(files!=null) {
			for (CommonsMultipartFile commonsMultipartFile : files) {
				if(!commonsMultipartFile.isEmpty()){  
					pmsPInformation.setPhotopath( path + commonsMultipartFile.getOriginalFilename());
					//pd.put("PHOTOPATH", path + commonsMultipartFile.getOriginalFilename());
					int pre = (int) System.currentTimeMillis();  
					try {  

						//拿到输出流，同时重命名上传的文件                  
						FileOutputStream os = new FileOutputStream(path + commonsMultipartFile.getOriginalFilename());  
						//拿到上传文件的输入流  
						FileInputStream in = (FileInputStream) commonsMultipartFile.getInputStream();    


						//以写字节的方式写文件  
						int b = 0;  
						while((b=in.read()) != -1){  
							os.write(b);  
						}  
						os.flush();  
						os.close();  
						in.close();  
						int finaltime = (int) System.currentTimeMillis();  
						System.out.println(finaltime - pre);  

					} catch (Exception e) {  
						e.printStackTrace();  
						System.out.println("上传出错");  
					}  
				}
			}
		}
		}
		else{
			pmsPInformation.setPhotopath(null);
		}
		pInfoService.eidtPerinfo(pd,pmsPInformation);
		mv.addObject("msg","success");
/*		JSONArray arr = JSONArray.fromObject(pInfoService.listAllPersons(pd));
		String json = arr.toString();
		json = json.replaceAll("DEPARTMENT_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "url");*/
		//所有部门
		mv.setViewName("save_result");
		return mv;
	}
	/**删除工作经历
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@ControllerOptLog(desc="删除用户工作经历")
	@RequestMapping(value = "/deletePEx")
	public String  deletePEx() throws Exception {
		String json="";
		PageData pd = new PageData();
		pd = this.getPageData();
		
		try{
			pInfoService.deletePEx(pd);
			json="[{\"msg\":\"成功\"}]";
		}catch (Exception e) {
			// TODO: handle exception
			json="[{\"msg\":\"失败\"}]";
		}

		return json;
	}
	/**删除获奖荣誉
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@ControllerOptLog(desc="删除用户获奖荣誉")
	@RequestMapping(value = "/deletePHo")
	public String  deletePHo() throws Exception {
		String json="";
		PageData pd = new PageData();
		pd = this.getPageData();
		
		try{
			pInfoService.deletePHo(pd);
			json="[{\"msg\":\"成功\"}]";
		}catch (Exception e) {
			// TODO: handle exception
			json="[{\"msg\":\"失败\"}]";
		}

		return json;
	}
	/**删除人事信息
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@ControllerOptLog(desc="删除人事信息")
	@RequestMapping(value = "/deletePinfo")
	public String  deletePinfo() throws Exception {
		String json="";
		PageData pd = new PageData();
		pd = this.getPageData();
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		pd.put("REFRESHTIME", time);	//创建时间
		try{
			pInfoService.deletePinfo(pd);
			json="[{\"msg\":\"成功\"}]";
		}catch (Exception e) {
			// TODO: handle exception
			json="[{\"msg\":\"失败\"}]";
		}
		/*JSONArray arr = JSONArray.fromObject(pInfoService.listAllPersons(pd));
		String json = arr.toString();
		json = json.replaceAll("DEPARTMENT_ID", "id").replaceAll("PARENT_ID", "pId").replaceAll("NAME", "name").replaceAll("subDepartment", "nodes").replaceAll("hasDepartment", "checked").replaceAll("treeurl", "url");*/
		//所有部门
		return json;
	}
	/**
	 * SELECT DEGREE,count(DEGREE) as count from pms_pinformation GROUP BY DEGREE
	 * @param pms_pinformation
	 * @param out
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2018年2月4日 下午11:08:37
	 *
	 */
	@ResponseBody
	@ControllerOptLog(desc="getCountByDegree")
	@RequestMapping(value="/getCountByDegree")
	public Object getCountByDegree() throws Exception{
	
	List<PageData> pd=	pInfoService.getCountByDegree();
		return pd;
	}
	
	@ResponseBody
	@ControllerOptLog(desc="getCountByPtitle")
	@RequestMapping(value="/getCountByPtitle")
	public Object getCountByPtitle() throws Exception{
	
	List<PageData> pd=	pInfoService.getCountByPtitle();
		return pd;
	}
	
	@ResponseBody
	@ControllerOptLog(desc="getCountByDepartment")
	@RequestMapping(value="/getCountByDepartment")
	public Object getCountByDepartment() throws Exception{
	
	List<PageData> pd=	pInfoService.getCountByDepartment();
		return pd;
	}


}
