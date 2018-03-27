package com.fh.service.ams.apply.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fh.dao.ApplyFileMapper;
import com.fh.dao.ApplyMapper;
import com.fh.dao.ApplyStuteMapper;
import com.fh.dao.ArchDistributeFileMapper;
import com.fh.dao.ArchDistributeMapper;
import com.fh.dao.DaoSupport;
import com.fh.dao.FileMapper;
import com.fh.dao.SharepathuserMapper;
import com.fh.entity.Page;
import com.fh.entity.Result;
import com.fh.entity.amsmodel.Apply;
import com.fh.entity.amsmodel.ApplyFile;
import com.fh.entity.amsmodel.ApplyStute;
import com.fh.entity.amsmodel.ArchDistribute;
import com.fh.entity.amsmodel.ArchDistributeFile;
import com.fh.service.ams.apply.ApplyManager;
import com.fh.util.FileUtil;
import com.fh.util.PageData;


@Service
public class ApplyService implements ApplyManager{
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource
	private ApplyMapper applyDao;
	@Resource
	private FileMapper fileDao;

	@Resource
	private ApplyFileMapper applyFileDao;
	@Resource
	private ArchDistributeFileMapper archDistributeFileDao;
	@Resource
	private ApplyStuteMapper applyStuteDao;

	@Resource
	private SharepathuserMapper sharepathuser;




	@Resource
	private ArchDistributeMapper archDistributeDao;

	@Override
	public List<Apply> getApplyList() throws Exception {
		// TODO Auto-generated method stub
		return (List<Apply>) dao.findForList("com.fh.dao.ApplyMapper.showApplylistpage", null);
	}

	@Override
	public List<PageData> showApplylistpage(Page page) throws Exception {
		return applyDao.showApplylistPage(page);
		// TODO Auto-generated method stub

	}

	@Override
	public PageData getApplyDesc(int apply_id) {
		// TODO Auto-generated method stub
		PageData pd=new PageData();
		PageData pda=applyDao.selectByApplyKeymy(apply_id);
		pd.put("apply", pda);
		List<PageData> applyFiles= applyFileDao.selectByApplyKey(apply_id);	
		pd.put("applyFiles", applyFiles);
		List<PageData> applyStutes =  applyStuteDao.selectByApplyKey(apply_id);
		pd.put("applyStutes", applyStutes);
		return pd;
	}

	@Override
	public Result save(Apply apply,String fileIds) {
		// TODO Auto-generated method stub

		Result r=new Result<Apply>();
		System.out.println(apply);
		int i=	 applyDao.insertSelective(apply);
		System.err.println(i+"------------------");
		if(i>=0){
			if(fileIds!=null&&fileIds!=""&&!"".equals(fileIds)){
				String[] ids=fileIds.trim().split(",");
				for (String string : ids) {
					ApplyFile af=new ApplyFile();
					af.setFileId(Integer.parseInt(string));
					af.setApplyId(apply.getApplyId());
					applyFileDao.insertSelective(af);
				}		
			}

			r.setResult(true);		
		}else{
			r.setResult(false);	
		}

		r.setRes(apply);
		return r;
	}

	@Override
	public Result saveapplyStute(ApplyStute applyStute) {
		// TODO Auto-generated method stub
		int i=   applyStuteDao.insertSelective(applyStute);
		Result r=new Result<Apply>();
		if(i>=0){
			r.setResult(true);		
		}else{
			r.setResult(false);	
		}
		r.setRes(applyStute);
		return r;
	}

	@Override
	public Result saveArchdistribute(String userIds, String user_ID, String desc, String files,Integer applyId) throws Exception {
		// TODO Auto-generated method stub
		ArchDistribute ar; 
		Map map=new HashMap<>();
		Result r =  new Result<>();;
		r.setResult(true);		
		if(null==applyId||"".equals(applyId)){ //


			String[]   users=  userIds.trim().split(",");
			for (String u : users) {
				PageData pd = sharepathuser.selectPathbyuserId(u);
				if(pd==null){
					r.setResult(false);
					r.setDesc("用户id:"+u+",共享地址不存在");
					return r;
				}
				PageData pdss=(PageData) new PageData();
				pdss.put("USER_ID", u);
				PageData pds=	(PageData) dao.findForObject("UserMapper.getUsernameAndName",pdss);
			
				String[]  filesz  =	 files.trim().split(",");
				ar=new ArchDistribute();
				ar.setUserId2(user_ID);
				ar.setUserId(u);

				ar.setDistributeRemark(desc);
				ArchDistributeFile arf;
				int ta=archDistributeDao.insertSelective(ar);
				final String path=pd.getString("path")+"/"+pds.getString("USERNAME")+"/"+ar.getDistributeId()+"/";	
				if(!new File(path).exists()){
					new File(path).mkdirs();

				}else{
					new File(path).delete();
					new File(path).mkdirs();


				}
				System.out.println(ar);
				if(ta>=0){	

					for (final String file : filesz) {
						arf=new ArchDistributeFile();
						arf.setDistributeId(ar.getDistributeId());

						if(null==u||"".equals(u)||null==file||"".equals(file)||!file.matches("^[0-9]*[1-9][0-9]*$")){
							arf.setMess("没有文件，请自己来取");
							arf.setStute(0);
							archDistributeFileDao.insertSelective(arf);
							continue;	
							}				

						PageData pd2=	(PageData) dao.findForObject("FileMapper.selectPathByPrimaryKey", file);
						final String filepath=	pd2.getString("filepath");


						if(filepath==null||"".equals(filepath)){
							map.put(file, "文件地址为空，没有拷贝");
							arf.setMess("文件地址为空，请联系管理员");
							arf.setStute(0);
							arf.setFileId(Integer.parseInt(file));
							archDistributeFileDao.insertSelective(arf);
							continue;

						}
						
					
						if(!new File(filepath).exists()){

							map.put(file, "文件地址不存在");
							arf.setMess("文件不在服务器上，请联系管理员");
							arf.setStute(0);
							arf.setFileId(Integer.parseInt(file));
							archDistributeFileDao.insertSelective(arf);
							continue;
						}
		
				   if(	getsize(new File(filepath))>5368709120L){

							map.put(file, "文件大于5G");
							arf.setMess("文件大于5G，请联系管理员");
							arf.setStute(0);
							arf.setFileId(Integer.parseInt(file));
							archDistributeFileDao.insertSelective(arf);
							continue;
						}
						
						
						arf.setMess("文件已经拷贝到共享目录！");
						arf.setStute(1);
						arf.setFileId(Integer.parseInt(file));
						archDistributeFileDao.insertSelective(arf);


						new Thread(new Runnable() {
							public void run() {								
								try {
									FileUtil.copy(filepath, path, filepath);
								} catch (Exception e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							}
						}).start(); 	



					}

				}



			}
		}else{	

			Apply ap=	applyDao.selectByPrimaryKey(applyId);
			String u=ap.getUserId();
			PageData pd = sharepathuser.selectPathbyuserId(u);
			if(pd==null){
				r.setResult(false);
				r.setDesc("用户id:"+u+",共享地址不存在");
				return r;
			}

			Apply apply= applyDao.selectByPrimaryKey(applyId);
			ar=new ArchDistribute();
			ar.setApplyId(applyId);
			ar.setUserId2(user_ID);
			ar.setUserId(u);
			ar.setDistributeRemark("来自申请表id="+applyId);
			if(archDistributeDao.insertSelective(ar)>=0){
				final String path=pd.getString("path");
				List<PageData> list=	applyFileDao.selectByApplyKey(applyId);
				System.err.println(list.size());
				ArchDistributeFile arf;
				if(list.equals(null)){	
					arf=new ArchDistributeFile();
					arf.setMess("没有文件，请自己来取");
					arf.setStute(0);
					arf.setDistributeId(ar.getDistributeId());			
					archDistributeFileDao.insertSelective(arf);

					r.setDesc("没有文件，请他自己来取");
					r.setResult(true);
					return r;
				}
				for (final PageData pageData : list) {	
					final String filepath=pageData.getString("FILE_URL");
					arf=new ArchDistributeFile();
					String fileId=pageData.get("FILE_ID").toString();
					arf.setFileId(Integer.parseInt(fileId));				
					arf.setStute(1);
					arf.setDistributeId(ar.getDistributeId());				

					if(filepath==null||"".equals(filepath)){
						map.put( "fileID："+pageData.get("FILE_ID"), "文件地址为空，没有拷贝");
						arf.setMess("文件地址为空，请自己来取");
						arf.setStute(0);
						archDistributeFileDao.insertSelective(arf);
						continue;

					}
					if(!new File(filepath).exists()){
						map.put("fileID："+pageData.get("FILE_ID"), "文件地址不存在");
						arf.setMess("文件不在服务器，请自己来取");
						arf.setStute(0);
						archDistributeFileDao.insertSelective(arf);
						continue;
					}				
					arf.setMess("文件已拷贝到共享目录");
					arf.setStute(1);
					archDistributeFileDao.insertSelective(arf);
					new Thread(new Runnable() {
						public void run() {									
							try {
								FileUtil.copy(filepath, path, filepath);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}).start();;  	

				}



			}
		}
		r.setResult(true);
		r.setRes(map);
		return r;
	}
	public Result saveArchdistribute2(String userIds, String user_ID, String desc, String files,Integer applyId) throws Exception {
		Result r =  new Result<>();;
		r.setResult(true);		
		String[] filess;
		if(null==applyId||"".equals(applyId)){ //	
			filess=files.split(",");

		}
		List<PageData> list=	applyFileDao.selectByApplyKey(applyId);

		return r;


	}

	@Override
	public List<PageData> showArchdistributelistPage(Page page) {
		// TODO Auto-generated method stub

		return archDistributeDao.selectarchDistributelistPage(page);
	}

	@Override
	public PageData getArchiverecordDesc(Integer id) {
		// TODO Auto-generated method stub
		PageData pd=new PageData();
		List<PageData>  ar=	archDistributeDao.selectArchivereByPrimaryKey(id);
		pd.put("archDistribute", ar.get(0));
		List<PageData> listf=archDistributeDao.selectarchDistributebyarchDistributeId(id);
		pd.put("listf", listf);

		Object obj=  ar.get(0).get("APPLY_ID");
		if(obj==null){
			System.err.println(obj);
		}else{
			PageData pda=applyDao.selectByApplyKeymy((int)obj);
			pd.put("apply", pda);
			List<PageData> applyFiles= applyFileDao.selectByApplyKey((int)obj);	
			pd.put("applyFiles", applyFiles);
			List<PageData> applyStutes =  applyStuteDao.selectByApplyKey((int)obj);
			pd.put("applyStutes", applyStutes);
		}

		return pd;
	}

	@Override
	public List<PageData> showApplyStutecount() {
		// TODO Auto-generated method stub
		return applyDao.getApplyStutecount();
	}

	static long getsize(File f){
		long size=0;
		if(f.isDirectory()){

		 File[] fs=	f.listFiles();
		  for (File file : fs) {	
			  size+=  getsize(file);
		    }

		}
		if(f.isFile()){
		size+=f.length();
		}
		return size;
		
	}

}
