package com.fh.service.fmspz.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.fms.FmsDataDict;
import com.fh.entity.fms.FmsDataDictItem;
import com.fh.entity.fms.FmsDocMain;
import com.fh.entity.fms.FmsPZDoc;
import com.fh.entity.fms.FmsPZDocBox;
import com.fh.entity.fms.FmsPZDocVolume;
import com.fh.service.fmspz.FmspzService;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;
@Service
public class FmspzServiceImpl implements FmspzService  {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Override
	public PageData listData(Page page) throws Exception {
		PageData pzlist=new PageData();
		// TODO Auto-generated method stub
		List<PageData> pzyear=	(List<PageData>)dao.findForList("FmsPZDocVolumeMapper.getyear", page);
		pzlist.put("pzyear", pzyear);
		List<PageData> pzmonth=	(List<PageData>)dao.findForList("FmsPZDocVolumeMapper.getmonth", page);
		pzlist.put("pzmonth", pzmonth);
		List<PageData> pzbox=	(List<PageData>)dao.findForList("FmsPZDocVolumeMapper.getbox", page);
		pzlist.put("pzbox", pzbox);
		List<PageData> pzvolume=	(List<PageData>)dao.findForList("FmsPZDocVolumeMapper.getvolume", page);
		pzlist.put("pzvolume", pzvolume);
		List<PageData> pzlistpage=    (List<PageData>) dao.findForList("FmsPZDocVolumeMapper.pzlistPage", page);
		pzlist.put("pzlistpage", pzlistpage);
		 return pzlist;
	}
	/**查看借阅消息
	 * 	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData listborrow(Page page) throws Exception {
		PageData pzborrow=new PageData();
		// TODO Auto-generated method stub
		List<PageData> borrowlist=	(List<PageData>)dao.findForList("FmsPZDocBoxMapper.borrowlistPage", page);
		pzborrow.put("borrowlist", borrowlist);
		 return pzborrow;
	}
	/**查看全部删除记录
	 * 	 * @param pd
	 * @throws Exception
	 */
	public PageData listAlldelete(Page page) throws Exception {
		PageData pzdelete=new PageData();
		// TODO Auto-generated method stub
		List<PageData> deletelist=	(List<PageData>) dao.findForList("FmsPZDocVolumeMapper.deletelistpage", page);
		pzdelete.put("deletelist", deletelist);
		return pzdelete;
	}
	/**去修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findById(String acdocId) throws Exception {
		PageData pzlist=	 (PageData) dao.findForObject("FmsPZDocMapper.selectByacdocId", acdocId);
		// TODO Auto-generated method stub
		List<PageData> pzbox=	(List<PageData>)dao.findForList("FmsPZDocVolumeMapper.getbox", null);
		pzlist.put("pzbox", pzbox);
		List<PageData> pzvolume=	(List<PageData>)dao.findForList("FmsPZDocVolumeMapper.getvolume", null);
		pzlist.put("pzvolume", pzvolume);

	return pzlist;
	}
	
	/**保存修改
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public	void eidtPz(PageData pd)throws Exception{
		 dao.update("FmsPZDocMapper.updateByPzdoc", pd);
		 dao.update("FmsPZDocVolumeMapper.updateByPzdocvolume", pd); 
		 dao.update("FmsPZDocBoxMapper.updateByPzdocbox", pd);
	}
	
	
	/**去新添
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData goadd(PageData pd) throws Exception {
		PageData pzlist=new PageData();
		// TODO Auto-generated method stub
		List<PageData> pzbox=	(List<PageData>)dao.findForList("FmsPZDocVolumeMapper.getbox", null);
		pzlist.put("pzbox", pzbox);
		List<PageData> pzvolume=	(List<PageData>)dao.findForList("FmsPZDocVolumeMapper.getvolume", null);
		pzlist.put("pzvolume", pzvolume);

	return pzlist;
	}
	/**保存新添
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void save(PageData pd) throws Exception {
		if(dao.findForObject("FmsPZDocBoxMapper.selectByPrimaryKey", pd.getString("ac_box_id"))==null){
			dao.save("FmsPZDocBoxMapper.insertpzdocbox", pd);
		}
		if(dao.findForObject("FmsPZDocVolumeMapper.selectByPrimaryKey", pd.getString("ac_volume_id"))==null){	
		dao.save("FmsPZDocVolumeMapper.insertpzdocvolume", pd);
		}
		dao.save("FmsPZDocMapper.insertpzdoc", pd);
	}
	
	
	/**销毁
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deletepz(PageData pd) throws Exception {
		dao.update("FmsPZDocMapper.deleteByPzdoc", pd);
	}
	
	/**去批量删除
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData godeleteall(PageData pd) throws Exception {
		PageData pzlist=new PageData();
		// TODO Auto-generated method stub
		List<PageData> pzvolume=	(List<PageData>)dao.findForList("FmsPZDocVolumeMapper.getvolume", null);
		pzlist.put("pzvolume", pzvolume);

	return pzlist;
	}
	
	/**批量销毁
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void deleteallpz(PageData pd) throws Exception {
		dao.update("FmsPZDocMapper.deleteByPzdocvolume", pd);
	}
	
	/**去借阅
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByboxId(String acboxid) throws Exception {
		PageData pzlist=	 (PageData) dao.findForObject("FmsPZDocBoxMapper.selectByacboxid", acboxid);
		// TODO Auto-generated method stub
	return pzlist;
	}
	/**保存借阅
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void borrowsave(PageData pd) throws Exception {
		String ids=pd.getString("ac_box_id");
		if(StringUtils.isNotEmpty(ids)){
		String[] idz=	ids.split(",");
		for (String id : idz) {
			pd.put("borrowid", UuidUtil.get32UUID());    //借阅ID
			pd.put("isvalid", "1");	
			pd.put("ac_box_id", id);
			dao.update("FmsPZDocBoxMapper.updateBybox", pd);
			dao.save("FmsPZDocBoxMapper.insertborrow", pd);
			dao.save("FmsPZDocBoxMapper.insertborrowpz", pd);
		}
			
		}
		
	}
	
	/**去归还
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData findByacboxId(String acboxid) throws Exception {
		PageData pzlist=	 (PageData) dao.findForObject("FmsPZDocBoxMapper.selectreturnByacboxid", acboxid);
		// TODO Auto-generated method stub
	return pzlist;
	}
	
	/**归还借阅
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public void returnborrow(PageData pd) throws Exception {
		dao.update("FmsPZDocBoxMapper.returnBybox", pd);
		dao.update("FmsPZDocBoxMapper.returnborrow", pd);
	}
	
	/**给总量
	 * @param pd
	 * @throws Exception
	 */
	@Override
	public PageData num(PageData pd) throws Exception {
		PageData pzlist=new PageData();
		List<PageData> pzyear=	(List<PageData>)dao.findForList("FmsPZDocMapper.selectyear", null);
		pzlist.put("pzyear", pzyear);
		return pzlist;
	}
	
	@Override
	public List<FmsPZDocBox> findBoxByIds(String ids) throws Exception {
		// TODO Auto-generated method stub
		
		return   (List<FmsPZDocBox>) dao.findForList("FmsPZDocBoxMapper.findBoxByIds", ids.split(","));
	}
	
	@Override
	public List<PageData> getCountByyear() throws Exception {
		// TODO Auto-generated method stub
		
		return   (List<PageData>) dao.findForList("FmsPZDocMapper.getCountByyear",null);
	}
}
