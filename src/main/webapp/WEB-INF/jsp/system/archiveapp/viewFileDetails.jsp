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
	<table id="table_report" class="table" style="background: #fff;">
			<tr>
				<td class="tdNew">文件名称:</td>
				<td colspan='3'><input type="text" name="FILE_NAME" id="FILE_NAME"
					value="${pd.FILE_NAME }" placeholder="无" title="文件名称"
					style="width: 98%;" /></td>
			</tr>
           
		<tr>
			<td class="tdNew">数字文件格式:</td>
			<td  colspan='3'><input type="text" name="DATAFORM" id="DATAFORM"
				value="${pd.DATAFORM }"  placeholder="无" title="用户名"
				style="width: 98%;" /></td>
		</tr>
        <tr>
			<td class="tdNew">文件地址:</td>
			<td colspan='3'><textarea name="FILE_URL" id="FILE_URL"
				type="text" style="width: 98%;"
				placeholder="无" title="文件地址" >${pd.FILE_URL}</textarea></td>
		</tr>
		  <tr>
				<td class="tdNew">是否数字:</td>
				<td>
				<c:choose>
					<c:when test="${pd.IFDIGIT=='1'}">
						<input name="IFDIGIT" id="IFDIGIT" value="是" type="text"
							style="width: 98%;" placeholder="无" title="是否数字" />
					</c:when>
					<c:otherwise>
						<input name="IFDIGIT" id="IFDIGIT" value="否" type="text"
							style="width: 98%;" placeholder="无" title="是否数字" />
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		<tr>
			<td class="tdNew">数据量</td>
			<td><input type="text" name="VOLUME" id="VOLUME"
				value="${pd.VOLUME }"  placeholder="无" title="数据量"
				style="width: 98%;" /></td>

			<td class="tdNew">单位:</td>
			<td><input type="text" name="UNIT" id="UNIT"
				value="${pd.UNIT }" placeholder="无" title="单位"
				style="width: 98%;" /></td>
		</tr>
		<tr>
			<td class="tdNew">是否成果:</td>
			<td>
			<c:choose>
					<c:when test="${pd.IFARCHIVE=='1'}">
						<input name="IFARCHIVE" id="IFARCHIVE" value="是" type="text"
							style="width: 98%;" placeholder="无" title="是否成果" />
					</c:when>
					<c:otherwise>
						<input name="IFARCHIVE" id="IFARCHIVE" value="否" type="text"
							style="width: 98%;" placeholder="无" title="是否成果" />
					</c:otherwise>
				</c:choose>
			</td>
			<td class="tdNew">文件类型:</td>
			<td><input name="FILE_TYPE" id="FILE_TYPE" value="${pd.FILE_TYPE}" type="text"
							style="width: 98%;" placeholder="无" title="文件类型" />
					</td>
		</tr>
		<tr>
			<td class="tdNew">比例尺:</td>
			<td><input type="text" name="SCALE" id="SCALE"
				value="${pd.SCALE }" placeholder="无" 
				title="比例尺" style="width: 98%;" /></td>
			<td class="tdNew">索取号:</td>
			<td><input name="GET_ID" id="GET_ID"
				value="${pd.GET_ID}" type="text" 
				style="width: 98%;" placeholder="无" title="索取号" /></td>
		</tr>
		<tr>
			<td class="tdNew">文件备注:</td>
			<td><input type="text" name="FILE_REMARK" id="FILE_REMARK"
				value="${pd.FILE_REMARK }" placeholder="无"
				title="文件备注" style="width: 98%;" /></td>

			<td class="tdNew">生成日期:</td>
			<td><input name="CREATIONDATE" id="CREATIONDATE"
				value="${pd.CREATIONDATE}" type="text" data-date-format="yyyy-mm-dd"
				style="width: 98%;" placeholder="无" title="生成日期" /></td>
		</tr>
		<tr>
			<td class="tdNew">审批级别:</td>
			<td><input type="text" name="PERMISSION_CLASS" id="PERMISSION_CLASS"
				value="${pd.PERMISSION_CLASS }"  placeholder="无" title="审批级别"
				style="width: 98%;" /></td>
            <td class="tdNew">年份:</td>
			<td><input type="text" name="YEAR" id="YEAR"
				value="${pd.YEAR }"  placeholder="无" title="年份"
				style="width: 98%;" /></td>
		</tr>
		<tr>
			<td style="text-align: center;" colspan="10"><a
				class="btn btn-mini btn-primary" onclick="top.Dialog.close();">确定</a>
			</td>
		</tr>
	</table>

	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script type="text/javascript">
    $(top.hangge());
    
  //修改获奖荣誉
   <%-- function editPHo(PRYZS_ID){
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
  } --%>
    
  //删除获奖荣誉
    /* function deletePHo(PRYZS_ID){
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
 	/* 		        	 if('${page.currentPage}' == '0'){
 							 top.jzts();
 							 setTimeout("self.location=self.location",100);
 						 }else{
 							 nextPage(${page.currentPage});
 						 }
 			          }
 			        }); 
    		}
    	})
  } */ 
   
/*     $(function(){
    	//日期框
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		});
    }) */
    </script>


</body>
</html>