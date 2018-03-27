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
<%@ include file="../../system/index/top.jsp"%>
<link rel="stylesheet"
	href="static/ace/css/css/bootstrap-datetimepicker.min.css" />
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
							<!-- 检索  -->	
							<div></div>
							<div class="testexcel">
							
								<label for="date">请选择时间</label>
 	                				<input name="endtime" class="span10 date-picker"  id="exportDoc" type="text" readonly="readonly" value=""
									data-date-format="yyyy-mm-dd"
									placeholder="导出时间" />
							
								<dl class="dl-horizontal">
								
								
									<dt>导出月份文档记录表
										
									</dt>
									<dd>											
								
									<a class="btn" id="exportDoc"
											target="_blank"> 导出 </a>
									</dd>
									<br>
									<dt>导出分月文件登记簿										
									</dt>
									<dd>											
									               			
									<a class="btn" id="exportDocLogByMouth"
											target="_blank"> 导出 </a>
									</dd>
								    <dt>
									</dt>
								    <dt>										
									</dt>
									
								</dl>
								
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

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>

<script type="text/javascript">
$(top.hangge());

$(function(){
	
  	//日期框
	$('.date-picker').datepicker({
		initialDate:new Date(),
		autoclose: true,
		todayHighlight: true,
	
	});
	
	$("#exportDocLogByMouth").click(function(){
		var d= new Date()

	    location = "<%=basePath%>test/exportDocLogByMouth?dates="+$('.date-picker').val();
	  });
	$("#exportDoc").click(function(){
		var d= new Date()

	    location = "<%=basePath%>test/exportDoc?dates="+$('.date-picker').val();
	  });
	
})




</script>
</html>
