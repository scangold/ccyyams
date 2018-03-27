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
 <base href="<%=basePath%>"> 
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<link rel="stylesheet"
	href="http://218.89.185.162:25409/arcgisjavascript34/js/dojo/dijit/themes/claro/claro.css">
<link rel="stylesheet"
	href="http://218.89.185.162:25409/arcgisjavascript34/js/esri/css/esri.css">
	<link rel="stylesheet" href="assets/css/map.css">
	
	<script>
	var dojoConfig = {
		parseOnLoad : true
	};
	
</script>
 
	<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
	<script type="text/javascript" src="static/js/jquery/jquery-3.0.0.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck-3.5.min.js"></script>
    
<script src="http://218.89.185.162:25409/arcgisjavascript34/"></script>
<style>
html, body {
	margin: 0;
	padding: 0;
	overflow:hidden;
}
</style>
</head>
<body class="no-skin" style="background-color: #FFFFFF; ">

	<div>
		<div id="mapTools">
			<ul>
				<li><a><i class="glyphicon glyphicon-globe"></i>全图</a></li>
				<li><a><i class="glyphicon glyphicon-zoom-in"></i>放大</a></li>
				<li><a><i class="glyphicon glyphicon-zoom-out"></i>缩小</a></li>
				<li><a><i class="glyphicon glyphicon-arrow-left"></i>前视</a></li>
				<li><a><i class="glyphicon glyphicon-arrow-right"></i>后视</a></li>
				<li><a><i class="fa fa-line-chart"></i>测距</a></li>
				<li><a><i class="fa fa-area-chart"></i>测面</a></li>
				<li><a><i class="glyphicon glyphicon-info-sign"></i>属性</a></li>
				<li><a><i class="glyphicon glyphicon-remove"></i>清除</a></li>
<!-- 				<li><a><i class="glyphicon glyphicon-user"></i><span>隐藏人员</span></a></li>
				<li id="fullScreen"><a><i class="icon-fullscreen"></i><span>全屏显示</span></a></li> -->
			</ul>
		</div>
		<div id="mapContainer">

			<div id="measure">
				<span id="result"></span><a id="infoclose"><i
					class="glyphicon glyphicon-remove"></i></a>
			</div>

			<!-- <div id="layerControl" style="display: none;">
				<table id="toc"
					class="table table-striped table-bordered table-hover"
					style="background: white;"></table>
			</div> -->
			<!--浮动框-->
			<div id="div_searchResult" class="mydiv">

				<a id="rc_show" href="javascript:void(0)"><i
					class="glyphicon glyphicon-chevron-right"></i></a> <a id="rc_hide"
					href="javascript:void(0)"><i
					class="glyphicon glyphicon-chevron-left"></i> </a>
				<div id="div_rightshow">
					<div id="div_search">
						<ul id="myTab" class="nav nav-tabs">
							<li class="active"><a href="#realTime" data-toggle="tab">图层控制
							</a></li>
							<li><a href="#history" data-toggle="tab">数据查询</a></li>

						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade in active" id="realTime">
								<div id="realtimeListTreeFilteredPanel" class="reti">
									<ul id="layerManagement" class="ztree"></ul>
								</div>
							</div>
							<div class="tab-pane fade" id="history">
								<label for=projectName style="margin-left: 2%;">项目名称查询：</label>
								<input type="text" id="projectName"
									style="width: 98%; margin-left: 2%; margin-right: 2%">
									<div style="margin-top:10px;margin-left:2%;">
								<button id="resetProjectName" type="button" class="btn" >重置</button>
								<button type="reset" id="searchProjectName"
									class="btn  btn-info">查询</button>
									</div>
									
						<div id="viewProNameResult" 
                        style="margin-top:10px;width:100%;max-height:500px;display:none;">
                        <div style="border-bottom:2px solid #438eb9  !important;font-size: 18px;height: 30px;line-height: 30px;">
                         <span style="margin-left:20px;font-size:15px;color:#438eb9 ">查询结果：</span> 
                        <!-- <span></span> -->
                        </div>
                        <table style="margin-top:5px;">
                        <thead>
							<tr>
								<th style="width:55%" class="center hidden-480">图层名</th>
								<th style="width:20%"  class="center hidden-480">结果数目</th>
								<th style="width:25%" class="center hidden-480">操作</th>
							</tr>
							<tr>
						</tr>
						</thead>
						<tbody></tbody>
                        </table>
                        </div>

								
							</div>
						</div>
                       
					</div>
				</div>
			</div>
		
			<div class="copyright" style="color: black;">
				数据来源：天地图 天地图·四川 四川省测绘地理信息局 <br>审图号：图川审（2017）43号<br>
				技术支持：四川省第一测绘工程院
			</div>
			<div id="zhongxin2" class="center" style="display: none; position: absolute;top: 35%;
    left: 50%;z-index: 9999;">
									<br /> <br /> <br /> <br /> <img
										src="static/images/jiazai.gif" /><br />
									<h4 class="lighter block green"></h4>
								</div>	
		</div>
		
	


</div>
	<%@ include file="../../system/index/foot.jsp"%>
	
	<script type="text/javascript">
		 $(top.hangge());//关闭加载状态 
		/* window.location.href="http://192.168.0.254:25416/index.htm"; */
	</script>
	<!--提示框--> 
	<script type="text/javascript" src="static/js/jquery.tips.js"></script> 
	<script src="assets/js/pageInit.js"></script>
	<script src="assets/js/mapConstant.js"></script>
    <script src="assets/js/mapQuery.js"></script> 
	<script src="assets/js/map.js"></script>
	


</body>
</html>