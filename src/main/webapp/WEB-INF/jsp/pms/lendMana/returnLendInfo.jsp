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
#table_report td{width:35%;border:none !important;}
#table_report .tdNew{width:15%;}
.date-picker,.datepicker-days{cursor:pointer;}
</style>
 <!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<script type="text/javascript" src="static/js/jquery/jquery-3.0.0.min.js"></script>
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
</head>

<body>

<table style="width:100%;background: #fff;">
						<tr>
						<td>
						<form action="pms/saveBackInfo.do" name="newLendForm" id="newLendForm" method="post" >
						<input type="text" name="id" id="id"  value="${pd.ID }" style="width:98%;display:none;"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table">
										<c:if test="${fx != 'head'}">
										<tr>
										<td  class="tdNew">档案名称:</td>
											<td><input type="text" readonly="readonly" name="FILENAME" id="FILENAME"  value="${pd.FILENAME }"  maxlength="32" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
										 <td class="tdNew">归还人:</td>
											<td>
											
											<select class="chosen-select form-control"  name="return_user_id" id="return_user_id" data-placeholder="请选择借阅人" style="vertical-align:top;" style="width:98%;" >
											<c:forEach items="${pInformationList}" var="pinfodata">
											
 											<option value="${pinfodata.userId }">${pinfodata.name }</option> 
											</c:forEach>
											</select>
											</td>
										</tr>
	
										</c:if>
										<c:if test="${fx == 'head'}">
											<input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }" type="hidden" />
										</c:if>

										
										<tr>
											<td style="text-align: center;" colspan="10" >
												<a  class="btn btn-mini btn-primary" onclick="Psave();">确定</a>
												<a  class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> 
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

	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>

    <script type="text/javascript">
    $(top.hangge());
  
  //保存修改的人事信息
	function Psave(){
		$('#newLendForm').submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
  }

	$(document).ready(function(){
 		//下拉框
 	   $('.chosen-select').chosen({ allow_single_deselect: true,width:"98%" }); 
		
 		//日期框
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		});
 	});
	</script>
</body>
</html>