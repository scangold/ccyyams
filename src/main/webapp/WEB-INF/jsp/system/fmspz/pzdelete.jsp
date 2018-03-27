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
							<form action="pz/deletepz.do" name="pzForm" id="pzForm"
								method="post">
								<input type="text" name="acdoc_id" class="hidden" id="acdoc_id" value="${pd.fmsPZDoc.acdoc_id }" style="width:98%;display:none;"/>
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">盒号:</td>
											<td>
												<input type="text" name="acdoc_box" id="acdoc_box" value="${pd.fmsPZDoc.acdoc_box }"
												maxlength="32" placeholder="输入盒号例如2017010101" style="width: 98%;" readonly="readonly">
												</td>
										</tr>
										<tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">册号:</td>
											<td>
												<input type="text" name="acdoc_volume" id="acdoc_volume" value="${pd.fmsPZDoc.acdoc_volume}"
												maxlength="32" placeholder="输入盒号例如2017010101" style="width: 98%;" readonly="readonly">
												</td>
										</tr>
										<tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">凭证号:</td>
											<td>
											
											<input type="text" name="acdoc_num" id="acdoc_num"  value="${pd.fmsPZDoc.acdoc_num}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" readonly="readonly"></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">销毁方式:</td>
											<td>
											
											<input type="text" name="destroy_how" id="destroy_how"  value="${pd.destroy_how}"
												maxlength="32" placeholder="输入销毁方式" title="描述"
												style="width: 98%;" /></td>
										</tr>
																				<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">销毁人:</td>
											<td>
											
											<input type="text" name="destroy_check" id="destroy_check" value="${pd.destroy_check}"
												maxlength="32" placeholder="输入办理销毁人名字" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="save();">注销</a> <a
												class="btn btn-mini btn-danger"
												onclick="top.Dialog.close();">取消</a></td>
										</tr>
									</table>
								</div>
								<div id="zhongxin2" class="center" style="display: none">
									<br /> <br /> <br /> <br /> <img
										src="static/images/jiazai.gif" /><br />
									<h4 class="lighter block green"></h4>
									
								</div>
							</form>
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
	<!-- basic scripts -->
		<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript">
    $(top.hangge());
  //保存新增信息与判断不能为空
	function save(){
		if ($("#destroy_how").val() == "") {
			$("#destroy_how").tips({
				side : 3,
				msg : '请输入销毁方式',
				bg : '#AE81FF',
				time : 2
			});
			$("#destroy_how").focus();
			return false;
		}
		if ($("#destroy_check").val() == "") {
			$("#destroy_check").tips({
				side : 3,
				msg : '请输入办理销毁人名字',
				bg : '#AE81FF',
				time : 2
			});
			$("#destroy_check").focus();
			return false;
		}
		debugger
		$("#pzForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
    </script>

	 
</body>
</html>