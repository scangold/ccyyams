package com.fh.controller.system.archivereceive;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.amstools.GetRAIDDiskpartition;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.Receive;
import com.fh.entity.system.User;
import com.fh.service.ams.cdm.impl.CdmService;
import com.fh.service.ams.fdm.impl.FdmService;
import com.fh.service.ams.hdm.impl.HdmService;
import com.fh.service.ams.realstorage.RealStorageManager;
import com.fh.util.Const;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

import net.sf.json.JSONObject;

/**
 * 类名称：ArchiveController 成果管理工具 创建人：kioor 修改时间：2016年4月25日15:40:11
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/archiveRCPRJ")
public class Archive1RCPRJController extends BaseController {


	@Resource(name = "realstorageService")
	private RealStorageManager realstorageService;

	
	/**
	 * 1确定项目 并将项目编号PRJ_ID传递给后续页面 打开注册存储介质页面
	 * ***********************************************************
	 * 
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/setproject")
	public ModelAndView setProject(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);

		// 多页面间 利用session传值
		String arProjectoldnew = pd.getString("ifprojectnew-radio");// 1已有项目或2新项目
		int arSelectprjID =  Integer.parseInt(pd.getString("projectIDinput"));// 1已有项目ID即PRJ_ID
		String arSelectprjName = pd.getString("projectNAMEinput");// 1已有项目ID即PRJ_ID
		try {
			Session projectsession = Jurisdiction.getSession();
/*			projectsession.setAttribute("arProjectoldnew", arProjectoldnew);*/
			projectsession.setAttribute("arSelectprjID", arSelectprjID);
			projectsession.setAttribute("arSelectprjName", arSelectprjName);
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/*// 为第二步 存储介质列表选择传值做准备forStorageList
		List<PageData> StorageList = realstorageService.list(page);*/

		// 查询服务器有多少磁盘
		GetRAIDDiskpartition getraid = new GetRAIDDiskpartition();
		List<Map> fuwuqiraidpartition = getraid.getRAIDDiskpartion();
		net.sf.json.JSONArray jsonArrayRAID = net.sf.json.JSONArray.fromObject(fuwuqiraidpartition);	
		//磁盘信息：本地磁盘 C:\容量大小100G 可用容量大小50G
		
		
		
		// 更新realstorage表中的磁盘记录
		// 先更新旧记录 已有磁盘分区名称的可用容量等内容的更新（每次查询存储介质表都需要查询并更新容量大小记录）
		// 如果有新磁盘分区 添加新记录           realstorage表中Storagetype=5的内容
		//未写服务？??????????????????????????????????????????????????????????????????realstorageService

		
		Boolean tf = realstorageService.saveRAID(jsonArrayRAID);
		if(tf==true){

			// 选择项目完毕
			System.out.println("select project over Start select storage");
			// 设置传输页面内容
			mv.setViewName("system/archive/ARstorage");
			mv.addObject("RAIDList", fuwuqiraidpartition);// for show RAID
			
			mv.addObject("pd", pd);
			return mv;
		}else{
			mv.addObject("msg","failed");

			mv.setViewName("save_result");
			return mv;
		}
		
	}

	

}

// 创建人kioor2016年4月25日16:36:10