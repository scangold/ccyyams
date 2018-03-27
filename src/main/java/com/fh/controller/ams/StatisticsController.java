package com.fh.controller.ams;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.service.ams.statistics.StatisticsManager;
import com.fh.util.PageData;
@Controller
@RequestMapping("/statistics")
public class StatisticsController extends BaseController{
	
	@Autowired
private	StatisticsManager statisticsService;
	
	@ResponseBody
	@RequestMapping("/getAllProject")
	public PageData getAllProject() throws Exception{
		return statisticsService.getAllProject();
		
	}
	
	@ResponseBody
	@RequestMapping("/getProjectFilelist")
	public List<PageData> getProjectFilelist() throws Exception{
		return statisticsService.getProjectFilelist();
		
	}
	
	/**
	 * 提供存储列表
	 * @return
	 * @throws Exception
	 * @date:2016年9月23日 下午2:27:44
	 *
	 */
	@ResponseBody
	@RequestMapping("/getStorageTypelist")
	public List<PageData> getStorageTypelist() throws Exception{
		return null;
		
	}


	/**
	 * 提供用户列表
	 * @return
	 * @throws Exception
	 * @date:2016年9月23日 下午2:27:44
	 *
	 */
	@ResponseBody
	@RequestMapping("/getUserlist")
	public List<PageData> getUserlist() throws Exception{
		return null;
		
	}
}