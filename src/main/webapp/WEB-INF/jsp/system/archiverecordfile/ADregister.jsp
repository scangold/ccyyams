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
											<h4 class="lighter">第4步：测绘产品入库交付记录 成果接收登记</h4>
										</div>
										<div class="widget-body">
											<div class="widget-main">
												<table style="margin-top:5px;">
													<tr>
														<form action="archiveRCREG/arFinish.do" name="FinishForm"
															id="FinishForm">

															<div id="doing1"
																class="step-content row-fluid position-relative">
																<table>

																	<tr>
																		<div id=register-ReceiveDetails " class="center"
																			style="display:show">
																			<font color="#3333ff" face="微软雅黑" style="float:left">请根据以下表单提示
																				填写成果接收登记内容</font>
																			<hr />
																			<font color="#3333ff" face="微软雅黑" style="float:left">接收详情</font>
																			<hr />
																			<table>
																				<tr>
																					<!-- <td><lable>接收序号</lable><input type="text"
																			name="RC_ID" id="RC_ID" value="" style="width:95%"
																			disabled="disabled" /></td> -->
																					<td><lable>移交人</lable><input type="text"
																						name="TRANSFNAME" id="TRANSFNAME" value="测试人员"
																						placeholder="移交人" style="width:95%" /></td>
																					<td><lable>移交单位</lable><select
																						class="chosen-select form-control" id="PRODEPART"
																						name="PRODEPART" title="移交单位"
																						data-placeholder="移交单位" style="width:95%">
																							<option value="地理信息应用中心">地理信息应用中心</option>
																							<option value="生产技术科资料室">生产技术科资料室</option>
																							<option value="质检中心">质检中心</option>
																							<option value="工程中心">工程中心</option>
																							<option value="一中队">一中队</option>
																							<option value="二中队">二中队</option>
																							<option value="三中队">三中队</option>
																							<option value="四中队">四中队</option>
																							<option value="五中队">五中队</option>
																							<option value="六中队">六中队</option>
																							<option value="七中队">七中队</option>
																							<option value="八中队">八中队</option>
																					</select></td>
																					<td><lable>接收人</lable><input type="text"
																						name="RC_NAME" id="RC_NAME" value="测试人员"
																						placeholder="接收人" style="width:95%" /></td>
																					<td><lable>接收单位</lable><select
																						class="chosen-select form-control" id="RC_DEPART"
																						name="RC_DEPART" title="接收单位"
																						data-placeholder="接收单位" style="width:95%">
																							<option value="生产技术科资料室">生产技术科资料室</option>
																							<option value="其他部门">其他部门</option>
																					</select></td>
																					<td><lable style="display: none">接收时间</lable><input type="text"
																						name="RC_TIME" id="RC_TIME" value=""
																						placeholder="接收时间" style="width:95%;display: none" /></td>
																					<td><lable style="display: none">接收进度</lable><input type="text"
																						name="RC_PROGRESS" id="RC_PROGRESS" value=""
																						placeholder="接收进度" style="width:95%;display: none" /></td>
																					<td><lable>检查文件地址</lable><input type="text"
																						name="CHECKFILE_URL" id="CHECKFILE_URL" value="${CHECKFILE_URL}"
																						placeholder="检查文件地址" style="width:95%;display: show" /></td>
																					<td><lable style="display: none">接收进度字符串</lable><input type="text"
																						name="RC_STRING" id="RC_STRING" value=""
																						placeholder="接收进度字符串" style="width:95%;display: none" /></td>
																				</tr>
																				<tr>
																					<td><lable>接收备注</lable><input type="text"
																						name="RC_REMARK" id="RC_REMARK" value="测试人员测试"
																						placeholder="接收备注" style="width:95%" /></td>
																					<td><lable style="display: none">检查文件详情</lable><input type="text"
																						name="CHECKDETAILS" id="CHECKDETAILS" value="测试"
																						placeholder="检查文件详情" style="width:95%;display: none" /></td>

																				</tr>

																			</table>
																			<hr />
																		</div>
																	</tr>
																	<tr>
																		<div id="register-ProjectDetails" class="center"
																			style="display:show">

																			<font color="#3333ff" face="微软雅黑" style="float:left">项目其他详情</font>
																			<hr />
																			<table>
																				<tr>
																					<td><lable>存储ID</lable><input type="text"
																						name="REGISTER_ID" id="REGISTER_ID"
																						value="${REGISTER_ID}" placeholder="存储ID"
																						style="width:95%" /></td>
																					<td><lable>存储设备</lable><input type="text"
																						name="REGISTER_NAME" id="REGISTER_NAME"
																						value="${REGISTER_NAME}" placeholder="存储ID"
																						style="width:95%" /></td>
																					<td><lable>项目ID</lable><input type="text"
																						name="PRJ_ID" id="PRJ_ID" value="${PRJ_ID}"
																						placeholder="项目ID" style="width:95%" /></td>
																					<td><lable>项目名称</lable><input type="text"
																						name="PRJ_NAME" id="PRJ_NAME" value="${PRJ_NAME}"
																						placeholder="项目ID" style="width:95%" /></td>
																					<td><lable>总文件夹相对路径</lable><input type="text"
																						name="PRJROOT" id="PRJROOT" value="测试"
																						placeholder="总文件夹相对路径"
																						style="width:95%" /></td>
																					
																				</tr>

																				<tr>
																					
																					<td><lable>是否电子成果</lable><input type="text"
																						name="IFDIGIT" id="IFDIGIT" value="数字成果"
																						placeholder="成果类型" style="width:95%" /></td>
																					<td><lable>文件总容量</lable><input type="text"
																						name="VOLUME" id="VOLUME" value="10"
																						placeholder="文件总容量" style="width:95%" /></td>
																					<td><lable>容量单位</lable><select
																						class="chosen-select form-control"
																						name="UNIT" id="UNIT" title="单位"
																						data-placeholder="容量单位" style="width:95%">
																							<option value="K">KB</option>
																							<option value="M">MB</option>
																							<option value="G">GB</option>
																							<option value="T">TB</option>
																					</select></td>
																					<td><lable>文件数量</lable><input type="text"
																						name="NUM" id="NUM" value="10" placeholder="文件数量"
																						style="width:95%" /></td>
																					<td><lable>密级</lable><select
																						class="chosen-select form-control"
																						name="PERMISSION_CLASS" id="PERMISSION_CLASS" title="密级"
																						data-placeholder="密级">
																							<option value="公开">公开</option>
																							<option value="国内">国内</option>
																							<option value="内部">内部</option>
																							<option value="秘密">秘密</option>
																							<option value="机密">机密</option>
																							<option value="绝密">绝密</option>
																					</select></td>
																					<td><lable>文件类型</lable><select
																						class="chosen-select form-control"
																						name="FILE_TYPE" id="FILE_TYPE" title="文件类型" style="width:95%" 
																						data-placeholder="文件类型">
																							<option value="文件类型1">类型1</option>
																							<option value="文件类型2">类型2</option>
																							<option value="文件类型3">类型3</option>
																					</select></td>
																					
																				</tr>
																			</table>
																		</div>
																	</tr>

																	<tr>
																		<div id="register-FileDetails" class="center"
																			style="display:show">
																			<hr />
																			<font color="#3333ff" face="微软雅黑" style="float:left">文件列表详情</font>
																			<hr />
																			<!-- 检索  -->
																			<form action="project/selectall.do" method="post"
																				name="FileForm" id="FileForm">
																				<table style="margin-top:5px;">
																					<tr>
																						<td>
																							<div class="nav-search">
																								<span class="input-icon"> <input
																									type="text" placeholder="这里输入关键词"
																									class="nav-search-input" id="nav-search-input"
																									autocomplete="off" name="keywords"
																									value="${pd.keywords }" placeholder="这里输入关键词" />
																									<i
																									class="ace-icon fa fa-search nav-search-icon"></i>
																								</span>
																							</div>
																						</td>
																						<c:if test="${QX.cha == 1 }">
																							<td style="vertical-align:top;padding-left:2px"><a
																								class="btn btn-light btn-xs"
																								onclick="tosearch();" title="检索"><i
																									id="nav-search-icon"
																									class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
																						</c:if>
																					</tr>
																				</table>
																				<!-- 检索  -->
																				
																				<div id="toolbar" class="position-relative"></div>
																				
																				<table id="checkedfile-table"
																					class="table table-striped table-bordered table-hover"
																					style="margin-top:5px;">
																					
																				</table>
																				
																			</form>
																		</div>
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
																style="float:right">完成传输 登记接收</a>
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

				$("#FinishForm").submit();
				$("#doing1").hide();
				$("#doing2").show();
			}
		</script>
		</ body>
</html>