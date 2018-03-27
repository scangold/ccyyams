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
						<form action="pms/${msg}.do" name="newPersHoForm" id="newPersHoForm" method="post">
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table" style="background: #fff;">
								            <tr style='display:none;'>
								            <td>
											<input name="pId" id="pId" value="${pd.P_ID }" />
											<input name="pryzsId" id="pryzsId" value="${pd.PRYZS_ID }" />
											</td>
									        </tr>
											<tr>
											<td  class="tdNew" >姓名:</td>
										    <td><input type="text" name="name" id="name"  value="${pd.NAME }"  readonly="readonly" style="width:98%;"/></td>
											<td  class="tdNew">获奖时间:</td>
											<td><input class="span10 date-picker" name="pryzsTime" id="pryzsTime"  value="${pd.PRYZS_TIME}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="获奖时间" title="获奖时间"/></td>
										</tr>
										<tr>
										<td  class="tdNew" >获奖名称:</td>
										<td><input type="text" name="pryzsName" id="pryzsName"  value="${pd.PRYZS_NAME }"  placeholder="这里输入获奖名称" title="获奖名称" style="width:98%;"/></td>
										<td  class="tdNew" >获奖等级:</td>
										<td><input type="text" name="pryzsNum" id="pryzsNum"  value="${pd.PRYZS_NUM }"  maxlength="32" placeholder="这里输入获奖等级" title="获奖等级" style="width:98%;"/></td>
										</tr>

										<tr>
											<td  class="tdNew">颁奖机构:</td>
											<td ><input type="text" name="pryzsOrgnization" id="pryzsOrgnization" maxlength="255"  value="${pd.PRYZS_ORGNIZATION }" placeholder="这里输入颁奖机构" title="颁奖机构" style="width:98%;"/></td>
										<td  class="tdNew">备注:</td>
											<td ><input type="text" name="pryzsBz" id="pryzsBz" value="${pd.PRYZS_BZ }" maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
										
										</tr>
					
										<tr  >
											<td style="text-align: center;" colspan="10" >
												<a  class="btn btn-mini btn-primary" onclick="PHosave();">保存</a>
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
  //保存新增的获奖荣誉
	function PHosave(){
		$("#newPersHoForm").submit();
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