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

<!-- 表单构建组建 -->
<link rel="shortcut icon" href="favicon.ico">
<link href="plugins/fhform/css/bootstrap.min.css?v=3.3.5"
	rel="stylesheet">
<link href="plugins/fhform/css/animate.min.css" rel="stylesheet">
<link href="plugins/fhform/css/style.min.css?v=4.0.0" rel="stylesheet">

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
.a-upload {
    padding: 4px 10px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #ffffff;
    background: #428bca;
    border: 1px solid #FFFFFF;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}

.a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}
.a-upload:hover {
    color: #444;
    background: #eee;
    border-color: #ccc;
    text-decoration: none
}
</style>
</head>
<body>

	<div class="main-container" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">

						<!-- /接收第1步 -->
						<div id="archreceive3">

							<div class="col-xs-12">
								<div class="span12">
									<div class="widget-box">
										<div
											class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
											<h4 class="lighter">第1步：上传成果历史数据文件目录</h4>
										</div>
										<div class="widget-body">
											<div class="widget-main">

												<div id="zhongxin">

													<table>
														<tr>
															<form action="archiveauto/getHistory.do" name="FormRCHistory"
																method="post" enctype="multipart/form-data"
																id="FormRCHistory" style="display:show" >
																<div>
																	<table>
																		<tr>
																			<font color="#3333ff" face="微软雅黑">已人工梳理历史数据，已确认项目，并确定将硬盘、光盘、案卷等作为存储介质，请根据以下提示操作：</font>

																		</tr>
																	</table>
																</div>


																<div id="HDFstorage-receive" class="center"
																	style="display:show">

																	<div id="2yingpan" class="center" style="display:show">
																		<table>
																			<tr>
																				<td><lable>请选择历史数据的目录文件(EXCEL格式文件)： </lable></td>
																				<td><a class="a-upload">选择文件
																				<input type="file" id="checkexcel"  name="checkexcel"  accept=".xls,.xlsx" onchange="document.getElementById('viewfile').value=this.value;"/>
																				</a>
																				</td>
																				<td>
																				<input type="text" name="viewfile" id="viewfile" style="width: 300px">
																				</td>
																			</tr>
																		</table>
																	</div>
																</div>
															</form>
														</tr>


													</table>
												</div>

												<div id="zhongxin2" class="center" style="display:none">
													<br /> <img src="static/images/jzx.gif" id='msg' /><br />
													<h4 class="lighter block green" id='msg'>正在发送...</h4>
													<strong id="second_shows" class="red">6秒</strong>后关闭
												</div>

												<div>
													<a class="btn btn-sm btn-primary" onclick="afterreceive();"
														style="float:right">下一步</a>
												</div>
												<div>
													<a class="btn btn-sm btn-primary"
														onclick="setbacktosetproject();" style="float:right;">返回</a>
												</div>
											</div>
										</div>
										<!--/widget-main-->
									</div>
									<!--/widget-body-->
								</div>
							</div>
						</div>
						<!-- /接收第1步 -->

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
	<script type="text/javascript">
		$(top.hangge());//清除加载进度
		
		function afterreceive() {
		
			$("#FormRCHistory").submit();
	
		}


	</script>
	</body>
</html>