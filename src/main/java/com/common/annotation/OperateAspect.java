package com.common.annotation;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.common.utils.IPUtil;
import com.fh.service.log.OptLogService;
import com.fh.util.Jurisdiction;


@Aspect
@Component
@Order(1)// Order值越小优先被加载
public class OperateAspect {

	private final Log logger = LogFactory.getLog(OperateAspect.class);

	private Boolean recordOptLog = true;

	@Autowired
  OptLogService optLogService;

	@Around(value = "@annotation(com.common.annotation.ControllerOptLog)")
	public Object aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		Object[] args = joinPoint.getArgs();
		if (recordOptLog) {
			try {
				HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
						.getRequest();
				String ip = IPUtil.getIpAddr(request);
				MethodSignature signature = (MethodSignature) joinPoint.getSignature();
				Method method = signature.getMethod();
				String userId =Jurisdiction.getUserid();
			
				ControllerOptLog controllerOptLog = method.getAnnotation(ControllerOptLog.class);
				String desc = controllerOptLog.desc();
				RequestMapping requestMappingAnnotation = joinPoint.getTarget().getClass().getAnnotation(RequestMapping.class);
				String url = "";
				if (requestMappingAnnotation != null) {
					String[] temp = requestMappingAnnotation.value();
					url = StringUtils.join(temp)+"/"+method.getName();
				}
				optLogService.log(desc, method.toString(), url, ip, userId, args);
			} catch (Throwable e) {
				logger.error("记录操作日志错误", e);
			}
		}
		Object rt = joinPoint.proceed(args);
		return rt;
	}

}
