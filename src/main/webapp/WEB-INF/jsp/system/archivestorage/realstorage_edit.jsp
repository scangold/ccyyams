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

							<form action="archivestorage/${msg }.do" name="SEForm" id="SEForm"
								method="post">
								<input type="hidden" name="REALSTORAGE_ID" id="REALSTORAGE_ID"
									value="${pd.REALSTORAGE_ID}" />
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">

										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">存储类型名:</td>
											<td><input type="text" name="STORAGE_TYPENAME" id="STORAGE_TYPENAME" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\/\.]/g,'')"
												value="${pd.STORAGE_TYPENAME}" maxlength="30" placeholder="请输入存储介质类型名称如“YP\CD\FD+编号”"
												title="存储类型名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">存储名称:</td>
											<td><input type="text" name="STORAGE_NAME" id="STORAGE_NAME"
												value="${pd.STORAGE_NAME}" maxlength="50" placeholder="输入存储名称"
												title="存储名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">存储类型:</td>
											<td>
										    <select  name="STORAGE_TYPE" id="STORAGE_TYPE" data-placeholder="这里输入存储类型" style="vertical-align:top;width:98%;" >
											<option value="YP">硬盘</option>
											<option value="CD">光盘</option>
											<option value="FD">案卷</option>
											<option value="RAID">服务器盘符</option>
											</select></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">容量:</td>
											<td><input type="number" name="VOLUME" id="VOLUME" onkeyup="value=value.replace(/[^\d\.]/g,'')"
												value="${pd.VOLUME}" maxlength="50" placeholder="输入容量值（只能为数字）"
												title="容量" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">可用容量:</td>
											<td><input type="number" name="ACTVOLUME" id="ACTVOLUME" onkeyup="value=value.replace(/[^\d\.]/g,'')"
												value="${pd.ACTVOLUME}" maxlength="50" placeholder="输入可用容量值（只能为数字）"
												title="可用容量" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">容量单位:</td>
											<td>
										<select  name="UNIT" id="UNIT" data-placeholder="这里输入容量单位" style="vertical-align:top;width:98%;" >
											<option value="KB">KB</option>
											<option value="MB">MB</option>
											<option value="GB">GB</option>
											<option value="TB">TB</option>
											<option value="盒">盒</option>
											<option value="张">张</option>
											<option value="页">页</option>
											<option value="份">份</option>
											<option value="单位">单位</option>
											</select></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">存储位置:</td>
											<td><input type="text" name="LOCATION" id="LOCATION"
												value="${pd.LOCATION}" maxlength="255"
												placeholder="输入存储位置" title="存储位置" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">保存期限:</td>
											<td><input type="text" name="LIMIT" id="LIMIT"
												value="${pd.LIMIT}" maxlength="20"
												placeholder="输入保存期限" title="保存期限" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">删除时间:</td>
											<td><input type="text" name="DELETETIME" id="DELETETIME"
												value="${pd.DELETETIME}" maxlength="20"
												placeholder="输入删除时间" title="删除时间" style="width:98%;" /></td>
										</tr>
										<!-- <tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">删除原因:</td>
											<td><input type="text" name="DELETEWHY" id="DELETEWHY"
												value="${pd.DELETEWHY}" maxlength="30"
												placeholder="输入删除原因" title="删除原因" style="width:98%;" /></td>
										</tr> -->
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">序列号:</td>
											<td><input type="text" name="SERANUM" id="SERANUM"
												value="${pd.SERANUM}" maxlength="50"
												placeholder="输入序列号" title="序列号" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">案卷年限:</td>
											<td><input type="text" name="FD_YEAR" id="FD_YEAR"
												value="${pd.FD_YEAR}" maxlength="10"
												placeholder="输入案卷年限" title="案卷年限" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">档案室编:</td>
											<td><input type="text" name="FD_S" id="FD_S"
												value="${pd.FD_S}" maxlength="10" placeholder="输入档案室编"
												title="档案室编" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">档案馆编:</td>
											<td><input type="text" name="FD_G" id="FD_G"
												value="${pd.FD_G}" maxlength="10" placeholder="输入档案馆编"
												title="档案馆编" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">档案页数:</td>
											<td><input type="text" name="FD_PAGE" id="FD_PAGE"
												value="${pd.FD_PAGE}" maxlength="10" placeholder="输入档案页数"
												title="档案页数" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">详细:</td>
											<td><textarea name="OTHER1" id="OTHER1" title="详细" style="width:98%;resize:none;" maxlength="1024" placeholder="输入详细">${pd.OTHER1}</textarea>
												</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">备注:</td>
											<td><input type="text" name="STORAGE_REMARK" id="STORAGE_REMARK"
												value="${pd.STORAGE_REMARK}" maxlength="255" placeholder="输入备注"
												title="备注" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="saveS();">保存</a> <a
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
		function saveS() {
			if ($("#STORAGE_TYPENAME").val() == "") {
				$("#STORAGE_TYPENAME").tips({
					side : 3,
					msg : '请输入存储介质类型名称如“YP112”',
					bg : '#AE81FF',
					time : 2
				});
				$("#STORAGE_TYPENAME").focus();
				return false;
			}
			if ($("#STORAGE_TYPE").val() == "") {
				$("#STORAGE_TYPE").tips({
					side : 3,
					msg : '请输入存储介质类型名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#STORAGE_TYPE").focus();
				return false;
			}
			if ($("#VOLUME").val() == "") {
				$("#VOLUME").tips({
					side : 3,
					msg : '请输入容量空间值',
					bg : '#AE81FF',
					time : 2
				});
				$("#VOLUME").focus();
				return false;
			}
			if ($("#UNIT").val() == "") {
				$("#UNIT").tips({
					side : 3,
					msg : '请输入容量单位',
					bg : '#AE81FF',
					time : 2
				});
				$("#UNIT").focus();
				return false;
			}
			if ($("#LOCATION").val() == "") {
				$("#LOCATION").tips({
					side : 3,
					msg : '请输入存储位置',
					bg : '#AE81FF',
					time : 2
				});
				$("#LOCATION").focus();
				return false;
			}
			$("#SEForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	</script>
</body>
</html>