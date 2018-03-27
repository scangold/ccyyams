<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<style type="text/css">



.date-picker, .datepicker-days {
	cursor: pointer;
}

html {
	background: #fff;
}
</style>

<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
</head>
<body style="background: #fff;">
	<form action="pms/viewPersHonor.do"  method="post">
	<input name='P_ID' value='${pd.P_ID}' style='display:none;'/>
	<input name='NAME' value='${pd.NAME}' style='display:none;'/>
	<div style="border-bottom:2px solid #438eb9  !important;font-size: 18px;height: 60px;line-height: 60px;"><span style='margin-left:20px;font-size:26px;color:#438eb9 '>${pd.NAME}</span><span style='margin-left:10px;'>获奖信息：</span></div>
		<table class='table table-bordered ' id="table_report" style="width: 100%;background: #fff;" border="0">

			<thead>
				<tr>
					<th class="center" style="width:5%">序号</th>
					<!-- <th class="center" style='width:10%'>姓名</th> -->
					<th class="center" style="width:10%">获奖名称</th>
					<th class="center" style="width:10%">获奖时间</th>
					<th class="center" style="width:12%">获奖等级</th>
					<th class="center" style="width:20%">颁奖机构</th>
					<th class="center" style="width:23%">详情备注</th>
					<th class="center" style="width:23%">操作</th>
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
															<%-- <td class="center">${data.NAME}</td> --%>
															<td class="center">${data.PRYZS_NAME}</td>
															<td class="center"><fmt:formatDate value="${data.PRYZS_TIME}" pattern="yyyy-MM-dd"/></td>
															<td class="center">${data.PRYZS_NUM}</td>
															<td class="center">${data.PRYZS_ORGNIZATION}</td>
															<td class="center">${data.PRYZS_BZ}</td>
															<td class="center">
															<%-- <c:if test="${QX.edit == 1 }"> --%>
																<a class="btn btn-xs btn-default" title="编辑"
																	onclick="editPHo('${data.PRYZS_ID }')"> <i
																	class="ace-icon fa fa-pencil bigger-120"
																	title="编辑"></i>
																</a>
																<a class="btn btn-xs btn-danger" title="删除"
																	onclick="deletePHo('${data.PRYZS_ID }')"> <i
																	class="ace-icon fa fa-trash-o bigger-120"
																	title="删除"></i>
																</a>
																
															<%-- </c:if> --%>
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
			</tbody>
		</table>
		
						<div class="page-header position-relative" style="width: 100%;background: #fff;">
									<table style="width: 100%;background: #fff;">
									 	<tr>
											<td style="vertical-align: top;">
													<a class="btn btn-mini btn-success" style=" margin-left: 5px;" onclick="addPHo('${pd.NAME}','${pd.P_ID }');">新增获奖荣誉</a>
												</td>
											<td style="vertical-align: top;"><div class="pagination"
													style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
										</tr>
									</table>
								</div>
					
	</form>
	<%@ include file="../../system/index/foot.jsp"%>
		<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
			<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script type="text/javascript">
    $(top.hangge());
    //添加人事经历
    function addPHo(name,pId){
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
  //修改获奖荣誉
   function editPHo(PRYZS_ID){
	  debugger;
	    top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="修改工作经历";
		 diag.URL = '<%=basePath%>pms/editPersHo.do?PRYZS_ID='+PRYZS_ID;
		 diag.Width = 620;
		 diag.Height = 298;
		 diag.CancelEvent = function(){ //关闭事件
			  if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){ 
				  bootbox.dialog({
						message: "<span class='bigger-110'>更新获奖荣誉成功！</span>",
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
    
  //删除获奖荣誉
    function deletePHo(PRYZS_ID){
    	bootbox.confirm("确定要删除该段获奖荣誉吗?", function(flag) {
    		if(flag){
    			   $.ajax({  
 			          dataType: "json",
 			          data:{"PRYZS_ID":PRYZS_ID},
 			          url: "pms/deletePHo.do",  
 			          success: function(data){
 			        	  //debugger;
 			        /* 	  bootbox.dialog({
 								message: "<span class='bigger-110'>删除人事信息成功！</span>",
 								buttons: 			
 								{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
 							});  */
 			        	 if('${page.currentPage}' == '0'){
 							 top.jzts();
 							 setTimeout("self.location=self.location",100);
 						 }else{
 							 nextPage(${page.currentPage});
 						 }
 			          }
 			        }); 
    		}
    	})
  }
   
    $(function(){
    	//日期框
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		});
    })
    </script>


</body>
</html>