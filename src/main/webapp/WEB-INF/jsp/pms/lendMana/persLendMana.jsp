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
<html style="margin:10px;">
<head>
<base href="<%=basePath%>">
 <!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
table{ border="0"}
body{background-color:white}
</style>
</head>
<body>
<form action="pms/persLendMana.do" method="post" name="persLendManaForm" id="persLendManaForm">

<table style="width:100%">
<!-- 头部 -->
<tr><td><table><tr>
<td style="width: 154px;">
							<div class="nav-search">
								<span class="input-icon"> <input class="nav-search-input"
									autocomplete="off" id="nav-search-input" type="text"
									name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</div>
						</td>
<td style="width: 90px;">
						
						 <select class="chosen-select form-control" value="${pd.isValid }" name="isValid" id="isValid"  style="vertical-align:top;" >
											
											 <option value="2" <c:if test="${pd.isValid=='2'}">selected</c:if> >全部</option>
											  <option value="1" <c:if test="${pd.isValid=='1'}">selected</c:if>>未借阅</option>
											 <option value="0" <c:if test="${pd.isValid=='0'}">selected</c:if>>已借阅</option>

											</select>
											
						</td>
							<td style="vertical-align: top; padding-left: 2px;width:50px;"><a
								class="btn btn-light btn-xs" onclick="searchs();" title="检索"><i
									id="nav-search-icon"
									class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a>
									</td>
</tr></table></td></tr>
<!-- 表格部分 -->
<tr><td>
<table id="simple-table"
									class="table table-striped table-bordered table-hover"
									style="margin-top: 5px;">
									<thead>
										<tr>
										<c:if test="${pd.isValid=='1'}">
										<th class="center" style="width:2%"></th>
										</c:if>
											<th  class="center">序列</th>
											<th  class="center">姓名</th>
											<th  class="center">档案盒编号</th>
											<th  class="center">档案盒名称</th>
											<c:if test="${pd.isValid=='0'}">
											<th  class="center">借阅名称</th>
											<th  class="center">借阅描述</th>
											
											<th  class="center">借阅人</th>
											<th  class="center">借阅时间</th>
											<th  class="center">归还时间</th>
											</c:if>															
																									
											<th  class="center">借阅操作</th>
											
										</tr>
									</thead>
									<tbody>
										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty dataList}">
												<c:if test="${QX.cha == 1 }">
													<c:forEach items="${dataList}" var="data" varStatus="vs">
														<tr>
														<c:if test="${pd.isValid=='1'}">
														<td class='center'>
														<label class="pos-rel">
														<input type='checkbox' name='ids' value="${data.PFILE_ID}" class="ace" onchange="changeids('${data.PFILE_ID }')"/>														
										                <span class="lbl"></span>
														</label>
														</td>
										                </c:if>
															<td class='center' style="width: 30px;">${vs.index+1}</td>
															<td class="center">${data.PNAME}</td>
															<td class="center">${data.PFILE_NUM}</td>
															<td class="center">${data.PFILE_NAME}</td>
										                    <c:if test="${pd.isValid=='0'}">
															<td class="center">${data.NAME}</td>
															<%-- <td class="center">${data.POLITICALID}</td> --%>
															<td class="center">${data.DESCRIBLE}</td>
															<td class="center">${data.BORROW_USER}</td>
															<td class="center">${data.STARTTIME}</td>
															<td class="center">${data.ENDTIME}</td>
															</c:if>
															
															<td class="center">
															<c:if test="${pd.isValid=='1'}">
															<a class="btn btn-xs btn-info" title="借阅"
																	onclick="lend('${data.PFILE_NAME }','${data.PFILE_ID }')"> <i
																	class="ace-icon fa fa-thumbs-o-up bigger-120"
																	title="借阅"></i>
																</a>
																</c:if>
																<c:if test="${pd.isValid=='0'}">
																<a class="btn btn-xs btn-success" title="归还"
																	onclick="back('${data.PFILE_NAME }','${data.ID }')"> <i
																	class="ace-icon fa fa-repeat bigger-120"
																	title="归还"></i>
																</a>
																
															</c:if>
															<c:if test="${pd.isValid=='2'}">
																<a class="btn btn-xs btn-info" title="查看历史借阅记录"
																	onclick="query('${data.PFILE_NAME }','${data.PFILE_ID }')"> <i
																	class="ace-icon fa fa-search bigger-120"
																	title="查看历史借阅记录"></i>
																</a>
																
															</c:if>	
								
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
<!-- 尾部 -->
<tr><td >
						<div class="page-header position-relative">
									<table style="width: 100%;">
										<tr>
										<c:if test="${pd.isValid=='1'}">
										<td style="vertical-align: top;">
													<a class="btn btn-mini btn-success" onclick="makeAll();">批量借阅</a>
												</td>
												</c:if>
											<td style="vertical-align: top;"><div class="pagination"
													style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
										</tr>
									</table>
								</div>
					</td></tr>
				</table>
</form>
		<%@ include file="../../system/index/foot.jsp"%>
		<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
			<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		var ids="${data.PFILE_ID}";
		function changeids(e){

			if(ids.indexOf(e)>-1){
				ids=ids.replace(e+",","")		
			}else{
				ids=ids+e+","
			}
			$(".ids").val(ids);
			console.log(e+" ids------------------"+ids);			
		}
		//批量借阅档案
		function makeAll(){
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="批量借阅档案";
		 diag.URL = '<%=basePath%>pms/goborrowall.do?ids='+ids;
		 diag.Width = 550;
		 diag.Height = 300;
		 diag.CancelEvent = function(){ //关闭事件
					 nextPage(${page.currentPage});
			diag.close();
		 };
		 diag.show();
		}
		//历史
		function query(PFILE_NAME,PFILE_ID){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title =PFILE_NAME+"  历史借阅查询";
			 diag.URL = '<%=basePath%>pms/queryLendInfo.do?PFILE_NAME='+PFILE_NAME+'&PFILE_ID='+PFILE_ID;
			 diag.Width = 820;
			 diag.Height = 200;
			 diag.CancelEvent = function(){ //关闭事件
				  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){ 
					  bootbox.dialog({
							message: "<span class='bigger-110'>归还成功！</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						}); 
	 
				} 
				  diag.close();
			 };
			 diag.show();
		}
		//归还
		function back(name,Id){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="归还档案";
			 diag.URL = '<%=basePath%>pms/backLendInfo.do?FILENAME='+name+'&ID='+Id;
			 diag.Width = 620;
			 diag.Height = 122;
			 diag.CancelEvent = function(){ //关闭事件
				  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){ 
					  bootbox.dialog({
							message: "<span class='bigger-110'>归还成功！</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						}); 
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
		//借阅
		function lend(name,fId){
			top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="借阅档案";
			 diag.URL = '<%=basePath%>pms/addLendInfo.do?FILENAME='+name+'&PFILE_ID='+fId;
			 diag.Width = 620;
			 diag.Height = 218;
			 diag.CancelEvent = function(){ //关闭事件
				  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){ 
					  bootbox.dialog({
							message: "<span class='bigger-110'>借阅成功！</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						}); 
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
		//检索
		function searchs(){
			top.jzts();
			$("#persLendManaForm").submit();
		}
	</script>
</body>
</html>