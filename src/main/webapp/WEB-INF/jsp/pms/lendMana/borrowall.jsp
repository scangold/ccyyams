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
#table_report td {
	width: 35%;
	/*  border: none !important;*/
}

#table_report .tdNew {
	width: 15%;
}

.date-picker, .datepicker-days {
	cursor: pointer;
}
</style>
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<script type="text/javascript"
	src="static/js/jquery/jquery-3.0.0.min.js"></script>
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
</head>

<body>

	<table style="width: 100%; background: #fff;">
		<tr>
			<td>
				<form action="pms/saveAllLendInfo.do" name="saveAllLendInfo"
					id="saveAllLendInfo" method="post">
					<div class="form-group hidden">
						<label for="ac_box_id">file_ids</label> <input value="${pd.ids}"
							name="file_ids" id="file_ids">
					</div>
					<div id="zhongxin" style="padding-top: 13px;">

						<table class='table table-striped table-bordered table-hover' id="table_report">
							<thead>
								<tr>
									<th class="center" style="width: 10%">序号</th>
									<th class="center" style='width: 45%'>档案盒号</th>
									<th class="center" style="width: 45%">档案盒名称</th>
								</tr>
							</thead>
							<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty PmsDocMains}">

										<c:forEach items="${PmsDocMains}" var="data" varStatus="vs">
											<tr>
												<td class='center' style="width: 30px;">${vs.index+1}</td>
												<td class='center'>${data.PFILE_NUM}</td>
												<td class='center'>${data.PFILE_NAME}</td>
											</tr>
										</c:forEach>

									</c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="100" class="center">没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
							
							
						</table>

						<table id="table_report" class="table">
							<c:if test="${fx != 'head'}">
								<tr>
										<td class="tdNew">借阅人:</td>
								<td><select class="chosen-select form-control"
									name="borrow_user_id" id="borrow_user_id"
									data-placeholder="请选择借阅人" style="vertical-align: top;"
									style="width:98%;">
										<c:forEach items="${pInformationList}" var="pinfodata">

											<option value="${pinfodata.userId }">${pinfodata.name }</option>
										</c:forEach>
								</select></td>
									<td class="tdNew">到期时间:</td>
									<td><input class="span10 date-picker" name="endtime"
										id="endtime" value="${pd.ENDTIME}" type="text"
										data-date-format="yyyy-mm-dd" style="width: 98%;"
										placeholder="2018-08-18" title="到期时间" /></td>
								</tr>

							</c:if>
							<c:if test="${fx == 'head'}">
								<input name="ROLE_ID" id="role_id" value="${pd.ROLE_ID }"
									type="hidden" />
							</c:if>

							<tr>
							
								<td class="tdNew">借阅主题:</td>
								<td><input type="text" name="name" id="name"
									value="${pd.NAME }" placeholder="这里输入主题" title="主题"
									style="width: 98%;" /></td>
									<td class="tdNew">描述:</td>
								<td colspan='1'><input type="text" name="describle"
									id="describle" value="${pd.DESCRIBLE }" placeholder="这里输入借阅描述"
									title="描述" style="width: 98%;" /></td>

							</tr>


						
							<tr>
								<td style="text-align: center;" colspan="10"><a
									class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
									class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a></td>
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
		function save() {
			$('#saveAllLendInfo').submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}

		$(document).ready(function() {
			//下拉框
			$('.chosen-select').chosen({
				allow_single_deselect : true,
				width : "98%"
			});

			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
		});
	</script>
</body>
</html>