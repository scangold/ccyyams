﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<script src="static/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="static/ace/css/sweetalert2.min.css">
</head>
<body>

	<div class="main-container" id="main-container" style="font-family: microsoft yahei;">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<!--/set project-->
						<div id="archreceive1">
							<!-- /接收准备 确定项目-->
							<div class="col-xs-12">
								<div class="span12">
									<div  class="widget-box">
										<div
											class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
											<h4 class="lighter">第1步：确定项目</h4>
										</div>


										<div class="widget-body">
											<div class="widget-main">

												<table style="margin-top:5px;">
													<tr>
														<form action="archiveRCPRJ/setproject.do" name="FormAR" id="FormAR">
															<!-- 	<form action="archive/setproject.do" name="FormAR"
															id="FormAR" method="post" enctype="multipart/form-data"> -->
															<div id="doing1">
																<!-- <font color="#3333ff" face="微软雅黑">请查询项目，点击项目所在行确定成果所属项目 </font> -->
																 <input type="hidden"
																	name="PROJECTOLDNEWTYPE" id="PROJECTOLDNEWTYPE"
																	value="1" /> <input type="hidden" name="TYPE"
																	id="TYPE" value="1" />
																	<div>
																	<table style="width:95%;">
																		<tr>
																			<td>
																				<span style="font-size: 16px;float:left;">一、接收成果前，请确认并留存成果接收生产技术科、质检科等管理部门开具的证明文件！</span>
																			<!-- 
																				<span style="font-size: 16px;float:left;">一、请上传证明文件：</span>
																		    <input type="file" name="file" class="form-control" style="width:60%;"multiple="multiple">
																		 -->	</td>

																		</tr>

																	</table>
																</div>
																<div id="ifprojectnew" style="margin-left:12px;margin-bottom:5px;">
																	<table style="width:95%;">
																		<tr>
																			<td>
																				<span style="font-size: 16px;">二、请选择项目类型：</span> <label
																		style="padding-left: 15px;"> <input
																		name="ifprojectnew-radio" id="ifprojectnew-radio1"
																		onclick="ifProjectNew('projectold');"
																		checked="checked" type="radio" value="projectold"
																		class="ace" /> <span class="lbl">已有项目</span>
																	</label> <label style="padding-left: 10px;"> <input
																		name="ifprojectnew-radio" id="ifprojectnew-radio2"
																		onclick="ifProjectNew('projectnew');" type="radio"
																		value="projectnew" class="ace" /> <span class="lbl">新增项目</span>
																	</label>
																		
																			</td>

																		</tr>

																	</table>
																</div>
																<!--/ifprojectnew-end-->
																<div id="setproject-details">
																
																	<div id="projectold" style="text-align: left !important;margin-left:12px;">
																	<span style="font-size: 16px;">三、</span> <span
																		style="font-size: 16px; color: #3333ff">
																		请查询项目，点击项目所在行确定成果所属项目 </span>

																	<table style="width:100%;" >
																		<tr>
																			<td style="text-align: left;"><span class="lbl"
																				style="margin-left: 25px;">已选择项目的ID:</span> <input 
																				 name="projectIDinput" id="projectIDinput" type="text" value="请选择项目，确定项目ID"
																				  style="border:0;color:#F00;width:80%;background:transparent !important;"  readonly="readonly" style="border:0;"/></td>
																		</tr>
																		<tr>
																			<td style="text-align: left;"><span class="lbl"
																				style="margin-left: 25px;">已选择项目的名称:</span> <input
																				name="projectNAMEinput" id="projectNAMEinput" type="text" value="请选择项目，确定项目名称"
																				  style="border:0;color:#F00;width:80%;background:transparent !important;"  readonly="readonly"/>
																			</td>
																		</tr>

																	</table>
																</div>
																	<div id="projectnew"
																		style="display:none">
																		<!-- <table>
																			<tr>
																				<td></td>
																				<td><span class="lbl"> 请点击 “新增项目”
																						输入新项目详细信息</span> <a class="btn btn-sm btn-success"
																					onclick="addP();">新增项目</a></td>

																			</tr>

																		</table> -->
																		<span style="font-size: 16px; margin-left: 12px;">二、</span>
																	<span class="lbl"
																		style="font-size: 16px; color: #3333ff; margin-right: 15px;">
																		请点击 “新增项目” 输入新项目详细信息</span> <a class="btn btn-sm btn-success"
																		onclick="addP();">新增项目</a>
																	</div>

																</div>
																
																
																<!-- setproject-details end -->

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

														<!-- 检索  -->
														<form action="project/selectall.do" method="post"
															name="FormSP" id="FormSP">
										
																		
															<!-- bootstrap table for project -->
															<table id="arproject-table"
																class="table table-striped table-bordered table-hover"
																style="margin-top:5px;">
															</table>


															<div class="page-header position-relative">
																<table style="width:100%;">
																	<tr>
																		<td style="vertical-align:top;"><c:if
																				test="${QX.add == 1 }">
																				<a class="btn btn-sm btn-success" onclick="addP();">新增</a>
																			</c:if> <c:if test="${QX.add == 1 }">
																				<a class="btn btn-sm btn-success"
																					onclick="deleteP();">删除</a>
																			</c:if> <c:if test="${QX.del == 1 }">
																				<a class="btn btn-sm btn-danger"
																					onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除"><i
																					class='ace-icon fa fa-trash-o bigger-120'></i></a>
																			</c:if></td>
																		<td style="vertical-align:top;">
																			<div class="pagination"
																				style="float: center;padding-top: 0px;margin-top: 0px;">
																				${page.pageStr}</div>
																		</td>

																	</tr>
																</table>
															</div>
														</form>


														<!-- 检索  END-->
													</tr>



													<tr>

														<div>
															<a class="btn btn-sm btn-primary"
																onclick="setProjectStartReceive();" style="float:right">确定项目 开始接收</a>
														</div>

														<div>
															<a class="btn btn-sm btn-primary" onclick="setback();"
																style="float:right;">返回</a>
														</div>
													</tr>
												</table>



											</div>
											<!--/widget-main-->

										</div>
										<!--/widget-body-->
									</div>
									<!-- widget-box end -->
								</div>

							</div>
							<!-- /接收准备：确定项目 -->

						</div>
						<!--/set project end-->

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
	<script src="static/js/jquery/jquery-3.0.0.min.js"></script>
	
	<script src="static/ace/js/ace/ace.js" />
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	
	<script src="static/ace/js/dist/bootstrap-table.min.js"></script>
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/ccyyamsjs/archive.js"></script>


    <!-- 汉化bootstrap table -->
    <script src="static/ace/js/dist/bootstrap-table-zh-CN.js"></script>

	<script type="text/javascript">
		$(top.hangge());//清除加载进度
		
		//返回
		function setback(){
		}
		
		//保存
		function setProjectStartReceive() {
            var text=$("#projectIDinput")[0].value;
			if(text=="请选择项目，确定项目ID")
			{
				swal(
						  'NO!',
						  '请选择一个文件',
						  'error'
						)
			}
		else{
			$("#FormAR").submit();
			$("#doing1").hide();
			$("#doing2").show();
			}
		}

		//选择 已有项目 或 新建项目
		function ifProjectNew(value) {

			//$("#PROJECTOLDNEWTYPE").val(value);

			if (value == "projectold") {
				$("#projectnew").hide();
				$("#projectold").show();

			}

			if (value== "projectnew") {
				$("#projectold").hide();
				$("#projectnew").show();

			}

		}
		
		function addP(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增项目";
			 diag.URL = '<%=basePath%>project/goAdd.do';
			diag.Width = 650;
			diag.Height = 500;
			diag.CancelEvent = function() { //关闭事件
				if (diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none') {
					if ('${page.currentPage}' == '0') {
						top.jzts();
						setTimeout("self.location=self.location", 100);
					} else {
						nextPage(${page.currentPage});
					}
				}
				diag.close();
			};

			diag.show();
		}
		
		
		$(function() {
			var oTable = new check_TableInit();
			oTable.Init();
		});
		function check_TableInit() {
			var oTableInit = new Object();
			//初始化Table
			oTableInit.Init = function() {
				$('#arproject-table').bootstrapTable(
								{
									url : "/CCYYAMS/project/showprojectlistpage", //请求后台的URL（*）
									method : 'get', //请求方式（*）
									striped : true, //是否显示行间隔色
									cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
									pagination : true, //是否显示分页（*）
									sortable : true, //是否启用排序
									sortOrder : "desc", //排序方式
									sortName : "PRJ_ID",//"tasksort",
									queryParams : oTableInit.queryParams, //传递参数（*）
									sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
									pageNumber : 1, //初始化加载第一页，默认第一页
									pageSize : 10, //每页的记录行数（*）
									pageList : [ 0, 5, 10, 25, 50, 100, 200 ], //可供选择的每页的行数（*）
									search : true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
									strictSearch : true,
									showColumns : true, //是否显示所有的列
									showRefresh : true, //是否显示刷新按钮
									minimumCountColumns : 2, //最少允许的列数
									clickToSelect : true, //是否启用点击选中行
									showToggle : true, //是否显示详细视图和列表视图的切换按钮
									cardView : false, //是否显示详细视图
									detailView : false, //是否显示父子表
									showExport : true,
									exportDataType : "all",
									columns : [ {
										field : "PRJ_ID",
										title : "项目ID",
										align : "center",
										sortable : "true"
									}, {
										field : "PRJ_NAME",
										title : "项目名称",
										align : "center",
										sortable : "true"
									}, {
										field : "YEAR",
										title : "项目年份",
										align : "center",
										sortable : "true"
									}, {
										field : "PRJ_ORIGIN",
										title : "项目来源",
										align : "center",
										sortable : "true"
									}, {
										field : "COVERAGE_ID",
										title : "项目区域",
										align : "center",
										sortable : "true"
									}, {
										field : "PRJTYPE",
										title : "项目类型",
										align : "center",
										sortable : "true"
									} ],
									onClickRow : function(row, $element) {
										//$element是当前tr的jquery对象
										//$("#projectIDinput").val(row.PRJ_ID);
										//$("#projectNAMEinput").val(row.PRJ_NAME);
										$("#projectIDinput").val(row.PRJ_ID);
										$("#projectNAMEinput").val(row.PRJ_NAME);
									},//单击row事件
								})

			};

			//得到查询的参数
			oTableInit.queryParams = function(params) {
				var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
					limit : params.limit,
					offset : params.offset,
					sort : params.sort,
					order : params.order,
					search : params.search
				};
				return temp;
			};
			return oTableInit;
		};
	</script>
	</body>
</html>