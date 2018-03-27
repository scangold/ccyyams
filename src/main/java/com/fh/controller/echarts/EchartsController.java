package com.fh.controller.echarts;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.fms.FmsDataDictItem;
import com.fh.service.fmspz.FmspzService;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

/** 
 * 类名称：UserController
 * 创建人：
 * 更新时间：
 * @version
 */
@Controller
@RequestMapping(value="/echarts")
public class EchartsController extends BaseController {
	
	String menuUrl = "echarts/index.do";
	@Resource
	private FmspzService fmspzService;
	
	@RequestMapping(value = "/index")
	public ModelAndView index(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("echarts/storage");
		mv.addObject("QX",Jurisdiction.getHC());
		return mv;

	}

	
    @ResponseBody
	@RequestMapping(value="/test")
	public PageData num() throws Exception {
		PageData pd = this.getPageData();
		return fmspzService.num(pd);

	}
}
