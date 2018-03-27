package com.fh.service.ams.realstorage.impl;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;

import com.fh.dao.*;
import com.fh.entity.Page;
import com.fh.entity.amsmodel.*;
import com.fh.util.PageData;
import com.fh.service.ams.realstorage.RealStorageManager;

/**
 * 
 * @author kioor
 *	2016年5月11日09:34:19
 */
@Service("realstorageService")
public class RealStorageService implements RealStorageManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@Override
	public void save(PageData pd) throws Exception {
		dao.save("RealStorageMapper.save", pd);
	}
	
	@Override
	public void delete(PageData pd) throws Exception {
		dao.delete("RealStorageMapper.delete", pd);
	}
	
	@Override
	public void edit(PageData pd) throws Exception {
		 dao.update("RealStorageMapper.edit", pd);
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page) throws Exception {
		return (List<PageData>)dao.findForList("RealStorageMapper.realstoragelistPage", page);
	}



	
	@SuppressWarnings("unchecked")
	public List<PageData> typelist(Page page) throws Exception {
		return (List<PageData>)dao.findForList("RealStorageMapper.storagetypelistPage", page);
	}
	
	/**获取总数
	 * @param pd
	 * @throws Exception
	 */
	public PageData getCount(String value)throws Exception{
		return (PageData)dao.findForObject("RealStorageMapper.getProjectCount", value);
	}
	
	@Override
	public PageData findById(PageData pd) throws Exception {
		return (PageData)dao.findForObject("RealStorageMapper.findById", pd);
	}

	@Override
	public PageData findEntityByName(String namestring) throws Exception {
		return (PageData)dao.findForObject("RealStorageMapper.findPDByName", namestring);
	}
	@Override
	public int findByName(String namestring) throws Exception {
		return (int)dao.findForObject("RealStorageMapper.findByName", namestring);
	}

	@Override
	public void deleteByType(PageData pd) throws Exception {
		dao.delete("RealStorageMapper.deleteByType", pd);
	}
	
	@Override
	public void saveByType(PageData pd) throws Exception {
		dao.save("RealStorageMapper.saveByType", pd);
	}

/*	@Override
	public List<PageData> getRealstorageby(PageData pd) {
		// TODO Auto-generated method stub
		try {
		
			return (List<PageData>) dao.findForList("RealStorageMapper.getStoragetypeAnd", pd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		}
*/
	
	@Override
	public Boolean saveRAID(JSONArray jsonArrayRAID) {
		
		try {

			int raidnum = jsonArrayRAID.size();
			JSONArray json = jsonArrayRAID;
			
			
			if(raidnum>=0){

				for(int i=0;i<raidnum;i++){
					RealStorage realstorage = new RealStorage();
					realstorage.setStorageName(json.getJSONObject(i).getString("diskName"));
					realstorage.setStorageTypename(json.getJSONObject(i).getString("pathName"));
					realstorage.setActvolume(json.getJSONObject(i).getString("usableSpaceG"));
					realstorage.setVolume(json.getJSONObject(i).getString("totalSpaceG"));
					realstorage.setUnit("GB");
					realstorage.setStorageType("RAID");
					
					saveOrUpdate(realstorage);
					
				}
				return true;
			}else{

				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			return false;
		}
		
	}
	
	
	
	@Override
	public void insertSelective(RealStorage rs) throws Exception {
		dao.save("RealStorageMapper.insertSelective", rs);
	}

	@Override
	public void updateByPrimaryKeySelective(RealStorage rs) throws Exception {
		dao.save("RealStorageMapper.updateByPrimaryKeySelective", rs);
	}

	@Override
	public PageData whetherTypeNameExist(RealStorage rs) throws Exception {
		PageData pd = new PageData();
		pd.put("STORAGE_TYPENAME", rs.getStorageTypename());
		return (PageData)dao.findForObject("RealStorageMapper.findByTypeName", pd);
		
	}
    @Override
    public void saveOrUpdate(RealStorage rs) throws Exception {
        if (rs == null) {
            return;
        }
        PageData pd = new PageData();
        pd=this.whetherTypeNameExist(rs);
        if (pd!=null) {
        	try {
        		rs.setRealstorageId((Integer) pd.get("REALSTORAGE_ID"));
            	//更新数据 需要查询ID
				this.updateByPrimaryKeySelective(rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
        } else {
            try {
        		//插入数据 不需要ID
				this.insertSelective(rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }
    }

	@Override
	public List<PageData> showRealstoragecount() throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>)dao.findForList("RealStorageMapper.showRealstoragecount", null);
	}




	
}

