package com.fh.controller.system.archivereceive;

import java.util.List;
import javax.annotation.Resource;
import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.ams.CheckFileClass;
import com.fh.controller.ams.KioorTools;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.Receive;
import com.fh.service.ams.file.impl.FileService;
import com.fh.service.ams.receive.impl.AReceiveService;
import com.fh.util.DateUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/**
 * 类名称：ArchiveController 成果管理工具 创建人：kioor 修改时间：2016年4月25日15:40:11
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/archiveRCREG")
public class Archive4RCREGController extends BaseController {
	
	// for save and show receive table
	@Resource(name = "areceiveService")
	private AReceiveService areceiveService;
	@Resource(name = "fileService")
	private FileService fileService;

	/**
	 * 4完成注册 ***********************************************************
	 * A填写接收表、B填写文件表
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/arFinish")
	public ModelAndView arFinish(Page page) throws Exception {
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
		//是否电子成果
		String IFDIGIT = (String) arfinishsession.getAttribute("arIfdigit");
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
		receive.setRegisterId(Integer.parseInt((String)pd.get("REGISTER_ID")));
		receive.setPrjId((int)arfinishsession.getAttribute("arSelectprjID"));
		receive.setCheckdetails((String)arfinishsession.getAttribute("checkExcelfileName"));
		
		//插入实体receive
		areceiveService.save(receive);

		//获得插入实体到接收表的自增长主键 rcId

		//arfinishsession.setAttribute("receive", receive);
		
		/* A接收表填写数据库操作*********end********** */
		
		
		
		
		/* B文件表ams_file填写开始 数据库操作*********** */
		//java.util.List<PageData> varPDList = (java.util.List<PageData>)pd.get("varPDList");
		//需保证session有此varPDList
		@SuppressWarnings("unchecked")
		java.util.List<PageData> varPDList = (List<PageData>) arfinishsession.getAttribute("varPDList");
		
		//加入接收序号 以及其他参数之后 添加进ams_file表 ********该过程应该要更改 暂且如是 期能者优化之（xml 事务管理之类 ）***
		CheckFileClass checkfile = new CheckFileClass();
		int RC_ID = receive.getRcId();
		String IFARCHIVE = (String) arfinishsession.getAttribute("arIFArchiveID");/*
		String PERMISSION_CLASS = pd.getString("PERMISSION_CLASS");
		String FILE_TYPE = pd.getString("FILE_TYPE");
		String FILE_UNIT ="K";*/

		//EXCEL 
		List<PageData> varPDListadd = checkfile.listAddRCID(varPDList,RC_ID,IFDIGIT,IFARCHIVE);

		//插入扫描上传文件的文件详情到 文件列表ams_file
		fileService.savecheckArray(varPDListadd);
		
		/*#{RC_ID},
		#{FILE_NAME},
		#{IFDIGIT},
		#{DATAFORM},
		#{FILE_URL},
		#{VOLUME},
		#{UNIT},
		#{IFARCHIVE},
		#{FILE_TYPE},
		#{FILE_REMARK},
		#{PERMISSION_CLASS}*/
		
		
		

		/* B文件表ams_file填写数据库操作*********end********** */
		
		
		
		
		
		
		mv.setViewName("system/archive/ARfinish");
		mv.addObject("pd", pd);
		return mv;
	}

	
}

// 创建人kioor2016年4月25日16:36:10