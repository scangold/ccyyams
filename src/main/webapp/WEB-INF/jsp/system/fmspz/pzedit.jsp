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
							<form action="pz/edit.do" name="pzForm" id="pzForm"
								method="post">
								<input type="text" name="acdoc_id" class="hidden" id="acdoc_id" value="${pd.fmsPZDoc.acdoc_id }" style="width:98%;display:none;"/>
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">盒号:</td>
											<td>
												<select class="chosen-select form-control" name="ac_box_id" id="box" 
											data-placeholder="这里输入容量单位" style="vertical-align:top;width:98%;" >
									<option selected="selected" value="${pd.fmsPZDoc.ac_box_id}">${pd.fmsPZDoc.acdoc_box }</option>
									<c:forEach items="${pd.fmsPZDoc.pzbox}" var="pz">
										<option value="${pz.ac_box_id}">${pz.acdoc_box}</option>
									</c:forEach>
									</select>
												</td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">册号:</td>
											<td>
												<input type="text" name="acdoc_volume" id="acdoc_volume" value="${pd.fmsPZDoc.acdoc_volume}"
												maxlength="32" placeholder="输入盒号例如2017010101" style="width: 98%;" readonly="readonly">
												</td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">凭证号:</td>
											<td>
											
											<input type="text" name="acdoc_num" id="acdoc_num"  value="${pd.fmsPZDoc.acdoc_num}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
																				<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">年份:</td>
											<td>
											
											<input type="text" name="acdoc_year" id="acdoc_year" value="${pd.fmsPZDoc.acdoc_year}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
																				<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">月份:</td>
											<td>
											
											<input type="text" name="acdoc_month" id="acdoc_month"  value="${pd.fmsPZDoc.acdoc_month}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
																				<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">保存年限:</td>
											<td>
											
											<input type="text" name="acdoc_valid" id="acdoc_valid"  value="${pd.fmsPZDoc.acdoc_valid}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
																														<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">保管室号:</td>
											<td>
											
											<input type="text" name="acdoc_room" id="acdoc_room"  value="${pd.fmsPZDoc.acdoc_room}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
																														<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">保管箱号:</td>
											<td>
											
											<input type="text" name="acdoc_case" id="acdoc_case"  value="${pd.fmsPZDoc.acdoc_case}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">备注:</td>
											<td>
											<input type="text" style="width: 338px;height: 50px;max-width: 338px;max-height: 50px" name="acdoc_remark" id="acdoc_remark" value="${pd.fmsPZDoc.acdoc_remark}" placeholder="输入备注" maxlength="300" /></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
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
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function() {
		if ($("#user_id").val() != "") {
			$("#loginname").attr("readonly", "readonly");
			$("#loginname").css("color", "gray");
		}
		
		
		 $(".removeitem").click(function(){  
			   $(this).parent().remove();			
			}); 
	});
    //保存
	function save(){
		if ($("#acdoc_num").val() == "") {
			$("#acdoc_num").tips({
				side : 3,
				msg : '请输入凭证号',
				bg : '#AE81FF',
				time : 2
			});
			$("#acdoc_num").focus();
			return false;
		}
		if ($("#acdoc_year").val() == "") {
			$("#acdoc_year").tips({
				side : 3,
				msg : '请输入年份',
				bg : '#AE81FF',
				time : 2
			});
			$("#acdoc_year").focus();
			return false;
		}
		if ($("#acdoc_month").val() == "") {
			$("#acdoc_month").tips({
				side : 3,
				msg : '请输入月份',
				bg : '#AE81FF',
				time : 2
			});
			$("#acdoc_month").focus();
			return false;
		}
		if ($("#acdoc_valid").val() == "") {
			$("#acdoc_valid").tips({
				side : 3,
				msg : '请输入保存年限',
				bg : '#AE81FF',
				time : 2
			});
			$("#acdoc_valid").focus();
			return false;
		}
		if ($("#acdoc_room").val() == "") {
			$("#acdoc_room").tips({
				side : 3,
				msg : '请输入档案室号',
				bg : '#AE81FF',
				time : 2
			});
			$("#acdoc_room").focus();
			return false;
		}
		if ($("#acdoc_case").val() == "") {
			$("#acdoc_case").tips({
				side : 3,
				msg : '请输入保管柜号',
				bg : '#AE81FF',
				time : 2
			});
			$("#acdoc_case").focus();
			return false;
		}
		$("#pzForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
  }
</script>

</body>
</html>