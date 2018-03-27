<%@page import="com.fh.util.PageData"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	List<PageData> ls = (List<PageData>) request.getAttribute("listfile");
	JSONArray jsonArray = JSONArray.fromObject(ls);
	String str = jsonArray.toString();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">


<!-- jsp文件头和头部 -->
<%@ include file="../index/topcss.jsp"%>
<style type="text/css">
body {
	background-color: #FFFFFF;
}

#apply-left {
	margin-left: 1px;
}

textarea {
	width: 100%;
	height: 100%;
	max-width: 100%;
	max-height: 500px;
}
</style>
<%@ include file="../index/top.jsp"%>
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<script src="static/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="static/ace/css/sweetalert2.min.css">
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<form class="form-horizontal" role="form">
		<div class="main-container" id="main-container">
			<div style="margin-left: 10%; margin-right: 10%; margin-top: 10px">
				<h2 class="center" style="margin: auto; text-align: center;">
					<b>申请表</b>
				</h2>
				<br> <br>
				<div class="form-group">
					<div class="col-sm-10">
						<label for="lastname">申请原因：</label> <input type="text"
							id="applyWhy" placeholder="请输入原因" class="text">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<label for="firstname">归还时间：</label> <input
							class="span10 date-picker" name="returntime" id="returntime"
							value="" type="text" data-date-format="yyyy-mm-dd"
							readonly="readonly" style="width: 88px;" placeholder="归还日期"
							title="归还回来的日期">
					</div>
				</div>
				<div class="form-group" id="apply-left">
					<label for="name">申请详细：</label>
					<textarea class="form-control" rows="5" cols="100%" id="descs"
						name="descs"></textarea>
				</div>

				<table id="table" data-toggle="table" data-height="460"
					data-data='<%=str%>' data-sort-name="name" data-sort-order="desc">
					<thead>
						<tr>
							<th data-field="FILE_ID" data-sortable="true">ID</th>
							<th data-field="FILE_NAME" data-sortable="true">文件名</th>
							<th data-field="FILE_TYPE" data-sortable="true">文件类型</th>
							<th data-field="DATAFORM" data-sortable="true">来源</th>
							<th data-field="PERMISSION_CLASS" data-sortable="true">密级</th>
						</tr>
					</thead>
				</table>

			</div>
		</div>


		<br>

		<div>
			<button type="button" class="btn" style="margin-left: 50%">提交</button>
		</div>

	</form>


	<!-- /.main-container -->

	<!-- basic scripts -->

	<!-- 页面底部js¨ -->
	<%@ include file="../index/footjs.jsp"%>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>

	<!-- 删除时确认窗口 -->
</body>
<script type="text/javascript">
	//$(top.hangge());//关闭加载状态
	$("#userForm").submit();
	$(function() {
		$('.date-picker').datepicker({
			autoclose : true,
			todayHighlight : true
		});
	});

	/* 
	 $.ajax({
	 type: "POST",
	 xhrFields: {
	 withCredentials: true,
	 useDefaultXhrHeader: false
	 },
	 url:"/CCYYAMS/apply/addApplys.do",
	 success:function(res){
	 console.log("success-1");
	 console.log(res);
	 },
	 error: function(){
	
	 console.log("***********************************888");
	 }
	 }); */

	$("button")
			.on(
					'click',
					function() {
						PipeApi
								.SaveApplyforms(
										$("#applyWhy").val(),
										$("#returntime").val(),
										$("#descs").val(),
										'${ids }',
										function(mess) {
											console
													.log("---------------------------------------------------------------------------------------------------");
											console.log(mess);
											var r = mess.result;
											var t = mess.desc;
											if (r == true) {
												swal({
													title : 'YES!',
													text : t,
													type : 'success'
												})
														.then(
																function(
																		isConfirm) {
																	if (isConfirm === true) {
																		window.location
																				.reload()

																	} else {
																		window.location
																				.reload()

																	}
																})
											} else {
												swal({
													title : 'NO!',
													text : t,
													type : 'error'
												})
														.then(
																function(
																		isConfirm) {
																	if (isConfirm === true) {
																		window.location
																				.reload()

																	}

																	else {
																		window.location
																				.reload()

																	}
																})
											}

										}, PipeApi.ERROR)
					});
</script>
</html>
