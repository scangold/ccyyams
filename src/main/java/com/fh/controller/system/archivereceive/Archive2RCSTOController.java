package com.fh.controller.system.archivereceive;

import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.ams.KioorTools;
import com.fh.controller.base.BaseController;
import com.fh.entity.amsmodel.FileDetail;
import com.fh.entity.amsmodel.Receive;
import com.fh.entity.amsmodel.ReceiveTemp;
import com.fh.entity.amsmodel.Storage;
import com.fh.entity.system.User;
import com.fh.service.ams.file.FileManager;
import com.fh.service.ams.realstorage.RealStorageManager;
import com.fh.service.ams.receivetemp.AReceiveTempManager;
import com.fh.service.ams.storage.StorageManager;
import com.fh.util.Const;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;


/**
 * 类名称：ArchiveController 成果管理工具 创建人：kioor 修改时间：2016年4月25日15:40:11
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/archiveRCSTO")
public class Archive2RCSTOController extends BaseController {

	@Resource(name = "areceiveTempService")
	private AReceiveTempManager areceiveTempService;

	@Resource(name = "storageService")
	private StorageManager storageService;
	

	@Resource(name = "fileService")
	private FileManager fileService;
	
	
	
	/**
	 * 2注册存储介质 ***********************************************************
	 * 选择已注册介质 或注册新介质
	 * 
	 * 之后打开接收页面 ***********************************************************
	 * 
	 * @param file
	 * @return
	 * @throws ParseException 
	 * @throws Exception
	 */
	@RequestMapping(value = "/setstorage")
	public ModelAndView setStorage() throws ParseException{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();

		Session receivesession = Jurisdiction.getSession();

		//本操作用户
		User user = (User) receivesession.getAttribute(Const.SESSION_USERROL);	//将用户信息存入project表后 再编辑下面的逻辑
		String username = user.getNAME();
		//用户id
		String userid = user.getUSER_ID();
		
		
		
		// 多页面间 利用session传值
		// 已注册则获取存储介质ID NAME
		String arIfdigit = pd.getString("selectFileEorM");// 选择文件类型（1电子2模拟)
		String arStoragetype = pd.getString("TYPE");// 存储介质类型（1硬盘2光盘3案卷4库体5磁盘阵列）

		try {
			receivesession.setAttribute("arIfdigit", arIfdigit);
			receivesession.setAttribute("arStoragetype", arStoragetype);

			// 根据arStoragetype、arStorageoldnew参数
			// 判断并用session记录:成果档案管理员所填写有关存储介质的值
			int i = Integer.parseInt(arStoragetype);
			
			//可以优化！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！有时间再弄~~~~~~~~~
			switch (i) {
			case 1:
					String aroldhdid = pd.getString("storageIDinput");// 已注册硬盘ID
					String aroldhdname = pd.getString("storageNAMEinput");// 已注册硬盘Name
					receivesession.setAttribute("arstorageid", aroldhdid);
					receivesession.setAttribute("arstoragename", aroldhdname);
					// 成果接收最后的注册页面 确认时 调用新介质注册service服务添加该存储介质ss
				break;
			case 2:
					String aroldcdid = pd.getString("storageIDinput");// 已注册光盘ID
					String aroldcdname = pd.getString("storageNAMEinput");// 已注册光盘Name
					receivesession.setAttribute("arstorageid", aroldcdid);
					receivesession.setAttribute("arstoragename", aroldcdname);
				break;

			case 3:
					String aroldajid = pd.getString("storageIDinput");// 已注册案卷ID
					String aroldajname = pd.getString("storageNAMEinput");// 已注册案卷Name
					receivesession.setAttribute("arstorageid", aroldajid);
					receivesession.setAttribute("arstoragename", aroldajname);
				break;

			case 4:
					String aroldktid = pd.getString("storageIDinput");// 已注册案卷ID
					String aroldktname = pd.getString("storageNAMEinput");// 已注册案卷Name
					receivesession.setAttribute("arstorageid", aroldktid);
					receivesession.setAttribute("arstoragename", aroldktname);
				break;

			case 5:
/*					String aroldriadName = pd.getString("oldRIAD-select");// 已注册磁盘阵列盘符
					String aroldraidName = pd.getString("oldRIAD-select").split("&&")[0];// 已注册磁盘名
					String aroldraidPath = pd.getString("oldRIAD-select").split("&&")[1];// 已注册磁盘盘符路径
					receivesession.setAttribute("aroldraidPath", aroldraidPath);//将已选择的磁盘阵列盘符路径存入session
				break;*/
				String aroldriadid = pd.getString("storageIDinput");// 已注册硬盘ID
				String aroldriadName = pd.getString("storageNAMEinput");// 已注册硬盘Name
				receivesession.setAttribute("arstorageid", aroldriadid);
				receivesession.setAttribute("arstoragename", aroldriadName);
				
			break;
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 选择存储介质完毕
		
		
		//注册存储介质ams_storage 存储介质在此之前应当先录入存储介质表//storage表需录入STORAGE_ID REGISTER(即userid) REGIST_TIME 自动输入REGISTER_ID
		Storage storage = new Storage();
		storage.setStorageId(Integer.parseInt((String) receivesession.getAttribute("arstorageid")));  //真实存储介质ID**********************************
		storage.setRegister(userid);     															  //注册人**********************************
		storage.setRegistTime(KioorTools.TimeStringToDatatime(DateUtil.getSdfTimes()));				  //注册时间**********************************
		
		//存入storage
		try {
			storageService.save(storage);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//创建临时接收表记录ams_receive_temp
		ReceiveTemp receivetemp =  new ReceiveTemp();
		
		java.sql.Timestamp sqldatetime = KioorTools.TimeStringToDatatime(DateUtil.getSdfTimes());
		

		int arSelectprjID = (int) receivesession.getAttribute("arSelectprjID");//所选择项目ID
		String arSelectprjName = (String) receivesession.getAttribute("arSelectprjName");//所选项目名称
		int registerid = storage.getRegisterId();//获取storage表的register_id
		int STORAGE_ID = Integer.parseInt((String) receivesession.getAttribute("arstorageid"));//选择的真实存储ID
		String arstoragename = (String) receivesession.getAttribute("arstoragename");//选择的存储类型名称
		receivetemp.setUserId(userid);
		receivetemp.setPrjId(arSelectprjID);
		receivetemp.setRegisterId(registerid);
		receivetemp.setIfdigit(arIfdigit);
		receivetemp.setStorageType(arStoragetype);
		receivetemp.setIfarchive("4");
		receivetemp.setRctempTime(sqldatetime);
		
		//存入areceiveTemp
		try {
			areceiveTempService.save(receivetemp);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		receivesession.setAttribute("receivetemp", receivetemp);//receivetemp
		*/
		pd.put("RctempId", receivetemp.getRctempId());
		pd.put("PRJ_ID", receivetemp.getPrjId());
		pd.put("PRJ_NAME", arSelectprjName);
		pd.put("registerid", receivetemp.getRegisterId());
		pd.put("STORAGE_ID", STORAGE_ID);
		pd.put("arstoragename", arstoragename);
		pd.put("USERNAME", username);
		pd.put("USER_IDstr", userid);
		pd.put("FILE_URL", arstoragename+"/"+"成果项目"+"/"+DateUtil.getYear()+"/"+arSelectprjID+arSelectprjName+"/"+receivetemp.getRctempId()+"/");
		
		
		
		
		System.out.println("select storage over");
		mv.setViewName("system/archive/ARhandreceive");
		mv.addObject("type", arStoragetype);
		mv.addObject("pd", pd);
		return mv;
		
	}

	@ResponseBody
	@RequestMapping("/uploadArcRcByhand")
	public Object uploadArcRcByhand(@RequestParam(value = "file", required = false) CommonsMultipartFile[] files,
			HttpServletRequest request, Model model,
			ReceiveTemp rctemp,Receive rc,
			com.fh.entity.amsmodel.File f,FileDetail fdetail,
			Integer storageIds) throws Exception {
		HttpSession session = this.getRequest().getSession();
		User user = (User) session.getAttribute(Const.SESSION_USER);
		String fileurl = f.getFileUrl();
		f.setFileUrl(fileurl+f.getFileName());
		//手动输入的内容保存
		PageData pd = fileService.saveHandRCFiles(files,rctemp, rc, f, fdetail, user);
		model.addAttribute("pd", pd);
		
		//跳至完成页面
		ModelAndView mv = this.getModelAndView();
		System.out.println("成果接收填写表单完成");
		mv.setViewName("system/archive/ARfinish");
		mv.addObject("pd", pd);
		mv.addObject("rcId", rc.getRcId());
		return mv;
	}


}

// 创建人kioor2016年4月25日16:36:10