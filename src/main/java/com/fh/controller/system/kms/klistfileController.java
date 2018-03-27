package com.fh.controller.system.kms;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.common.annotation.ControllerOptLog;
import com.fh.controller.ams.KioorTools;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.KmsAddFile;
import com.fh.entity.amsmodel.KmsFile;
import com.fh.entity.amsmodel.KmsFileBox;
import com.fh.entity.fms.FmsAddFile;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDocBox;
import com.fh.entity.fms.FmsDocMain;
import com.fh.service.kms.kmsfile.KmsfileManager;
import com.fh.service.kms.kmsfilebox.KmsfileBoxManager;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * kms科技档案管理
 */
@Controller
@RequestMapping("/kms")
public class klistfileController extends BaseController {
	
	String kmsUrl = "kms/listkfile.do"; //(权限用)
	@Resource(name="kmsfileBoxService")
	private KmsfileBoxManager kmsfileBoxService;
	@Resource(name="kmsfileService")
	private KmsfileManager kmsfileService;
	

	
	/**显示科技档案管理页面kms_ztree
	 * @param page
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/listztree")
	public ModelAndView listKmsFiles(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String serchkmskey = pd.getString("serchkmskey");
		if(null != serchkmskey && !"".equals(serchkmskey)){
			pd.put("serchkmskey", serchkmskey.trim());
		}
		page.setPd(pd);
		mv.setViewName("system/kms/kms_ztree");
		mv.addObject("pd", pd);		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	/**显示科技档案盒列表
	 * @param page
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value="/listFileBox")
	public List<KmsFileBox> listFileBox(KmsFileBox kmsFileBox) throws Exception {
	
		return kmsfileBoxService.listFileBox(kmsFileBox);
		
	}
	/**显示科技档案列表
	 * @param page
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="列出科技档案")
	@RequestMapping(value="/listkfile")
	public ModelAndView listDoc(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}

		page.setOrder("DESC");
		page.setSort("CREATETIME");
		page.setPd(pd);	

		List<PageData> list= kmsfileService.listKFile(page);
		mv.setViewName("system/kms/kms_list");
		mv.addObject("pd", pd);		
		mv.addObject("list", list);		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	
	
	
	/**根据档案盒显示科技档案列表
	 * @param page
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog
	@RequestMapping(value="/listKmsFileByBoxId")
	public ModelAndView listKmsFileByBoxId(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}

		page.setOrder("DESC");
		page.setSort("KFILE_NAME");
		page.setPd(pd);	

		List<PageData> list= kmsfileService.listKmsFileByBoxId(page);

		mv.setViewName("system/kms/kms_list");
		mv.addObject("list", list);		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}

	
	/**GO添加科技档案盒
	 * 
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年11月2日 下午3:34:19
	 *
	 */
	@RequestMapping(value="/goAddKBox")
	public ModelAndView goAddKBox(KmsFileBox kfileBox)throws Exception{
		if(!Jurisdiction.buttonJurisdiction(kmsUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		mv.setViewName("system/kms/kms_boxedit");
		mv.addObject("msg", "addKBox");
		mv.addObject("pd", pd);
		return mv;
	}
	/**添加科技档案盒
	 * 
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年11月2日 下午3:34:19
	 *
	 */
	@RequestMapping(value="/addKBox")
	public ModelAndView addKBox(KmsFileBox kfileBox)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String selectedpid = null;
		
		try {
			kfileBox.setId(get32UUID());
			kfileBox.setPid(pd.getString("pid"));
			kmsfileBoxService.saveKBOX(kfileBox);
			mv.addObject("msg","success");
		} catch (Exception e) {
			logBefore(logger, e.getMessage());
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	/**GO删除科技档案盒
	 * 
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年11月2日 下午3:34:19
	 *
	 */
	@RequestMapping(value="/goDeleteKBox")
	public ModelAndView goDeleteKBox()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(kmsUrl, "del")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();	
		mv.setViewName("system/kms/kms_boxdelete");
		mv.addObject("msg", "deleteKBox");
		mv.addObject("pd", pd);
		return mv;
	}	
	/**删除科技档案盒
	 * 
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年11月2日 下午3:34:19
	 *
	 */
	@RequestMapping(value="/deleteKBox")
	public ModelAndView deleteKBox()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();	

		return mv;
	}

	/**GO编辑科技档案盒
	 * 
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年11月2日 下午3:34:19
	 *
	 */
	@RequestMapping(value="/goEditKBox")
	public ModelAndView goEditKBox()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(kmsUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		KmsFileBox  kfileBox = kmsfileBoxService.findById(pd.getString("id"));
		String pid = kfileBox.getPid();
		pd.put("pid", pid);
		pd.put("kfileBox", kfileBox);
		mv.setViewName("system/kms/kms_boxedit");
		mv.addObject("msg", "editKBox");
		mv.addObject("pd", pd);
		return mv;
	}	
	/**编辑科技档案盒
	 * 
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年11月2日 下午3:34:19
	 *
	 */
	@RequestMapping(value="/editKBox")
	public ModelAndView editKBox(KmsFileBox kfileBox)throws Exception{
		if(!Jurisdiction.buttonJurisdiction(kmsUrl, "edit")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"编辑科技档案盒");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
	
			kmsfileBoxService.editBox(kfileBox);
			mv.addObject("msg","success");
		} catch (Exception e) {
			// TODO: handle exception
			logBefore(logger, e.getMessage());
			mv.addObject("msg","failed");
		}	
		mv.setViewName("save_result");
		return mv;
	}
	
	/**GO添加科技档案
	 * 
	 * @param page
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("null")
	@ControllerOptLog
	@RequestMapping(value="/goAddKFile")
	public ModelAndView goAddKFile()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(kmsUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData 	pd = this.getPageData();
		

		KmsFile kmsFile = new KmsFile();
		kmsFile.setKfboxid(pd.getString("kfboxid"));
		pd.put("kmsFile", kmsFile);
		
		mv.setViewName("system/kms/kms_edit");		
		mv.addObject("msg", "addKFile");
		mv.addObject("pd", pd);

		return mv;
	}
	/**添加科技档案
	 * 
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年11月2日 下午3:34:19
	 *
	 */
	@RequestMapping(value="/addKFile")
	public ModelAndView addKFile(KmsFile kmsFile,@RequestParam( required = false,value="files") CommonsMultipartFile[] files)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();	
		KmsAddFile kmsandfile;

		 
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try{
		
	/*	String setPrjId = pd.getString("prjId"); 
		if (setPrjId != ""&&setPrjId!=null&&setPrjId.length()!=0) {
			Integer prjId = new Integer(setPrjId);
			kmsFile.setPrjId(prjId);
		}
		kmsFile.setPrjNameInput(pd.getString("prjNameInput"));
		kmsFile.setCequname(pd.getString("cequname"));
		kmsFile.setKfileNum(pd.getString("kfileNum"));
		kmsFile.setKfileName(pd.getString("kfileName"));
		

		String setCreatetime = pd.getString("createtime");
		if (setCreatetime != ""&&setCreatetime!=null&&setCreatetime.length()!=0) {
			java.util.Date dateTime = sdf.parse(setCreatetime);
			java.sql.Timestamp createTimestamp = new java.sql.Timestamp(dateTime.getTime());
			kmsFile.setCreatetime(dateTime);
		}
		

		String setPage = pd.getString("page"); 
		if (setPage != ""&&setPage!=null&&setPage.length()!=0) {
			Integer kfileNum = new Integer(setPage);
			kmsFile.setPage(kfileNum);
		}
		kmsFile.setKfileLimit(pd.getString("kfileLimit"));
		kmsFile.setStorageplace(pd.getString("storageplace"));
		kmsFile.setMiji(pd.getString("miji"));
		kmsFile.setMulu(pd.getString("mulu"));
		kmsFile.setRemark(pd.getString("remark"));
		

		String setRealstorageId = pd.getString("realstorageId");  
		if (setRealstorageId != ""&&setRealstorageId!=null&&setRealstorageId.length()!=0) {
			Integer realstorageId = new Integer(setRealstorageId);
			kmsFile.setRealstorageId(realstorageId);
			
		}
		if (pd.getString("ifexist")=="是") {
			kmsFile.setIfexist(true);
		} else {
			kmsFile.setIfexist(false);
		}
		kmsFile.setCopystatus(pd.getString("copystatus"));
		kmsFile.setJieshourenInput(pd.getString("jieshourenInput"));
		kmsFile.setBumenInput(pd.getString("bumenInput"));
		kmsFile.setYijiaorenInput(pd.getString("yijiaorenInput"));
		kmsFile.setYjbumenInput(pd.getString("yjbumenInput"));
		
		String jstime = pd.getString("jieshouTime");
		if (jstime != ""&&jstime!=null&&jstime.length()!=0) {
			java.util.Date jsdateTime = sdf.parse(jstime);
			java.sql.Timestamp jsTimestamp = new java.sql.Timestamp(jsdateTime.getTime());
			kmsFile.setJieshouTime(jsdateTime);
		}
		String yjtime = pd.getString("yijiaoTime");
		if (yjtime != ""&&yjtime!=null&&yjtime.length()!=0) {
			java.util.Date yjdateTime = sdf.parse(yjtime);
			java.sql.Timestamp yjTimestamp = new java.sql.Timestamp(yjdateTime.getTime());
			kmsFile.setYijiaoTime(yjdateTime);
		}

		String setTypeId = pd.getString("typeId");  
		if (setTypeId != ""&&setTypeId!=null&&setTypeId.length()!=0) {
			Integer typeId = new Integer(setTypeId);
			kmsFile.setTypeId(typeId);
			
		}

		kmsFile.setKfboxid(pd.getString("kfboxid"));*/
		
		List<KmsAddFile> kmsAddFiles=new ArrayList<KmsAddFile>();
		String path=	"D:/科技电子档案/" + DateUtil.getSdfTimes() + "/";
		File f=new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		if(files!=null) {
			for (CommonsMultipartFile commonsMultipartFile : files) {
				if(!commonsMultipartFile.isEmpty()){  
					kmsandfile=new KmsAddFile();
					kmsandfile.setKmsId(kmsFile.getKfileId());
					kmsandfile.setId(get32UUID());
					kmsandfile.setPath(path);
					kmsandfile.setName(commonsMultipartFile.getOriginalFilename());
					kmsAddFiles.add(kmsandfile);
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
		
	
			kmsFile.setKmsAddFiles(kmsAddFiles);
			kmsfileService.save(kmsFile);

			mv.addObject("msg","success");
		} catch (Exception e) {
			// TODO: handle exception
			logBefore(logger, e.getMessage());
			mv.addObject("msg","failed");
		}	

		mv.setViewName("save_result");
		return mv;
	}
	/**GO删除科技档案
	 * 
	 * @param page
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog
	@RequestMapping(value="/goDeleteKFile")
	public ModelAndView goDeleteKFile()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(kmsUrl, "del")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData 	pd = this.getPageData();
		int pdint= Integer.parseInt(pd.getString("KFILE_ID"));
		
		try {
			kmsfileService.delete(pdint);
			mv.addObject("msg","success");
		} catch (Exception e) {
			logBefore(logger, e.getMessage());
			mv.addObject("msg","failed");
		}

		mv.setViewName("save_result");
		return mv;
	}
	
	/**GO编辑科技档案
	 *
	 * @param page
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog
	@RequestMapping(value="/goEditKFile")
	public ModelAndView goEditKFile()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(kmsUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData 	pd = this.getPageData();
		KmsFile kmsFile = null;
		try {
			int kmsfid = Integer.parseInt(pd.get("KFILE_ID").toString());
			kmsFile = kmsfileService.findById(kmsfid);
		} catch (NumberFormatException e) {
		    e.printStackTrace();
		}
		

		
		
		pd.put("kmsFile", kmsFile);
		mv.setViewName("system/kms/kms_edit");		
		mv.addObject("msg", "editkfile");
		mv.addObject("pd", pd);

		return mv;
	}
	/**编辑科技档案
	 * 
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2017年11月2日 下午3:34:19
	 *
	 */
	@RequestMapping(value="/editkfile")
	public ModelAndView editkfile(KmsFile kmsFile,@RequestParam( required = false,value="files") CommonsMultipartFile[] files)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		KmsAddFile kmsandfile;	
		
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try{
	
		List<KmsAddFile> kmsandfiles=new ArrayList<KmsAddFile>();		
		String path=	"D:/科技电子档案/" + DateUtil.getSdfTimes() + "/";
		File f=new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		if(files!=null) {
			for (CommonsMultipartFile commonsMultipartFile : files) {
				if(!commonsMultipartFile.isEmpty()){  
					kmsandfile=new KmsAddFile();
					kmsandfile.setKmsId(kmsFile.getKfileId());
					kmsandfile.setId(get32UUID());
					kmsandfile.setPath(path);
					kmsandfile.setName(commonsMultipartFile.getOriginalFilename());
					kmsandfiles.add(kmsandfile);
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
		kmsFile.setKmsAddFiles(kmsandfiles);
		kmsfileService.edit(kmsFile,pd.getString("deletefile"));
		mv.addObject("msg","success");
		}catch (Exception e) {
			// TODO: handle exception
			logBefore(logger, e.getMessage());
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	

/*	*//**
	 * 文件下载
	 * @Description: 
	 * @param fileName
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 *//*
	@ControllerOptLog(desc="下载文件")
	@RequestMapping("/download")
	public String downloadFile( HttpServletResponse response) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData 	pd = this.getPageData();
		String id=	pd.getString("id");
		KmsAddFile fmsAddFile=  fmsService.findFmsAddFilebyid(id);   
		File file = new File(fmsAddFile.getPath(), fmsAddFile.getName());
		if (file.exists()) {
			response.setContentType("application/force-download");// 设置强制下载不打开
			response.addHeader("Content-Disposition",
					"attachment;fileName=" + fmsAddFile.getName());// 设置文件名
			byte[] buffer = new byte[1024];
			FileInputStream fis = null;
			BufferedInputStream bis = null;
			try {
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				OutputStream os = response.getOutputStream();
				int i = bis.read(buffer);
				while (i != -1) {
					os.write(buffer, 0, i);
					i = bis.read(buffer);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				if (bis != null) {
					try {
						bis.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (fis != null) {
					try {
						fis.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}

		return null;
	}
	
	
	
	
	*/
	
	
	
	
	
	
	
	
	
	
	/**GO查看科技档案详情
	 * 
	 * @param page
	 * @return 
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog
	@RequestMapping(value="/goViewKFile")
	public ModelAndView goViewKFile()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(kmsUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData 	pd = this.getPageData();
		KmsFile kmsFile = null;
		try {
			int kmsfid = Integer.parseInt(pd.get("KFILE_ID").toString());

			kmsFile = kmsfileService.findById(kmsfid);
		} catch (NumberFormatException e) {
		    e.printStackTrace();
		}
		
		pd.put("kmsFile", kmsFile);
		mv.setViewName("system/kms/kms_view");		
		mv.addObject("msg", "editkfile");
		mv.addObject("pd", pd);

		return mv;
	}
	
	
	
	
	
	
	@RequestMapping(value = "/listKFileForm")
	public ModelAndView archiveReceive() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/kms/klistmanage");
		mv.addObject("pd", pd);
		return mv;
	}
	
	@RequestMapping(value = "/searchkms")
	public void searchKms() throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
	}
	
	

	/**
	 * select count(1) as count ,YEAR from  ams_file  WHERE YEAR IS NOT NULL AND YEAR!='' AND YEAR!='CurentDate();' group by YEAR  ORDER by YEAR
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2018年2月5日
	 *
	 */
	@ResponseBody
	@ControllerOptLog(desc="getCountAMSYEAR")
	@RequestMapping(value="/getCountAMSYEAR")
	public Object getCountAMSYEAR() throws Exception{	
		List<PageData> pd=	kmsfileService.getCountAMSYEAR();
		return pd;
	}
	/**
	 * select count(1) as count ,MONTH(JIESHOU_TIME) as jst from  kms_file group by JIESHOU_TIME   ORDER by JIESHOU_TIME 
	 * @return
	 * @throws Exception
	 * @author:shenyang
	 * @date:2018年2月5日
	 *
	 */
	@ResponseBody
	@ControllerOptLog(desc="getCountKMSYEAR")
	@RequestMapping(value="/getCountKMSYEAR")
	public Object getCountKMSYEAR() throws Exception{	
		List<PageData> pd=	kmsfileService.getCountKMSYEAR();
		return pd;
	}
	
	
	

	/**
	 * 文件下载
	 * @Description: 
	 * @param fileName
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception 
	 */
	@ControllerOptLog(desc="下载文件")
	@RequestMapping("/download")
	public String downloadFile( HttpServletResponse response) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData 	pd = this.getPageData();
		String id=	pd.getString("id");
		KmsAddFile kmsAddFile=  kmsfileService.findKmsAddFilebyid(id);   
		File file = new File(kmsAddFile.getPath(), kmsAddFile.getName());
		if (file.exists()) {
			response.setContentType("application/force-download");// 设置强制下载不打开
			response.addHeader("Content-Disposition",
					"attachment;fileName=" + kmsAddFile.getName());// 设置文件名
			byte[] buffer = new byte[1024];
			FileInputStream fis = null;
			BufferedInputStream bis = null;
			try {
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				OutputStream os = response.getOutputStream();
				int i = bis.read(buffer);
				while (i != -1) {
					os.write(buffer, 0, i);
					i = bis.read(buffer);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				if (bis != null) {
					try {
						bis.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (fis != null) {
					try {
						fis.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}

		return null;
	}
	
	
}
