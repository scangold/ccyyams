package com.fh.controller.fms;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.lang.Long;
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
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.fms.FmsAddFile;
import com.fh.entity.fms.FmsDataDict;

import com.fh.entity.fms.FmsDocBox;
import com.fh.entity.fms.FmsDocMain;
import com.fh.service.data.DataService;
import com.fh.service.fms.FmsService;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/** 
 * 类名称：UserController
 * 创建人：
 * 更新时间：
 * @version
 */
@Controller
@RequestMapping(value="/doc")
public class DocController extends BaseController {

	String menuUrl = "doc/list.do"; //菜单地址(权限用)
	@Resource
	private FmsService fmsService;
	@Resource
	private DataService dataService;


	/**显示用户列表
	 * @param page
	 * @return 
	 * @return
	 * @throws Exception
	 */	
	@RequestMapping(value="/list")
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
		
		//pd.put("ROLE_ID", "1");
		//List<Role> roleList = roleService.listAllRolesByPId(pd);//列出所有系统用户角色
		//List<FmsDataDictItem> isValidList = dataService.listDataDictItemDataById("isvalid");
		
	
		//档案类型
 		pd=	fmsService.getData(pd);
		FmsDataDict classtypeitem =   dataService.findByDATAKEY("classtype");
		if(StringUtils.equals(pd.getString("detail"), "1")){
			String classtype =pd.getString("classtype");			
			
			if (StringUtils.isEmpty(classtype)) {
				classtype=classtypeitem.getFmsDataDictItems().get(0).getName();
			}
			//上位类
			FmsDataDict fmsDataDict =   dataService.findByDATAKEY(classtype+"superordinateclass");
			//中位类
			FmsDataDict fmsDataDict1 =   dataService.findByDATAKEY(classtype+"medianclass");
			//下位类
			FmsDataDict fmsDataDict2 =   dataService.findByDATAKEY(classtype+"subordinateclass");

			//密级
			FmsDataDict dense =   dataService.findByDATAKEY("dense");
			//文本类型
			FmsDataDict doctype =   dataService.findByDATAKEY("doctype");	
			//数据来源
			FmsDataDict source =   dataService.findByDATAKEY("source");	
			//规格
			FmsDataDict spec =   dataService.findByDATAKEY("spec");	
			//载体
			FmsDataDict carrier =   dataService.findByDATAKEY("carrier");	

			mv.addObject("shang", fmsDataDict);
			mv.addObject("zhong", fmsDataDict1);
			mv.addObject("xia", fmsDataDict2);
			mv.addObject("doctype", doctype);
			mv.addObject("source", source);
			mv.addObject("classtype", classtypeitem);
			mv.addObject("dense", dense);
			mv.addObject("spec", spec);
			mv.addObject("carrier", carrier);
		

		}
		mv.addObject("classtype", classtypeitem);
		List<PageData> list= fmsService.listDoc(page);
		List<FmsDocBox> listDocBox= fmsService.selectAllDocBox();
		mv.addObject("listDocBox", listDocBox);
		mv.setViewName("fms/doc/list");
		//mv.addObject("dataList", dataList);
		//mv.addObject("isValidList", isValidList);
		FmsDataDict isvalid =   dataService.findByDATAKEY("isvalid");	
		mv.addObject("isvalid", isvalid);
		mv.addObject("pd", pd);		
		mv.addObject("list", list);		
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}



	@RequestMapping(value="/goAddDoc")
	public ModelAndView goAddDoc()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData 	pd = this.getPageData();
		String classtype =pd.getString("classtype");
		//档案类型
		FmsDataDict classtypeitem =   dataService.findByDATAKEY("classtype");
		if (StringUtils.isEmpty(classtype)) {
			classtype=classtypeitem.getFmsDataDictItems().get(0).getName();
			pd.put("classtype", classtype);
		}

		//上位类
		FmsDataDict fmsDataDict =   dataService.findByDATAKEY(classtype+"superordinateclass");
		if(fmsDataDict==null) {
			fmsDataDict=new FmsDataDict(); 
			fmsDataDict.setName(classtype+"上位类");
			fmsDataDict.setDatakey(classtype+"superordinateclass");
			fmsDataDict.setId(get32UUID());
			dataService.save(fmsDataDict);			
		}
		//中位类
		FmsDataDict fmsDataDict1 =   dataService.findByDATAKEY(classtype+"medianclass");
		if(fmsDataDict1==null) {
			fmsDataDict1=new FmsDataDict(); 
			fmsDataDict1.setName(classtype+"中位类");
			fmsDataDict1.setDatakey(classtype+"medianclass");
			fmsDataDict1.setId(get32UUID());
			dataService.save(fmsDataDict1);

		}
		//下位类
		FmsDataDict fmsDataDict2 =   dataService.findByDATAKEY(classtype+"subordinateclass");
		if(fmsDataDict2==null) {
			fmsDataDict2=new FmsDataDict(); 
			fmsDataDict2.setName(classtype+"下位类");
			fmsDataDict2.setDatakey(classtype+"subordinateclass");
			fmsDataDict2.setId(get32UUID());
			dataService.save(fmsDataDict2);

		}


		//密级
		FmsDataDict dense =   dataService.findByDATAKEY("dense");

		//文本类型
		FmsDataDict doctype =   dataService.findByDATAKEY("doctype");			

		//数据来源
		FmsDataDict source =   dataService.findByDATAKEY("sumnumber");	

		//规格
		FmsDataDict spec =   dataService.findByDATAKEY("spec");	

		//载体
		FmsDataDict carrier =   dataService.findByDATAKEY("carrier");	
		List<FmsDocBox> listDocBox= fmsService.selectAllDocBox();

		Long count=(Long) fmsService.findAllCount();
		pd=	fmsService.getData(pd);
		mv.setViewName("fms/doc/edit");		
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		mv.addObject("shang", fmsDataDict);
		mv.addObject("counts", String.format("%04d", count+1));		
		mv.addObject("zhong", fmsDataDict1);
		mv.addObject("xia", fmsDataDict2);
		mv.addObject("dense", dense);
		mv.addObject("doctype", doctype);
		mv.addObject("source", source);
		mv.addObject("listDocBox", listDocBox);
		mv.addObject("spec", spec);
		mv.addObject("carrier", carrier);		
		mv.addObject("classtypeitem", classtypeitem);
		return mv;
	}

	@ControllerOptLog(desc="新增文书")
	@RequestMapping(value="/save")
	public String save(FmsDocMain dmsDocMain,@RequestParam( required = false,value="files") CommonsMultipartFile[] files) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增tyepe");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<FmsAddFile> fmsAddFiles=new ArrayList<FmsAddFile>();
		FmsAddFile fmsandfile;
		dmsDocMain.setId(get32UUID());
		dmsDocMain.setUserId(Jurisdiction.getUserid());
		String path=	"D:/filedata/" + new Date().getTime()+"/";
		File f=new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		if(files!=null) {
			for (CommonsMultipartFile commonsMultipartFile : files) {
				if(!commonsMultipartFile.isEmpty()){  
					fmsandfile=new FmsAddFile();
					fmsandfile.setFmsId(dmsDocMain.getId());
					fmsandfile.setId(get32UUID());
					fmsandfile.setPath(path);
					fmsandfile.setName(commonsMultipartFile.getOriginalFilename());
					fmsAddFiles.add(fmsandfile);
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

		try {
			dmsDocMain.setFmsAddFiles(fmsAddFiles);
			fmsService.saveFmsDocMain(dmsDocMain);

			mv.addObject("msg","success");
		} catch (Exception e) {
			// TODO: handle exception
			logBefore(logger, e.getMessage());
			mv.addObject("msg","failed");
		}	




		return "redirect:/doc/view?fmsid="+dmsDocMain.getId();
	}

	@RequestMapping(value="/view")
	public ModelAndView view() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		FmsDocMain fmsDocMain=  fmsService.findDocById(pd.getString("fmsid"));	

		if("admin".equals(pd.getString("USERNAME"))){return null;}	//不能查看admin用户
		pd.put("ROLE_ID", "1");
		mv.setViewName("fms/doc/view");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		mv.addObject("fmsDocMain", fmsDocMain);


		return mv;
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
		FmsAddFile fmsAddFile=  fmsService.findFmsAddFilebyid(id);   
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
	/**
	 * 
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2017年8月7日 上午10:34:34
	 *
	 */
	@RequestMapping(value="/goEditDoc")
	public ModelAndView goEditDoc() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData 	pd = this.getPageData();
		FmsDocMain fmsDocMain=  fmsService.findDocById(pd.getString("fmsid"));
		String classtype=pd.getString("classtype");
		if (StringUtils.isEmpty(classtype)) {
			classtype=fmsDocMain.getClasstype();
		}
		//档案类型
		FmsDataDict classtypeitem =   dataService.findByDATAKEY("classtype");
		if (StringUtils.isEmpty(classtype)) {
			classtype=classtypeitem.getFmsDataDictItems().get(0).getName();
		}	

		FmsDataDict fmsDataDict  =   dataService.findByDATAKEY(classtype+"superordinateclass");
		//中位类
		FmsDataDict fmsDataDict1 =   dataService.findByDATAKEY(classtype+"medianclass");
		//下位类
		FmsDataDict fmsDataDict2 =   dataService.findByDATAKEY(classtype+"subordinateclass");		
		//密级
		FmsDataDict dense =   dataService.findByDATAKEY("dense"	);

		//文本类型
		FmsDataDict doctype =   dataService.findByDATAKEY("doctype");	
		//数据来源
		FmsDataDict source =   dataService.findByDATAKEY("sumnumber");	

		//规格
		FmsDataDict spec =   dataService.findByDATAKEY("spec");
		//载体
		FmsDataDict carrier =   dataService.findByDATAKEY("carrier");	

		List<FmsDocBox> listDocBox= fmsService.selectAllDocBox();

		pd=	fmsService.getData(pd);	
		pd.put("classtype", classtype);
		pd.put("fmsDocBox", fmsDocMain.getFmsDocBox());
		mv.setViewName("fms/doc/edit");
		mv.addObject("msg", "editDoc");
		mv.addObject("pd", pd);		
		mv.addObject("shang", fmsDataDict);
		mv.addObject("counts",fmsDocMain.getDocnum().substring(fmsDocMain.getDocnum().lastIndexOf("-")+1));		
		mv.addObject("zhong", fmsDataDict1);
		mv.addObject("xia", fmsDataDict2);
		mv.addObject("doctype", doctype);
		mv.addObject("source", source);
		mv.addObject("dense", dense);
		mv.addObject("spec", spec);
		mv.addObject("carrier", carrier);
		mv.addObject("listDocBox", listDocBox);
		mv.addObject("fmsDocMain", fmsDocMain);
		mv.addObject("classtypeitem", classtypeitem);
		return mv;
	}

	@ControllerOptLog(desc="编辑文书")
	@RequestMapping(value="/editDoc")
	public String editDoc(FmsDocMain dmsDocMain ,@RequestParam( required = false,value="files") CommonsMultipartFile[] files) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改");
		PageData pd ;
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限	
		pd = this.getPageData();
		List<FmsAddFile> fmsAddFiles=new ArrayList<FmsAddFile>();
		FmsAddFile fmsandfile;
		dmsDocMain.setUserId(Jurisdiction.getUserid());

		String path=	"D:/filedata/" + new Date().getTime()+"/";
		File f=new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		if(files!=null) {
			for (CommonsMultipartFile commonsMultipartFile : files) {
				if(!commonsMultipartFile.isEmpty()){  
					fmsandfile=new FmsAddFile();
					fmsandfile.setFmsId(dmsDocMain.getId());
					fmsandfile.setId(get32UUID());
					fmsandfile.setPath(path);
					fmsandfile.setName(commonsMultipartFile.getOriginalFilename());
					fmsAddFiles.add(fmsandfile);
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

		dmsDocMain.setFmsAddFiles(fmsAddFiles);
		fmsService.updateFmsDocMain(dmsDocMain,pd.getString("deletefile"));

		return "redirect:/doc/view?fmsid="+dmsDocMain.getId();
	}

	/**删除文件
	 * @param out
	 * @throws Exception 
	 */
	@ControllerOptLog(desc="删除文书")
	@RequestMapping(value="/deleteDoc")
	public void deleteDoc(FmsDocMain dmsDocMain,PrintWriter out) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"删除user");
		PageData 	pd = this.getPageData();
		fmsService.deleteDoc(pd);
		out.write("success");
		out.close();
	}
	
	/**
	 * select count(1) as count ,FILEYEAR from  fms_docmain  group by FILEYEAR
	 * @param dmsDocMain
	 * @param out
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2018年2月4日 下午11:08:37
	 *
	 */
	@ResponseBody
	@ControllerOptLog(desc="getCountByyear")
	@RequestMapping(value="/getCountByyear")
	public Object getCountByyear() throws Exception{
	
	List<PageData> pd=	fmsService.getCountByyear();
	
		
		
		return pd;
	}
	@ResponseBody
	@ControllerOptLog(desc="getCountByyearAndcarrier")
	@RequestMapping(value="/getCountByyearAndcarrier")
	public Object getCountByyearAndcarrier() throws Exception{
		
		List<PageData> pd=	fmsService.getCountByyearAndcarrier();
		
		
		
		return pd;
	}
	@ResponseBody
	@ControllerOptLog(desc="getCountBycarrier")
	@RequestMapping(value="/getCountBycarrier")
	public Object getCountBycarrier() throws Exception{
		
		List<PageData> pd=	fmsService.getCountBycarrier();
		
		
		
		return pd;
	}

}
