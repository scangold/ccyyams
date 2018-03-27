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
							<form action="pz/save.do" name="pzForm" id="pzForm"
								method="post">
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">盒号:</td>
											<td id="td1">
											<div class="radio" style="float: left;">
							<label><input name="acdoc_box" type="radio" value="" id="have"/>已有盒号 </label>
							<label><input name="acdoc_box" type="radio" value="" id="new"/>新建盒号 </label>
						</div>
									<div><select name="ac_box_id" id="havebox" 
											data-placeholder="这里输入容量单位" style="vertical-align:top;width:317px;display:none;" >
									<option value="" ></option>
									<c:forEach items="${pd.fmsPZDoc.pzbox}" var="pz">
										<option value="${pz.ac_box_id }">${pz.acdoc_box}</option>
									</c:forEach>
									</select></div>
												<div><input type="text" name="acdoc_box" id="newbox"  value="${pd.acdoc_box}"
												maxlength="32" placeholder="输入盒号例如2015-01-01" title="描述"
												style="width: 98%;display:none;" /></div>
												</td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">册号:</td>
											<td id="td2">
											<div class="radio" style="float: left;">
							<label><input name="acdoc_volume" type="radio" value="" id="ha"/>已有册号 </label>
							<label><input name="acdoc_volume" type="radio" value="" id="ne"/>新建册号 </label>
						</div>
									<div><select name="ac_volume_id" id="havevolume" 
											data-placeholder="这里输入容量单位" style="vertical-align:top;width:317px;display:none;" >
									<option value="" ></option>
									<c:forEach items="${pd.fmsPZDoc.pzvolume}" var="pz">
										<option value="${pz.ac_volume_id }" >${pz.acdoc_volume}</option>
									</c:forEach>
									</select></div>
												<input type="text" name="acdoc_volume" id="newvolume"  value="${pd.acdoc_volume}"
												maxlength="32" placeholder="输入盒号例如2017010101" title="描述"
												style="width: 98%;display:none" />
												</td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">凭证号:</td>
											<td>
											
											<input type="text" name="acdoc_num" id="acdoc_num"  value="${pd.acdoc_num}"
												maxlength="32" placeholder="输入凭证号" title="描述"
												style="width: 98%;" /></td>
										</tr>
																				<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">年份:</td>
											<td>
											
											<input type="text" name="acdoc_year" id="acdoc_year" value="${pd.acdoc_year}"
												maxlength="32" placeholder="输入年份" title="描述"
												style="width: 98%;" /></td>
										</tr>
																				<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">月份:</td>
											<td>
											
											<input type="text" name="acdoc_month" id="acdoc_month"  value="${pd.acdoc_month}"
												maxlength="32" placeholder="输入月份" title="描述"
												style="width: 98%;" /></td>
										</tr>
																				<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">保存年限:</td>
											<td>
											
											<input type="text" name="acdoc_valid" id="acdoc_valid"  value="${pd.acdoc_valid}"
												maxlength="32" placeholder="输入保存年限" title="描述"
												style="width: 98%;" /></td>
										</tr>
																														<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">保管室号:</td>
											<td>
											
											<input type="text" name="acdoc_room" id="acdoc_room"  value="${pd.acdoc_room}"
												maxlength="32" placeholder="输入保管室号" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">保管箱号:</td>
											<td>
											
											<input type="text" name="acdoc_case" id="acdoc_case"  value="${pd.acdoc_case}"
												maxlength="32" placeholder="输入保管箱号" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">备注:</td>
											<td>
											<textarea style="width: 317px;height: 50px;max-width: 317px;max-height: 50px" name="acdoc_remark" id="acdoc_remark" value="${pd.acdoc_remark}" placeholder="输入备注" maxlength="300" wrap="hard"></textarea></td>
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
		if ($("#havebox").val() == ""&&$("#newbox").val() == "") {
			$("#td1").tips({
				side : 3,
				msg : '请输入盒号',
				bg : '#AE81FF',
				time : 2
			});
			$("#td1").focus();
			return false;
		}
		if ($("#newvolume").val() == ""&&$("#havevolume").val() == "") {
			$("#td2").tips({
				side : 3,
				msg : '请输入册号',
				bg : '#AE81FF',
				time : 2
			});
			$("#td2").focus();
			return false;
		}
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
		debugger
		$("#pzForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
  
  //选择
	$("#have").on('change',function(){
		if($("#have").checked=true){
			$("#havebox").show();
			$("#newbox").hide();
		}else if($("#have").checked=false){
			$("#havebox").hide();
			$("#newbox").show();
		}else{
			$("#havebox").hide();
			$("#newbox").hide();
		}
	});
	$("#new").on('change',function(){
		if($("#new").checked=true){
			$("#havebox").hide();
			$("#newbox").show();
		}else if($("#new").checked=false){
			$("#havebox").show();
			$("#newbox").hide();
		}else{
			$("#havebox").hide();
			$("#newbox").hide();
		}
	});
	$("#ha").on('change',function(){
		if($("#ha").checked=true){
			$("#havevolume").show();
			$("#newvolume").hide();
		}else if($("#ha").checked=false){
			$("#havevolume").hide();
			$("#newvolume").show();
		}else{
			$("#havevolume").hide();
			$("#newvolume").hide();
		}
	});
	$("#ne").on('change',function(){
		if($("#ne").checked=true){
			$("#havevolume").hide();
			$("#newvolume").show();
		}else if($("#ne").checked=false){
			$("#havevolume").show();
			$("#newvolume").hide();
		}else{
			$("#havevolume").hide();
			$("#newvolume").hide();
		}
	});
    </script>

	 
</body>
</html>