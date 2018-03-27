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
<link rel="stylesheet" href="static/ace/css/chosen.css" />

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link rel="stylesheet" href="static/ace/js/dist/bootstrap-table.min.css" />
</head>
<body class="no-skin">

	<h2 class="text-center">申请记录表</h2>
	
	<input id="so" value="${sessionUser.USER_ID }" style="display:none;">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<div
			style="height: 48px; width: 100%; margin: 30px 0 10px 0; font-family: microsoft yahei; border-bottom: 2px solid #438eb9;">
			<span style="font-size: 20px;margin-left:15px;">当前用户：</span><span
				style="font-size: 18px; color: #438eb9;margin:0px 10px;" >${sessionUser.NAME}</span> <span 
				style="font-size: 20px; margin-left: 180px;">待审批：</span><span id="waitingForApproval"
				style="font-size: 18px; color: red;margin:0 15px;"></span> <span
				style="font-size: 20px;">个</span>
		</div>
		<table id="apply_list_table"></table>
        <div>
        <div style="color:#438eb9;cursor:pointer;" id="historyApproval">查看审批历史</div>
        <div id="hisTableControl" style="display:none;"> <table id="applyHistory_list_table"></table></div>
       
        </div>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/js/jquery/jquery-3.0.0.min.js"></script>
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>

	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script src="static/ace/js/dist/bootstrap-table.min.js"></script>
	
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	
	<!-- 汉化bootstrap table -->
    <script src="static/ace/js/dist/bootstrap-table-zh-CN.js"></script>
    <script>
    $("#historyApproval").click(function(){
    	if($(this).html().indexOf("隐藏")>=0){
    		$(this).empty().html("查看审批历史");
    		$("#hisTableControl").hide();
    		}
    	else{
    		$(this).empty().html("隐藏审批历史");
    		$("#hisTableControl").show();
    		}
    	
    	})
    </script>
</body>
<script type="text/javascript">
	$(top.hangge());//关闭加载状态
</script>
<script src="static/js/ccyyamsjs/apply_list.js?v=1.0"></script>
</html>
