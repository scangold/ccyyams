package com.fh.controller.system.archivereceive;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.ams.prjtype.impl.PrjtypeService;
import com.fh.service.ams.project.impl.ProjectService;
import com.fh.util.PageData;

/**
 * @类名称：ArchiveController 成果管理工具 
 * @创建人：kioor
 * @修改时间：2016年4月25日15:40:11
 * 
 * @version
 */
@Controller
@RequestMapping(value = "/archiveRCSTART")
public class Archive0RCSTARTController extends BaseController {
	
	// for show project
	@Resource(name = "projectService")
	private ProjectService projectService;
	@Resource(name = "prjtypeService")
	private PrjtypeService prjtypeService;
	
	/**
	 * 0接收准备 点击菜单“成果接收”按钮 打开确定项目页面
	 * ***********************************************************
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/receive")
	public ModelAndView archiveReceive(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		// for show project list
		List<PageData> varAllList = projectService.listAll(pd); // 列出列表
		List<PageData> prjtypeList = prjtypeService.selectAll(pd);// 列出所有项目类型
		List<PageData> varList = new ArrayList<PageData>();
		for (int i = 0; i < varAllList.size(); i++) {
			PageData vpd = new PageData();
			vpd.put("PRJ_ID", varAllList.get(i).get("PRJ_ID")); // 项目序号
			// //vpd.put("COVERAGE_ID",
			// varAllList.get(i).getString("COVERAGE_ID")); //覆盖区域序号
			vpd.put("PRJTYPE", varAllList.get(i).get("PRJTYPE")); // 项目类型
			// vpd.put("PRJTYPE_NAME",
			// varAllList.get(i).getString("PRJTYPE_NAME")); //项目类型名称
			// vpd.put("PRJTYPE_REMARK",
			// varAllList.get(i).getString("PRJTYPE_REMARK")); //项目类型备注
			vpd.put("PRJ_NAME", varAllList.get(i).getString("PRJ_NAME")); // 项目名称
			vpd.put("PRJ_ORIGIN", varAllList.get(i).getString("PRJ_ORIGIN")); // 项目来源
			vpd.put("PRJ_LEADER", varAllList.get(i).getString("PRJ_LEADER")); // 项目负责人
			vpd.put("PRJ_DEPART", varAllList.get(i).getString("PRJ_DEPART")); // 项目负责单位部门
			// //vpd.put("PRJ_STRATTIME",
			// varAllList.get(i).getString("PRJ_STRATTIME")); //项目开始时间
			// //vpd.put("PRJ_ENDTIME",
			// varAllList.get(i).getString("PRJ_ENDTIME")); //项目结束时间
			// //vpd.put("PRJ_PROGRESS",
			// varAllList.get(i).getString("PRJ_PROGRESS")); //项目进度情况
			// //vpd.put("PRJ_REMARK",
			// varAllList.get(i).getString("PRJ_REMARK")); //项目备注
			// //vpd.put("USER_ID", varAllList.get(i).getString("USER_ID"));
			// //用户序号
			vpd.put("YEAR", varAllList.get(i).getString("YEAR")); // 项目开始年份
			vpd.put("RECORD_LIMIT", varAllList.get(i).getString("RECORD_LIMIT")); // 项目保存时间
			vpd.put("SECURITY_CLASS",varAllList.get(i).getString("SECURITY_CLASS")); // 项目密级
			// vpd.put("PRO_NUM", varAllList.get(i).getString("PRO_NUM"));
			// //项目编号
			varList.add(vpd);
		}// for show project list

		mv.setViewName("system/archive/ARproject");

		mv.addObject("varList", varList);// for show project
		mv.addObject("prjtypeList", prjtypeList);// for show project

		mv.addObject("pd", pd);
		
		return mv;
	}

}

// 创建人kioor2016年4月25日16:36:10