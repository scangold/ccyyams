package com.fh.service.log;


import java.util.List;

import org.springframework.stereotype.Service;

import com.fh.entity.Page;
import com.fh.util.PageData;


@Service("OperateLogService")
public interface OptLogService {
	/**
	 * 记录日志
	 * @param optName
	 * @param method
	 * @param url
	 * @param ip
	 * @param userId
	 * @param args
	 * @throws Exception 
	 */
	public void log(String optName,String method, String url,String ip,String userId,Object... args) throws Exception;

	public void deleteBatch(List<String> os);

	public List<PageData> listData(Page page) throws Exception;
	
}
