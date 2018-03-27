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
<link rel="stylesheet" type="text/css" href="static/ace/css/ace.css" />
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
<!-- ace scripts -->
<script src="static/ace/js/ace/ace.js"></script>

</script>



<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>

<script src="static/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="static/ace/css/sweetalert2.min.css">

<script type="text/javascript" src="static/js/ccyyamsjs/archive.js"></script>

</head>
<body>

	<div class="main-container" id="main-container" style="font-family: microsoft yahei;">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">

						<div id="archreceive2">
							<!-- /2选择存储介质 -->

							<div class="col-xs-12">
								<div class="span12">
									<div class="widget-box">
										<div
											class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
											<h4 class="widget-title">第2步：选择存储介质</h4>

										</div>

										<div class="widget-body">
											<div class="widget-main">
												<table style="margin-top:5px;">
													<tr>
														<form action="archiveRCSTO/setstorage.do" name="SETSTORAGEForm" id="SETSTORAGEForm">
															<font color="#3333ff" face="微软雅黑"> 介质存在 则选择已注册介质<br />
																新介质 则根据表单输入详细信息注册
															</font> <input type="hidden" name="OLDNEWTYPE" id="OLDNEWTYPE"
																value="1" /> <input type="hidden" name="TYPE" id="TYPE"
																value="1" /><input type="hidden" name="STORAGEOLDNEW"
																id="STORAGEOLDNEW" value="1" />
															<hr />
															<div id="ifsotoragenew">
																<div id="setfiletype" class="center"
																	style="display:show">
																	<table>
																		<tr>
																			<td style="text-align: center;padding-top: 5px;">
																				<select class="chosen-select form-control"
																				id="selectFileEorM" title="选择文件类型"
																				data-placeholder="选择文件类型..." style="width:100%;"
																				name="selectFileEorM" value="${selectFileEorM}">
																					<option value="0">-请选择文件类型-</option>
																					<option value="1">电子成果</option>
																					<option value="2">模拟成果</option>
																			</select>
																			</td>			
																	
																		</tr>

																	</table>
																</div> <!-- setfiletype end -->

															</div>
															<div>
																<div id="storageold" class="center" style="display:show">
																	<table style="width:100%;">
																		<tr>
																			<td style="text-align: left;"><span class="lbl"
																				style="margin:0 0 0 15px;">已选择存储介质的ID:</span> <input
																				name="storageIDinput" id="storageIDinput"
																				type="text" value="存储介质ID"
																				style="border:0;color:#F00;width:80%;background:transparent !important;"
																				readonly="readonly" /></td>
																		</tr>
																		<tr>
																			<td style="text-align: left;"><span class="lbl"
																				style="margin:0 0 0 15px;">已选择存储介质的类型ID名:</span> <input
																				name="storageNAMEinput" id="storageNAMEinput"
																				type="text" value="类型ID名"
																				style="border:0;color:#F00;width:80%;background:transparent !important;"
																				readonly="readonly" /></td>
																		</tr>

																	</table>
																</div>
															</div>
															<div
																style="padding:10px 0 50px 10px;border-bottom:2px solid #438eb9;">
																<label style="float:left;padding-left: 5px;"> <input
																	name="setstoragetype-radio" id="setstoragetype-radio1"
																	onclick="setStorageType('1');" checked="checked"
																	type="radio" value="1" class="ace"> <span
																	class="lbl">硬盘</span>
																</label> <label style="float:left;padding-left: 5px;"> <input
																	name="setstoragetype-radio" id="setstoragetype-radio2"
																	onclick="setStorageType('2');" type="radio" value="2"
																	class="ace" /> <span class="lbl">光盘</span>
																</label> <label style="float:left;padding-left: 5px;"> <input
																	name="setstoragetype-radio" id="setstoragetype-radio3"
																	onclick="setStorageType('3');" type="radio" value="3"
																	class="ace" /> <span class="lbl">案卷</span>
																</label> <label style="float:left;padding-left: 5px;"> <input
																	name="setstoragetype-radio" id="setstoragetype-radio4"
																	onclick="setStorageType('4');" type="radio" value="4"
																	class="ace" /> <span class="lbl">库体</span>
																</label> <label style="float:left;padding-left: 5px;"> <input
																	name="setstoragetype-radio" id="setstoragetype-radio5"
																	onclick="setStorageType('5');" type="radio" value="5s"
																	class="ace" /> <span class="lbl">磁盘阵列</span>
																</label>
																<!--<a class="btn btn-sm btn-success" onclick="addP();"
																	style="float:left; margin-top:-5px;"> 新增存储介质</a>-->
															</div>
															<!-- ifsotoragenew end-->
															<div id="setstoragetype" style="margin-top:20px;">
																
                                                                    <table>
																	<tr>
																		<!-- bootstrap table for storage -->
																		<table id="arstorage-table"
																			class="table table-striped table-bordered table-hover"
																			style="margin-top:5px;">
																		</table>
																	</tr>
																	<tr>
																		<div id="riad" class="center" style="display:none">
																			<table>
																				<tr>
																					<td><select name="oldRIAD-select"
																						class="chosen-select form-control"
																						id="oldRIAD-select" title="请选择已有磁盘阵列盘符"
																						data-placeholder="选择已有磁盘阵列盘符...">
																							<c:forEach items="${RAIDList}" var="raid">
																								<option value="${raid.diskName }&&${raid.pathName }"
																									<c:if test="${raid.pathName == raid.pathName }">selected</c:if>>${raid.diskName }|磁盘路径：${raid.pathName }|可用空间：${raid.usableSpaceG}G }</option>
																							</c:forEach>
																					</select></td>
																					<td><span class="lbl">选择已有磁盘阵列盘符</span></td>
																				</tr>
																			</table>
																		</div>
																	</tr>
																	
																	<tr>
																		<div id="storageboottable" class="center" >
																			<!-- bootstrap table for storage -->
																			<table id="arstorage-table"
																				class="table table-striped table-bordered table-hover"
																				style="margin-top:5px;">
																			</table>
																			
																		</div>
																	</tr>
																	
																</table>
															</div>
															<!-- setstoragetype end-->

																			
														</form>
													</tr>
													<tr>
														<div>
															<a class="btn btn-sm btn-primary" onclick="setStorage();"
																style="float:right">确定存储介质</a>
														</div>
														<div>
															<a class="btn btn-sm btn-primary"
																onclick="setbacktosetproject();" style="float:right;">返回</a>
														</div>
													</tr>

												</table>

											</div>
											<!-- widget-main end -->
										</div>
										<!-- widget-body end -->
									</div>
								</div>
							</div>
							<!-- /2选择存储介质 -->
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
		//$(top.hangge());//清除加载进度

		//设置文件类型为电子成果
		var options = document.getElementById('selectFileEorM').options;
		options[1].selected = true;

		//注册存储介质提交

		function setStorage() {
			var text =$("#storageIDinput")[0].value;
			if (text == "存储介质ID") {
				swal('NO!', '请选择一个介质', 'error')
			} else {
				$("#SETSTORAGEForm").submit();
			}
		}

		// 选择新介质类型 /可用
		function setStorageType(value) {

			$("#TYPE").val(value);
			if ($("#TYPE").val() == "1") {

				$("#riad").hide();
				//设置文件类型为电子成果
				var options = document.getElementById('selectFileEorM').options;
				options[1].selected = true;
				/* 		
						setStorageTable(1); */
			}

			if ($("#TYPE").val() == "2") {

				$("#riad").hide();
				//设置文件类型为电子成果
				var options = document.getElementById('selectFileEorM').options;
				options[1].selected = true;

			}
			if ($("#TYPE").val() == "3") {

				$("#riad").hide();
				//设置文件类型为模拟成果
				var options = document.getElementById('selectFileEorM').options;
				options[2].selected = true;

			}
			if ($("#TYPE").val() == "4") {

				$("#riad").hide();
				//设置文件类型为电子成果
				var options = document.getElementById('selectFileEorM').options;
				options[1].selected = true;
			}
			if ($("#TYPE").val() == "5") {

				$("#riad").show();

				//设置文件类型为电子成果
				var options = document.getElementById('selectFileEorM').options;
				options[1].selected = true;
			}
		}

		function setStorageTable(value) {
			$('#arstorage-table').bootstrapTable({
				url : "/CCYYAMS/archivestorage/showstoragelistpage", //请求后台的URL（*）
				method : "get", //请求方式（*）
				striped : true, //是否显示行间隔色
				cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				pagination : true, //是否显示分页（*）
				sortable : true, //是否启用排序
				sortOrder : "desc", //排序方式
				sortName : "REALSTORAGE_ID",//"tasksort",
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
					field : "REALSTORAGE_ID",
					title : "ID",
					align : "center",
					sortable : "true"
				}, {
					field : "STORAGE_TYPENAME",
					title : "类型ID名",
					align : "center",
					sortable : "true"
				}, {
					field : "STORAGE_NAME",
					title : "介质名",
					align : "center",
					sortable : "true"
				}, {
					field : "STORAGE_TYPE",
					title : "类型编号",
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
					$("#storageIDinput").val(row.REALSTORAGE_ID);
					$("#storageNAMEinput").val(row.STORAGE_TYPENAME);
				},//单击row事件
			})
		}

		$(function() {
			var oTable = new storage_TableInit();
			oTable.Init();
		});
		function storage_TableInit() {
			var oTableInit = new Object();
			//初始化Table
			oTableInit.Init = function() {
				$('#arstorage-table').bootstrapTable({
					url : "/CCYYAMS/archivestorage/showstoragelistpage", //请求后台的URL（*）
					method : "get", //请求方式（*）
					striped : true, //是否显示行间隔色
					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
					pagination : true, //是否显示分页（*）
					sortable : true, //是否启用排序
					sortOrder : "desc", //排序方式
					sortName : "REALSTORAGE_ID",//"tasksort",
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
						field : "REALSTORAGE_ID",
						title : "ID",
						align : "center",
						sortable : "true"
					}, {
						field : "STORAGE_TYPENAME",
						title : "类型ID名",
						align : "center",
						sortable : "true"
					}, {
						field : "STORAGE_NAME",
						title : "介质名",
						align : "center",
						sortable : "true"
					}, {
						field : "STORAGE_TYPE",
						title : "类型编号",
						align : "center",
						sortable : "true"
					}, {
						field : "VOLUME",
						title : "容量空间",
						align : "center",
						sortable : "true"
					}, {
						field : "ACTVOLUME",
						title : "可用容量",
						align : "center",
						sortable : "true"
					}, {
						field : "UNIT",
						title : "容量单位",
						align : "center",
						sortable : "true"
					}, {
						field : "STORAGE_REMARK",
						title : "备注",
						align : "center",
						sortable : "true"
					} ],
					onClickRow : function(row, $element) {
						//$element是当前tr的jquery对象
						$("#storageIDinput").val(row.REALSTORAGE_ID);
						$("#storageNAMEinput").val(row.STORAGE_TYPENAME);
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
					search : params.search,
					STORAGE_TYPE : $(
							'input:radio[name="setstoragetype-radio"]:checked')
							.val()
				};

				/* 
				var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
				limit: params.limit,   //页面大小
				offset: params.offset,  //页码
				sdate: $("#stratTime").val(),
				edate: $("#endTime").val(),
				sellerid: $("#sellerid").val(),
				orderid: $("#orderid").val(),
				CardNumber: $("#CardNumber").val(),
				maxrows: params.limit,
				pageindex:params.pageNumber,
				portid: $("#portid").val(),
				CardNumber: $("#CardNumber").val(),
				tradetype:$('input:radio[name="tradetype"]:checked').val(),
				success:$('input:radio[name="success"]:checked').val(),
				 */

				return temp;
			};
			return oTableInit;
		};
	</script>
	</body>
</html>