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
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
							<form action="doc/list.do" method="post" name="userForm"
								id="userForm">
								<input hidden="hidden" name="ids" class="ids" value="${pd.ids }">
								<table style="margin-top: 5px;">								
									<tr>
										<td>
											<div class="nav-search">
												<span class="input-icon"> 
												<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词" /> 
													<i class="ace-icon fa fa-search nav-search-icon"></i>
												</span>
											</div>
										</td>
										<%-- 
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="最近登录开始"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" name="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="最近登录结束"/></td> --%>
										<td>
											<div class="nav-search">
												<span class="input-icon">
													<select class="form-control" name="fmsid">
														<option value="">全部</option>
														<c:forEach items="${listDocBox}" var="data">
															<option value="${data.id}"
																<c:if test="${pd.fmsid==data.id}">selected</c:if>>${data.name}</option>
														</c:forEach>
													</select>
												</span>
											</div>
										</td>
											<td>
											<div class="nav-search">
												<span class="input-icon">
													<select class="form-control" name="classtype">
														<option value="">全部</option>
														<c:forEach items="${classtype.fmsDataDictItems}" var="data">
															<option value="${data.name}"
																<c:if test="${pd.classtype==data.name}">selected</c:if>>${data.value}</option>
														</c:forEach>
													</select>
												</span>
											</div>
										</td>
										<td style="vertical-align: top; padding-left: 2px;"><select
											class="chosen-select form-control" name="isvalid"
											id="isvalid" data-placeholder="请选择状态"
											style="vertical-align: top; width: 120px;">
												<option value=""></option>
												<option value="">全部</option>
												<c:forEach items="${isvalid.fmsDataDictItems}" var="data">
													<option value="${data.name }"
														<c:if test="${pd.isvalid==data.name}">selected</c:if>>${data.value }</option>
												</c:forEach>
										</select>
										</td>
										<c:if test="${QX.cha == 1 }">
											<td style="vertical-align: top; padding-left: 2px;"><a
												class="btn btn-light btn-xs" onclick="searchs();" title="检索"><i
													id="nav-search-icon"
													class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
											<%-- <c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>
								<c:if test="${QX.FromExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="ace-icon fa fa-cloud-upload bigger-110 nav-search-icon blue"></i></a></td></c:if>
 --%>									</c:if>
									</tr>
								</table>
								<!---高级索引 --s  -->
								<c:if test="${pd.detail == 1 }">															
									<table class="table table-striped table-bordered table-hover"
										style="margin-top: 5px;">
										<tr>
											<td colspan="2">
												<div class="nav-search">
													<span> <input type='text' name='detail' value='1'
														hidden /> <label>责任部门</label></span> <select
														class="form-control" name="owner">
															<option value="">全部</option>
															<c:forEach items="${pd.zrdepartment }" var="data">
																<option value="${data.DEPARTMENT_ID}"
																	<c:if test="${pd.owner==data.DEPARTMENT_ID}">selected</c:if>>${data.NAME}</option>
															</c:forEach>
													</select>
												</div> 
											</td>
											<td colspan="2">
												<div class="nav-search">
													<label>承办部门</label> <select class="form-control"
														name="subowner">
														<option value="">全部</option>
														<c:forEach items="${pd.cbdepartment }" var="data">

															<option value="${data.DEPARTMENT_ID}"
																<c:if test="${pd.subowner==data.DEPARTMENT_ID}">selected</c:if>>${data.NAME}</option>
														</c:forEach>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="nav-search">
													<label>档案类型</label> <select class="form-control"
														name="classtype" onchange="changeClassType()">
														<option value="">全部</option>
														<c:forEach items="${classtype.fmsDataDictItems}"
															var="data">
															<option value="${data.name}"
																<c:if test="${pd.classtype==data.name}">selected</c:if>>${data.value}</option>
														</c:forEach>
													</select>
												</div>
											</td>

											<td>
												<div class="nav-search">
													<label>文本类型</label> <select class="form-control"
														name="doclevel">
														<c:forEach items="${doctype.fmsDataDictItems}" var="data">
															<option value="${data.name}"
																<c:if test="${pd.doclevel==data.name}">selected</c:if>>${data.value}</option>
														</c:forEach>
													</select>
												</div>
											</td>
												<td>
												<div class="nav-search">
													<label>文件来源</label> <select class="form-control"
														name="sumnumber">
														<option value="">全部</option>
														<c:forEach items="${source.fmsDataDictItems}" var="data">
															<option value="${data.name}"
																<c:if test="${pd.sumnumber==data.name}">selected</c:if>>${data.value}</option>
														</c:forEach>
													</select>
												</div>
											</td>
											<td>
												<div class="nav-search">
													<label>密级</label> <select class="form-control"
														name="secretlevel">
														<option value="">全部</option>
														<c:forEach items="${dense.fmsDataDictItems}" var="data">
															<option value="${data.name}"
																<c:if test="${pd.secretlevel==data.name}">selected</c:if>>${data.value}</option>
														</c:forEach>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="nav-search">
													<label>上位类</label> <select class="form-control"
														name="superordinateclass">
														<option value="">全部</option>
														<c:forEach items="${shang.fmsDataDictItems}" var="data">
															<option value="${data.name}"
																<c:if test="${pd.superordinateclass==data.name}">selected</c:if>>${data.value}</option>
														</c:forEach>
													</select>
												</div>
											</td>
											<td>
												<div class="nav-search">
													<label>中位类</label> <select class="form-control"
														name="medianclass">
														<option value="">全部</option>
														<c:forEach items="${zhong.fmsDataDictItems}" var="data">
															<option value="${data.name}"
																<c:if test="${pd.medianclass==data.name}">selected</c:if>>${data.value}</option>
														</c:forEach>
													</select>
												</div>
											</td>
											<td>
												<div class="nav-search">
													<label>下位类</label> <select class="form-control"
														name="subordinateclass">
														<option value="">全部</option>
														<c:forEach items="${xia.fmsDataDictItems}" var="data">
															<option value="${data.name}"
																<c:if test="${pd.subordinateclass==data.name}">selected</c:if>>${data.value}</option>
														</c:forEach>
													</select>
												</div>
											</td>
										
									
										<tr>
									</table>
								</c:if>
								<!---高级索引 -e  -->
								<!-- 检索  -->
								<table id="simple-table"
									class="table table-striped table-bordered table-hover"
									style="margin-top: 5px;">
									<thead>
										<tr>
											<th></th>
											<th>序号</th>
											<th>文号</th>
											<th>题名</th>
											<th>提&nbsp;&nbsp;&nbsp;&nbsp;要</th>
											<th>创建时间</th>
											<th>编辑</th>
										</tr>
									</thead>

									<tbody>
										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty list}">
												<c:if test="${QX.cha == 1 }">
												
													<c:forEach items="${list}" var="data" varStatus="vs">
														<tr <c:if test="${ data.ISVALID==0}">  style="background-color: #c6c6c6"</c:if> <c:if test="${ data.ISVALID==1}">  style="background-color: #F8F8FF"</c:if><c:if test="${ data.ISVALID==2}">  style="background-color: #F5F5F5"</c:if> >
															<td class='center' style="width: 30px;">
																<label>												
															
															 <c:if test="${data.ISVALID == 1}"> 
																	<input  type='checkbox'  value="${data.ID }"   <c:if test="${fn:contains(pd.ids,data.ID)}"> checked="checked"</c:if>  class="ace" onchange="changeids('${data.ID }')"/>
															</c:if>
																	<span class="lbl"> </span>
																</label>															
															</td>
															<td class='center' style="width: 30px;"><a	href="doc/view.do?fmsid=${data.ID}">${vs.index+1}</a></td>
															<td class="center">
																<a	href="doc/view.do?fmsid=${data.ID}">${data.docid}</a>
															</td>
															<td class="center">${data.TITLE}</td>
															<td class="center">${data.PRECISE}</td>
															<td class="center">${data.CREATETIME}</td>
															<td class="center">
																<c:if test="${QX.edit == 1 && data.ISVALID!=0}">
																	<a class="btn btn-xs btn-success" title="编辑" onclick="edit('${data.ID }')">
																	 	<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
																	</a>
																</c:if> 
																<c:if test="${QX.del == 1 && data.ISVALID==1  }">
																	<a class="btn btn-xs btn-danger"
																		onclick="delDoc('${data.ID }','${data.TITLE}');">
																		<i class="ace-icon fa fa-trash-o bigger-120"
																		title="删除"></i>
																	</a>
																</c:if>
															</td>
														</tr>
													</c:forEach>
												</c:if>
											</c:when>
										</c:choose>
								</table>

								<div class="page-header position-relative">
									<table style="width: 100%;">
										<tr>
											<td style="vertical-align: top;">
												<c:if  test="${QX.cha == 1 }">
													<a class="btn btn-mini btn-success" onclick="detailedsearchs();">高级搜索</a>
													<a class="btn btn-mini btn-success" onclick="borrowing();">借阅</a>
												</c:if>
											</td>
											<td style="vertical-align: top;">
												<div class="pagination" style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div>
											</td>
										</tr>
									</table>
								</div>
							</form>
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
<script type="text/javascript">
$(top.hangge());
//检索
function searchs(){
	top.jzts();
	$("#userForm").submit();
}
//检索
function detailedsearchs(){
	top.jzts();
	  var tmpInput=$("<input type='text' name='detail'  value='1'  hidden/>");  
 	$("#userForm").append(tmpInput)
	$("#userForm").submit();
}
//删除
function delDoc(id,msg){
	bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
		if(result) {
			top.jzts();
			var url = "<%=basePath%>doc/deleteDoc.do?id="+id+"&tm="+new Date().getTime();
			$.get(url,function(data){
				nextPage(${page.currentPage});
			});
		};
	});
}
//新增
function add(){
	 //top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增";
	 diag.URL = '<%=basePath%>data/goAddDao.do';
	 diag.Width = 469;
	 diag.Height = 510;
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

function siMenu(id,fid,MENU_NAME,MENU_URL){

	top.mainFrame.tabAddHandler(id,MENU_NAME,MENU_URL);
	
}
//修改
function edit(id){
	
	siMenu('adddoc','adddoc','修改Doc','doc/goEditDoc.do?fmsid='+id);	 
}

$(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
	
	//下拉框
	if(!ace.vars['touch']) {
		$('.chosen-select').chosen({allow_single_deselect:true}); 
		$(window)
		.off('resize.chosen')
		.on('resize.chosen', function() {
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			});
		}).trigger('resize.chosen');
		$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
			if(event_name != 'sidebar_collapsed') return;
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			});
		});
		$('#chosen-multiple-style .btn').on('click', function(e){
			var target = $(this).find('input[type=radio]');
			var which = parseInt(target.val());
			if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
			 else $('#form-field-select-4').removeClass('tag-input-style');
		});
	}	
	//复选框全选控制
	var active_class = 'active';
	$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
		var th_checked = this.checked;//checkbox inside "TH" table header
		$(this).closest('table').find('tbody > tr').each(function(){
			var row = this;
			if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
			else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
		});
	});
   });
	function changeClassType(){
			$("#userForm").submit();	
	}

	function borrowing(){
		siMenu('adddoc','adddoc','修改Doc','borrow/goAdd.do?ids='+ids);
	
	
	}
	var ids="${pd.ids }";
	function changeids(e){

		if(ids.indexOf(e)>-1){
			ids=ids.replace(e+",","")		
		}else{
			ids=ids+e+","
		}
		$(".ids").val(ids);
		console.log(e+" ids------------------"+ids);			
	}
		
</script>
</body>

</html>
