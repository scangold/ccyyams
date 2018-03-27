<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
 <!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
     <script type="text/javascript" src="static/js/jquery/jquery-3.0.0.min.js"></script>
    
	<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	<style type="text/css">
	.tree li{line-height:22px; }
	body{background-color:white}
	.tdNew{width:89px;text-align: right;padding-top: 13px;}
	.queryTD{width:12.5%}
	a:hover{text-decoration:none;}
	</style>
<body>

<table style="width:100%;" border="0">
	<tr>
		<td style="width:18%;" valign="top" bgcolor="#F9F9F9">
			 <div class="zTreeDemoBackground left" id="divTree">
                    <ul id="leftTree" style="font-size:14px;padding:20px;" class="ztree">
                    </ul>
             </div>
		</td>
		<td style="width:82%;" valign="top" >
		
		<table style="width: 100%;" border="0"><tr><td>
		<form action="pms/listPersInfo.do"  method="post" name="persForm" id="persForm">
		<input id="TREENODES"name="TREENODES" class="clear" value="${pd.treeNodes}" style="display:none;"/> <!-- 树结点 -->
				<table style="width: 100%; margin-top:10px;" border="0">
					<tr>
						<td style="width: 154px;">
							<div class="nav-search">
								<span class="input-icon"> <input class="nav-search-input clear"
									autocomplete="off" id="nav-search-input" type="text"
									name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</div>
						</td>
						<td style="width: 90px;">
						
						 <select class="chosen-select form-control" value="${pd.isValid }" name="isValid" id="isValid"  style="vertical-align:top;" >
											
											 <option value="" <c:if test="${pd.isValid==null||pd.isValid==''}">selected</c:if> >全部</option>
											  <option value="1" <c:if test="${pd.isValid=='1'}">selected</c:if>>在职</option>
											 <option value="0" <c:if test="${pd.isValid=='0'}">selected</c:if>>离职</option>

											</select>
											
						</td>
							<td style="vertical-align: top; padding-left: 2px;width:50px;"><a
								class="btn btn-light btn-xs" onclick="searchs();" title="检索"><i
									id="nav-search-icon"
									class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
									<input name="DEPARTMENT_ID" class="clear"  style="display:none;" value="${pd.DEPARTMENT_ID }" />
									<input name="LEVEL"  class="clear"  style="display:none;" value="${pd.LEVEL }" /> 
									</td>
									<td><a id="higherQuery" onclick="higherQuery()" style="cursor:pointer;">高级检索</a></td>
					</tr>
					<tr>
					<td colspan="4">
					<table id="compreQuery" style="width:100%;margin-bottom: 10px;display:none;">
					<tr>
					<td colspan="8">
					<div style="border-bottom:2px solid #438eb9  !important;font-size: 14px;height: 35px;line-height: 35px;margin-bottom: 5px;">人事综合查询
					<span style="color:red;font-size:12px;">（全院综合查询）</span></div>
					</td></tr>
					<tr>
					<td align="right" class="queryTD">
					性别：
					</td>
					<td class="queryTD">
					<select class="chosen-select form-control clear" name="sex" id="SEX" data-placeholder="请选择性别" style="vertical-align:top;" style="width:98%;" >
					<option value=''<c:if test="${pd.sex==null||pd.sex==''}">selected</c:if>>不限</option>
					<option value='男' <c:if test="${pd.sex=='男'}">selected</c:if>>男</option>
					<option value='女' <c:if test="${pd.sex=='女'}">selected</c:if>>女</option>
					</select></td>
					<td align=right class="queryTD">
					政治面貌：
					</td>
					<td class="queryTD">
					<select class="chosen-select form-control clear" name="politicalid" id="POLITICALID" data-placeholder="请选择政治面貌" style="vertical-align:top;" style="width:98%;" >											
										    <option value='' <c:if test="${pd.politicalid==null||pd.politicalid==''}">selected</c:if>>不限</option>
										    <option value='中共党员'<c:if test="${pd.politicalid=='中共党员'}">selected</c:if>>中共党员</option>
											<option value='共青团员'<c:if test="${pd.politicalid=='共青团员'}">selected</c:if>>共青团员</option>
											<option value='群众'<c:if test="${pd.politicalid=='群众'}">selected</c:if>>群众</option> 
											</select>
					</td>
					<td align="right" class="queryTD">
					获奖荣誉：
					</td>
					<td class="queryTD">
					<input type="text" class="clear"  name="honor" id="honor"value="${pd.honor }" placeholder="这里输入获奖荣誉"  title="获奖荣誉" style="width:98%;"/>
					</td>
					<td align="right" class="queryTD">
					年龄：
					</td>
					<td class="queryTD">
					<input type="text" class="clear"  name="minAge" id="honor"value="${pd.minAge }"   title="年龄" style="width:40px;"/>
					至
					<input type="text" class="clear"  name="maxAge" id="honor"value="${pd.maxAge }"   title="年龄" style="width:40px;"/>
					岁
					</td>
					</tr>
					<tr>
					<td align="right" class="queryTD">
					所在部门：
					</td>
					<td class="queryTD">
					<select class="chosen-select form-control"  name="department_id" id="DEPARTMENT_ID" data-placeholder="请选择部门" style="vertical-align:top;" style="width:98%;" >
											<option value="" >不限</option>
											<c:forEach items="${departmentList}" var="departmenttype">
												<option value="${departmenttype.DEPARTMENT_ID }" >${departmenttype.NAME }</option>
											</c:forEach>
											</select>
					</td>
					<td align="right" class="queryTD">
					最高学历：
					</td>
					<td class="queryTD">
					<select class="chosen-select form-control" name="degree" id="DEGREE"  style="vertical-align:top;" style="width:98%;" >
											 <option value=''>不限</option>
											 <option value='本科'>本科</option>
											<option value='博士研究生'>博士研究生</option>
											<option value='硕士研究生'>硕士研究生</option>
											<option value='专科'>专科</option>
											
											</select>
					</td>
					<td align="right" class="queryTD">
					职称：
					</td>
					<td class="queryTD">
					<select class="chosen-select form-control" name="ptitle" id="PTITLE"  style="width:98%;" >
											<option value=''>不限</option>
											<option value='工程师'>工程师</option>
											<option value='助理工程师'>助理工程师</option>
											<option value='技术员'>技术员</option>
											<option value='教授级高级工程师'>教授级高级工程师</option>
											<option value='高级工程师'>高级工程师</option>
											</select>
											</td>
											<td align="right" class="queryTD">
				          毕业院校：
					</td>
					<td class="queryTD">
					<input type="text" class="clear"  name="school" id="school"  value="${pd.school }" maxlength="32" placeholder="这里输入毕业院校" title="毕业院校" style="width:98%;"/>
					</td>
					
					</tr>
					<tr>
					<td align="right" class="queryTD">
					手机号码：
					</td>
					<td class="queryTD">
					<input type="number" class="clear"  name="telephone" id="PHONE"  value="${pd.telephone }"  maxlength="11" placeholder="这里输入手机号" title="手机号" style="width:98%;"/>
					</td>
					<td align="right" class="queryTD">
					户口所在地：
					</td>
					<td class="queryTD">
					<input type="text" class="clear"  name="hukou" id="hukou"  value="${pd.hukou }"   placeholder="户口所在地" title="户口" style="width:98%;"/>
					</td>
					<td align="right" class="queryTD">
					籍贯：
					</td>
					<td class="queryTD">
					<input type="text" class="clear"  name="originplace" id="ORIGINPLACE"  value="${pd.originplace }" maxlength="64" placeholder="这里输入籍贯" title="籍贯"style="width:98%;"/>
					</td>
					<td align="right" class="queryTD">
					婚姻状况：
					</td>
					<td class="queryTD">
					<select class="chosen-select form-control" name="maritalstatus" id="MARITALSTATUS"  style="vertical-align:top;" style="width:98%;" >
											<option value=''>不限</option>
											<option value='已婚'>已婚</option>
											<option value='未婚'>未婚</option>
											</select>
					</td>
					
					</tr>
					<tr>
					<td align="right" class="queryTD">
					所学专业：
					</td>
					<td class="queryTD">
					<input type="text" class="clear"  name="major" id="MAJOR"  value="${pd.major }" maxlength="32" placeholder="这里输入所学专业" title="所学专业" style="width:98%;"/>
					</td>
					<td align="right" class="queryTD">
					参与项目：
					</td>
					<td class="queryTD" colspan="5">
					<input type="text" class="clear"  name="prjName" id="prjName"value="${pd.prjName }"   title="年龄" style="width:100%;"/>
					</td>
					</tr>
					
					</table>
					</td>
					</tr>
					<tr><td colspan="4" >
					<table id="simple-table"
									class="table table-striped table-bordered table-hover"
									style="margin-top: 5px;">
									<thead>
										<tr>
											<th  class="center">序列</th>
											<th  class="center">姓名</th>
											<th  class="center">性别</th>
											<th  class="center">民族</th>
											<th  class="center">在职状态</th>
											<th  class="center">所在部门</th>
											<!-- <th  class="center">政治面貌</th> -->
											<th  class="center">最高学历</th>
											<th  class="center">手机号码</th>
											<th  class="center">人事信息操作</th>
											<th  class="center">工作经历操作</th>
											<th  class="center">获奖荣誉操作</th>
										</tr>
									</thead>
									<tbody>
										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty dataList}">
												<c:if test="${QX.cha == 1 }">
													<c:forEach items="${dataList}" var="data" varStatus="vs">
														<tr>
															<td class='center' style="width: 30px;">${vs.index+1}</td>
															<td class="center">${data.NAME}</td>
															<td class="center">${data.SEX}</td>
															<td class="center">${data.NATION}</td>
															<%-- <td class="center">${data.ORIGINPLACE}</td> --%>
															<c:choose>
											<c:when test="${data.HIRED ==true}">
											<%-- <input type="text" name="HIRED" id="ORIGINPLACE"  value="${pd.HIRED }" maxlength="64" placeholder="无" title="是否在职"style="width:98%;"/> --%>
											<td class="center">在职</td>
											</c:when>
											<c:otherwise>
											<td class="center">离职</td>
											</c:otherwise>
											</c:choose>
															<td class="center">${data.DEPARTMENTNAME}</td>
															<%-- <td class="center">${data.POLITICALID}</td> --%>
															<td class="center">${data.DEGREE}</td>
															<td class="center">${data.TELEPHONE}</td>
															<td class="center">
															<c:if test="${QX.edit == 1 }">
															<a class="btn btn-xs btn-info" title="查看"
																	onclick="view('${data.USER_ID }')"> <i
																	class="ace-icon fa fa-search bigger-120"
																	title="查看"></i>
																</a>
																<a class="btn btn-xs btn-default" title="编辑"
																	onclick="edit('${data.USER_ID }')"> <i
																	class="ace-icon fa fa-pencil bigger-120"
																	title="编辑"></i>
																</a>
																<a class="btn btn-xs btn-danger" title="删除"
																	onclick="deleteP('${data.NAME}','${data.USER_ID }')"> <i
																	class="ace-icon fa fa-trash-o bigger-120"
																	title="删除"></i>
																</a>
																
															</c:if>
															</td>
															<td  class="center">
															<a class="btn btn-xs btn-info" title="查看人事经历"
																	onclick="viewPexperience('${data.NAME}','${data.P_ID }')"> <i
																	class="ace-icon fa fa-search bigger-120"
																	title="新增人事经历"></i>
															</a>
															<a class="btn btn-xs btn-success" title="新增人事经历"
																	onclick="addPexperience('${data.NAME}','${data.P_ID }')"> <i
																	class="ace-icon fa fa-plus bigger-120"
																	title="新增人事经历"></i>
															</a>
															</td>
															<td  class="center">
															<a class="btn btn-xs btn-info" title="查看获奖荣誉"
																	onclick="viewHonor('${data.NAME}','${data.P_ID }')"> <i
																	class="ace-icon fa fa-search bigger-120"
																	title="新增人事经历"></i>
															</a>
															<a class="btn btn-xs btn-success" title="新增获奖荣誉"
																	onclick="addHonor('${data.NAME}','${data.P_ID }')"> <i
																	class="ace-icon fa fa-plus bigger-120"
																	title="新增人事经历"></i>
															</a>
															</td>
														</tr>
													</c:forEach>
												</c:if>
											</c:when>
											<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
										</c:choose>
								</table>
					</td></tr>
					<tr><td colspan="4">
						<div class="page-header position-relative">
									<table style="width: 100%;">
										<tr>
											<td style="vertical-align: top;">
													<a class="btn btn-mini btn-success" onclick="add();">新增人事信息</a>
												</td>
											<td style="vertical-align: top;"><div class="pagination"
													style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
										</tr>
									</table>
								</div>
					</td></tr>
				</table>
				</form>
				</td></tr>
				<tr><td>
				
</table>
</table>
<!-- </form> -->
	<%@ include file="../../system/index/foot.jsp"%>
		<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
			<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//查看或者删除工作经历
		function viewPexperience(name,pId){
			top.mainFrame.tabAddHandler('pexprience','人事经历','pms/viewPersEx.do?P_ID='+pId+'&NAME='+name);
		}
		//查看或者删除工作经历
		function viewHonor(name,pId){
			top.mainFrame.tabAddHandler('phonor','获奖荣誉','pms/viewPersHonor.do?P_ID='+pId+'&NAME='+name);
		}
	     //增加获奖荣誉
	     function addHonor(name,pId){
	    		top.jzts();
				 var diag = new top.Dialog();
				 diag.Drag=true;
				 diag.Title ="新添获奖荣誉";
				 diag.URL = '<%=basePath%>pms/newPersHo.do?NAME='+name+'&P_ID='+pId;
				 diag.Width = 620;
				 diag.Height = 298;
				 diag.CancelEvent = function(){ //关闭事件
					  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){ 
						  bootbox.dialog({
								message: "<span class='bigger-110'>新添获奖荣誉成功！</span>",
								buttons: 			
								{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
							}); 
		 
					} 
					  diag.close();
				 };
				 diag.show(); 
	     }
		//增加工作经历
		function addPexperience(name,pId){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新添工作经历";
			 diag.URL = '<%=basePath%>pms/newPersEx.do?NAME='+name+'&P_ID='+pId;
			 diag.Width = 620;
			 diag.Height = 298;
			 diag.CancelEvent = function(){ //关闭事件
				  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){ 
					  bootbox.dialog({
							message: "<span class='bigger-110'>新添工作经历成功！</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						}); 
	 
				} 
				  diag.close();
			 };
			 diag.show();
		}
		//增加人事信息
		function add(){
		top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新添人事信息";
		 diag.URL = '<%=basePath%>pms/newPersInfo.do';
		 diag.Width = 620;
		 diag.Height = 510;
		 diag.CancelEvent = function(){ //关闭事件
			  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){ 
				 clear();
				  if('${page.currentPage}' == '0'){
					 top.jzts();
					 setTimeout("self.location=self.location",100);
				 }else{
					 nextPage(${page.currentPage});
				 }
				 
			} 
			  diag.close();
		 };
		 diag.show();
		}
		//删除
		function deleteP(userName,userId){
			
		  	bootbox.confirm("确定要删除["+userName+"]吗?", function(flag) {
        		if(flag){
        			   $.ajax({  
     			          dataType: "json",
     			          data:{"USER_ID":userId},
     			          url: "pms/deletePinfo.do",  
     			          success: function(data){
     			        	 debugger;
     			        	  clear();
     			        	  bootbox.dialog({
     								message: "<span class='bigger-110'>删除人事信息成功！</span>",
     								buttons: 			
     								{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
     							}); 
     			        	 if('${page.currentPage}' == '0'){
     							 top.jzts();
     							 setTimeout("self.location=self.location",100);
     						 }else{
     							 nextPage(${page.currentPage});
     						 }
     			          },
     			          error:function(data){
     			        	 debugger; 
     			          },
     			          cache:false  
     			        }); 
        		}
        	})
		}
		//查看
		function view(userId){
			$(top.hangge());
			 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="查看人事资料";
		 diag.URL = '<%=basePath%>pms/viewPinfo.do?USER_ID='+userId;
		 diag.Width = 620;
		 diag.Height = 510;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.show();
		}
		
		//编辑
		function edit(userId){
			$(top.hangge());
			 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑人事资料";
		 diag.URL = '<%=basePath%>pms/goEditP.do?USER_ID='+userId;
		 diag.Width = 620;
		 diag.Height = 510;
		 diag.CancelEvent = function(){ //关闭事件
			
			  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				  clear();
				  nextPage(${page.currentPage});
			} 
			diag.close();
		 };
		 diag.show();	
		}
		//检索
		function searchs(){
			top.jzts();
			getAllNodes();
			$("#persForm").submit();
		}


		
		//设置树形结构
	 	$(document).ready(function(){
	 		//下拉框
	 	   $('.chosen-select').chosen({ allow_single_deselect: true,width:"98%" }); 
	 		//添加人员之后给出提示
	 		var msg = '${msg}';
	 		if(msg!=""){
	 			bootbox.dialog({
					message: "<span class='bigger-110'>添加人员"+msg+"！</span>",
					buttons: 			
					{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
	 		}
			
	 		//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
	 	});
	 		//人员树设置
			  var setting = {
                       view: {
                    	   showIcon: false,
                           showLine: true,
                           fontCss:{'color':"#438eb9",'font-family': '微软雅黑'}
                       },
                       data: {
                           simpleData: {
                               enable: true
                           }
                       },
                       callback: {
                    	   onClick: function (event,treeId, treeNode) {
                    		   console.log(treeNode);
                    		   if (!treeNode.isParent) {//子节点
                    			   view(treeNode.id);
                    		   }
                    		   else{
                    			   getAllNodes();
                    			   if(treeNode.level=="0"){
                    				   //川测一院
                    				   $("input[name='DEPARTMENT_ID']").val("");
                    				   $("input[name='LEVEL']").val("");
			                           $("#persForm").submit();
                    			
                    			   }
                    			   else if(treeNode.level=="1"){
                    				   $("input[name='DEPARTMENT_ID']").val(treeNode.id);
                    				   //职能部门\生产部门
                    				   if(treeNode.name=="院部"){
                    					   $("input[name='LEVEL']").val(2);
                        				   $("#persForm").submit(); 
                    				   }
                    				   else{
                    					   $("input[name='LEVEL']").val(1); 
                        				   $("#persForm").submit();   
                    				   }
                    				  
                    			   }
                    			   else{
                    				   //分院
                    				   $("input[name='DEPARTMENT_ID']").val(treeNode.id);
                    				   $("input[name='LEVEL']").val(2);
                    				   $("#persForm").submit();
                    			   }
                    		   }
                    	   }
                       }

                   };
			var zn = '${treeNodes}';
			var zTreeNodes = eval(zn);
			 $.fn.zTree.init($("#leftTree"), setting, zTreeNodes);
function clear(){
	 $(".clear").val("");
	 
}
	function treeFrameT(){
			var hmainT = $("#divTree")[0];
			var bheightT = document.documentElement.clientHeight;			
			hmainT.style.height = (bheightT-26) + 'px';
			
		}
		treeFrameT();
		window.onresize=function(){  
			treeFrameT();
		}; 
		
		//将时间戳转换成时间
		function formatDate(now) {
			var year = now.getFullYear();
			var month = padleft0(now.getMonth() + 1);
			var date = padleft0(now.getDate());
			var hour = padleft0(now.getHours());
			var minute = padleft0(now.getMinutes());
			var second = padleft0(now.getSeconds());
			return year + "-" + month + "-" + date + " " + hour + ":" + minute
					+ ":" + second;
		}
		 // 补齐两位数
	    function padleft0(obj) {
	        return obj.toString().replace(/^[0-9]{1}$/, "0" + obj);
	    }
		 //高级查询
		 function higherQuery(){
			if($("#compreQuery")[0].style.display == 'none'){
				clear();
				$("#compreQuery").show();
				$("#higherQuery").empty().html("隐藏高级查询");
			}
			else{
				$("#compreQuery").hide();
				$("#higherQuery").empty().html("高级查询");
			}
		 }
			function getAllNodes(){
				
				 var treeObj = $.fn.zTree.getZTreeObj("leftTree");
				    var node = treeObj.getNodes();
				    var nodes = treeObj.transformToArray(node);
				    var list=new Array();  
				    for(var i in nodes){    
	var obj=new Object();
	obj.id=nodes[i].id;
	obj.iffiled=nodes[i].iffiled;
	obj.name=nodes[i].name;
	obj.open=nodes[i].open;
	obj.pId=nodes[i].pId;
	list.push(obj);
				           } 
				    
				    var nodesJson=JSON.stringify(list);
				    $("#TREENODES").val("").val(nodesJson);
			}

		


		
		/* //显示所选人员的详细信息	
		function showPer(data){
			disabledForm(true);

			$("input[name='NAME']").val(data.NAME);
			$("input[name='USERNAME']").val(data.USERNAME);
			$("#DEPARTMENT_ID").val(data.DEPARTMENT_ID)//设置值  
			$('#DEPARTMENT_ID').trigger('chosen:updated');//更新选项 
			$("input[name='PHONE']").val(data.PHONE);
			$("input[name='EMAIL']").val(data.EMAIL);
			$("input[name='BZ']").val(data.BZ);
			$("#SEX").val(data.SEX)//设置值  
			$('#SEX').trigger('chosen:updated');//更新选项 
			$("input[name='NATION']").val(data.NATION);
			$("input[name='ORIGINPLACE']").val(data.ORIGINPLACE);
			$("#SEX").val(data.SEX)//设置值  
			$('#SEX').trigger('chosen:updated');//更新选项 
			$("input[name='POLITICALID']").val(data.POLITICALID);
			$("input[name='JOINPARTYDAY']").val(formatDate(new Date(data.JOINPARTYDAY)));
			$("input[name='JOINLEAGUEDAY']").val(formatDate(new Date(data.JOINLEAGUEDAY)));
			$("#MARITALSTATUS").val(data.MARITALSTATUS)//设置值  
			$('#MARITALSTATUS').trigger('chosen:updated');//更新选项 
			$("input[name='DEGREE']").val(data.DEGREE);
			$("input[name='MAJOR']").val(data.MAJOR);
			$("input[name='SCHOOL']").val(data.SCHOOL);
			$("input[name='HUKOU']").val(data.HUKOU);
			$("input[name='IDNUMBER']").val(data.IDNUMBER);
			$("input[name='PPOST']").val(data.PPOST);
			$("input[name='PTITLE']").val(data.PTITLE);
		}  */
	</script>
</body>
</html>