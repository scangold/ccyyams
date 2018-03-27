package com.fh.controller.ams;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.shiro.session.Session;

import com.fh.util.Jurisdiction;


@SuppressWarnings("serial")
public class GetData extends HttpServlet {  
	  
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
        retData(request, response, "GET");  
    }  
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
          
        retData(request, response, "POST");  
    }  
  
      
    /** 
     * 接收json数据 
     * @param request 
     * @param response 
     * @param method 
     * @throws IOException 
     */  
    private void retData(HttpServletRequest request, HttpServletResponse response,String method) throws IOException{  
          
        String userName = request.getParameter("userName");  
        String age = request.getParameter("age");  
        PrintWriter out = response.getWriter();  
        out.print(method+":userName="+userName+",age="+age);  
        out.flush();  
        
		Session session = Jurisdiction.getSession();


    	//解码  
        String str = request.getParameter("HandFileTable");  
    	
        JSONObject joHandFileTable=new JSONObject();   
        //将json格式的字符串转换为json对象
        joHandFileTable = joHandFileTable.fromObject(str);
        
		JSONArray joHandFileTableArr = joHandFileTable.getJSONArray("HandFileTable");
        
		// 将arrayList存入session
		session.setAttribute("joHandFileTable",joHandFileTableArr);
        
    }  
}  