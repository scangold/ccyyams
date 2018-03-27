package com.fh.controller.fmspz;

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

import com.common.annotation.ControllerOptLog;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDocMain;
import com.fh.entity.fms.FmsPZDoc;
import com.fh.entity.fms.FmsPZDocBox;
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
@RequestMapping(value="/pz")
public class PzdocvolumeController extends BaseController {
	
	String menuUrl = "pz/pzlist.do";
	@Resource
	private FmspzService fmspzService;
	
	@RequestMapping(value = "/pzlist")
	public ModelAndView listData(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setOrder("DESC");
		page.setSort("acdoc_year");
		page.setPd(pd);
		PageData	dataList = fmspzService.listData(page);
		mv.addObject("dataList", dataList);
		mv.addObject("pd", pd);
		mv.setViewName("system/fmspz/pzlist");
		mv.addObject("QX",Jurisdiction.getHC());
		return mv;

	}
	/**删除查看
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/pzdellist")
	public ModelAndView pzdellist(Page page) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setOrder("DESC");
		page.setSort("acdoc_year");
		page.setPd(pd);
		PageData	dataList = fmspzService.listAlldelete(page);
		mv.addObject("dataList", dataList);
		mv.addObject("pd",pd);
		mv.setViewName("system/fmspz/pzdellist");
		mv.addObject("QX",Jurisdiction.getHC());
		return mv;

	}
	
	/**借阅列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/pzborrow")
	public ModelAndView pzborrow(Page page) throws Exception{
		
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setOrder("DESC");
		page.setSort("acdoc_box");
		page.setPd(pd);
		PageData   dataList = fmspzService.listborrow(page);
		mv.addObject("dataList", dataList);
		mv.addObject("pd",pd);
		mv.setViewName("system/fmspz/pzborrowlist");
		mv.addObject("QX",Jurisdiction.getHC());
		return mv;

	}

	/**去编辑
	 * 
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2017年8月7日 上午10:34:34
	 *
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit(Page page) throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = fmspzService.findById(pd.getString("acdocId"));
		//根据ID读取		
		pd.put("fmsPZDoc", pd);
		mv.setViewName("system/fmspz/pzedit");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存编辑
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/edit")
	public ModelAndView  edit() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		pd.put("REFRESHTIME", time);
		fmspzService.eidtPz(pd);
		mv.addObject("msg","成功");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去新增页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd=fmspzService.goadd(pd);
		pd.put("fmsPZDoc", pd);
		mv.setViewName("system/fmspz/pzadd");
		mv.addObject("msg", "add");
		mv.addObject("pd", pd);
		return mv;
	}	
	
	/**新增
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="新增凭证")
	@RequestMapping(value="/save")
	public ModelAndView add() throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		logBefore(logger, Jurisdiction.getUsername()+"新增pz");
		ModelAndView mv = this.getModelAndView();
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		//ID 盒子
		if(!pd.containsKey("ac_box_id")|| StringUtils.isEmpty(pd.getString("ac_box_id")) ){
			pd.put("ac_box_id", this.get32UUID());
		}
        //ID 册子
        if(!pd.containsKey("ac_volume_id")|| StringUtils.isEmpty(pd.getString("ac_volume_id")) ){
        	pd.put("ac_volume_id", this.get32UUID());	
        }
		pd.put("acdoc_id", this.get32UUID());    //ID 凭证
		pd.put("destroied", "0");
		pd.put("isvalid", "0");
		try{
			fmspzService.save(pd);
			mv.addObject("msg","成功");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","失败");
		}	
		mv.setViewName("save_result");

		return mv;
	}
	
	/**去注销页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goDelete")
	public ModelAndView goDeletepz()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "delete")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = fmspzService.findById(pd.getString("acdocId"));
		pd.put("fmsPZDoc", pd);
		mv.setViewName("system/fmspz/pzdelete");
		mv.addObject("msg", "add");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**注销
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="注销凭证")
	@RequestMapping(value = "/deletepz")
	public ModelAndView  deletepz() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		pd.put("REFRESHTIME", time);
		pd.put("destroy_id", this.get32UUID());
		pd.put("destroied", "1");
		fmspzService.deletepz(pd);
		mv.addObject("msg","成功");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去批量删除页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goDeleteall")
	public ModelAndView goDeleteall()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "delete")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd=fmspzService.godeleteall(pd);
		pd.put("fmsPZDoc", pd);
		mv.setViewName("system/fmspz/pzdeleteall");
		mv.addObject("msg", "add");
		mv.addObject("pd", pd);
		return mv;
	}

	/**批量注销
	 * @return
	 * @throws Exception
	 */
	@ControllerOptLog(desc="批量注销凭证")
	@RequestMapping(value = "/deleteallpz")
	public ModelAndView  deleteallpz() throws Exception {
		PageData pd = new PageData();
		pd = this.getPageData();
		ModelAndView mv = this.getModelAndView();
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		pd.put("REFRESHTIME", time);
		pd.put("destroy_id", this.get32UUID());
		pd.put("destroied", "1");
		fmspzService.deleteallpz(pd);
		mv.addObject("msg","成功");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**去借阅
	 * 
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2017年8月7日 上午10:34:34
	 *
	 */
	@RequestMapping(value="/goBorrow")
	public ModelAndView goBorrow(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = fmspzService.findByboxId(pd.getString("acboxid"));
		//根据ID读取		
		pd.put("fmsPZBorrow", pd);
		mv.setViewName("system/fmspz/pzborrow");
		mv.addObject("msg", "borrow");
		mv.addObject("pd", pd);
		return mv;
	}
	
	/**保存借阅
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value="/borrowpz")
	public ModelAndView borrowpz() throws Exception{
		ModelAndView mv = this.getModelAndView();
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		pd.put("borrowid", this.get32UUID());    //借阅ID
		pd.put("isvalid", "1");
		
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    pd.put("starttime", f.format(new Date()));
		try{
			fmspzService.borrowsave(pd);
			mv.addObject("msg","成功");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","失败");
		}	
		mv.setViewName("save_result");

		return mv;
	}
	
	/**去归还
	 * 
	 * @return
	 * @throws Exception
	 * @email:401701706@qq.com
	 * @date:2017年8月7日 上午10:34:34
	 *
	 */
	@RequestMapping(value="/goreturn")
	public ModelAndView goreturn(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = fmspzService.findByacboxId(pd.getString("acboxid"));
		//根据ID读取		
		pd.put("fmsPZreturn", pd);
		mv.setViewName("system/fmspz/pzreturn");
		mv.addObject("msg", "borrow");
		mv.addObject("pd", pd);
		return mv;
	}
	
	
	/**保存归还
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value="/returnborrow")
	public ModelAndView returnborrow() throws Exception{
		ModelAndView mv = this.getModelAndView();
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = this.getPageData();
		pd.put("isvalid", "0");
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		pd.put("NOWENDTIME", time);
		try{
			fmspzService.returnborrow(pd);
			mv.addObject("msg","成功");
		}catch (Exception e) {
			// TODO: handle exception
			mv.addObject("msg","失败");
		}	
		mv.setViewName("save_result");

		return mv;
	}
	
	/**去批量借阅
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/goborrowall")
	public ModelAndView goborrowall()throws Exception{
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd =this.getPageData();
		String ids=pd.getString("ids");
		String[] idsz= ids.split(",");

		List<FmsPZDocBox> FmsPZDocBoxs= fmspzService.findBoxByIds(ids);
		mv.setViewName("system/fmspz/pzborrowall");
		mv.addObject("FmsPZDocBoxs", FmsPZDocBoxs);
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		return mv;
	}
	
	@ResponseBody
	@ControllerOptLog(desc="getCountByyear")
	@RequestMapping(value="/getCountByyear")
	public Object getCountByyear() throws Exception{
	
	List<PageData> pd=	fmspzService.getCountByyear();
	
		
		
		return pd;
	}
	@ResponseBody
	@RequestMapping(value = "/aa")
	public List<PageData> aa() throws Exception{
		
		return (List<PageData>) fmspzService.listData(null);
	}
}
