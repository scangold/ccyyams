package com.fh.controller.system.archivereceive;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.fh.amstools.AMSReadExcel;
import com.fh.controller.ams.CheckFileClass;
import com.fh.controller.ams.KioorTools;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.Receive;
import com.fh.entity.amsmodel.ReceiveTemp;
import com.fh.entity.system.Department;
import com.fh.service.ams.file.FileManager;
import com.fh.service.ams.file.impl.FileService;
import com.fh.service.fhoa.department.DepartmentManager;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FileUpload;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 类名称：ArchiveController 成果管理工具 创建人：kioor 修改时间：2016年4月25日15:40:11
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/archiveRCREC")
public class Archive3RCRECController extends BaseController {

	@Resource(name = "fileService")
	private FileManager fileService;

	@Resource(name = "departmentService")
	private DepartmentManager departmentService;
	
	
	
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addHDFhand")
	public ModelAndView FormReceiveHDFhand(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Session session = Jurisdiction.getSession();

		/*JSONArray joHandFileTable = (JSONArray) session.getAttribute("joHandFileTable");*/
		//移交单位列表传值
		List<PageData> departList = departmentService.listAllDepartmentPD(pd); // 列出列表
		
		ReceiveTemp receivetemp = (ReceiveTemp) session.getAttribute("receivetemp");
		int userid = Integer.parseInt(receivetemp.getUserId());
		
		int registerid = receivetemp.getRegisterId();
		int arstorageid = Integer.parseInt((String) session.getAttribute("arstorageid"));
		String arstoragename = (String) session.getAttribute("arstoragename");
		
		int prjid = (int) session.getAttribute("arSelectprjID");
		String prjname = (String) session.getAttribute("arSelectprjName");
		
		/*---------------------------通过pd传给注册页面确定的值*/
		//移交人
		//移交单位
		//接收人
		pd.put("USERNAME", Jurisdiction.getUsername());//当前登录者用户名 即接收人
		//接收ID
		pd.put("USER_IDstr", userid);//当前登录者用户IDstr
		//单位列表
		pd.put("departList", departList);//当前单位部门列表
		//存储注册ID
		pd.put("registerid", registerid);
		//存储ID
		pd.put("arstorageid", arstorageid);
		//存储类型名称
		pd.put("arstoragename", arstoragename);
		//项目ID
		pd.put("PRJ_ID", prjid);
		//项目名称
		pd.put("PRJ_NAME", prjname);
		
		
		/*---------------------------通过pd传给注册页面确定的值*/
		
		
		mv.setViewName("system/archive/ARregister");
		mv.addObject("pd", pd);
		return mv;
	}
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addHDFauto")
	public ModelAndView FormReceiveHDFauto(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		
		
		
		
		mv.setViewName("system/archive/ARregister");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	/**
	 * 3成果文件接收后 跳转至 新检查文件 接收
	 * *********************************************************** 
	 * 例如：
	 * 1判断为硬盘
	 * 2上传文件硬盘内项目 检查文件 
	 * 3根据所上传的检查文件 获得文件详细内容 
	 * 4传递文件详细内容到注册页面前台展示
	 * 
	 * 当文件存在且非空 上传检查文件 获取session中的项目ID 存储ID 
	 * 新建接收条目
	 * 开始插入数据到数据库ams_receive表 并查询数据到前台
	 * ***********************************************************
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/addHDF")
	public ModelAndView addHDF(HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException,
			IOException, Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());

		// 多页面间 利用session传值
		String getarStoragetype = new String();
		int PRJ_ID;
		String PRJ_NAME = new String();
		String REALSTORAGE_ID = new String();
		String STORAGE_TYPENAME = new String();
		
		List<PageData> varPDList = new ArrayList<PageData>();
		
		try {

			Session registersession = Jurisdiction.getSession();
			// 判断存储介质性质
			getarStoragetype = (String) registersession.getAttribute("arStoragetype");
			// 项目ID
			PRJ_ID = (int) registersession.getAttribute("arSelectprjID");
			// 项目名
			PRJ_NAME = (String) registersession.getAttribute("arSelectprjName");
			// 存储ID
			REALSTORAGE_ID = (String) registersession.getAttribute("arstorageid");
			// 存储名
			STORAGE_TYPENAME = (String) registersession.getAttribute("arstoragename");
			
			
			
			
			
			
			// 判断存储介质类型（1硬盘2光盘3案卷4库体5磁盘阵列）
			int i = Integer.parseInt(getarStoragetype);
			switch (i) {
			case 1:
				// 1判断为硬盘
				// 2上传文件硬盘内项目 检查文件
				// 3根据所上传的检查文件 获得文件详细内容
				// 4传递文件详细内容到注册页面前台展示
				// 设定上传文件地址Const.CHECKFILEPATH.replaceAll("/","\\\\")
				if (multipartResolver.isMultipart(request)) {
					MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
					
					Iterator<String> iter = multiRequest.getFileNames();
					while (iter.hasNext()) {
						// file即为内容
						MultipartFile file = multiRequest.getFile((String) iter.next());
						
						// ***********************************************************
						// 当文件存在且非空 上传检查文件
						// ams_receive表 确定项目ID 存储ID 开始插入数据到数据库
						// 并查询数据到前台
						//
						if (null != file && !file.isEmpty()) {
							String syspath = request.getSession().getServletContext().getRealPath("/");
							String sysfilePath = syspath+ Const.CHECKFILEPATH.replaceAll("/","\\\\");// 文件上传路径
							String sysfileName = "CF" + DateUtil.getSdfTimes()+ file.getOriginalFilename();
							//String extName = sysfileName.substring(sysfileName.lastIndexOf("."));//扩展名带点号
							
							//执行EXCEL上传
							String checkExcelfileName =  FileUpload.amsFileUp(file, sysfilePath, sysfileName);			
							//执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
							//varPDList = (List)AMSReadExcel.readExcel(sysfilePath, sysfileName,  1, 0, 0);	//读取原测试清单.exsl
							varPDList = (List)AMSReadExcel.readManagedFileExcel(sysfilePath, sysfileName,  2, 0, 0);	//读取现人工清查内容
							
							// 将arrayList存入session
							registersession.setAttribute("varPDList",varPDList);
							// 将arrayList存入session
							registersession.setAttribute("checkExcelfileName",checkExcelfileName);
							
							
							
							// 成功
							mv.addObject("msg", "success");
							pd = this.getPageData();
							
							mv.addObject("pd", pd);
							mv.addObject("PRJ_ID", PRJ_ID);
							mv.addObject("PRJ_NAME", PRJ_NAME);
							mv.addObject("REALSTORAGE_ID", REALSTORAGE_ID);
							mv.addObject("STORAGE_TYPENAME", STORAGE_TYPENAME);
							
							
							
							//移交单位列表传值
							List<PageData> departList = departmentService.listAllDepartmentPD(pd); // 列出列表
							mv.addObject("departList", departList);
							
							
							
							//存储ID、存储名称、项目ID、项目名称、是否电子成果、文件总大小及单位、文件数量（EXCEL表中记录条数）、
							//项目密级取消（随文件记录）、文件类型（123）、IFARCHIVE、IFDIGIT
							
							mv.setViewName("system/archive/ARregister");
							
							
						} else {
							// 失败
							System.out.println("upload " + "checkfile failed");
							mv.addObject("pd", pd);
							mv.addObject("msg", "goback");
							mv.setViewName("upload_failed");
						}
					}
				}
			case 2:
				// 1判断为光盘
				// 2上传文件硬盘内项目 检查文件
				// 3根据所上传的检查文件 获得文件详细内容
				// 4传递文件详细内容到注册内容页面前台展示

			case 3:
				// 1判断为案卷
				// 2前台 案卷需上传清单内容或者手动填写清单
				// 3后台 根据所上传的检查文件或手动填写的内容 获得文件详细内容
				// 4传递文件详细内容到注册内容页面展示

			case 4:
				// 1判断为库体
				// 2前台 案卷需上传清单内容或者手动填写清单
				// 3后台 根据所上传的检查文件或手动填写的内容 获得文件详细内容
				// 4传递文件详细内容到注册内容页面展示

			case 5:
				// 1判断为磁盘阵列盘符
				// 2前台 需选择
				// 3后台 根据所上传的检查文件或手动填写的内容 获得文件详细内容
				// 4传递文件详细内容到注册内容页面展示
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		//是否成果 1为成果5为档案String IFARCHIVE = "4";//1成果2过程3收集 4待分类历史成果5档案
		//FILE_TYPE String FILE_TYPE = (String) filepdi.get("FILE_TYPE");//文件类型
		//文件类型（1收集资料、2成果资料、3过程资料4其他）
		
		//存储ID、存储名称、项目ID、项目名称、是否电子成果、文件总大小及单位、文件数量（EXCEL表中记录条数）、
		//项目密级取消（随文件记录）、文件类型（123）、IFARCHIVE、IFDIGIT
		
		
		
		
		
		
		return mv;

	}
	
}






































// 创建人kioor2016年4月25日16:36:10