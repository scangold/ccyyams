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

							<form action="file/${msg}.do" name="fileEditForm" id="fileEditForm"
								method="post">
								<input type="hidden" name="FILE_ID" id="FILE_ID"
									value="${pd.FILE_ID}" />
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
					
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;word-wrap:break-word;">文件名称:</td>
											<td style="word-wrap:break-word;"><input type="text" name="FILE_NAME" id="FILE_NAME" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\-\.\：\《\》\“\”\‘\’]/g,'')"
												value="${pd.FILE_NAME}" maxlength="100" placeholder="这里输入文件名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">是否电子:</td>
											<td>
											<select class="chosen-select form-control" name="IFDIGIT" id="IFDIGIT" data-placeholder="这里输入是否电子1为电子数据2为模拟数据" style="vertical-align:top;" style="width:98%;" >
											<option value="1">电子数据</option>
											<option value="2">模拟数据</option>
											</select>
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">文件格式:</td>
											<td><input type="text" name="DATAFORM" id="DATAFORM"
												value="${pd.DATAFORM}" maxlength="100" placeholder="这里输入文件格式"
												style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">文件地址:</td>
											<td><input type="text" name="FILE_URL" id="FILE_URL" onkeyup="value=value.replace(/[^\a-\z\A-\Z0-9\u4E00-\u9FA5\:\\\/\.]/g,'')"
												value="${pd.FILE_URL}" maxlength="255" placeholder="这里输入文件地址"
												style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">容量数量:</td>
											<td><input type="text" name="VOLUME" id="VOLUME" onkeyup="value=value.replace(/[^\d\.]/g,'')" 
												value="${pd.VOLUME}" maxlength="50"
												placeholder="这里输入文件容量大小" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">单位:</td>
											<td>
											<select class="chosen-select form-control" name="UNIT" id="UNIT" 
											data-placeholder="这里输入容量单位" style="vertical-align:top;width:98%;" >
											<option value=""></option>
											<option value="KB">KB</option>
											<option value="MB">MB</option>
											<option value="GB">GB</option>
											<option value="TB">TB</option>
											<option value="盒">盒</option>
											<option value="张">张</option>
											<option value="页">页</option>
											<option value="份">份</option>
											<option value="单位">单位</option>
											</select>
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">成果或档案:</td>
											<td>
											<select class="chosen-select form-control" name="IFARCHIVE" id="IFARCHIVE" 
											data-placeholder="选择是否成果" style="vertical-align:top;width:98%;" >
											<option value="1">成果资料</option>
											<option value="2">过程资料</option>
											<option value="3">收集资料</option>
											<option value="4">待分类资料</option>
											<option value="5">档案</option>
											</select>
											</td>
											
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">文件类型:</td>
											<td>
											<select class="chosen-select form-control" name="FILE_TYPE" id="FILE_TYPE" 
											data-placeholder="选择文件类型" style="vertical-align:top;width:98%;" >
											<option value="1">成果资料</option>
											<option value="2">过程资料</option>
											<option value="3">收集资料</option>
											<option value="4">待分类资料</option>
											<option value="5">档案</option>
											</select>
											</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">比例尺:</td>
											<td>
                                            <input list="companys" name="SCALE" id="SCALE" data-placeholder="选择比例尺" style="vertical-align:top;width:98%;"/>
                                            <datalist id="companys">
                                            <option value="1:500">1:500</option>
                                            <option value="1:2000">1:2000</option>
                                            <option value="1:10000">1:10000</option>
                                            <option value="1:50000">1:50000</option>
                                            </datalist>
												</td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">文件备注:</td>
											<td><input type="text" name="FILE_REMARK" id="FILE_REMARK"
												value="${pd.FILE_REMARK}" maxlength="255" placeholder="输入文件备注"
												style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">文件密级:</td>
											<td><input type="text" name="PERMISSION_CLASS" id="PERMISSION_CLASS"
												value="${pd.PERMISSION_CLASS}" maxlength="10" placeholder="输入文件密级"
												style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">创建日期:</td>
											<td><input type="text" name="CREATIONDATE" id="CREATIONDATE"
												value="${pd.CREATIONDATE}" maxlength="50" placeholder="输入创建日期"
												style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">覆盖区域:</td>
											<td><input type="text" name="COVERAGE" id="COVERAGE"
												value="${pd.COVERAGE}" maxlength="255" placeholder="这里输入覆盖区域"
												style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">年份:</td>
											<td><input type="text" name="YEAR" id="YEAR" onkeyup="this.value=this.value.replace(/\D/g,'')"
												value="${pd.YEAR}" maxlength="5" placeholder="这里输入年份"
												style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">详细目录:</td>
											<td><input type="text" name="FILEDETAIL" id="FILEDETAIL"
												value="${pd.FILEDETAIL}" maxlength="1024"
												placeholder="这里输入名称" title="名称" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">临时接收ID:</td>
											<td><input type="text" name="RCTEMP_ID" id="RCTEMP_ID" onkeyup="this.value=this.value.replace(/\D/g,'')"
												value="${receivetemp.rctempId}" maxlength="30" style="width:98%;" /></td>
										</tr>
										
										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="saveF();">保存</a> <a
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
		function saveF() {
			if ($("#FILE_NAME").val() == "") {
				$("#FILE_NAME").tips({
					side : 3,
					msg : '请输入文件名称',
					bg : '#AE81FF',
					time : 2
				});
				$("#FILE_NAME").focus();
				return false;
			}
			if ($("#FILE_URL").val() == "") {
				$("#FILE_URL").tips({
					side : 3,
					msg : '请输入文件存放地址或者URL',
					bg : '#AE81FF',
					time : 2
				});
				$("#FILE_URL").focus();
				return false;
			}
			if ($("#VOLUME").val() == "") {
				$("#VOLUME").tips({
					side : 3,
					msg : '请输入文件容量或数量',
					bg : '#AE81FF',
					time : 2
				});
				$("#VOLUME").focus();
				return false;
			}
			if ($("#UNIT").val() == "") {
				$("#UNIT").tips({
					side : 3,
					msg : '请输入文件容量或数量单位',
					bg : '#AE81FF',
					time : 2
				});
				$("#UNIT").focus();
				return false;
			}
			if ($("#IFARCHIVE").val() == "") {
				$("#IFARCHIVE").tips({
					side : 3,
					msg : '请选择输入是否成果获档案',
					bg : '#AE81FF',
					time : 2
				});
				$("#IFARCHIVE").focus();
				return false;
			}
			if ($("#FILE_TYPE").val() == "") {
				$("#FILE_TYPE").tips({
					side : 3,
					msg : '请输入文件类型',
					bg : '#AE81FF',
					time : 2
				});
				$("#FILE_TYPE").focus();
				return false;
			}
			$("#fileEditForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
	</script>
</body>
</html>