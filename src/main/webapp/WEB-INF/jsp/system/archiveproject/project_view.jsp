<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">

							<form action="project/${msg }.do" name="prjeForm" id="prjeForm"
								method="post">
								<input type="hidden" name="PRJ_ID" id="PRJ_ID"
									value="${pd.PRJ_ID}" />
								<div id="zhongxin" style="padding-top: 13px;">
										<table id="table_report" class="table table-striped table-bordered table-hover">
										<c:if test="${fx != 'head'}">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">类型:</td>
											<td id="juese">
											<select class="chosen-select form-control" name=PRJTYPE id="PRJTYPE" style="vertical-align:top;" style="width:98%;" disabled="disabled">
											<c:forEach items="${prjtypeList}" var="role">
												<option value="${prjtype.PRJTYPE }" <c:if test="${prjtype.PRJTYPE == pd.PRJTYPE}">selected</c:if>>${prjtype.PRJTYPE_NAME }</option>
											</c:forEach>
											</select>
											</td>
										</tr>
										</c:if>
										<c:if test="${fx == 'head'}">
											<input name="PRJTYPE" id="PRJTYPE" value="${pd.PRJTYPE }" type="hidden" />
										</c:if>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目范围ID:</td>
											<td><input type="text" name="COVERAGE_ID" id="COVERAGE_ID" value="${pd.COVERAGE_ID}" maxlength="32" title="项目范围ID" style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目名称:</td>
											<td><input type="text" name="PRJ_NAME" id="PRJ_NAME" value="${pd.PRJ_NAME}" maxlength="32" title="项目名称"  style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目来源:</td>
											<td><input type="text" name="PRJ_ORIGIN" id="PRJ_ORIGIN"  value="${pd.PRJ_ORIGIN }"  maxlength="32" placeholder="项目来源" title="项目来源" style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目负责人::</td>
											<td><input type="text" name="PRJ_LEADER" id="PRJ_LEADER"  value="${pd.PRJ_LEADER }"  maxlength="32" title="项目负责人:" style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目实施单位:</td>
											<td><input type="text" name="PRJ_DEPART" id="PRJ_DEPART"  value="${pd.PRJ_DEPART }" maxlength="32" title="项目实施单位"  style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目开始时间:</td>
											<td><input type="text" name="PRJ_STARTTIME" id="PRJ_STARTTIME"value="${pd.PRJ_STARTTIME }"  maxlength="64" title="项目开始时间" style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目结束时间:</td>
											<td><input type="text" name="PRJ_ENDTIME" id="PRJ_ENDTIME"value="${pd.PRJ_ENDTIME }"  maxlength="64" title="项目结束时间" style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目进度:</td>
											<td><input type="text" name="PRJ_PROGRESS" id="PRJ_PROGRESS"value="${pd.PRJ_PROGRESS }"  maxlength="64" title="项目进度" style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目备注:</td>
											<td><input type="text" name="REMARK" id="REMARK"value="${pd.REMARK }"  maxlength="64" title="项目备注" style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户:</td>
											<td id="juese">
											<select class="chosen-select form-control" name="USER_ID" id="USER_ID" data-placeholder="用户" style="vertical-align:top;" style="width:98%;"  disabled="disabled" >
											<option value=""></option>
											<c:forEach items="${userList}" var="userList">
												<option value="${userList.USER_ID }" <c:if test="${userList.USER_ID == pd.USER_ID }">selected</c:if>>${userList.USERNAME }</option>
											</c:forEach>
											</select>
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">年份:</td>
											<td><input type="text" name="YEAR" id="YEAR"value="${pd.YEAR }"  maxlength="64" title="年份" style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">保存时间:</td>
											<td><input type="text" name="RECORD_LIMIT" id="RECORD_LIMIT"value="${pd.RECORD_LIMIT }"  maxlength="64" title="保存时间" style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目密级:</td>
											<td><input type="text" name="SECURITY_CLASS" id="SECURITY_CLASS"value="${pd.SECURITY_CLASS }"  maxlength="64" title="项目密级" style="width:98%;" disabled="disabled"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">索取号:</td>
											<td><input type="text" name="PRO_NUM" id="PRO_NUM"value="${pd.PRO_NUM }"  maxlength="64" title="索取号" style="width:98%;" disabled="disabled"/></td>
										</tr>
									</table>
								</div>
								
							</form>
							</div>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());
		$(function() {
			var str1 = '<c' + ':if test="' + '$' + '{QX.' + $("#QX_NAME").val();
			var str2 = ' == 1 }">这里放按钮<'+'/c:'+'if>';
			$("#code").val(str1 + str2);
		});
		//拼代码
		function changecode(value) {
			var str1 = '<c'+':if test="'+'$'+'{QX.';
			var str2 = ' == 1 }">这里放按钮<'+'/c:'+'if>';
			$("#code").val(str1 + value + str2);
		}

	</script>
</body>
</html>