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
<html lang="en" >
<head>
<base href="<%=basePath%>">
<style type="text/css">
#table_report td{width:35%;border:none !important;}
#table_report .tdNew{width:15%;}
.date-picker,.datepicker-days{cursor:pointer;}
html{    background: #fff;}
</style>

<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
</head>
<body>
<table style="width:100%;background: #fff;">
						<tr>
						<td>
						<form action="pms/${msg}.do" name="newPersExForm" id="newPersExForm" method="post">
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table" style="background: #fff;">
								            <tr style='display:none;'>
								            <td>
											<input name="pId" id="pId" value="${pd.P_ID }" />
											<input name="pExId" id="pExId" value="${pd.P_EX_ID }" />
											</td>
									        </tr>
											<tr>
											<td  class="tdNew">开始时间:</td>
											<td><input class="span10 date-picker" name="starttime" id="starttime"  value="${pd.STARTTIME}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="开始时间" title="结束时间"/></td>
											<td  class="tdNew">结束时间:</td>
											<td><input class="span10 date-picker" name="endtime" id="endtime"  value="${pd.ENDTIME}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="结束时间" title="结束时间"/></td>
										</tr>
										<tr>
										<td  class="tdNew" >姓名:</td>
										<td><input type="text" name="name" id="name"  value="${pd.NAME }"  readonly="readonly" style="width:98%;"/></td>
										<td  class="tdNew" >工作单位/部门:</td>
										<td><input type="text" name="place" id="place"  value="${pd.PLACE }"  maxlength="32" placeholder="这里输入工作单位/部门" title="工作单位/部门" style="width:98%;"/></td>
										</tr>
										
									
										

										<tr>
											<td  class="tdNew">简要经历:</td>
											<td colspan='3'><input type="text" name="sth" id="sth" value="${pd.STH }" maxlength="32" placeholder="这里输入简要经历" title="简要经历" style="width:98%;"/></td>
										
										</tr>
					
										<tr>
											<td  class="tdNew"">详情备注:</td>
											<td colspan='3'><input type="text" name="bz" id="bz" value="${pd.BZ }" maxlength="32" placeholder="这里输入简要经历" title="简要经历" style="width:98%;"/></td>
										</tr>
	
										<tr  >
											<td style="text-align: center;" colspan="10" >
												<a  class="btn btn-mini btn-primary" onclick="PExsave();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> 
											</td>
										</tr>
									</table>
						</div>
						<div id="zhongxin2" class="center" style="display: none">
									<br /> <br /> <br /> <br /> <img
										src="static/images/jiazai.gif" /><br />
									<h4 class="lighter block green"></h4>
								</div>			
						</form>
						</td>
						</tr>
					</table>
		<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript">
    $(top.hangge());
  //保存新增的人事信息
	function PExsave(){
		$("#newPersExForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
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