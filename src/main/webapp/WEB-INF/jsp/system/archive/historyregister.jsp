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
<%@ include file="../index/top.jsp"%>

<link href="static/ccyyamscss/bootstrap/bootstrap-table.css" rel="stylesheet" type="text/css"/>

<style type="text/css">
#dialog-add, #dialog-message, #dialog-comment {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	z-index: 99999999;
	display: none;
}

.commitopacity {
	position: absolute;
	width: 100%;
	height: 10000px;
	background: #7f7f7f;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	top: 0px;
	z-index: 99999;
}

.commitbox {
	width: 100%;
	margin: 0px auto;
	position: absolute;
	top: 120px;
	z-index: 99999;
}

.commitbox_inner {
	width: 96%;
	height: 255px;
	margin: 6px auto;
	background: #efefef;
	border-radius: 5px;
}

.commitbox_top {
	width: 100%;
	height: 253px;
	margin-bottom: 10px;
	padding-top: 10px;
	background: #FFF;
	border-radius: 5px;
	box-shadow: 1px 1px 3px #e8e8e8;
}

.commitbox_top textarea {
	width: 95%;
	height: 195px;
	display: block;
	margin: 0px auto;
	border: 0px;
}

.commitbox_cen {
	width: 95%;
	height: 40px;
	padding-top: 10px;
}

.commitbox_cen div.left {
	float: left;
	background-size: 15px;
	background-position: 0px 3px;
	padding-left: 18px;
	color: #f77500;
	font-size: 16px;
	line-height: 27px;
}

.commitbox_cen div.left img {
	width: 30px;
}

.commitbox_cen div.right {
	float: right;
	margin-top: 7px;
}

.commitbox_cen div.right span {
	cursor: pointer;
}

.commitbox_cen div.right span.save {
	border: solid 1px #c7c7c7;
	background: #6FB3E0;
	border-radius: 3px;
	color: #FFF;
	padding: 5px 10px;
}

.commitbox_cen div.right span.quxiao {
	border: solid 1px #f77400;
	background: #f77400;
	border-radius: 3px;
	color: #FFF;
	padding: 4px 9px;
}
</style>

</head>
<body>

	<div class="main-container" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">


						<div id="archreceive4">
							<!-- /接收第4步 -->
							<div class="col-xs-12">
								<div class="span12">
									<div class="widget-box">
										<div
											class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
											<h4 class="lighter">第2步： 成果接收登记</h4>
										</div>
										<div class="widget-body">
											<div class="widget-main">
												<table style="margin-top:5px;">
													<tr>
														<form action="archiveauto/historyREGISTER.do" name="historyREGISTERForm"
															id="historyREGISTERForm">

															<div id="doing1"
																class="text-center step-content row-fluid position-relative">
																
																	<table>
																		<tr>
																			<font color="#3333ff" face="微软雅黑">服务已读取上传文件内容，点击 完成登记接收：</font>

																		</tr>
																	</table>
															</div>
															<!--/doing1-end-->
															<div id="doing2" class="center" style="display:none">
																<br /> <img src="static/images/jzx.gif" /><br />
																<h4 class="lighter block green"></h4>
															</div>
															<!--/doing2-end-->

														</form>
													</tr>
													<tr>

														<div>
															<a class="btn btn-sm btn-primary" onclick="arfinish();"
																style="float:right">完成登记接收</a>
														</div>
													</tr>
												</table>



												<!--/widget-main-->
											</div>
											<!--/widget-body-->
										</div>
									</div>
								</div>
								<!-- /接收第4步 -->

							</div>

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
		<%@ include file="../index/foot.jsp"%>
		<!-- ace scripts -->
		<script src="static/ace/js/ace/ace.js"></script>

		</script>



		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<!--引入属于此页面的js -->
		<script type="text/javascript" src="static/js/ccyyamsjs/archive.js"></script>
		
		<!-- 引入bootstrap table js -->
		<script type="text/javascript" src="static/js/ccyyamsjs/bootstrap/bootstrap-table-zh-CN.js"></script>
		<script type="text/javascript" src="static/js/ccyyamsjs/bootstrap/bootstrap-table.js"></script>
		
		<script type="text/javascript">
			$(top.hangge());//清除加载进度

		

			//保存
			function arfinish() {

				$("#historyREGISTERForm").submit();
				$("#doing1").hide();
				$("#doing2").show();
			}
		</script>
		</ body>
</html>