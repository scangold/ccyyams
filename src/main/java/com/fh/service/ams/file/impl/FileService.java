package com.fh.service.ams.file.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.fh.amstools.CheckProjectExist;
import com.fh.amstools.AmsEnum.IfArchiveEnum;
import com.fh.controller.ams.KioorTools;
import com.fh.dao.*;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.*;
import com.fh.entity.system.User;
import com.fh.util.CompressFile;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;
import com.fh.service.ams.file.FileManager;
import com.fh.service.ams.hdm.HdmManager;
import com.fh.service.ams.project.ProjectManager;
import com.fh.service.ams.realstorage.RealStorageManager;
import com.fh.service.ams.receive.AReceiveManager;
import com.fh.service.ams.receivetemp.AReceiveTempManager;


/**
 * 
 * @author kioor
 *	2016年6月16日16:32:38
 */
@Service("fileService")
public class FileService implements FileManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Resource(name="realstorageService")
	private RealStorageManager realstorageService;

	@Resource(name="hdmService")
	private HdmManager hdmService;

	@Resource(name="projectService")
	private ProjectManager projectService;

	@Resource(name="areceiveService")
	private AReceiveManager areceiveService;

	@Resource(name = "areceiveTempService")
	private AReceiveTempManager areceiveTempService;
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception{
		return (List<PageData>)dao.findForList("FileMapper.datalistPage", page);
	}
	/**获取档案详细信息
	 * @param page
	 * @throws Exception
	 */
	public PageData getFileDetails(PageData pd)throws Exception{
		return (PageData)dao.findForObject("FileMapper.listFileDetailsById", pd);
	}
	/**查询项目相关的档案信息
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listProRelaFiles(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("FileMapper.listAllProRelaFileslistPage", page);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> listpfs(Page page) throws Exception {
		return (List<PageData>)dao.findForList("FileMapper.pfslistPage", page);
	
	}

	/**
	 * @param page
	 * @throws Exception
	 *
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> showCheckFilelistPage(Page page) throws Exception {

		return (List<PageData>) dao.findForList("FileMapper.showCheckFilelistPage", page);

	}


	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("FileMapper.delete", pd);
	}

	public void handsave(PageData pd) throws Exception {
		dao.save("FileMapper.handsave", pd);
	}

	public void save(File file) throws Exception {
		dao.save("FileMapper.savefile", file);
	}

	@Override
	public void edit(PageData pd) throws Exception {
		 dao.update("FileMapper.edit", pd);
	}
	
	
	/**保存List
	 * @param page
	 * @throws Exception
	 */
	@Override
	public void savecheckArray(List<PageData> Listpd) throws Exception {
		// TODO Auto-generated method stub

		for(int i=0;i<Listpd.size();i++){
			dao.save("FileMapper.save",Listpd.get(i));
		}


	}

	@Override
	public List<PageData> listPage(Page page) throws Exception {
		// TODO Auto-generated method stub	
		return (List<PageData>) dao.findForList("FileMapper.filelistPage", page);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> getfilelistByIds(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("FileMapper.getfilelistByIds", pd);
	}

	/**列出Temp文件分页列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> fileTemplistPage(Page page) throws Exception {
		return (List<PageData>) dao.findForList("FileMapper.fileTemplistPage", page);

	}



	/**
	 * 自动保存历史成果数据检查文件List
	 * 
	 * @param page
	 * @throws Exception
	 */
	@Override
	public void saveHistoryArchiveStorage(List<PageData> pdStorageList) {
		
		Session session = Jurisdiction.getSession();
		// 本操作用户
		User user = (User) session.getAttribute(Const.SESSION_USERROL); // 将用户信息存入project表后
																		// 再编辑下面的逻辑
		String userid = user.getUSER_ID();
		// 0先根据pdStorageList录入存储介质信息
		for (int i = 0; i < pdStorageList.size(); i++) {

			// 循环得记录行
			PageData storagepdi = pdStorageList.get(i);

			// 确定项目project
			String STORAGE_TYPENAME = (String) storagepdi.get("STORAGE_ID");// 获取存储介质ID
			String STORAGE_NAME = (String) storagepdi.get("STORAGE_NAME");// 获取存储介质NAME
			String VOLUME = (String) storagepdi.get("VOLUME");// 获取存储介质总空间
			String ACTVOLUME = (String) storagepdi.get("ACTVOLUME");// 获取存储介质可用空间
			String UNIT = (String) storagepdi.get("UNIT");// 获取存储介质空间单位
			String LOCATION = (String) storagepdi.get("LOCATION");// 获取存储介质位置
			String STORE_TIME = (String) storagepdi.get("STORE_TIME");// 获取存储介质位置
			String DETAIL = (String) storagepdi.get("DETAIL");// 获取存储详细情况
			String REMARK = (String) storagepdi.get("REMARK");// 获取存储介质备注
			int sl = STORAGE_TYPENAME.length();
			// 确定存储介质ID不为空
			if (sl > 2) {
				// 还应该判断表中是否存在此ID 或者在上传EXCEL表循环的过程中判断表规范否 是否有重复的
				String storageType = STORAGE_TYPENAME.substring(0, 2);
				
				
				PageData realstoragepd = new PageData();
				// 将循环的存储介质存入相应的存储介质表中
				realstoragepd.put("STORAGE_TYPENAME", STORAGE_TYPENAME);
				realstoragepd.put("STORAGE_NAME", STORAGE_NAME);
				realstoragepd.put("STORAGE_TYPE", storageType);
				realstoragepd.put("VOLUME", VOLUME);
				realstoragepd.put("ACTVOLUME", ACTVOLUME);
				realstoragepd.put("UNIT", UNIT);
				realstoragepd.put("LOCATION", LOCATION);
				realstoragepd.put("LIMIT", STORE_TIME);
				realstoragepd.put("STORAGE_REMARK", REMARK);

				realstoragepd.put("DELETETIME", "");
				realstoragepd.put("DELETEWHY", "");
				realstoragepd.put("SERANUM", "");
				realstoragepd.put("FD_YEAR", "");
				realstoragepd.put("FD_S", "");
				realstoragepd.put("FD_G", "");
				realstoragepd.put("FD_PAGE", "");
				realstoragepd.put("OTHER1", DETAIL);
				realstoragepd.put("OTHER2", "");
				realstoragepd.put("OTHER3", "");

				PageData storagepd;
				try {
					storagepd = realstorageService.findEntityByName(STORAGE_TYPENAME);

					if (storagepd == null) { // 所查为空
						// 不存在此ID的存储介质才存入
						dao.save("RealStorageMapper.save", realstoragepd);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}

	}

	/**自动保存历史成果数据检查文件List
	 * @param page
	 * @throws Exception
	 */
	@Override
	public void saveHistoryArchiveDataToFILES(List<PageData> pdFileList) throws Exception {
		// TODO Auto-generated method stub
		Session session = Jurisdiction.getSession();
		//本操作用户
		User user = (User) session.getAttribute(Const.SESSION_USERROL);	//将用户信息存入project表后 再编辑下面的逻辑
		String userid = user.getUSER_ID();


		//根据目录确定循环 每一行文件file 为一次接收过程receive 每一行可能为某个项目中的某个文件夹  
		for(int i=0;i<pdFileList.size();i++){
			Project hisProject = new Project();
			Storage hisStorage = new Storage();
			Receive hisreceive = new Receive();
			File hisFile = new File();
			FileDetail hisFileDetail = new FileDetail();
			//循环得记录行
			PageData filepdi = pdFileList.get(i);


			//1确定项目类型prjtype

			//2确定项目project
			String PRJ_NAME = (String) filepdi.get("PRJ_NAME");//项目表需保证录入 项目名称、当前系统用户名
			hisProject.setPrjName(PRJ_NAME);

			if(PRJ_NAME==null|PRJ_NAME.trim()==""){
				//如果项目名为空，则以FILE_URL根文件夹名 和 项目名文件名称 定义
				
				String fstring = filepdi.getString("FILE_URL");
				String[] fstrings = fstring.split("\\\\");
				int s=fstrings.length;
				String froot = "_";
				if(s>1){

					froot = "_"+fstring.split("\\\\")[1]+"_";
				}
				
				
				PRJ_NAME = "？未知项目？"+froot + filepdi.getString("FILE_NAME");

			}

			hisProject.setPrjName(PRJ_NAME);  //项目名称**********************************
			hisProject.setUserId(userid);	  //用户ID**********************************
			//存入项目hisProject

			int PRJ_ID =0;
			//查询是否存在同项目名称，若存在同项目名称，则归为同一项目，获取其ID
			PageData getprjpd = projectService.findByName(PRJ_NAME);
			if(getprjpd==null){
				//不存在该名称项目，则存入
				dao.save("ProjectMapper.saveproject", hisProject);

				PRJ_ID = hisProject.getPrjId();
			}else{

				//存在该名称项目,获取项目ID
				PRJ_ID = (int) getprjpd.get("PRJ_ID");

			}



			//3注册存储介质storage 存储介质在此之前应当先录入存储介质表
			//storage表需录入STORAGE_ID REGISTER REGIST_TIME 自动输入REGISTER_ID
			//STORAGE_ID
			String STORAGE_TYPEID = (String) filepdi.get("STORAGE_ID");//获取表中的如"YP8" "CD10" "AJ11"
			String REGISTER = user.getUSER_ID();
			java.sql.Timestamp  REGIST_TIME= KioorTools.TimeStringToDatatime(DateUtil.getSdfTimes());

			//STORAGE_ID应该从存储表中查询得(需确保文件名唯一！)
			int storageidint= 0;
			PageData rspd = realstorageService.findEntityByName(STORAGE_TYPEID); 
			if(rspd!=null){
				storageidint = (int) rspd.get("REALSTORAGE_ID");
			}
			hisStorage.setStorageId(storageidint);  //存储介质ID**********************************
			hisStorage.setRegister(REGISTER);     //注册人**********************************
			hisStorage.setRegistTime(REGIST_TIME);//注册时间**********************************

			//存入项目hisStorage
			dao.save("StorageMapper.savestorage", hisStorage);
			int REGISTER_ID = hisStorage.getRegisterId();

			//4确定接收receive
			////RC_ID//自动



			//文件提供来源PRODEPART
			String PRODEPART = filepdi.getString("PRODEPART");
			if(PRODEPART==null|PRODEPART.trim()==""){
				PRODEPART="未载";
			}
			String TRANSFNAME = filepdi.getString("TRANSFNAME");
			if(TRANSFNAME==null|TRANSFNAME.trim()==""){
				TRANSFNAME="未载";
			}
			String RC_NAME = filepdi.getString("RC_NAME");
			if(RC_NAME==null|RC_NAME.trim()==""){
				TRANSFNAME="管理员";
			}
			String RC_TIME = filepdi.getString("RC_TIME").trim();
			//按照日期格式加参数，我假设的是yyyyMMdd
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyyMMdd");
			Date RC_TIMEdate = dateFormat.parse("11111111");
			if(RC_TIME.length()==8){
				//按照日期格式加参数，我假设的是yyyyMMdd
				dateFormat=new SimpleDateFormat("yyyyMMdd");
				RC_TIMEdate = dateFormat.parse(RC_TIME);
			}
			
			hisreceive.setProdepart(PRODEPART);//**********************************
			hisreceive.setTransfname(TRANSFNAME);//**********************************
			hisreceive.setRcName(RC_NAME);//**********************************
			hisreceive.setRcTime(RC_TIMEdate);//**********************************
			
			hisreceive.setPrjId(PRJ_ID);//**********************************
			hisreceive.setRegisterId(REGISTER_ID);//**********************************
			hisreceive.setUserId(userid);

			//存入接收表hisreceive
			dao.save("ReceiveMapper.save",hisreceive);
			int RC_ID = hisreceive.getRcId();

			//存入file之前存入文件详细信息file_detail
			String DETAIL = (String) filepdi.get("DETAIL");//文件详情

			if(DETAIL==null|DETAIL.trim()==""|DETAIL.length()<1)
			{
				DETAIL="";
			}
			hisFileDetail.setDetail(DETAIL);

			dao.save("FileDetailMapper.savefiledetail",hisFileDetail);
			int FILEDETAIL_ID = hisFileDetail.getFiledetailId();
			//5根据接收信息填写file



			//RC_ID
			//FILE_NAME
			String FILE_NAME = (String) filepdi.get("FILE_NAME");//文件名称

			//IFDIGIT //1电子2模拟
			String IFDIGIT = "1";
			if(STORAGE_TYPEID.substring(0, 2)=="AJ"){
				IFDIGIT = "2";
			}
			//DATAFORM
			String DATAFORM = (String) filepdi.get("DATAFORM");//文件格式
			//FILE_URL
			String FILE_URL = (String) filepdi.get("FILE_URL");//文件路径
			//VOLUME
			String VOLUME = (String) filepdi.get("VOLUME");//文件容量
			//UNIT
			String UNIT = (String) filepdi.get("UNIT");//文件大小单位
			//IFARCHIVE
			String IFARCHIVE = "4";//1成果2过程3收集 4待分类历史成果5档案
			//FILE_TYPE
			String FILE_TYPE = (String) filepdi.get("FILE_TYPE");//文件类型
			//文件类型（1成果资料、2过程资料、3收集资料、4待分类）
			switch (FILE_TYPE) {
			case "收集资料":
				FILE_TYPE = Integer.toString(IfArchiveEnum.DAIFENLEI.getValue());
				break;
			case "成果资料":
				FILE_TYPE = Integer.toString(IfArchiveEnum.DAIFENLEI.getValue());
				break;
			case "过程资料":
				FILE_TYPE = Integer.toString(IfArchiveEnum.DAIFENLEI.getValue());
				break;
			default :
				FILE_TYPE = Integer.toString(IfArchiveEnum.DAIFENLEI.getValue());
			}
			//SCALE
			//GET_ID
			//FILE_REMARK
			String FILE_REMARK = (String) filepdi.get("FILE_REMARK");//文件备注
			//PERMISSION_CLASS
			String PERMISSION_CLASS = (String) filepdi.get("PERMISSION_CLASS");//文件备注
			//CREATIONDATE
			String CREATIONDATE = (String) filepdi.get("CREATIONDATE");//手工录入的文件创建年月日
			//COVERAGE_IDS
			//COVERAGE
			String COVERAGE = (String) filepdi.get("COVERAGE");//文件类型
			//YEAR
			String YEAR = (String) filepdi.get("YEAR");//年份
			//FILEDETAIL_ID

			//FILEATTR1//FILEATTR2//FILEATTR3

			hisFile.setRcId(RC_ID);//1**********************************
			hisFile.setFileName(FILE_NAME);//2**********************************
			hisFile.setIfdigit(IFDIGIT);//3**********************************
			hisFile.setDataform(DATAFORM);//4**********************************
			hisFile.setFileUrl(FILE_URL);//5**********************************
			hisFile.setVolume(VOLUME);//6**********************************
			hisFile.setUnit(UNIT);//7**********************************
			hisFile.setIfarchive(IFARCHIVE);//8**********************************
			hisFile.setFileType(FILE_TYPE);//9**********************************
			hisFile.setFileRemark(FILE_REMARK);//12**********************************
			hisFile.setPermissionClass(PERMISSION_CLASS);//13**********************************
			hisFile.setCreationdate(CREATIONDATE);//14**********************************
			hisFile.setCoverage(COVERAGE);//16**********************************
			hisFile.setYear(YEAR);//17**********************************
			hisFile.setFiledetailId(FILEDETAIL_ID);//18**********************************
System.err.println(hisFile.toString());

			dao.save("FileMapper.savefile",hisFile);

		}	




	}



	@Override
	public PageData seveFiles(PageData pd, String user_ID, CommonsMultipartFile[] files)
			throws Exception {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub

		List<java.io.File> lists=new ArrayList<>();
		PageData pds=new PageData();
		try{
			Receive re=new Receive();
			re.setPrjId( Integer.parseInt(pd.getString("prjId")));
			re.setCheckdetails(pd.getString("checkdetails"));
			re.setCheckfileUrl((pd.getString("CheckfileUrl")));;
			re.setProdepart(pd.getString("prodepart"));
			re.setRcDepart(pd.getString("rcDepart"));
			re.setRcName(pd.getString("rcName"));
			re.setRcProgress(pd.getString("rcProgress"));
			re.setRcRemark(pd.getString("rcProgress"));
			re.setRcString(pd.getString("rcString"));
			re.setRcTime(new Date());			
			re.setTransfname(pd.getString("transfname"));
			int a=(int) dao.findForList("ReceiveMapper.insertSelective", re);
			for (CommonsMultipartFile commonsMultipartFile : files) {	
				//String dir=pd.getString("dir1")+DateUtil.getDays()+"/"+pd.getString("filedir");
				String dir="E:/ams"+DateUtil.getDays()+"/"+pd.getString("filedir");
				java.io.File filedir=new java.io.File(pd.getString(dir));
				if(!filedir.exists()){
					filedir.mkdirs();
				}
				java.io.File file=new java.io.File(dir+"/"+commonsMultipartFile.getOriginalFilename());
				if(file.isFile()){
					file= new java.io.File(dir+"/"+DateUtil.getSdfTimes()+commonsMultipartFile.getOriginalFilename());

				}		
				lists.add(file);
				File f=new File();	

				f.setRcId(re.getRcId());
				f.setCoverage(pd.getString("coverage"));
				f.setCoverageIds(pd.getString("coverageIds"));
				f.setCreationdate(pd.getString("creationdate"));
				f.setDataform(pd.getString("dataform"));
				f.setFileattr1(pd.getString("fileattr1"));
				f.setFileattr2(pd.getString("fileattr2"));
				f.setFileattr3(pd.getString("fileattr3"));
				f.setFiledetailId(Integer.parseInt(pd.getString("filedetailId")));
				f.setFileName(commonsMultipartFile.getOriginalFilename());
				f.setFileRemark(pd.getString("fileRemark"));
				f.setFileType(pd.getString("fileType"));
				f.setFileUrl(dir+"/"+commonsMultipartFile.getOriginalFilename());
				//f.setGetId(Integer.parseInt(pd.getString("filedetailId")));
				f.setIfarchive(pd.getString("ifarchive"));
				f.setIfdigit(pd.getString("ifdigit"));
				f.setPermissionClass(pd.getString("permissionClass"));
				f.setScale(pd.getString("scale"));
				f.setUnit("bytes");	
				f.setVolume(String.valueOf(commonsMultipartFile.getSize()));
				f.setYear(pd.getString("year"));
				//	fileDao.insertSelective(f);
				commonsMultipartFile.transferTo(file);							

			}
		}catch(Exception e){

			for (java.io.File file : lists) {
				file.deleteOnExit();

			}			

			pds.put("isSuccess", false);
			pds.put("mess", "存储档案失败");
			return pds;
		}
		pds.put("isSuccess", true);
		pds.put("mess", "存储档案成功");
		return pds;

	}

	@Override
	public PageData saveFiles(Receive re, File f, CommonsMultipartFile[] files, User user,Integer storageId) {
		// TODO Auto-generated method stub

		List<java.io.File> lists=new ArrayList<>();
		PageData pds=new PageData();
		re.setUserId(user.getUSER_ID());
		Storage st=new Storage();
		st.setRegister(user.getUSER_ID());
		st.setRegistTime(new Date());
		st.setStorageId(storageId);

		try {
			dao.save("StorageMapper.insertSelective", st);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		re.setRegisterId(st.getRegisterId());
		re.setRcTime(new Date());
		System.err.println(re.getRegisterId());		
		try{
			String dir = re.getCheckdetails() + "/" + DateUtil.getDays();
			dao.save("ReceiveMapper.insertSelective", re);
			for (CommonsMultipartFile commonsMultipartFile : files) {
				// String
				// dir=pd.getString("dir1")+DateUtil.getDays()+"/"+pd.getString("filedir");
				java.io.File filedir = new java.io.File(dir);
				if (!filedir.exists()) {
					filedir.mkdirs();
				}
				String name = commonsMultipartFile.getOriginalFilename();

				java.io.File file = new java.io.File(dir + "/" + name);
				if (file.isFile()) {
					file = new java.io.File(dir + "/" + DateUtil.getSdfTimes() + name);

				}
				lists.add(file);

				f.setFileName(name.substring(0, name.lastIndexOf(".")));
				f.setRcId(re.getRcId());
				if (name.endsWith(".zip") || name.endsWith(".ZIP") || name.endsWith(".rar") || name.endsWith(".RAR")) {
					dir = dir + "/" + name.substring(0, name.lastIndexOf(".")) + "/";
					f.setFileUrl(dir);
				} else {
					f.setFileUrl(file.getPath());
				}
				f.setVolume(String.valueOf(commonsMultipartFile.getSize()));
				f.setUnit("KB");
				f.setDataform(commonsMultipartFile.getOriginalFilename().substring( commonsMultipartFile.getOriginalFilename().lastIndexOf(".") + 1));
				
				dao.save("FileMapper.insertSelective", f);
				commonsMultipartFile.transferTo(file);

				if (name.endsWith(".zip") || name.endsWith(".ZIP")) {
					final java.io.File ff = file;
					final String dirs = dir;
					new Thread(new Runnable() {
						@Override
						public void run() {
							// TODO Auto-generated method stub
							try {

								CompressFile.unZipFiles(ff, dirs);
								Thread.sleep(20000);
								while (!ff.delete()) {

								}

							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (InterruptedException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}

						}
					}).start();
				}

				if (name.endsWith(".rar") || name.endsWith(".RAR")) {

					final java.io.File ff = file;
					final String dirs = dir;
					new Thread(new Runnable() {
						@Override
						public void run() {
							// TODO Auto-generated method stub
							try {

								CompressFile.unRarFile(ff.getAbsolutePath(),dirs);
								Thread.sleep(20000);
								while (!ff.delete()) {

								}
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}

						}
					}).start();

				}

			}
		} catch (Exception e) {

			for (java.io.File file : lists) {
				file.delete();

			}

	pds.put("isSuccess", false);
			pds.put("mess", "存储档案失败");
			return pds;
		}
		pds.put("isSuccess", true);
		pds.put("mess", "存储档案成功");
		return pds;

	}

	@Override
	public PageData saveFiles2(CommonsMultipartFile[] files,File f, User user, String kboxid) {
		// TODO Auto-generated method stub

		List<java.io.File> lists=new ArrayList<>();
		PageData pds=new PageData();
		
		Storage st=new Storage();
		st.setRegister(user.getUSER_ID());
		st.setRegistTime(new Date());


		try {
			dao.save("StorageMapper.insertSelective", st);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try{
			String dir = "科技档案上传" + "/" + DateUtil.getDays();
			for (CommonsMultipartFile commonsMultipartFile : files) {
				// String
				// dir=pd.getString("dir1")+DateUtil.getDays()+"/"+pd.getString("filedir");
				java.io.File filedir = new java.io.File(dir);
				if (!filedir.exists()) {
					filedir.mkdirs();
				}
				String name = commonsMultipartFile.getOriginalFilename();

				java.io.File file = new java.io.File(dir + "/" + name);
				if (file.isFile()) {
					file = new java.io.File(dir + "/" + DateUtil.getSdfTimes() + name);

				}
				lists.add(file);

				f.setFileName(name.substring(0, name.lastIndexOf(".")));
				
				if (name.endsWith(".zip") || name.endsWith(".ZIP") || name.endsWith(".rar") || name.endsWith(".RAR")) {
					dir = dir + "/" + name.substring(0, name.lastIndexOf(".")) + "/";
					f.setFileUrl(dir);
				} else {
					f.setFileUrl(file.getPath());
				}
				f.setVolume(String.valueOf(commonsMultipartFile.getSize()));
				f.setUnit("KB");
				f.setDataform(commonsMultipartFile.getOriginalFilename().substring( commonsMultipartFile.getOriginalFilename().lastIndexOf(".") + 1));
				
				dao.save("FileMapper.insertSelective", f);
				commonsMultipartFile.transferTo(file);

				if (name.endsWith(".zip") || name.endsWith(".ZIP")) {
					final java.io.File ff = file;
					final String dirs = dir;
					new Thread(new Runnable() {
						@Override
						public void run() {
							// TODO Auto-generated method stub
							try {

								CompressFile.unZipFiles(ff, dirs);
								Thread.sleep(20000);
								while (!ff.delete()) {

								}

							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (InterruptedException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}

						}
					}).start();
				}

				if (name.endsWith(".rar") || name.endsWith(".RAR")) {

					final java.io.File ff = file;
					final String dirs = dir;
					new Thread(new Runnable() {
						@Override
						public void run() {
							// TODO Auto-generated method stub
							try {

								CompressFile.unRarFile(ff.getAbsolutePath(),dirs);
								Thread.sleep(20000);
								while (!ff.delete()) {

								}
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}

						}
					}).start();

				}

			}
		} catch (Exception e) {

			for (java.io.File file : lists) {
				file.delete();

			}

	pds.put("isSuccess", false);
			pds.put("mess", "存储档案失败");
			return pds;
		}
		pds.put("isSuccess", true);
		pds.put("mess", "存储档案成功");
		return pds;

	}
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("FileMapper.findById", pd);
	}

	@Override
	public PageData saveHandRCFiles(CommonsMultipartFile[] files,ReceiveTemp rctemp, Receive rc, File f,FileDetail filedetail, User user) {

		List<java.io.File> lists=new ArrayList<>();
		PageData pds=new PageData();
		rc.setUserId(user.getUSER_ID());
		
		rc.setRcTime(new Date());
		System.err.println(rc.getRegisterId());		
		
		try{		
/*			dao.save("ReceiveMapper.insertSelective", rc);
			f.setRcId(rc.getRcId());
			dao.save("FileDetailMapper.savefiledetail",filedetail);
			f.setFiledetailId(filedetail.getFiledetailId());
			dao.save("FileMapper.insertSelective", f);*/
			//如果未添加上传文件
			long fileslength = files[0].getSize();
			if(fileslength<=0){
				
				//存储接收信息 插入实体rc
				areceiveService.save(rc);
				//需要将RCID加到areceiveTempService
				/*receivetemp.setUserId(userid);
				receivetemp.setPrjId(arSelectprjID);
				receivetemp.setRegisterId(registerid);
				receivetemp.setIfdigit(arIfdigit);
				receivetemp.setStorageType(arStoragetype);
				receivetemp.setIfarchive("4");
				receivetemp.setRctempTime(sqldatetime);

				areceiveTempService.save(receivetemp);*/
				f.setRcId(rc.getRcId());
				
				//存储文件详细信息
				dao.save("FileDetailMapper.savefiledetail",filedetail);
				f.setFiledetailId(filedetail.getFiledetailId());
				
				//存储文件信息
				dao.save("FileMapper.insertSelective", f);
				
				//如果选择服务器路径，需要建立空文件夹，以备FTP上传文件
				String dir=f.getFileUrl();
				if(dir.contains(":")){
					try {
						java.io.File filedir=new java.io.File(dir);
						if(!filedir.exists()){
							filedir.mkdirs();
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}else{
				//如果有文件上传
				
				//制作文件地址，后面需确定前页传来的地址后端无斜杠？？？？
				/*String dir=f.getFileUrl()+"/"+DateUtil.getDays();*/
				String dir=f.getFileUrl();
				for (CommonsMultipartFile commonsMultipartFile : files) {
					//String dir=pd.getString("dir1")+DateUtil.getDays()+"/"+pd.getString("filedir");
					java.io.File filedir=new java.io.File(dir);
					if(!filedir.exists()){
						filedir.mkdirs();
					}
					String name = commonsMultipartFile.getOriginalFilename();
					
					java.io.File file=new java.io.File(dir+"/"+name);
					if(file.isFile()){
						file= new java.io.File(dir+"/"+DateUtil.getSdfTimes()+commonsMultipartFile.getOriginalFilename());
					}
					lists.add(file);
					
					commonsMultipartFile.transferTo(file);
					
					
					
					if (name.endsWith(".zip") || name.endsWith(".ZIP")) {
						final java.io.File ff = file;
						final String dirs = dir;
						new Thread(new Runnable() {
							@Override
							public void run() {
								// TODO Auto-generated method stub
								try {

									CompressFile.unZipFiles(ff, dirs);
									Thread.sleep(20000);
									while (!ff.delete()) {

									}

								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (InterruptedException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}

							}
						}).start();
					}

					if (name.endsWith(".rar") || name.endsWith(".RAR")) {

						final java.io.File ff = file;
						final String dirs = dir;
						new Thread(new Runnable() {
							@Override
							public void run() {
								// TODO Auto-generated method stub
								try {

									CompressFile.unRarFile(ff.getAbsolutePath(),dirs);
									Thread.sleep(20000);
									while (!ff.delete()) {

									}
								} catch (Exception e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}

							}
						}).start();

					}
					
				}
				
				

				//存储接收信息 插入实体rc
				areceiveService.save(rc);
				f.setRcId(rc.getRcId());
				f.setFileUrl(dir);
				
				//存储文件详细信息
				dao.save("FileDetailMapper.savefiledetail",filedetail);
				f.setFiledetailId(filedetail.getFiledetailId());
				
				//存储文件信息
				dao.save("FileMapper.insertSelective", f);
			}
			
		}catch(Exception e){

			for (java.io.File file : lists) {
				file.deleteOnExit();

			}			

			pds.put("isSuccess", false);
			pds.put("mess", "存储成果失败");
			return pds;
		}
		pds.put("isSuccess", true);
		pds.put("mess", "存储完成");
		return pds;

	}
	
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<PageData> arCountlistPage() throws Exception {
		Page page = new Page();
		return (List<PageData>)dao.findForList("FileMapper.arCountlistPage", page);
	}

	@Override
	public List<PageData> getFilecount(PageData pd) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("FileMapper.getFilecount", pd);
	}

	public static void main(String[] args) {
		java.io.File f = new java.io.File("E:\\DD\\C");
		f.mkdirs();
	}
}

