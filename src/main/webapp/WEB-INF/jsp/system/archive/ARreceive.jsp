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
<link href="plugins/fhform/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="plugins/fhform/css/animate.min.css" rel="stylesheet">
<link href="plugins/fhform/css/style.min.css?v=4.0.0" rel="stylesheet">


<!-- 按钮选择 -->
<link href='static/ccyyamscss/tabulous/style.css' rel='stylesheet' type='text/css'>



<script src="static/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="static/ace/css/sweetalert2.min.css">

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



<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>

<script src="static/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="static/ace/css/sweetalert2.min.css">

<script type="text/javascript" src="static/js/ccyyamsjs/archive.js"></script>

</head>
<body onload="init()">

	<div class="main-container" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">

						<!-- /接收第3.1步 -->
						<div id="archreceive3">

							<div class="col-xs-12">
								<div class="span12">
									<div class="widget-box">
										<div
											class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
											<h4 class="lighter">第3步：成果接收</h4>
										</div>
										<div class="widget-body">
											<div class="widget-main">
						
												<table id="atable"
													class="table table-striped table-bordered table-hover"
													style="margin-top:5px;">
												</table>
												<div id="zhongxin">
													<div id="hdfdiv1" name="hdfdiv1">
														
														<div>
															<font color="#3333ff" face="微软雅黑">已选择项目名、硬盘，请根据以下提示操作：</font>
														</div>
														<div id="2yingpan" class="center">
															<!-- Nav tabs -->
															<ul class="nav nav-tabs" role="tablist">
																<li><a onclick="uploadfilechoose('1');">手工填写文件表单</a></li>
																<li><a onclick="uploadfilechoose('2');">文件表单上传</a></li>
															</ul>
															<input type="hidden" name="UFC" id="UFC" value="1" />
															<!-- Tab panes -->
															<div id="Section1" name="Section1">
																
																<form action="archiveRCREC/addHDFhand.do"
																	name="FormReceiveHDFhand" method="post"
																	enctype="multipart/form-data" id="FormReceiveHDFhand">
																	
																	<div id="zhongxin">
																		<textarea name="CONTENT" id="CONTENT" style="display:none"></textarea>
																		
																		<table style="width:100%;" id="handinputtable">
																			<tr>
																				<td><input type="text" id="FILE_NAME"
																					name="FILE_NAME" value="测试文件名"
																					placeholder="1输入文件名称" style="color:#F00;width:98%" /></td>
																				<td><select class="chosen-select form-control"
																					name="IFDIGIT" id="IFDIGIT"
																					data-placeholder="2这里输入是否电子1为电子数据2为模拟数据"
																					style="vertical-align:top;color:#F00;width:98%">
																						<option value="1">电子数据</option>
																						<option value="2">模拟数据</option>
																				</select></td>
																				<td><input type="text" id="DATAFORM"
																					name="DATAFORM" value="TEST" placeholder="3输入文件扩展名"
																					style="color:#F00;width:98%" /></td>
																				<td><input type="text" id="FILE_URL"
																					name="FILE_URL" value="测试路径" placeholder="4输入文件地址"
																					style="color:#F00;width:98%" /></td>
																			</tr>
																			<tr>
																				<td><input type="text" id="VOLUME"
																					name="VOLUME" value="1" placeholder="5输入文件容量大小"
																					style="color:#F00;width:98%" /></td>
																				<td><select class="chosen-select form-control"
																					name="UNIT" id="UNIT" data-placeholder="6这里输入容量单位"
																					style="vertical-align:top;color:#F00;width:98%">
																						<option value="KB">KB</option>
																						<option value="MB">MB</option>
																						<option value="GB">GB</option>
																						<option value="TB">TB</option>
																						<option value="盒">盒</option>
																						<option value="张">张</option>
																						<option value="页">页</option>
																						<option value="份">份</option>
																						<option value="单位">单位</option>
																				</select></td>
																				<td><select class="chosen-select form-control"
																					name="IFARCHIVE" id="IFARCHIVE"
																					data-placeholder="7成果或档案"
																					style="vertical-align:top;color:#F00;width:98%">
																						<option value="1">成果</option>
																						<option value="5">档案</option>
																				</select></td>
																				<td><select class="chosen-select form-control"
																					name="FILE_TYPE" id="FILE_TYPE"
																					data-placeholder="8选择文件类型"
																					style="vertical-align:top;color:#F00;width:98%">
																						<option value="4">待分类资料</option>
																						<option value="1">成果资料</option>
																						<option value="2">过程资料</option>
																						<option value="3">收集资料</option>
																						<option value="5">档案</option>
																				</select></td>
																			</tr>
																			<tr>
																				<td><input type="text" id="SCALE" name="SCALE"
																					value="测试比例尺2000" placeholder="9输入比例尺 ,如“1：2000”"
																					style="color:#F00;width:98%" /></td>
																				<td><input type="text" id="FILE_REMARK"
																					name="FILE_REMARK" value="" placeholder="10输入文件备注"
																					style="color:#F00;width:98%" /></td>
																				<td><select class="chosen-select form-control"
																					name="PERMISSION_CLASS" id="PERMISSION_CLASS" title="密级"
																					data-placeholder="11输入文件密级" style="color:#F00;width:98%" >
																						<option value="公开">公开</option>
																						<option value="国内">国内</option>
																						<option value="内部">内部</option>
																						<option value="秘密">秘密</option>
																						<option value="机密">机密</option>
																						<option value="绝密">绝密</option>
																				</select></td>
																					
																					
																					
																				<td><input type="text" id="CREATIONDATE"
																					name="CREATIONDATE" value="" placeholder="12输入创建日期"
																					style="color:#F00;width:98%" /></td>
																			</tr>
																			<tr>
																				<td><input type="text" id="COVERAGE"
																					name="COVERAGE" value="测区"
																					placeholder="13输入覆盖区域或地点名称"
																					style="color:#F00;width:98%" /></td>
																				<td><input type="text" id="YEAR" name="YEAR"
																					value="2016" placeholder="14输入年份"
																					style="color:#F00;width:98%" /></td>
																				<td><input type="text" id="FILEDETAIL"
																					name="FILEDETAIL" value="" placeholder="15输入详情目录"
																					style="color:#F00;width:98%" /></td>
																				<td><input type="text" id="RCTEMP_ID"
																					name="RCTEMP_ID" value="${pd.RctempId}" placeholder="16输入接收临时ID"
																					style="color:#F00;width:98%" /></td>
																			</tr>
																		</table>

																		<a id="Section1-a" class="btn btn-sm btn-success"
																			onclick="addF();">手动添加文件</a>
																	</div>


																	<table id="newhandtable" data-toggle="table"
																		cellspacing="3" cellpadding="3" border="1">

																		<thead>
																			<tr>
																				<th class="center" style="width:50px;">接收临时序号</th>
																				<th class="center" style="width:50px;">文件ID</th>
																				<th class="center">文件名称</th>
																				<th class="center">是否电子</th>
																				<th class="center">扩展名</th>
																				<th class="center">文件路径</th>
																				<th class="center">文件容量</th>
																				<th class="center">容量单位</th>
																				<th class="center">成果或档案</th>
																				<th class="center">文件类型</th>
																				<th class="center">比例尺</th>
																				<th class="center">文件备注</th>
																				<th class="center">密级</th>
																				<th class="center">创建日期</th>
																				<th class="center">覆盖区域</th>
																				<th class="center">年份</th>
																				<th class="center">文件详情</th>

																			</tr>
																		</thead>

																		<tbody>
																			<tr>

																			</tr>
																		</tbody>
																	</table>
																	<a id="newhandtable-a" class="btn btn-sm btn-success"
																		onclick="saveF();">确定文件目录</a>
																		
																</form>
															</div>
															<div id="Section2" name="Section2" style="display:none">
																<form action="archiveRCREC/addHDF.do"
																	name="FormReceiveHDFauto" method="post"
																	enctype="multipart/form-data" id="FormReceiveHDFauto">
																	<table id="Section2-table" class="table">
																		<tr>
																			<td><lable>请选择待存储项目的检查文件(EXCEL)： </lable></td>
																			<td><a class="a-upload">选择文件 <input
																					type="file" id="checkexcel" name="checkexcel"
																					accept=".xls,.xlsx"
																					onchange="document.getElementById('viewfile').value=this.value;" />
																			</a></td>

																			<td><input type="text" name="viewfile"
																				id="viewfile" style="width: 300px"></td>
																		</tr>
																	</table>

																</form>
															</div>

														</div>
													</div>
													<div id="cdfdiv1" name="cdfdiv1" style="display:none">
														<form action="archiveRCREC/addCDF.do"
															name="FormReceiveCDF" method="post"
															enctype="multipart/form-data" id="FormReceiveCDF">
															<div>
																<font color="#3333ff" face="微软雅黑">已选择项目名，并将光盘作为存储介质，请根据以下提示操作：</font>
															</div>

															<div id="CDFstorage-receive" class="center">

																<div id="2guangpan" class="center"></div>
															</div>
														</form>
													</div>
													<div id="fdfdiv1" name="fdfdiv1" style="display:none">
														<form action="archiveRCREC/addFDF.do"
															name="FormReceiveFDF" method="post"
															enctype="multipart/form-data" id="FormReceiveFDF">
															<div>
																<font color="#3333ff" face="微软雅黑">已选择项目名，并将案卷作为存储介质，请根据以下提示操作：</font>
															</div>
															<div id="FDFstorage-receive" class="center">
																<div id="2anjuan" class="center"></div>
															</div>
														</form>

													</div>
													<div id="ktfdiv1" name="ktfdiv1" style="display:none">

														<form action="archiveRCREC/addKTF.do"
															name="FormReceiveKTF" method="post"
															enctype="multipart/form-data" id="FormReceiveKTF">
															<div>
																<font color="#3333ff" face="微软雅黑">已选择项目名，并将库体表单作为存储介质，请根据以下提示操作：</font>
															</div>


															<div id="KTFstorage-receive" class="center">
																<div id="2kuti" class="center" style="display:none">

																</div>

															</div>
														</form>
													</div>
													<div id="raiddiv1" name="raiddiv1" style="display:none">

														<form action="archiveRCREC/addRAID.do"
															name="FormReceiveRAID" method="post"
															enctype="multipart/form-data" id="FormReceiveRAID">
															<div>
																<font color="#3333ff" face="微软雅黑">已选择项目名，并将磁盘阵列作为存储介质，请根据以下提示操作：</font>
															</div>


															<div id="RAIDstorage-receive" class="center">
																<div id="2cipanzhenlie" class="center">
																	<table>
																		<tr>
																			<td><lable>请选择待存储项目的检查文件(EXCEL)： </lable></td>
																			<td><a class="file">选择文件 <input type="file"
																					id="checkexcel" name="checkexcel"
																					accept=".xls,.xlsx"
																					onchange="document.getElementById('viewfile').value=this.value;" />
																			</a></td>
																			<td><input type="text" name="viewfile"
																				id="viewfile" style="width: 300px"></td>
																		</tr>

																		<tr>
																			<td><lable>请上传存储至服务器磁盘阵列的真实文件： </lable></td>
																			<td><a class="file">选择文件 <input type="file"
																					id="2cipanzhenlierealfile"
																					name="2cipanzhenlierealfile" webkitdirectory
																					onchange="document.getElementById('viewfile').value=this.value;" />
																			</a></td>
																			<td><input type="text" name="viewfile"
																				id="viewfile" style="width: 300px"></td>
																		</tr>
																	</table>
																</div>

															</div>
														</form>
													</div>
												</div>


												<div id="zhongxin2" class="center" style="display:none">
													<br /> <img src="static/images/jzx.gif" id='msg' /><br />
													<h4 class="lighter block green" id='msg'>正在发送...</h4>
													<strong id="second_shows" class="red">6秒</strong>后关闭
												</div>

												<div>
													<a class="btn btn-sm btn-primary" onclick="afterreceive();"
														style="float:right">完成传输 登记接收</a>
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
						<!-- /接收第3.1步 -->

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
	
	
	<!-- 单选tabulous -->
	<script type="text/javascript" src="static/js/tabulous/tabulous.js"></script>
	<script type="text/javascript" src="static/js/tabulous/js.js"></script>
	
	<script type="text/javascript">
		$(top.hangge());//清除加载进度

		function init() {
			var oldnewtype = "${oldnewtype}";
			var type = "${type}";
    			console.log("type=",type);
    			console.log("oldnewtype=",oldnewtype);

			switch (type) {
			case "1":
   				console.log("---------1-------");
				$("#raiddiv1").hide();
				$("#ktfdiv1").hide();
				$("#fdfdiv1").hide();
				$("#cdfdiv1").hide();
				$("#hdfdiv1").show();
			/* 	
				$("#Section1").hide();
				$("#Section1-table").hide();
				$("#Section1-a").hide();
				
				$("#Section2-table").hide(); */
				
				break;
			case "2":
			   console.log("---------2-------");
				$("#hdfdiv1").hide();
				$("#ktfdiv1").hide();
				$("#fdfdiv1").hide();
				$("#raiddiv1").hide();
				$("#cdfdiv1").show();
				
				break;
			case "3":
			       console.log("---------3-------");
				$("#hdfdiv1").hide();
				$("#cdfdiv1").hide();
				$("#ktfdiv1").hide();
				$("#raiddiv1").hide();
				$("#fdfdiv1").show();
				
				break;
			case "4":
			   console.log("---------4-------");
				$("#hdfdiv1").hide();
				$("#cdfdiv1").hide();
				$("#fdfdiv1").hide();
				$("#raiddiv1").hide();
				$("#ktfdiv1").show();
				
				break;
			case "5":
			   console.log("---------5-------");
				$("#hdfdiv1").hide();
				$("#cdfdiv1").hide();
				$("#fdfdiv1").hide();
				$("#ktfdiv1").hide();
				$("#raiddiv1").show();
				
				break;
			}

		}
		function uploadfilechoose(value) {
			if(value=="1"){
				$("#UFC").val(value);
				
				
				$("#Section1").show();
				$("#Section1-table").show();
				$("#Section1-a").show();
				
				$("#Section2-table").hide();
			
			}else if(value=="2"){
				$("#UFC").val(value);
				
				$("#Section1").hide();
				$("#Section1-table").hide();
				$("#Section1-a").hide();
				
				$("#Section2").show();
				$("#Section2-table").show();
			}else{
				
				$("#Section1").hide();
				$("#Section2").hide();
			}
		}
		
		//新增
		function addP(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增项目";
			 diag.URL = '<%=basePath%>project/goAdd.do';
			 diag.Width = 600;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location=self.location",100);
					 }else{
					 
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
				
		function addF(){
		
            var $table = $('#newhandtable');
            var tr = 
            "<tr><td>"+ $("#RCTEMP_ID").val()+"</td><td></td>"+
            "<td>"+ $("#FILE_NAME").val()+"</td><td>"+ $("#IFDIGIT").val()+"</td>"+
            "<td>"+ $("#DATAFORM").val()+"</td><td>"+ $("#FILE_URL").val()+"</td>"+
            "<td>"+ $("#VOLUME").val()+"</td><td>"+ $("#UNIT").val()+"</td>"+
            "<td>"+ $("#IFARCHIVE").val()+"</td><td>"+ $("#FILE_TYPE").val()+"</td>"+
            "<td>"+ $("#SCALE").val()+"</td><td>"+ $("#FILE_REMARK").val()+"</td>"+
            "<td>"+ $("#PERMISSION_CLASS").val()+"</td><td>"+ $("#CREATIONDATE").val()+"</td>"+
            "<td>"+ $("#COVERAGE").val()+"</td><td>"+ $("#YEAR").val()+"</td>"+
            "<td>"+ $("#FILEDETAIL").val()+"</td></tr>"
            ;
            
            $table.append(tr);
			
		
		}
		
		$('#simple-table > thead > tr > th input[type=checkbox]')
		
		
		function saveF() {
 			var $table = $('#newhandtable');
  			var rows = [];
			// first row needs to be headers
			var headers = [];
			var trnum = $("#newhandtable tr").length;
			var thnum = $("#newhandtable th").length;
			$("#newhandtable").find("thead > tr > th").each(function(thindex, thitem){
				
				var headName = $(thitem).text();
				headers.push(headName);
			});
			for (var i = 2; i < trnum; i++) {
				var rowData = {};
				
				for(var j = 1; j < thnum+1; j++){
					var rowheadvalue = $("#newhandtable tr:eq("+ i +") td:nth-child("+ j +")").html();
					var rowheadname = headers[j-1];
					rowData[rowheadname] = rowheadvalue;
				}
				rows.push(rowData);
			}
			var jsondata =JSON.stringify({"HandFileTable":rows});
            
            $.ajax({
            	type: "POST",
                url: "/CCYYAMS/jsondata/resolveJsonObject", 
	    		contentType: "application/json", //必须有
                data:jsondata,
                success:function(data){
                	alert("确认文件目录成功！");
                 	
                },
		        error: function (er) {
		            alert("确认文件目录失败！");
		        }
            });
			
		}
		
				
		
		
		
		$(function() {
			var oTable = new receive_TableInit();
			oTable.Init();
			
			
			$('#button').click(function () {  
            $table.bootstrapTable('refresh', {url: '../json/data1.json'});  
            
            });  
			
		});
		/* 
		function receive_TableInit() {
			var oTableInit = new Object();
			//初始化Table
			oTableInit.Init = function() {
				$('#Section1-table').bootstrapTable(
				{
					url : "/CCYYAMS/file/showFileTemplistPage", //请求后台的URL（*）
					method : "get", //请求方式（*）
					striped : true, //是否显示行间隔色
					cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
					pagination : true, //是否显示分页（*）
					sortable : true, //是否启用排序
					sortOrder : "desc", //排序方式
					sortName : "FILE_ID",//"tasksort",
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
		} */
		
		
		function afterreceive() {
		
			var type = "${type}";
        
			switch (type) {
				case "1":
					if( $("#UFC").val() == "1"){
						//saveF();
						
						$("#FormReceiveHDFhand").submit();
						
						break;
					}else if( $("#UFC").val() == "2"){
						
						var t=document.getElementById("viewfile").value
						if(t=="")
						{
							swal('NO!','请选择一个文件','error')
							break;
						}else{
							
							$("#FormReceiveHDFauto").submit();
							
							break;
						}
						
					}
				case "2":
					$("#FormReceiveCDF").submit();
					break;
				case "3":
					$("#FormReceiveFDF").submit();
					break;
				case "4":
					$("#FormReceiveKTF").submit();
					break;
				case "5":
					$("#FormReceiveRAID").submit();
					break;
			}
		  
		}
		
		
		
	</script>
	</body>
</html>