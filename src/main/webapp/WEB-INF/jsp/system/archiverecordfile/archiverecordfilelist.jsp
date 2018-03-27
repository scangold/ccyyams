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

<h2 class="text-center">分发文件记录表</h2>
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<div id="toolbar">
			</div>
		<table id="table" data-search="true" data-toggle="table"
			data-toolbar="#toolbar" 
			data-show-refresh="true" data-show-toggle="true"
			data-show-columns="true" data-show-export="true"
			data-minimum-count-columns="2" data-show-pagination-switch="true" data-pagination="true"
			data-id-field="DISTRIBUTE_ID" data-page-list="[5,10, 25, 50, 100, ALL]"
			data-sort-order="desc"
			data-sort-name="DISTRIBUTE_ID"
			data-show-footer="false" data-side-pagination="server"
			data-url="archdistribute/showArchdistributelistPage.do"
			>
			<thead>
				<tr>
					<th data-field="state" data-checkbox="true" data-valign="middle"	data-align="center"></th>
					<th data-field="DISTRIBUTE_TIME" data-sortable="true" 	data-formatter="dataformatter">分发时间</th>
					<th data-field="name" data-sortable="true">接收者</th>
					<th data-field="name2" data-sortable="true">操作人员</th>
					<th data-field="DISTRIBUTE_REMARK" data-sortable="true">记录</th>
					<th data-field="coungt" data-sortable="true">文件数量</th>

				</tr>
			</thead>
		</table>
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
	
	  $table=$('#table');
	$(function(){
				
		  $table.on('dbl-click-row.bs.table', function (index,row ) {
	        console.log(row,"-------------------------------------------",index);
	        openWindosMENU("apply_d"+ row.apply_id,"apply_d"+row.DISTRIBUTE_ID,row.DISTRIBUTE_ID+"详细信息","/CCYYAMS/archdistribute/getArchiverecordDesc?distributeId="+ row.DISTRIBUTE_ID
);
	          // push or splice the elections if you want to save all data selections
	      });
	})
	function dataformatter(index,row){
		
		return new Date(index).Format("yyyy-MM-dd hh:mm:ss")
	}

</script>
<!-- <script src="static/js/ccyyamsjs/apply_list.js?v=1.0"></script> -->
</html>
