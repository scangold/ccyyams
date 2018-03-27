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
	<!-- ztree exhide包，ztree隐藏显示结点需要此包支持 -->   
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.exhide-3.5.min.js"></script>
	<style type="text/css">
	.tree li{line-height:22px; }
	body{background-color:white}
	.tdNew{width:89px;text-align: right;padding-top: 13px;}
	</style>
<body>

<table style="width:100%;" border="0">

					<tr>
		<td style="width:18%;" valign="top" bgcolor="#F9F9F9" colspan='2'>
		<table>
		    	<tr>
		
						<td style="width: 154px;">
							<div class="nav-search" style="margin-top: 10px; margin-left: 10px;">
								<span class="input-icon"> <input class="nav-search-input"
									autocomplete="off" id="keywords" type="text"
									name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</div>
						</td>
							<td style="vertical-align: top; padding-left: 2px;"><a
								class="btn btn-light btn-xs" onclick="filter();"  style="margin-top: 10px; margin-left: 10px;"title="检索"><i
									id="nav-search-icon"
									class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
									<input name="DEPARTMENT_ID" style="display:none;"/>
									<input name="LEVEL" style="display:none;"/> 
									</td>
					</tr>
					<tr><td colspan='2'>
			 <div class="zTreeDemoBackground left" id="divTree">
                    <ul id="leftTree" style="font-size:14px;padding:20px;" class="ztree">
                    </ul>
                </div>
                </td></tr>
                </table>
		</td>
		<td style="width:82%;" valign="top" >
		<table style="width: 100%;" border="0"><tr><td>
		<form action="pms/listPFilesInfo.do"  method="post" name="persFileForm" id="persFileForm">
		<input type="hidden" name="USER_ID" id="USER_ID" value="${pInfo.USER_ID}"/>
		<input type="hidden" name="newOrNot" id="newOrNot" />
		<input type="hidden" name="P_ID" id="P_ID"  value="${pInfo.P_ID}"/>
	
	<input id="TREENODES"name="TREENODES" style="display:none;"/>
		<input type="hidden" name="PFILE_ID" id="PFILE_ID" value="${fileBox.PFILE_ID}"/>
		<c:if test="${pd.newOrNot == 'new' }">
		<table style="width: 100%; margin-top:10px;" border="0"  id="newFileBox">
		<tr>
			    <td>
					<a class="btn btn-mini btn-success" onclick="add();">新增档案盒</a>
				
				</td>
				</tr>
		</table>
		</c:if>
		<c:if test="${pd.newOrNot == 'old'|| pd.newOrNot == ''|| pd.newOrNot == null}">
		<table style="width: 100%; margin-top:10px;" border="0"  id="oldFileBox">
				
				<tr style="border-bottom:2px solid #438eb9  !important;">
				<td>
					<div style="font-size: 18px;height: 60px;line-height: 60px;">
					<span style='margin-left:20px;font-size:26px;color:#438eb9 '>档案盒编号：</span>
					<span>${fileBox.PFILE_NUM}</span>
					</div>
				
				</td>
				<td>
					<div style="font-size: 18px;height: 60px;line-height: 60px;">
					<span style='margin-left:20px;font-size:26px;color:#438eb9 '>档案盒名称：</span>
					<span>${fileBox.PFILE_NAME}</span>
					
					</div>
				</td>
				<td style="text-align:right">
					
				<a class="btn btn-mini btn-success" onclick="editF('${fileBox.PFILE_ID}');" >编辑档案盒</a>
				</td>
				</tr>
				
					<tr><td colspan="3" >
					<table id="simple-table"
									class="table table-striped table-bordered table-hover"
									style="margin-top: 5px;">
									<thead>
										<tr>
											<th  class="center">序列</th>
											<th  class="center">姓名</th>
											<th  class="center">档案盒编号</th>
											<th  class="center">档案（盒）名称</th>
											<th  class="center">形成时间</th>
											<th  class="center">页数</th>
											<!-- <th  class="center">备注</th>
											<th  class="center">入档时间</th>
											<th  class="center">档案在库否</th>
											<th  class="center">档案进入方式</th>
											<th  class="center">档案进入日期</th>
											<th  class="center">档案移出方式</th>
											<th  class="center">档案移出日期</th>
											<th  class="center">其他</th> -->
											<th  class="center">档案类型</th>
											<th  class="center">档案操作</th>
										</tr>
									</thead>
									<tbody>
										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty dataList}">
												<%-- <c:if test="${QX.cha == 1 }"> --%>
													<c:forEach items="${dataList}" var="data" varStatus="vs">
														<tr>
															<td class='center' style="width: 30px;">${vs.index+1}</td>
															<td class="center">${data.NAME}</td>
															<td class="center">${data.PFILE_NUM}</td>
															<td class="center">${data.PFILE_NAME}</td>
															<td class="center"><fmt:formatDate value="${data.PFILE_CREATIME}" pattern="yyyy-MM-dd"/></td>
															<td class="center">${data.PFILE_PAGES}</td>
															<%-- <td class="center">${data.PFILE_REMARK}</td>
															<td class="center"><fmt:formatDate value="${data.PFILE_LOADTIME}" pattern="yyyy-MM-dd"/></td>
															<td class="center">${data.EXISTORNOT}</td>
															<td class="center">${data.RECEIVE_HOW}</td>
															<td class="center"><fmt:formatDate value="${data.RECEIVE_DATE}" pattern="yyyy-MM-dd"/></td>
															<td class="center">${data.REMOVE_HOW}</td>
															<td class="center"><fmt:formatDate value="${data.REMOVE_DATE}" pattern="yyyy-MM-dd"/></td>
															<td class="center">${data.OTHER}</td> --%>
															<td class="center">${data.PFILE_TYPE_NAME}</td>
															<td class="center">
															<c:if test="${QX.edit == 1 }">
															   <a class="btn btn-xs btn-info" title="查看"
																	onclick="viewF('${data.PFILE_ID}')"> <i
																	class="ace-icon fa fa-search bigger-120"
																	title="编辑"></i>
																</a>
																<a class="btn btn-xs btn-default" title="编辑"
																	onclick="editF('${data.PFILE_ID }','1')"> <i
																	class="ace-icon fa fa-pencil bigger-120"
																	title="编辑"></i>
																</a>
																<a class="btn btn-xs btn-danger" title="删除"
																	onclick="deleteF('${data.NAME}','${data.PFILE_ID }')"> <i
																	class="ace-icon fa fa-trash-o bigger-120"
																	title="删除"></i>
																</a>
																
															</c:if>
															</td>
														</tr>
													</c:forEach>
												<%-- </c:if> --%>
											</c:when>
											<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
										</c:choose>
								</table>
					</td></tr>
					<tr><td colspan="2">
						<div class="page-header position-relative">
									<table style="width: 100%;">
										<tr>
											<td style="vertical-align: top;">
													<a class="btn btn-mini btn-success" onclick="add('1');">新增档案信息</a>
												</td>
											<td style="vertical-align: top;"><div class="pagination"
													style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
										</tr>
									</table>
								</div>
					</td></tr>
				</table>
				</c:if>
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
		//查看
		function viewF(PFILE_ID){
			$(top.hangge());
			 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="查看档案信息详细";
		 diag.URL = '<%=basePath%>pms/viewPFile.do?pfileId='+PFILE_ID;
		 diag.Width = 700;
		 diag.Height = 380;
		 diag.CancelEvent = function(){ //关闭事件
			diag.close();
		 };
		 diag.show();
		}
		//编辑档案盒信息
		function editF(PFILE_ID,boxornot){
			
             var newOrNot=$("#newOrNot").val();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑档案信息";
			 diag.URL = '<%=basePath%>pms/editFileInfo.do?pfileId='+PFILE_ID+'&boxornot='+boxornot;
			 diag.Width = 700;
			 diag.Height = 410;
			 diag.CancelEvent = function(){ //关闭事件
				  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){ 
					  getAllNodes();
					  if('${page.currentPage}' == '0'){
						  if(newOrNot!=""){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
						  }
						  else{
							  $("#persFileForm").submit();   
						  }
					 }else{
						 nextPage(${page.currentPage});
					 }
					 
				} 
				  diag.close();
			 };
			 diag.show();	
		};
		//增加档案信息
		function add(boxornot){
		var newOrNot=$("#newOrNot").val();
		var P_ID=$("#P_ID").val();
		var PFILE_ID=$("#PFILE_ID").val();
		top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新添档案信息";
		 diag.URL = '<%=basePath%>pms/newFileInfo.do?P_ID='+P_ID+'&PFILE_ID='+PFILE_ID+'&boxornot='+boxornot;
		 diag.Width = 700;
		 diag.Height = 380;
		 diag.CancelEvent = function(){ //关闭事件
			  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){ 
				  getAllNodes();
				  if('${page.currentPage}' == '0'){
					 top.jzts();
					 if(newOrNot=="old"){
						 
					 setTimeout("self.location=self.location",100);
					 }
					 else{//获取新增盒子的档案信息
						 
						  $("#persFileForm").submit(); 
					 }
				 }else{
					 nextPage(${page.currentPage});
				 }
			
				
				 
			} 
			  diag.close();
		 };
		 diag.show();
			
		}
		//删除
		function deleteF(userName,PFILE_ID){
			
		  	bootbox.confirm("确定要删除["+userName+"]这条档案信息吗?", function(flag) {
        		if(flag){
        			   $.ajax({  
     			          dataType: "json",
     			          data:{"pfileId":PFILE_ID},
     			          url: "pms/deletePFile.do",  
     			          success: function(data){
     			        	  //debugger;
     			        	  bootbox.dialog({
     								message: "<span class='bigger-110'>删除人事信息成功！</span>",
     								buttons: 			
     								{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
     							}); 
     			        	 getAllNodes();
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
                    		   //console.log(treeNode);
                    		   if (!treeNode.isParent) {//子节点
                    			   //如果档案盒存在，则展示档案内容
                    			   if(treeNode.iffiled=='0'){
                    				/*    $("#newFileBox").show();
                    				   $("#oldFileBox").hide(); */
                    				   $("#USER_ID").val(treeNode.id);
                    				   $("#newOrNot").val("new");
                    				   getAllNodes();
                    				   $("#persFileForm").submit();
                    			   }
                    			   //如果档案盒不存在，则提示添加档案盒
                    			   else if(treeNode.iffiled=='1'){
                    				  /*  $("#newFileBox").hide();
                    				   $("#oldFileBox").show(); */
                    				   $("#USER_ID").val(treeNode.id);
                    				   $("#newOrNot").val("old");
                    				   getAllNodes();
                    				   $("#persFileForm").submit();
                    				  
                    			   }
                    			   
                    		   }
                    	   }
                       }

                   };
	 		debugger;
			var zn = '${treeNodes}';
			var zTreeNodes = eval(zn);
			 var zTreeObj=$.fn.zTree.init($("#leftTree"), setting, zTreeNodes);

	      function treeFrameT(){
			var hmainT = $("#divTree")[0];
			var bheightT = document.documentElement.clientHeight;			
			hmainT.style.height = (bheightT-48) + 'px';
			
		}
		treeFrameT();
		window.onresize=function(){  
			treeFrameT();
		}; 
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
		var hiddenNodes=[]; //用于存储被隐藏的结点

		//过滤ztree显示数据
		function filter(){
			var _keywords=$("#keywords").val();
			if(_keywords!=""){
				//全部展开
				zTreeObj.expandAll(true); 
			}
			else{
				//全部分院收缩
				var nodes = zTreeObj.getNodesByFilter(filterNodes);
				for(var i=0;i<nodes.length;i++){
				zTreeObj.expandNode(nodes[i], false, false, false, false)
				}
				//获取分院的结点
				function filterNodes(node) {
				    return (node.level == 2);
				}
			}
			
		    //显示上次搜索后背隐藏的结点
		    zTreeObj.showNodes(hiddenNodes);

		    //查找不符合条件的叶子节点
		    function filterFunc(node){
		        if(node.isParent||node.name.indexOf(_keywords)!=-1) return false;
		        return true;        
		    };

		    //获取不符合条件的叶子结点
		    hiddenNodes=zTreeObj.getNodesByFilter(filterFunc);

		    //隐藏不符合条件的叶子结点
		    zTreeObj.hideNodes(hiddenNodes);
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
	   	
	</script>
</body>
</html>