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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>

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
							<form action="file/listpfs.do" method="post" name="FPSLISTForm"
								id="FPSLISTForm">
								<table style="margin-top:5px;">
									<tr>
										<td>
											<div class="nav-search">
												<span class="input-icon"> <input type="text"
													placeholder="这里输入关键词" class="nav-search-input"
													id="keywords" autocomplete="off" name="keywords"
													value="${pd.keywords }" /> <i
													class="ace-icon fa fa-search nav-search-icon"></i>
												</span>
											</div>
										</td>
										<c:if test="${QX.cha == 1 }">
											<td style="vertical-align:top;padding-left:2px"><a
												class="btn btn-light btn-xs" onclick="tosearch();"
												title="检索"><i id="nav-search-icon"
													class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
										</c:if>
										<%-- <td style="padding-left:2px;"><input
											class="span10 date-picker" name="lastLoginStart"
											id="lastLoginStart" value="${pd.lastLoginStart}" type="text"
											data-date-format="yyyy-mm-dd" readonly="readonly"
											style="width:88px;" placeholder="开始日期" title="最近登录开始" /></td>
										<td style="padding-left:2px;"><input
											class="span10 date-picker" name="lastLoginEnd"
											id="lastLoginEnd" value="${pd.lastLoginEnd}" type="text"
											data-date-format="yyyy-mm-dd" readonly="readonly"
											style="width:88px;" placeholder="结束日期" title="最近登录结束" /></td> --%>
											
				<!-- 						<td>
											<span>查询字段</span>
										</td>
										<td style="vertical-align:top;padding-left:2px;"><select
											class="chosen-select form-control" name="ROLE_ID"
											id="role_id" data-placeholder="请选择"
											style="vertical-align:top;width: 120px;">
												<option value=""></option>
												<option value="">全部</option>
												<option>接收ID</option>
												<option>文件名</option>
												<option>项目ID</option>
												<option>项目名</option>
												<option>记录人</option>
												<option>存储注册ID</option>
												<option>存储介质ID</option>
												<option>存储类型名</option>
										</select></td> -->
									</tr>

								</table>
								<!-- 检索  -->

								<table id="fps-table"
									class="table table-striped table-bordered table-hover"
									style="margin-top:5px;">
									<thead>
										<tr>
											<th class="center" style="width:35px;"><label
												class="pos-rel"><input type="checkbox" class="ace"
													id="zcheckbox" /><span class="lbl"></span></label></th>
											<th class="center" style="width:50px;">序号</th>
											<th class="center">接收ID</th>
											<th class="center">文件名</th>
											<th class="center">年份</th>
											<!-- <th class="center">项目ID</th> -->
											<th class="center">项目名</th>
											<th class="center">记录人</th>
											<th class="center">存储注册ID</th>
											<th class="center">存储介质ID</th>
											<th class="center">存储类型名</th>
											<!-- <th class="center">操作</th> -->
										</tr>
									</thead>

									<tbody>
										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty varList}">
												<c:forEach items="${varList}" var="var" varStatus="vs">
													<tr>
														<td class='center'><label class="pos-rel"><input
																type='checkbox' name='ids' value="${var.File_ID}"
																class="ace" /><span class="lbl"></span></label></td>
														<td class='center' style="width: 30px;">${vs.index+1}</td>
														<td class='center'>${var.RC_ID}</td>
														<td class='center'>${var.FILE_NAME}</td>
														<td class='center'>${var.YEAR}</td>
														<%-- <td class='center'>${var.PRJ_ID}</td> --%>
														<td class='center'><a onclick="viewProject('${var.PRJ_ID}')" style="cursor:pointer;">${var.PRJ_NAME}</td>
														<td class='center'>${var.NAME}</td>
														<td class='center'>${var.REGISTER_ID}</td>
														<td class='center'>${var.STORAGE_ID}</td>
														<td class='center'>${var.STORAGE_TYPENAME}</td>


														<!-- <td class="center" width="75px"><c:if
																test="${QX.edit != 1 && QX.del != 1 }">
																<span
																	class="label label-large label-grey arrowed-in-right arrowed-in"><i
																	class="ace-icon fa fa-lock" title="无权限"></i></span>
															</c:if>
															<div class="hidden-sm hidden-xs btn-group"> -->
																<%-- <c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="editFILE('${var.FILE_ID}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="deleteF('${var.FILE_ID }','${var.FILE_NAME }');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if> --%>
															</div>
															<div class="hidden-md hidden-lg">
																<div class="inline pos-rel">
																	<button
																		class="btn btn-minier btn-primary dropdown-toggle"
																		data-toggle="dropdown" data-position="auto">
																		<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
																	</button>
																	<ul
																		class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
																		<!-- 															<c:if test="${QX.edit == 1 }"> -->
																		<!-- 															<li> -->
																		<!-- 																<a style="cursor:pointer;" onclick="editUser('${user.USER_ID}');" class="tooltip-success" data-rel="tooltip" title="修改"> -->
																		<!-- 																	<span class="green"> -->
																		<!-- 																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i> -->
																		<!-- 																	</span> -->
																		<!-- 																</a> -->
																		<!-- 															</li> -->
																		<!-- 															</c:if> -->
																		<c:if test="${QX.edit == 1 }">
																			<li><a style="cursor:pointer;"
																				onclick="editFILE('${var.USER_ID}');"
																				class="tooltip-success" data-rel="tooltip"
																				title="修改"> <span class="green"> <i
																						class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																				</span>
																			</a></li>
																		</c:if>
																		<c:if test="${QX.del == 1 }">
																			<li><a style="cursor:pointer;"
																				onclick="deleteF('${user.USER_ID }','${user.USERNAME }');"
																				class="tooltip-error" data-rel="tooltip" title="删除">
																					<span class="red"> <i
																						class="ace-icon fa fa-trash-o bigger-120"></i>
																				</span>
																			</a></li>
																		</c:if>
																	</ul>
																</div>
															</div></td>
													</tr>

												</c:forEach>

											</c:when>
											<c:otherwise>
												<tr class="main_info">
													<td colspan="100" class="center">没有相关数据</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								<div class="page-header position-relative">
									<table style="width:100%;">
										<tr>
											<td style="vertical-align:top;">
												<div class="pagination"
													style="float: left;padding-top: 0px;margin-top: 0px;">
													${page.pageStr}</div>
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
	<%@ include file="../index/foot.jsp"%>
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
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#FPSLISTForm").submit();
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
			$('#fps-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
		
		//删除
		function deleteF(file_id,file_name){
			bootbox.confirm("确定要删除["+file_name+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>file/deleteF.do?FILE_ID="+file_id+"&tm="+new Date().getTime();
					$.get(url,function(data){
					
						top.jzts();
						document.location.reload();
					});
				};
			});
		}
		
//修改
function editFILE(file_id){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="资料";
	 diag.URL = '<%=basePath%>file/goEditFile.do?FILE_ID='+file_id;
	 diag.Width = 469;
	 diag.Height = 510;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			nextPage(${page.currentPage});
		}
		diag.close();
	 };
	 diag.show();
}
		
		
		
		function viewProject(prj_id){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="项目详细情况";
			diag.URL = '<%=basePath%>project/viewP.do?PRJ_ID=' + prj_id;
			diag.Width = 469;
			diag.Height = 380;
			diag.CancelEvent = function() { //关闭事件
				diag.close();
			};
			diag.show();
		}
		
	</script>
	
</body>
</html>