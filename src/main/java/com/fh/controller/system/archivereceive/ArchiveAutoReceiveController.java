package com.fh.controller.system.archivereceive;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.fh.amstools.AMSReadExcel;
import com.fh.amstools.AmsEnum.IfArchiveEnum;
import com.fh.controller.ams.CheckFileClass;
import com.fh.controller.ams.KioorTools;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.Receive;
import com.fh.service.ams.cdm.impl.CdmService;
import com.fh.service.ams.fdm.impl.FdmService;
import com.fh.service.ams.file.impl.FileService;
import com.fh.service.ams.hdm.impl.HdmService;
import com.fh.service.ams.prjtype.impl.PrjtypeService;
import com.fh.service.ams.project.impl.ProjectService;
import com.fh.service.ams.receive.impl.AReceiveService;
import com.fh.service.system.role.RoleManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.FileUpload;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelRead;
import com.fh.util.PageData;
import com.fh.util.PathUtil;

/**
 * 类名称：ArchiveAutoReceiveController 自动存入历史成果管理工具 创建人：kioor
 * 修改时间：2016年8月3日10:01:40
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/archiveauto")
public class ArchiveAutoReceiveController extends BaseController {

	// for show project
	@Resource(name = "projectService")
	private ProjectService projectService;
	@Resource(name = "prjtypeService")
	private PrjtypeService prjtypeService;
	@Resource(name = "userService")
	private UserManager userService;
	@Resource(name = "roleService")
	private RoleManager roleService;

	// for show storage hd
	@Resource(name = "hdmService")
	private HdmService hdmService;
	// for show storage cd
	@Resource(name = "cdmService")
	private CdmService cdmService;
	// for show storage fd(anjuan)
	@Resource(name = "fdmService")
	private FdmService fdmService;

	// for save and show receive table
	@Resource(name = "areceiveService")
	private AReceiveService areceiveService;
	@Resource(name = "fileService")
	private FileService fileService;



	
	/**
	 * 1上传历史文件 ***********************************************************
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/historyfile")
	public ModelAndView historyFile(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		page.setPd(pd);
		// for show project list

		mv.setViewName("system/archive/historyfile");
		mv.addObject("pd", pd);
		return mv;
	}

	/**
	 * 2根据成果数据检查文件目录 填写注册内容
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/getHistory")
	public ModelAndView getHistory(HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException,
			IOException, Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());

		
		List<PageData> varPDList = new ArrayList<PageData>();
		
		List<PageData> varSTORAGEList = new ArrayList<PageData>();
	
		Session registersession = Jurisdiction.getSession();

		
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
					
					//执行上传
					String fileName =  FileUpload.amsFileUp(file, sysfilePath, sysfileName);	
					
					//执行读EXCEL操作,读出的数据导入varPDList 2:从第3行开始；0:从第A列开始；0:第0个sheet
					varPDList = (List)AMSReadExcel.readManagedFileExcel(sysfilePath, sysfileName,  2, 0, 0);	//读取现人工清查内容
					//执行读EXCEL操作,读出的数据导入varSTORAGEList 2:从第3行开始；0:从第A列开始；1:第1个sheet
					varSTORAGEList = (List)AMSReadExcel.readManagedStorageExcel(sysfilePath, sysfileName,  2, 0, 1);	//读取现人工清查内容
					
					// 将arrayList存入session
					registersession.setAttribute("varPDList",varPDList);
					// 将varSTORAGEList存入session
					registersession.setAttribute("varSTORAGEList",varSTORAGEList);
					
					// 成功
					mv.addObject("msg", "success");
					pd = this.getPageData();
					
					mv.setViewName("system/archive/historyregister");
				} else {
					// 失败
					System.out.println("upload " + "checkfile failed");
					mv.addObject("pd", pd);
					mv.addObject("msg", "goback");
					mv.setViewName("upload_failed");
				}
			}
		}
		return mv;

	}
	
	
	
	

	/**
	 * 3注册历史数据
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/historyREGISTER")
	public ModelAndView historyREGISTER(Page page){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		page.setPd(pd);
		
		//根据目录确定循环 每一行文件file 为一次接收过程receive 每一行可能为某个项目中的某个文件夹  
			
			//确定项目类型prjtype
			
			//确定项目project
			
			//确定存储介质1确定是否新介质，新介质则存入介质表hdm/cdm/fdm2注册存储介质，填写storage
			
			//确定接收receive
			
			//根据接收信息填写file
		Session registersession = Jurisdiction.getSession();
		
		//读取EXCEL得到的varPDList数据
		@SuppressWarnings("unchecked")
		java.util.List<PageData> varPDList = (List<PageData>) registersession.getAttribute("varPDList");
		//session消除该列表??????????????????????????
		
		//读取EXCEL得到的varSTORAGEList数据
		@SuppressWarnings("unchecked")
		java.util.List<PageData> varSTORAGEList = (List<PageData>) registersession.getAttribute("varSTORAGEList");
		//session消除该列表??????????????????????????

		try {
			//先存储存储介质
			fileService.saveHistoryArchiveStorage(varSTORAGEList);
			//再存储项目
			fileService.saveHistoryArchiveDataToFILES(varPDList);
			//再存储接收、文件
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		mv.setViewName("system/archive/ARfinish");
		mv.addObject("pd", pd);
		return mv;
	}
	

	/**
	 *注册历史数据
	 *
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/historyREGISTER1")
	public ModelAndView historyREGISTER1(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		
		/*A 接收表ams_receive填写开始 数据库操作       并返回接收序号RC_ID  *********** */
		//获取系统session
		Session arfinishsession = Jurisdiction.getSession();
		// 判断存储介质性质
		String getarStoragetype = (String) arfinishsession.getAttribute("arStoragetype");
		// 判断存储介质类型string转为int（1硬盘2光盘3案卷4库体5磁盘阵列）
		int i = Integer.parseInt(getarStoragetype);

		Receive receive =  new Receive();
		//接收表ams_receive暂有13项
		//0 RC_ID 插入其他数据时自动增长输入
		//1 TRANSFNAME手动填写
		//2 PRODEPART手动选择
		//3 RC_NAME手动填写//**********************************自动输入
		//4 RC_DEPART手动选择//**********************************自动输入
		//5 RC_TIME//**************************************服务端自动输入
		java.sql.Timestamp sqldatetime = KioorTools.TimeStringToDatatime(DateUtil.getSdfTimes());
		pd.put("RC_TIME", sqldatetime);

		//6 RC_PROGRESS******可在服务端记录成果接收进程(暂且省略)
		//pd.put("RC_PROGRESS", "");
		
		
		//7 CHECKFILE_URL根据存储介质不同相应该URL可能有不同判断
		switch(i){
		case 1:
			//7 CHECKFILE_URL****硬盘检查文件地址
			String CHECKFILE_URL = (String) arfinishsession.getAttribute("archeckfileurl");
			pd.put("CHECKFILE_URL", CHECKFILE_URL);		
			break;
		case 2:
			break;
		case 3:
			break;
		case 4:
			break;
		case 5:
			break;
		}
		//8 RC_STRING********可在服务端记录成果接收历史进程字符串(暂且省略)
		//9 RC_REMARK********接收备注可在服务端增加内容	 
		// 检查文件服务器绝对地址
		String archeckfileurl = (String) arfinishsession.getAttribute("archeckfileurl");
		String PRJROOT = archeckfileurl;
		//是否成果
		String IFDIGIT = pd.getString("IFDIGIT");
		String VOLUME = pd.getString("VOLUME");
		String UNIT = pd.getString("UNIT");
		String NUM = pd.getString("NUM");
		String RC_REMARK = pd.getString("RC_REMARK");
		RC_REMARK = RC_REMARK+"##"+IFDIGIT+"##"+VOLUME+UNIT+"##"+NUM+"个"+"##"+"根目录："+PRJROOT;		
		pd.put("RC_REMARK", RC_REMARK);
		//10 REGISTER_ID 网页session获得 已存在
		//11 PRJ_ID      网页session获得 已存在
		//12 *****其他
		pd.put("CHECKDETAILS", "");
		
		//将pd 以及session以及服务端编辑的所有参数 赋值给receive实体
		receive.setTransfname(pd.getString("TRANSFNAME"));
		receive.setProdepart(pd.getString("PRODEPART"));
		receive.setRcName(pd.getString("RC_NAME"));
		receive.setRcDepart(pd.getString("RC_DEPART"));
		receive.setRcTime(sqldatetime);
		receive.setRcProgress("finished");
		receive.setCheckfileUrl(pd.getString("CHECKFILE_URL"));
		receive.setRcString("receive finished");
		receive.setRcRemark(pd.getString("RC_REMARK"));
		receive.setRegisterId((int)pd.get("REGISTER_ID"));
		receive.setPrjId((int)arfinishsession.getAttribute("arSelectprjID"));
		receive.setCheckdetails((String)arfinishsession.getAttribute("checkExcelfileName"));
		
		//插入实体receive
		areceiveService.save(receive);

		//获得插入实体到接收表的自增长主键 rcId

		arfinishsession.setAttribute("receive", receive);
		
		/* A接收表填写数据库操作*********end********** */
		
		
		/* B文件表ams_file填写开始 数据库操作*********** */
		//java.util.List<PageData> varPDList = (java.util.List<PageData>)pd.get("varPDList");
		//需保证session有此varPDList
		@SuppressWarnings("unchecked")
		java.util.List<PageData> varPDList = (List<PageData>) arfinishsession.getAttribute("varPDList");
		
		//加入接收序号 以及其他参数之后 添加进ams_file表 ********该过程应该要更改 暂且如是 期能者优化之（xml 事务管理之类 ）***
		CheckFileClass checkfile = new CheckFileClass();
		int RC_ID = receive.getRcId();
		//自动接收的历史数据 全部作为未分类DAIFENLEI信息
		String IFARCHIVE = Integer.toString(IfArchiveEnum.DAIFENLEI.getValue());
		/*String PERMISSION_CLASS = pd.getString("PERMISSION_CLASS");
		String FILE_TYPE = pd.getString("FILE_TYPE");
		String FILE_UNIT ="K";*/
		//EXCEL 单位为KB
		List<PageData> varPDListadd = checkfile.listAddRCID(varPDList,RC_ID,IFDIGIT,IFARCHIVE);

		//插入文件详情到 文件列表ams_file
		fileService.savecheckArray(varPDListadd);

		/* B文件表ams_file填写数据库操作*********end********** */
		
		
		mv.setViewName("system/archive/ARfinish");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	/*

	*//**
	 * 0接收准备 点击菜单“成果接收”按钮 打开确定项目页面
	 * ***********************************************************
	 * 
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping(value = "/receive")
	public ModelAndView archiveReceive(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords"); // 关键词检索条件
		if (null != keywords && !"".equals(keywords)) {
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		// for show project list
		List<PageData> varAllList = projectService.listAll(pd); // 列出列表
		List<PageData> prjtypeList = prjtypeService.selectAll(pd);// 列出所有项目类型

		mv.setViewName("system/archive/ARproject");

		mv.addObject("varList", varAllList);// for show project
		mv.addObject("prjtypeList", prjtypeList);// for show project

		mv.addObject("pd", pd);
		return mv;
	}

	*//**
	 * 1确定项目 并将项目编号PRJ_ID传递给后续页面 打开注册存储介质页面
	 * ***********************************************************
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping(value = "/setproject")
	public ModelAndView setProject(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);

		// 多页面间 利用session传值
		String arProjectoldnew = pd.getString("ifprojectnew-radio");// 1已有项目或2新项目
		int arSelectprjID = Integer.parseInt(pd.getString("projectselect")
				.split("&&")[0]);// 1已有项目ID即PRJ_ID
		String arSelectprjName = pd.getString("projectselect").split("&&")[1];// 1已有项目ID即PRJ_ID
		try {
			Session projectsession = Jurisdiction.getSession();
			projectsession.setAttribute("arProjectoldnew", arProjectoldnew);
			projectsession.setAttribute("arSelectprjID", arSelectprjID);
			projectsession.setAttribute("arSelectprjName", arSelectprjName);
			String arIFArchiveID = "archive";// 是成果还是档案 标识
			projectsession.setAttribute("arIFArchiveID", arIFArchiveID);// 标识为成果
																		// 添加到session

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 为第二步 存储介质列表选择传值做准备forHDList
		List<PageData> HDList = hdmService.list(page); // 列出硬盘列表
		// 为第二步 存储介质列表选择传值做准备forCDList
		List<PageData> CDList = cdmService.list(page); // 列出光盘列表
		// 为第二步 存储介质列表选择传值做准备forAJList
		List<PageData> FDList = fdmService.list(page); // 列出案卷列表
		// 为第二步 存储介质列表选择传值做准备forKTList
		// 为第二步 存储介质列表选择传值做准备forRIADList

		// 选择项目完毕
		System.out.println("select project over Start select storage");
		// 设置传输页面内容
		mv.setViewName("system/archive/ARstorage");
		mv.addObject("HDList", HDList);// for show HD
		mv.addObject("CDList", CDList);// for show CD
		mv.addObject("FDList", FDList);// for show AJ
		mv.addObject("pd", pd);
		return mv;
	}

	*//**
	 * 2注册存储介质 ***********************************************************
	 * 选择已注册介质 或注册新介质
	 * 
	 * 之后打开接收页面 ***********************************************************
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping(value = "/setstorage")
	public ModelAndView setStorage() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		// 多页面间 利用session传值
		// 已注册则获取存储介质ID NAME
		// 若为新介质 则应存储表单信息填写至相应存储介质表ams_xxx以及ams_storage
		String arIfdigit = pd.getString("selectFileEorM");// 选择文件类型（1电子2模拟)
		String arStoragetype = pd.getString("TYPE");// 存储介质类型（1硬盘2光盘3案卷4库体5磁盘阵列）
		String arStorageoldnew = pd.getString("OLDNEWTYPE");// 1已注册或2新存储介质

		try {
			Session receivesession = Jurisdiction.getSession();
			receivesession.setAttribute("arIfdigit", arIfdigit);
			receivesession.setAttribute("arStoragetype", arStoragetype);
			receivesession.setAttribute("arStorageoldnew", arStorageoldnew);

			// 根据arStoragetype、arStorageoldnew参数
			// 判断并用session记录:成果档案管理员所填写有关存储介质的值
			int i = Integer.parseInt(arStoragetype);
			switch (i) {
			case 1:
				if (arStorageoldnew.equals("1")) {
					String aroldhdid = pd.getString("oldhd-select").split("&&")[0];// 已注册硬盘ID
					String aroldhdname = pd.getString("oldhd-select").split("&&")[1];// 已注册硬盘Name
					receivesession.setAttribute("aroldhdid", aroldhdid);
					receivesession.setAttribute("aroldhdname", aroldhdname);
				} else if (arStorageoldnew.equals("2")) {
					String arnewhdid = pd.getString("newhd-id");// 硬盘序号
					String arnewhdxuliehao = pd.getString("newhd-xuliehao");// 硬盘序列号
					String arnewhdname = pd.getString("newhd-name");// 硬盘名称
					String arnewhdvolume = pd.getString("newhd-volume");// 硬盘容量
					String arnewhdactvolume = pd.getString("newhd-actvolume");// 可用容量
					String arnewhdvolumeunit = pd.getString("newhd-volumeunit");// 单位
					String arnewhdweizhi = pd.getString("newhd-weizhi");// 存放位置
					String arnewhdlimit = pd.getString("newhd-limit");// 保存期限
					String arnewhdremark = pd.getString("newhd-remark");// 硬盘备注
					receivesession.setAttribute("arnewhdid", arnewhdid);
					receivesession.setAttribute("arnewhdxuliehao",arnewhdxuliehao);
					receivesession.setAttribute("arnewhdname", arnewhdname);
					receivesession.setAttribute("arnewhdvolume", arnewhdvolume);
					receivesession.setAttribute("arnewhdactvolume",arnewhdactvolume);
					receivesession.setAttribute("arnewhdvolumeunit",arnewhdvolumeunit);
					receivesession.setAttribute("arnewhdweizhi", arnewhdweizhi);
					receivesession.setAttribute("arnewhdlimit", arnewhdlimit);
					receivesession.setAttribute("arnewhdremark", arnewhdremark);

					// 成果接收最后的注册页面 确认时 调用新介质注册service服务添加该存储介质
				}
				break;

			case 2:
				if (arStorageoldnew.equals("1")) {
					String aroldcdid = pd.getString("oldcd-select");// 已注册光盘
					receivesession.setAttribute("aroldcdid", aroldcdid);
				} else if (arStorageoldnew.equals("2")) {
					String arnewcdid = pd.getString("newcd-id");// 光盘序号
					String arnewcdname = pd.getString("newcd-name");// 光盘名称
					String arnewcdvolume = pd.getString("newcd-volume");// 光盘容量
					String arnewcdactvolume = pd.getString("newcd-actvolume");// 可用容量
					String arnewcdvolumeunit = pd.getString("newcd-volumeunit");// 单位
					String arnewcdweizhi = pd.getString("newcd-weizhi");// 存放位置
					String arnewcdlimit = pd.getString("newcd-limit");// 保存期限
					String arnewcdremark = pd.getString("newcd-remark");// 光盘备注
					receivesession.setAttribute("arnewcdid", arnewcdid);
					receivesession.setAttribute("arnewcdname", arnewcdname);
					receivesession.setAttribute("arnewcdvolume", arnewcdvolume);
					receivesession.setAttribute("arnewcdactvolume",arnewcdactvolume);
					receivesession.setAttribute("arnewcdvolumeunit",arnewcdvolumeunit);
					receivesession.setAttribute("arnewcdweizhi", arnewcdweizhi);
					receivesession.setAttribute("arnewcdlimit", arnewcdlimit);
					receivesession.setAttribute("arnewcdremark", arnewcdremark);
					// 成果接收最后的注册页面 确认时 调用新介质注册service服务添加该存储介质
				}
				break;

			case 3:
				if (arStorageoldnew.equals("1")) {
					String aroldanjuanid = pd.getString("oldanjuan-select");// 已注册案卷
					receivesession.setAttribute("aroldanjuanid", aroldanjuanid);
				} else if (arStorageoldnew.equals("2")) {
					String arnewanjuanid = pd.getString("newanjuan-id");// 案卷序号
					String arnewanjuandasb = pd.getString("newanjuan-dasb");// 档案室编
					String arnewanjuandagb = pd.getString("newanjuan-dagb");// 档案馆编
					String arnewanjuanajtm = pd.getString("newanjuan-ajtm");// 案卷题名
					String arnewanjuanyear = pd.getString("newanjuan-year");// 年度
					String arnewanjuanpage = pd.getString("newanjuan-page");// 页数
					String arnewanjuanlimit = pd.getString("newanjuan-limit");// 期限
					String arnewanjuanremark = pd.getString("newanjuan-remark");// 案卷备注
					receivesession.setAttribute("arnewanjuanid", arnewanjuanid);
					receivesession.setAttribute("arnewanjuandasb",
							arnewanjuandasb);
					receivesession.setAttribute("arnewanjuandagb",
							arnewanjuandagb);
					receivesession.setAttribute("arnewanjuanajtm",
							arnewanjuanajtm);
					receivesession.setAttribute("arnewanjuanyear",
							arnewanjuanyear);
					receivesession.setAttribute("arnewanjuanpage",
							arnewanjuanpage);
					receivesession.setAttribute("arnewanjuanlimit",
							arnewanjuanlimit);
					receivesession.setAttribute("arnewanjuanremark",
							arnewanjuanremark);
					// 成果接收最后的注册页面 确认时 调用新介质注册service服务添加该存储介质
				}
				break;

			case 4:
				if (arStorageoldnew.equals("1")) {
					String aroldkutiid = pd.getString("oldkuti-select");// 已注册库体表单
					receivesession.setAttribute("aroldkutiid", aroldkutiid);
				} else if (arStorageoldnew.equals("2")) {
					String arnewkutiid = pd.getString("newkuti-id");// 请选择库体
					String arnewkutitablename = pd
							.getString("newkuti-tablename");// 请输入库体表名
					receivesession.setAttribute("arnewkutiid", arnewkutiid);
					receivesession.setAttribute("arnewkutitablename",
							arnewkutitablename);
					// 成果接收最后的注册页面 确认时 调用新介质注册service服务添加该存储介质
				}
				break;

			case 5:
				if (arStorageoldnew.equals("1")) {
					String aroldriadid = pd.getString("oldRIAD-select");// 已注册磁盘阵列盘符
					receivesession.setAttribute("aroldriadid", aroldriadid);
				} else if (arStorageoldnew.equals("2")) {
					String arnewRIADid = pd.getString("newRIAD-id");// 分区序号
					String arnewRIADprartition = pd
							.getString("newRIAD-prartition");// 分区名称
					String arnewRIADvolume = pd.getString("newRIAD-volume");// 分区容量
					String arnewRIADactvolume = pd
							.getString("newRIAD-actvolume");// 可用容量
					String arnewRIADunit = pd.getString("newRIAD-unit");// 单位
					String arnewRIADroot = pd.getString("newRIAD-root");// 分区根路径
					String arnewRIADremark = pd.getString("newRIAD-remark");// 其他备注
					receivesession.setAttribute("arnewRIADid", arnewRIADid);
					receivesession.setAttribute("arnewRIADprartition",
							arnewRIADprartition);
					receivesession.setAttribute("arnewRIADvolume",
							arnewRIADvolume);
					receivesession.setAttribute("arnewRIADactvolume",
							arnewRIADactvolume);
					receivesession.setAttribute("arnewRIADunit", arnewRIADunit);
					receivesession.setAttribute("arnewRIADroot", arnewRIADroot);
					receivesession.setAttribute("arnewRIADremark",
							arnewRIADremark);
					// 成果接收最后的注册页面 确认时 调用新介质注册service服务添加该存储介质
				}
				break;

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 选择存储介质完毕
		System.out.println("select storage over");
		mv.setViewName("system/archive/ARreceive");
		mv.addObject("oldnewtype", arStorageoldnew);
		mv.addObject("type", arStoragetype);

		mv.addObject("pd", pd);
		return mv;
	}

	*//**
	 * 3成果文件接收后 跳转至 新检查文件 接收
	 * *********************************************************** 例如： 1判断为硬盘
	 * 2上传文件硬盘内项目 检查文件 3根据所上传的检查文件 获得文件详细内容 4传递文件详细内容到注册页面前台展示
	 * 
	 * 当文件存在且非空 上传检查文件 获取session中的项目ID 存储ID 新建接收条目 开始插入数据到数据库ams_receive表
	 * 并查询数据到前台 ***********************************************************
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 *//*
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/addHDF")
	public ModelAndView addHDF(HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException,
			IOException, Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());

		// 多页面间 利用session传值
		String getarStoragetype = new String();
		int PRJ_ID;
		String PRJ_NAME = new String();
		int REGISTER_ID = (Integer) null;
		String REGISTER_NAME = new String();

		List<PageData> varPDList = new ArrayList<PageData>();

		try {

			Session registersession = Jurisdiction.getSession();
			// 判断存储介质性质
			getarStoragetype = (String) registersession
					.getAttribute("arStoragetype");
			// 项目ID
			PRJ_ID = (int) registersession.getAttribute("arSelectprjID");
			// 项目名
			PRJ_NAME = (String) registersession.getAttribute("arSelectprjName");
			// 存储ID
			REGISTER_ID = (int) registersession.getAttribute("aroldhdid");
			// 存储名
			REGISTER_NAME = (String) registersession
					.getAttribute("aroldhdname");

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
						MultipartFile file = multiRequest.getFile((String) iter
								.next());

						// ***********************************************************
						// 当文件存在且非空 上传检查文件
						// ams_receive表 确定项目ID 存储ID 开始插入数据到数据库
						// 并查询数据到前台
						//
						if (null != file && !file.isEmpty()) {
							String syspath = request.getSession()
									.getServletContext().getRealPath("/");
							String sysfilePath = syspath
									+ Const.CHECKFILEPATH.replaceAll("/",
											"\\\\");// 文件上传路径
							String sysfileName = "CF" + DateUtil.getSdfTimes()
									+ file.getOriginalFilename();
							// String extName =
							// sysfileName.substring(sysfileName.lastIndexOf("."));//扩展名带点号

							// 执行上传
							String fileName = FileUpload.amsFileUp(file,
									sysfilePath, sysfileName);
							// 执行读EXCEL操作,读出的数据导入List
							// 2:从第3行开始；0:从第A列开始；0:第0个sheet
							varPDList = (List) AMSReadExcel.readExcel(
									sysfilePath, sysfileName, 1, 0, 0);
							// 将arrayList存入session
							registersession
									.setAttribute("varPDList", varPDList);

							// 成功
							// System.out.println("upload " + archeckfileurl +
							// "checkfile success");
							mv.addObject("msg", "success");
							pd = this.getPageData();

							mv.addObject("pd", pd);
							mv.addObject("PRJ_ID", PRJ_ID);
							mv.addObject("PRJ_NAME", PRJ_NAME);
							mv.addObject("REGISTER_ID", REGISTER_ID);
							mv.addObject("REGISTER_NAME", REGISTER_NAME);

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
		return mv;

	}

	*//**
	 * 4完成注册 ***********************************************************
	 * A填写接收表、B填写文件表
	 * 
	 * @return
	 * @throws Exception
	 *//*
	@RequestMapping(value = "/arFinish")
	public ModelAndView arFinish(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		 A 接收表ams_receive填写开始 数据库操作 并返回接收序号RC_ID *********** 
		// 获取系统session
		Session arfinishsession = Jurisdiction.getSession();
		// 判断存储介质性质
		String getarStoragetype = (String) arfinishsession
				.getAttribute("arStoragetype");
		// 判断存储介质类型string转为int（1硬盘2光盘3案卷4库体5磁盘阵列）
		int i = Integer.parseInt(getarStoragetype);

		Receive receive = new Receive();
		// 接收表ams_receive暂有13项
		// 0 RC_ID 插入其他数据时自动增长输入

		// 1 TRANSFNAME手动填写
		// 2 PRODEPART手动选择
		// 3 RC_NAME手动填写
		// 4 RC_DEPART手动选择
		// 5 RC_TIME**********服务端自动输入
		java.sql.Timestamp sqldatetime = KioorTools
				.TimeStringToDatatime(DateUtil.getSdfTimes());
		pd.put("RC_TIME", sqldatetime);

		// 6 RC_PROGRESS******可在服务端记录成果接收进程(暂且省略)
		// pd.put("RC_PROGRESS", "");
		// 7 CHECKFILE_URL根据存储介质不同相应该URL可能有不同判断
		switch (i) {
		case 1:
			// 7 CHECKFILE_URL****硬盘检查文件地址
			String CHECKFILE_URL = (String) arfinishsession
					.getAttribute("archeckfileurl");
			pd.put("CHECKFILE_URL", CHECKFILE_URL);

			break;
		case 2:
			break;
		case 3:
			break;
		case 4:
			break;
		case 5:
			break;
		}
		// 8 RC_STRING********可在服务端记录成果接收历史进程字符串(暂且省略)
		// 9 RC_REMARK********接收备注可在服务端增加内容
		// 检查文件服务器绝对地址
		String archeckfileurl = (String) arfinishsession
				.getAttribute("archeckfileurl");
		String PRJROOT = archeckfileurl;
		// 是否成果
		String IFDIGIT = pd.getString("IFDIGIT");
		String WVOLUME = pd.getString("WVOLUME");
		String WUNIT = pd.getString("WUNIT");
		String WNUM = pd.getString("WNUM");
		String RC_REMARK = pd.getString("RC_REMARK");
		RC_REMARK = RC_REMARK + "##" + IFDIGIT + "##" + WVOLUME + WUNIT + "##"
				+ WNUM + "个" + "##" + "根目录：" + PRJROOT;
		pd.put("RC_REMARK", RC_REMARK);
		// 10 REGISTER_ID 网页session获得 已存在
		// 11 PRJ_ID 网页session获得 已存在
		// 12 *****其他
		pd.put("CHECKDETAILS", "");

		// 将pd 以及session以及服务端编辑的所有参数 赋值给receive实体
		receive.setTransfname(pd.getString("TRANSFNAME"));
		receive.setProdepart(pd.getString("PRODEPART"));
		receive.setRcName(pd.getString("RC_NAME"));
		receive.setRcDepart(pd.getString("RC_DEPART"));
		receive.setRcTime(sqldatetime);
		receive.setRcProgress("finished");
		receive.setCheckfileUrl(pd.getString("CHECKFILE_URL"));
		receive.setRcString("receive finished");
		receive.setRcRemark(pd.getString("RC_REMARK"));
		receive.setRegisterId((int)pd.get("REGISTER_ID"));
		receive.setPrjId((int) arfinishsession.getAttribute("arSelectprjID"));
		receive.setCheckdetails(RC_REMARK);

		// 插入实体receive
		areceiveService.save(receive);

		// 获得插入实体到接收表的自增长主键 rcId
		int RC_ID = receive.getRcId();
		 A接收表填写数据库操作*********end********** 

		 B文件表ams_file填写开始 数据库操作*********** 
		// java.util.List<PageData> varPDList =
		// (java.util.List<PageData>)pd.get("varPDList");
		// 需保证session有此varPDList
		@SuppressWarnings("unchecked")
		java.util.List<PageData> varPDList = (List<PageData>) arfinishsession.getAttribute("varPDList");

		// 加入接收序号 以及其他参数之后 添加进ams_file表 ********该过程应该要更改 暂且如是 期能者优化之（xml 事务管理之类
		// ）***
		CheckFileClass checkfile = new CheckFileClass();
		String IFARCHIVE = (String) arfinishsession.getAttribute("arIFArchiveID");
		String PERMISSION_CLASS = pd.getString("PERMISSION_CLASS");
		String FILE_TYPE = pd.getString("FILE_TYPE");

		List<PageData> varPDListadd = checkfile.listAddRCID(varPDList, RC_ID,
				IFDIGIT, IFARCHIVE, PERMISSION_CLASS, FILE_TYPE);

		// 插入文件详情到 文件列表ams_file
		fileService.savecheckArray(varPDListadd);

		 B文件表ams_file填写数据库操作*********end********** 

		mv.setViewName("system/archive/ARfinish");
		return mv;
	}*/

}

// 创建人kioor2016年4月25日16:36:10