<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<!-- jsp文件头和头部 -->
<%@ include file="../index/topcss.jsp"%>
<!-- 日期框 -->
</head>
<body class="no-skin">

	<div class="container">
		<br>
		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
		<!-- 	<div>
				<form role="form" class="form-horizontal">
					<div class="form-group">
						<div class="col-lg-6 col-sm-12 ">
							<label for="proId" class="col-lg-3 col-sm-3 control-label">项目名称</label>
							<div class="col-lg-9 col-sm-8">
								<select id="proId" class="form-control"
									onchange="GetRecivebyPageDate()"></select>
							</div>
						</div>
						<div class="col-lg-6 col-sm-12 ">
							<label for="rcid" class="col-lg-3 col-sm-3 control-label">接收次序</label>
							<div class="col-lg-9 col-sm-8">
								<select id="rcid" class="form-control"></select>
							</div>
						</div>
					</div>
				</form>
			</div> -->
			
			
			
			<div
				style="height: 48px; width: 100%; margin: 30px 0 10px 0; font-family: microsoft yahei; border-bottom: 2px solid #438eb9;">
				<span style="font-size: 20px;margin-left:15px;">接收查询：</span>
			</div>

<%-- 			<table
				style="height: 48px; width: 100%; margin: 30px 0 10px 0; font-family: microsoft yahei;">
				<tr>
					<td><span style="font-size: 20px;margin-left:15px;">部门</span></td>
					<td>
						<div
							style="width: 100%;margin-left:0px; font-family: microsoft yahei;">
							<select class="chosen-select form-control" name="DEPARTMENT_ID"
								id="DEPARTMENT_ID" data-placeholder="请选择部门"
								style="vertical-align:top;" style="width:98%;">
								<option value=""></option>
								<c:forEach items="${departmentList}" var="departmenttype">
									<option value="${departmenttype.DEPARTMENT_ID }"
										<c:if test="${departmenttype.DEPARTMENT_ID == pd.DEPARTMENT_ID }">selected</c:if>>${departmenttype.NAME }</option>
								</c:forEach>
							</select>
							
						</div>
					</td>
					<td>
					<td><span style="font-size: 20px;margin-left:15px;">年份</span></td>
					<td>
						<div
							style="width: 100%;margin-left:0px; font-family: microsoft yahei;">
							<select class="chosen-select form-control" name="YEAR"
								id="YEAR" data-placeholder="请选择部门"
								style="vertical-align:top;" style="width:98%;">
								
								<option></option>
								<option>2016</option>
							</select>
						</div>
					</td>
					<td>
					<td><button style="font-size: 20px;margin-left:30px;">查询申请成功次数</button>
					<td><button style="font-size: 20px;margin-left:0px;">查询申请总容量</button>
					<td>
				</tr>

			</table>



			<div
				style="height: 48px; width: 100%; margin: 30px 0 10px 0; font-family: microsoft yahei; border-bottom: 2px solid #438eb9;">
				<span style="font-size: 20px;margin-left:15px;">申请成功次数</span>
				<span style="font-size: 20px;margin-left:15px;">申请成功总容量</span>
			</div> --%>
			
			<table id="table" data-search="true" data-toggle="table"
				data-toolbar="#toolbar" data-detail-formatter="detailFormatter"
				data-show-refresh="true" data-show-toggle="true"
				data-show-columns="true" data-show-export="true"
				data-minimum-count-columns="2" data-show-pagination-switch="true"
				data-pagination="true" data-id-field="RC_ID"
				data-page-list="[10, 25, 50, 100, ALL]" data-sort-order="desc"
				data-sort-name="RC_ID" data-query-params="queryparams"
				data-show-footer="false" data-side-pagination="server"
				data-url="archive/showRecivelistPage.do"
				data-response-handler="responseHandler">
				<thead>
					<tr>
						<th data-field="RC_ID" data-sortable="true" data-valign="middle">接收ID</th>
						<th data-field="TRANSFNAME" data-sortable="true">移交人</th>
						<th data-field="PRODEPART" data-sortable="true">移交单位</th>
						<th data-field="RC_NAME" data-sortable="true">接收人</th>
						<!-- <th data-field="RC_DEPART" data-sortable="true">接收单位</th> -->
						<th data-field="RC_TIME" data-sortable="true"
							data-formatter="timeformatter">接收时间</th>
						<!-- 	<th data-field="RC_PROGRESS" data-sortable="true">接收过程</th>
						<th data-field="CHECKFILE_URL" data-sortable="true">检查文件地址</th>
						<th data-field="RC_STRING" data-sortable="true">接收参数</th> -->
						<th data-field="RC_REMARK" data-sortable="true">接收备注</th>
						<th data-field="REGISTER_ID" data-sortable="true">存储注册ID</th>
						<th data-field="PRJ_ID" data-sortable="true">项目ID</th>
						<!-- <th data-field="CHECKDETAILS" data-sortable="true">检查文件详情</th>
						<th data-field="USER_ID" data-sortable="true">用户ID</th> -->
					</tr>
				</thead>
			</table>

			
					
		</div>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/footjs.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	
	<!-- 汉化bootstrap table -->
    <script src="static/ace/js/dist/bootstrap-table-zh-CN.js"></script>
	
</body>
<script type="text/javascript">
	$(top.hangge());//关闭加载状态
	var $table = $('#table'), $remove = $('#remove'), selections = [];
	$(function() {
		getProjiecNameAndId();
		initTable();
		$table.bootstrapTable('check', 1);
		

	})



	//init select
	function getProjiecNameAndId() {
		PipeApi.GetProjiecNameAndId(function(mess) {

			$("#proId").append("<option></option>");
			for (var int = 0; int < mess.length; int++) {
				$("#proId").append(
						"<option value='"+mess[int].prjId+"'>"
								+ mess[int].prjName + "<ption>");

			}
			GetRecivebyPageDate();
		}, PipeApi.ERROR);

	}
	function GetRecivebyPageDate() {
		PipeApi.GetRecivebyPageDate($("#proId").val(), function(mess) {
			$("#rcid").empty();
			$("#rcid").append("<option></option>");
			for (var int = 0; int < mess.length; int++) {
				$("#rcid").append(
						"<option value='"+mess[int].rcid+"'>"
								+ mess[int].prodepart
								+ "&nbsp&nbsp~&nbsp&nbsp"
								+ new Date(mess[int].rctime)
										.Format("yyyy-MM-dd hh:mm:ss")
								+ "<ption>");

			}
			//console.log(mess);

		}, PipeApi.ERROR);

	}

	function queryparams(params) {
		params.rcid = Number($("#rcid").val());
		params.prjid = Number($("#proId").val());
		console.log(params);
		return params;
	}
	function initTable() {
		$table.on('check.bs.table', function(row, index) {

			if ($.inArray(index.file_id, selections) < 0) {
				console.log($.inArray(index.file_id, selections), row,
						selections, index);
				selections.push(index.file_id);
			}
		});
		$table.on('uncheck.bs.table', function(row, index) {
			for (var int = 0; int < selections.length; int++) {
				if (index.file_id == selections[int]) {
					selections.splice(int, int + 1);
				}
			}

		});

		$table.on('check-all.bs.table', function(index, rows) {
			$.each(rows, function(i, row) {
				// console.log("-----------"); 
				if ($.inArray(row.file_id, selections) < 0) {
					selections.push(row.file_id);

				}
				//$table.bootstrapTable('check', 1);
			});
		});
		$table.on('uncheck-all.bs.table', function(index, rows) {
			$.each(rows, function(i, row) {
				// console.log("-----------"); 
				if ($.inArray(row.file_id, selections) >= 0) {
					for (var int = 0; int < selections.length; int++) {
						if (row.file_id == selections[int]) {
							selections.splice(int, int + 1);
						}
					}

				}
				//$table.bootstrapTable('check', 1);
			});

		});
		/* $table.on('check.bs.table uncheck.bs.table '
				+ 'check-all.bs.table uncheck-all.bs.table', function() {
			$remove.prop('disabled',
					!$table.bootstrapTable('getSelections').length);
			// save your data, here just save the current page
			selections = getIdSelections();
			console.log(selections);
			// push or splice the selections if you want to save all data selections
		}); */

		$table.on('expand-row.bs.table', function(e, index, row, $detail) {

			if (index % 2 == 1) {
				$detail.html('Loading from ajax request...');
				$.get('LICENSE', function(res) {

					$detail.html(res.replace(/\n/g, '<br>'));
				});
			}
		});
		$table.on('all.bs.table', function(e, name, args) {
			// console.log(name,args)
		});
		$table.on('load-success.bs.table', function(data, res) {
			$.each(res.rows, function(i, row) {
				// console.log("-----------"); 
				if ($.inArray(row.file_id, selections) >= 0) {

					$table.bootstrapTable('check', i);
				}
				//$table.bootstrapTable('check', 1);
			});
			return false;
		});

	}
	function getIdSelections() {
		return $.map($table.bootstrapTable('getSelections'), function(row) {

			return row.file_id
		});
	}
	function responseHandler(res) {
		$.each(res.rows, function(i, row) {
			row.state = $.inArray(row.id, selections) !== -1;
			//$table.bootstrapTable('check', 1);
		});
		return res;
	}
	function detailFormatter(index, row) {

		var html = [];
		$.each(row, function(key, value) {
			html.push('<p><b>' + key + ':</b> ' + value + '</p>');
		});
		return html.join('');
	}

	function timeformatter(index, row) {

		return new Date(index).Format("yyyy-MM-dd hh:mm:ss");
	}
</script>
<!-- <script src="static/js/ccyyamsjs/apply_list.js?v=1.0"></script> -->
</html>
