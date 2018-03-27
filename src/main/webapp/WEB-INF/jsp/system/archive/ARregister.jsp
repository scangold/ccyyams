<%@page import="net.sf.json.JSONArray"%>
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

<% 
	JSONArray ja = (JSONArray)session.getAttribute("joHandFileTable"); //从session里把joHandFileTable拿出来，并赋值给jo 
	String paaaa = request.getContextPath();
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
																				填写成果接收登记内容</font><br>
																			<hr />
																			<font color="#3333ff" face="微软雅黑" style="float:left">接收详情</font>
																			<br> <br>
																			<table>
																				<tr>
																					<td><lable>移交人</lable><input type="text"
																						name="TRANSFNAME" id="TRANSFNAME" value="测试人员"
																						placeholder="移交人" style="color:#F00;width:95%" /></td>
																					<td><lable>移交单位</lable><select
																						name="PRODEPART"
																						class="chosen-select form-control" id="PRODEPART"
																						title="移交单位" style="color:#F00;width:95%"
																						data-placeholder="选择移交单位...">

																							<c:forEach items="${pd.departList}" var="var">
																								<option value="${var.DEPARTMENT_ID }"
																									<c:if test="${var.DEPARTMENT_ID == var.DEPARTMENT_ID }">
																								selected</c:if>>${var.NAME }</option>
																							</c:forEach>
																					</select></td>
																				</tr>


																				<tr>
																					<td><lable>接收人</lable><input type="text"
																						name="RC_NAME" id="RC_NAME" value="${pd.USERNAME} "
																						placeholder="接收人" style="color:#F00;width:95%" readonly="readonly"/></td>
																					<td><lable>接收人ID</lable><input type="text"
																						name="USER_ID" id="USER_ID" value="${pd.USER_IDstr} "
																						placeholder="接收人" style="color:#F00;width:95%" readonly="readonly" /></td>
																				</tr>

																				<tr>
																					<td><lable>项目ID</lable><input type="text"
																						name="PRJ_ID" id="PRJ_ID" value="${pd.PRJ_ID}"
																						placeholder="项目ID" style="color:#F00;width:95%" readonly="readonly" /></td>
																					<td><lable>项目名称</lable><input type="text"
																						name="PRJ_NAME" id="PRJ_NAME" value="${pd.PRJ_NAME}"
																						placeholder="项目ID" style="color:#F00;width:95%" readonly="readonly" /></td>
																				</tr>
																				<tr>
																					<td><lable>存储ID</lable><input type="text"
																						name="STORAGE_ID" id="STORAGE_ID"
																						value="${pd.arstorageid}" placeholder="存储ID"
																						style="color:#F00;width:95%" readonly="readonly" /></td>
																					<td><lable>存储设备</lable><input type="text"
																						name="REGISTER_NAME" id="REGISTER_NAME"
																						value="${pd.arstoragename}" placeholder="存储ID"
																						style="color:#F00;width:95%" readonly="readonly" /></td>
																				</tr>
																				<tr>
																					<td><lable>存储注册ID</lable><input type="text"
																						name="REGISTER_ID" id="REGISTER_ID"
																						value="${pd.registerid}" placeholder="存储ID"
																						style="color:#F00;width:95%" readonly="readonly" /></td>
																					<td><lable>接收备注</lable><input type="text"
																						name="RC_REMARK" id="RC_REMARK" value=""
																						placeholder="请输入备注" style="color:#F00;width:95%" /></td>
																				</tr>
																				<tr>
																				
																					<td><lable style="display: none">接收进度字符串</lable><input
																						type="text" name="RC_STRING" id="RC_STRING"
																						value="" placeholder="接收进度字符串"
																						style="width:95%;display: none" /></td>
																					<td><lable style="display: none">检查文件详情</lable><input
																						type="text" name="CHECKDETAILS" id="CHECKDETAILS"
																						value="测试" placeholder="检查文件详情"
																						style="width:95%;display: none" /></td>
																				</tr>
																				<tr>
																					<td><lable style="display: none">接收时间</lable><input
																						type="text" name="RC_TIME" id="RC_TIME" value=""
																						placeholder="接收时间" style="width:95%;display: none" /></td>
																					<td><lable style="display: none">接收进度</lable><input
																						type="text" name="RC_PROGRESS" id="RC_PROGRESS"
																						value="" placeholder="接收进度"
																						style="width:95%;display: none" /></td>
																					<td><lable style="display: none">检查文件地址</lable><input 
																						type="text" name="CHECKFILE_URL" id="CHECKFILE_URL"
																						value="" placeholder="检查文件地址"
																						style="width:95%;display: none" /></td>
																				</tr>
																			</table>
																			
																			
																		<div id="register-FileDetails" class="center"
																			style="display:show">
																			<hr />
																			<font color="#3333ff" face="微软雅黑" style="float:left">文件列表详情</font>
																			<br> <br>
																			<!-- 检索  -->
																			<table id="handfile-table"
																				class="table table-striped table-bordered table-hover"
																				style="margin-top:5px;">

																			</table>

																		</div>

																	
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
		<script src="static/js/jquery/jquery-3.0.0.min.js"></script>
		
		<script src="static/ace/js/ace/ace.js" />
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		<script type="text/javascript" src="static/ace/js/dist/bootstrap-table.min.js"></script>
		
		<script type="text/javascript" >
		
			$(top.hangge());//清除加载进度
			
			//保存
			function arfinish() {

				$("#FinishForm").submit();
				$("#doing1").hide();
				$("#doing2").show();
			}
			
				
			$(function() {
				var handtablejson = $("#tablejson").val();
				var oTable = new filehandtable_init();
				oTable.Init();
				
				 $('#handfile-table').bootstrapTable({
				 	data : <%=ja%>
				 	});
			});
			
			
			function filehandtable_init() {
				var oTableInit = new Object();
				//初始化Table
				oTableInit.Init = function() {
					$('#handfile-table').bootstrapTable(
					{
						/* url : "/CCYYAMS/file/showFileTemplistPage", //请求后台的URL（*） *//* 
						method : "get", //请求方式（*） */
						striped : true, //是否显示行间隔色
						cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
						pagination : true, //是否显示分页（*）
						sortable : true, //是否启用排序
						sortOrder : "desc", //排序方式
						sortName : "FILE_NAME",//"tasksort",
						queryParams : oTableInit.queryParams, //传递参数（*）
						sidePagination : "client", //分页方式：client客户端分页，server服务端分页（*）
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
							field : "RCTEMP_ID",
							title : "临时接收序号",
							align : "center",
							sortable : "true"
						}, {
							field : "FILE_ID",
							title : "文件ID",
							align : "center",
							sortable : "true"
						}, {
							field : "FILE_NAME",
							title : "文件名称",
							align : "center",
							sortable : "true"
						}, {
							field : "IFDIGIT",
							title : "是否电子",
							align : "center",
							sortable : "true"
						}, {
							field : "DATAFORM",
							title : "扩展名",
							align : "center",
							sortable : "true"
						}, {
							field : "FILE_URL",
							title : "文件路径",
							align : "center",
							sortable : "true"
						}, {
							field : "VOLUME",
							title : "文件容量",
							align : "center",
							sortable : "true"
						}, {
							field : "UNIT",
							title : "容量单位",
							align : "center",
							sortable : "true"
						}, {
							field : "IFARCHIVE",
							title : "成果或档案",
							align : "center",
							sortable : "true"
						}, {
							field : "FILE_TYPE",
							title : "文件类型",
							align : "center",
							sortable : "true"
						}, {
							field : "SCALE",
							title : "比例尺",
							align : "center",
							sortable : "true"
						}, {
							field : "FILE_REMARK",
							title : "文件备注",
							align : "center",
							sortable : "true"
						}, {
							field : "PERMISSION_CLASS",
							title : "密级",
							align : "center",
							sortable : "true"
						}, {
							field : "CREATIONDATE",
							title : "创建日期",
							align : "center",
							sortable : "true"
						}, {
							field : "COVERAGE",
							title : "覆盖区域",
							align : "center",
							sortable : "true"
						}, {
							field : "YEAR",
							title : "年份",
							align : "center",
							sortable : "true"
						}, {
							field : "FILEDETAIL",
							title : "文件详情",
							align : "center",
							sortable : "true"
						}],
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
		}
		</script>
		</body>
</html>