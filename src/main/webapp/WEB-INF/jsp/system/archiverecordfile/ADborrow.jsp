<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="http://localhost:8088/CCYYAMS/">
<!-- 下拉框 -->

<!-- jsp文件头和头部 -->

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title></title>
<meta name="description" content="" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	


<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="static/ace/css/bootstrap.min.css" />
<link rel="stylesheet" href="static/ace/css/bootstrap-theme.min.css" />
<!--bootstrap-table-->
<link rel="stylesheet" href="static/ace/js/dist/bootstrap-table.min.css" />	

<!-- 日期框 -->
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<div id="toolbar">
			<button onclick="goform()" class="btn">申请档案</button>
			<button onclick="goDistributeForm()" class="btn">分发档案</button>
		</div>
		<table id="table" data-search="true" data-toggle="table"
			data-toolbar="#toolbar" data-detail-formatter="detailFormatter"
			data-show-refresh="true" data-show-toggle="true"
			data-show-columns="true" data-show-export="true"
			data-minimum-count-columns="2" data-show-pagination-switch="true" data-pagination="true"
			data-id-field="file_id" data-page-list="[10, 25, 50, 100, ALL]"
			data-sort-order="desc"
			data-sort-name="prj_id"
			data-show-footer="false" data-side-pagination="server"
			data-url="file/showFilelistPage.do"
			data-response-handler="responseHandler">
			<thead>
				<tr>

					<th data-field="state" data-checkbox="true" data-valign="middle"
						data-align="center"></th>
					<th data-field="file_id" data-sortable="true" data-valign="middle">ID</th>
					<th data-field="file_name" data-sortable="true">档案名</th>
					<th data-field="file_type" data-sortable="true">档案类型</th>
					<th data-field="dataform" data-sortable="true">来源</th>
					<th data-field="prj_name" data-sortable="true">项目</th>
					<th data-field="rc_name" data-sortable="true">接收者</th>

				</tr>
			</thead>
		</table>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
			
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='http://localhost:8088/CCYYAMS/static/js/jquery/jquery-3.0.0.min.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='http://localhost:8088/CCYYAMS/static/ace/js/jquery1x.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='http://localhost:8088/CCYYAMS/static/ace/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<script src="static/js/common/PipeJsApi.js?v=1.2"></script>
	    <script src="static/ace/js/dist/bootstrap-table.min.js"></script>
	    <script src="static/ace/js/bootstrap.js"></script>


	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
</body>
<script type="text/javascript">
	$(top.hangge());//关闭加载状态
	var $table = $('#table'), $remove = $('#remove'), selections = [];

	$(function() {
		initTable();

		$table.bootstrapTable('check', 1);

	})

	function goform() {
		console.log("------------------");
		openWindosMENU("AD_gopage", "AD_gopage", "申请档案表",
				"recordfile/goADApplyFormPage?keywords=" + selections);
	}
	function goDistributeForm() {
		console.log("------------------");
		openWindosMENU("AD_gopage", "AD_gopage", "申请档案表",
				"recordfiledistribute/goADDistributeFormpage?keywords=" + selections);
	}

	function initTable() {
		$table.on('check.bs.table', function(row, index) {

			if ($.inArray(index.file_id, selections) < 0) {
				console.log("==============================");
				console.log($.inArray(index.file_id, selections), row,
						selections, index);
				selections.push(index.file_id);
				console.log("------------------------------");
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
</script>
<!-- <script src="static/js/ccyyamsjs/apply_list.js?v=1.0"></script> -->
</html>