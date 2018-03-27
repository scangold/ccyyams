package com.fh.service.log;


import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import org.apache.catalina.connector.ResponseFacade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.common.utils.JsonUtil;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.log.Optlog;
import com.fh.util.PageData;
import com.fh.util.UuidUtil;


@Service("OperateLogService")
public class OptLogServiceImpl implements OptLogService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;

	@Override
	public void log(String optName,String method, String url,String ip,String userId,Object... args) throws Exception {
		Optlog log=new Optlog();
		log.setId(UuidUtil.get32UUID());
		log.setOptname(optName);
		log.setMethod(method);
		log.setUrl(url);
		log.setIp(ip);
		log.setOpttime(new Date());
		log.setUserid(userId);
		if(args != null){
			Object[] argss = new Object[args.length];
			for(int i=0;i<args.length;i++){
				Object arg = args[i];
				
				if(arg instanceof MultipartFile || 
						arg instanceof org.apache.catalina.connector.Response ||
						arg instanceof ResponseFacade||arg instanceof PrintWriter ){
				}else{
					argss[i] = arg;
				}
			}
			String data =          JsonUtil.toJson(argss);
			log.setData(data);
		}
		dao.save("OptlogMapper.insertSelective", log);
	}

	@Override
	public void deleteBatch(List<String> os) {
		// TODO Auto-generated method stub
		
	}

	
	@Override
	public List<PageData> listData(Page page) throws Exception {
		// TODO Auto-generated method stub
		return (List<PageData>) dao.findForList("OptlogMapper.listPage", page);
	}

	
}
