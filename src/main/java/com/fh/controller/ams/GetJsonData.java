package com.fh.controller.ams;

import java.io.IOException;  
import java.net.URLDecoder;  
import java.util.ArrayList;   
import java.util.List;  

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  

import net.sf.json.JSONArray;  
import net.sf.json.JSONObject;  

import org.apache.shiro.session.Session;
import org.springframework.stereotype.Controller;  
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fh.controller.base.BaseController;
import com.fh.entity.Result;
import com.fh.entity.amsmodel.File;
import com.fh.util.Jurisdiction;
import com.fh.util.PageData;

  
@Controller  
@RequestMapping("/jsondata")  
public class GetJsonData extends BaseController  {  

    @RequestMapping(value = "/resolveJsonObject", method = {RequestMethod.POST})
	@ResponseBody  
    public void resolveJsonObject(@RequestBody List<File> rows ) throws IOException {  
		
		PageData pd= this.getPageData();
		/*
		for (File file:rows) {
			System.out.println(file.getFileName());
		}*/
		
		
		/*Session session = Jurisdiction.getSession();*/
		
    }
    
  
    
    
} 