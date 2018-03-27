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
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目范围ID:</td>
											<td><input type="text" name="COVERAGE_ID" id="COVERAGE_ID"
												value="${pd.COVERAGE_ID}" maxlength="30" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"
												placeholder="这里输入名称" title="名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;word-wrap:break-word;">项目类型:</td>
											<td id="juese">
											<select class="chosen-select form-control" name="PRJTYPE" id="prjtypeid" data-placeholder="请选择类型" style="vertical-align:top;" style="width:98%;" >
											<option value=""></option>
											<c:forEach items="${prjtypeList}" var="prjtypeList">
												<option value="${prjtypeList.PRJTYPE }" <c:if test="${pd.PRJTYPE == prjtypeList.PRJTYPE}">selected</c:if>>${prjtypeList.PRJTYPE_NAME }</option>
											</c:forEach>
											</select>
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;word-wrap:break-word;">项目名称:</td>
											<td style="word-wrap:break-word;"><input type="text" name="PRJ_NAME" id="PRJ_NAME"
												value="${pd.PRJ_NAME}" maxlength="255" placeholder="这里输入名称(字段不包括文件夹禁止字符)" 
												title="名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目来源:</td>
										    <td><select  name="PRJ_ORIGIN" id="PRJ_ORIGIN" data-placeholder="这里选择项目来源" style="vertical-align:top;width:98%;" >
											<option value="国家">国家</option>
											<option value="市场">市场</option>
											</select></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目负责人:</td>
											<td><input type="text" name="PRJ_LEADER" id="PRJ_LEADER"
												value="${pd.PRJ_LEADER}" maxlength="20" placeholder="这里输入名称"
												title="名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目实施单位:</td>
											<td><input type="text" name="PRJ_DEPART" id="PRJ_DEPART"
												value="${pd.PRJ_DEPART}" maxlength="100" placeholder="这里输入名称"
												title="名称" style="width:98%;" /></td>
										</tr>
										<!-- <tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目开始时间:</td>
											<td><input type="text" name="PRJ_STARTTIME" id="PRJ_STARTTIME"
												value="${pd.PRJ_STARTTIME}" maxlength="30"
												placeholder="这里输入名称" title="名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目结束时间:</td>
											<td><input type="text" name="PRJ_ENDTIME" id="PRJ_ENDTIME"
												value="${pd.PRJ_ENDTIME}" maxlength="30"
												placeholder="这里输入名称" title="名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目进度:</td>
											<td><input type="text" name="PRJ_PROGRESS" id="PRJ_PROGRESS"
												value="${pd.PRJ_PROGRESS}" maxlength="30"
												placeholder="这里输入名称" title="名称" style="width:98%;" /></td>
										</tr> -->
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目备注:</td>
											<td><input type="text" name="REMARK" id="REMARK"
												value="${pd.REMARK}" maxlength="255" placeholder="这里输入名称"
												title="名称" style="width:98%;" /></td>
										</tr>
										<%-- <tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户:</td>
											<td id="juese">
											<select class="chosen-select form-control" name="USER_ID" id="USER_ID" data-placeholder="请选择用户" style="vertical-align:top;" style="width:98%;" >
											<option value=""></option>
											<c:forEach items="${userList}" var="userList">
												<option value="${userList.USER_ID }" <c:if test="${userList.USER_ID == pd.USER_ID }">selected</c:if>>${userList.NAME }</option>
											</c:forEach>
											</select>
											</td>
										</tr> --%>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">年份:</td>
											<td><input type="text" name="YEAR" id="YEAR"
												value="${pd.YEAR}" maxlength="5" placeholder="这里输入名称"
												title="名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">保存时间:</td>
											<td><input type="text" name="RECORD_LIMIT" id="RECORD_LIMIT" onkeyup="this.value=this.value.replace(/\D/g,'')"
												value="${pd.RECORD_LIMIT}" maxlength="10"
												placeholder="这里输入名称" title="名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">项目密级:</td>
											<td><input type="text" name="SECURITY_CLASS" id="SECURITY_CLASS" onkeyup="this.value=this.value.replace(/\D/g,'')"
												value="${pd.SECURITY_CLASS}" maxlength="10"
												placeholder="这里输入名称" title="名称" style="width:98%;" /></td>
										</tr>
										<!-- <tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">索取号:</td>
											<td><input type="text" name="PRO_NUM" id="PRO_NUM"
												value="${pd.PRO_NUM}" maxlength="30" placeholder="这里输入名称"
												title="名称" style="width:98%;" /></td>
										</tr> -->
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">是否自动生成纸质档案案卷:</td>
										    <td><select  name="KMSBOXAUTO" id="KMSBOXAUTO" data-placeholder="这里选择" style="vertical-align:top;width:98%;" >
											<option value="1">是</option>
											<option value="0">否</option>
											</select></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="saveP();">保存</a> <a
												class="btn btn-mini btn-danger"
												onclick="top.Dialog.close();">取消</a></td>
										</tr>
									</table>
								</div>
								<div id="zhongxin2" class="center" style="display:none">
									<br /> <br /> <br /> <br /> <br /> <img
										src="static/images/jiazai.gif" /><br />
									<h4 class="lighter block green">提交中...</h4>
								</div>
							</form>

							<div id="zhongxin2" class="center" style="display:none">
								<img src="static/images/jzx.gif" style="width: 50px;" /><br />
								<h4 class="lighter block green"></h4>
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
		//保存
		function saveP() {
			if ($("#PRJ_NAME").val() == "") {
				$("#PRJ_NAME").tips({
					side : 3,
					msg : '请输入名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#PRJ_NAME").focus();
				return false;
			}
			if ($("#Prjtype").val() == "") {
				$("#Prjtype").tips({
					side : 3,
					msg : '请输入项目类型',
					bg : '#AE81FF',
					time : 2
				});
				$("#Prjtype").focus();
				return false;
			}
			if ($("#PRJ_ORIGIN").val() == "") {
				$("#PRJ_ORIGIN").tips({
					side : 3,
					msg : '请输入项目来源',
					bg : '#AE81FF',
					time : 2
				});
				$("#PRJ_ORIGIN").focus();
				return false;
			}
			$("#prjeForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	</script>
</body>
</html>