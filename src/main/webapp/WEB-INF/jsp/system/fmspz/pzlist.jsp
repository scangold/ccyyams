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
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<script src="static/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="static/ace/css/sweetalert2.min.css">
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
							<form action="pz/pzlist.do" method="post" name="FILELISTForm"
								id="FILELISTForm">
									<div id="tr1" style="width: 100%;display:none;padding-bottom:5px;padding-top:5px">
                                    <div style="vertical-align:top;padding-left:2px;width: 150px;display:inline">
								 	<select class="chosen-select form-control" name="acdoc_year" id="acdoc_year" data-placeholder="请选择年份" style="vertical-align:top;width: 180px;">
									<option value=""></option>
									
									<c:forEach items="${dataList.pzyear}" var="pz">
										<option value="${pz.acdoc_year }" <c:if test="${pd.acdoc_year==pz.acdoc_year}">selected</c:if>>${pz.acdoc_year}</option>
									</c:forEach>
									</select>
									</div>
									<div style="vertical-align:top;padding-left:2px;width: 150px;display:inline">
								 	<select class="chosen-select form-control" name="acdoc_month" id="acdoc_month" data-placeholder="请选择月份" style="vertical-align:top;width: 180px;">
									<option value=""></option>
									
									<c:forEach items="${dataList.pzmonth}" var="pz">
										<option value="${pz.acdoc_month }" <c:if test="${pd.acdoc_month==pz.acdoc_month}">selected</c:if>>${pz.acdoc_month}</option>
									</c:forEach>
									</select>
									</div>
									</div>
								<table style="margin-top:5px;">
									<tr>
										<td>
											<div class="nav-search">
												<span class="input-icon"> <input type="text"
													placeholder="这里输入关键词" class="nav-search-input"
													id="filekeywords" autocomplete="off" name="keywords"
													value="${pd.keywords }" /> <i
													class="ace-icon fa fa-search nav-search-icon"></i>
												</span>
											</div>
										</td>
										<c:if test="${QX.cha == 1 }">
											<td style="vertical-align:top;"><a
												class="btn btn-light btn-xs" style="margin-top: -1px" onclick="tosearch();"
												title="检索"><i id="nav-search-icon"
													class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
										</c:if>
										<td style="vertical-align:top;"><div style="color:#438eb9;cursor:pointer;font-size: 15px;margin-top: 3px;margin-left: 5px;" id="btn">高级查询</div></td>
										<td style="vertical-align:top;"><div style="color:#438eb9;cursor:pointer;font-size: 15px;margin-top: 3px;margin-left: 10px;" onclick="todellist()">销毁查询</div></td>
									</tr>
								</table>
								<!-- 检索  -->

								<table id="simple-table"
									class="table table-striped table-bordered table-hover"
									style="margin-top:5px;">
									<thead>
										<tr>
											<!-- <th class="center" style="width:50px;">文件序号</th> -->
											<th class="center">年份</th>
											<th class="center">月份</th>
											<th class="center">盒号</th>
											<th class="center">册号</th>
											<th class="center">凭证号</th>
											<th class="center">档案室</th>
											<th class="center">箱架号</th>
											<th class="center">保管年限</th>
											<th class="center">是否有效</th>
											<th class="center">备注</th>
                                            <th class="center">操作</th>
										</tr>
									</thead>

									<tbody>
										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty dataList.pzlistpage}">
											<c:if test="${QX.cha == 1 }">
												<c:forEach items="${dataList.pzlistpage}" var="var" varStatus="vs">
												
													<tr>
														<%-- <td class='center' style="width: 30px;">${vs.index+1}</td> --%>
														<td class='center'>${var.acdoc_year}</td>
														<td class='center'>${var.acdoc_month}</td>
														<td class='center'>${var.acdoc_box}</td>
														<td class='center'>${var.acdoc_volume}</td>
														<td class='center'>${var.acdoc_num}</td>
														<td class='center'>${var.acdoc_room}</td>
														<td class='center'>${var.acdoc_case}</td>
														<td class='center'>${var.acdoc_valid}</td>
														<c:if test="${var.destroied == 0 }">
														<td class='center'>有效</td>
														</c:if>
														<c:if test="${var.destroied == 1 }">
														<td class='center'>无效</td>
														</c:if>
														<td class='center'>${var.acdoc_remark}</td>
														
												<td class="center" width="75px">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="editFILE('${var.acdoc_id}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="deletePZ('${var.acdoc_id }','${var.acdoc_num }');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if>
												</div>
											</td>
													</tr>
                                                 
												</c:forEach>
                                                  </c:if>
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
												<td style="vertical-align: top;">
													<a class="btn btn-mini btn-success" onclick="add();">新增</a>
													<a title="借阅" class="btn btn-mini btn-primary" onclick="toborrow()">借阅</a>
													<a title="批量删除" class="btn btn-mini btn-danger" onclick="makeAll();">删除</a>
												</td>
												<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>

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
		function todellist(){
			top.mainFrame.tabAddHandler('dellist','销毁记录','pz/pzdellist.do');
		}
		function toborrow(){
			top.mainFrame.tabAddHandler('borrowlist','借阅','pz/pzborrow.do');
		}
		function tosearch(){
			top.jzts();
			$("#FILELISTForm").submit();
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
		
		//增加凭证
		function add(){
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增凭证";
		 diag.URL = '<%=basePath%>pz/goAdd.do';
		 diag.Width = 460;
		 diag.Height = 510;
		 diag.CancelEvent = function(){ //关闭事件
					 nextPage(${page.currentPage});
			diag.close();
		 };
		 diag.show();
		}
		
		//修改
		function editFILE(acdoc_id){
			$(top.hangge());
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改";
			 diag.URL = '<%=basePath%>pz/goEdit.do?acdocId='+acdoc_id;
			 diag.Width = 469;
			 diag.Height = 510;
			 diag.CancelEvent = function(){ //关闭事件
				 nextPage(${page.currentPage});
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function deletePZ(acdoc_id){
			bootbox.confirm("确定要注销凭证吗?",function(result){
				if(result) {
					$(top.hangge());
					 top.jzts();
					 var diag = new top.Dialog();
					 diag.Drag=true;
					 diag.Title ="注销凭证";
					 diag.URL = '<%=basePath%>pz/goDelete.do?acdocId='+acdoc_id;
					 diag.Width = 450;
					 diag.Height = 350;
					 diag.CancelEvent = function(){ //关闭事件
						 nextPage(${page.currentPage});
						diag.close();
					 };
					 diag.show();
				};
			});
		}
		
		//批量删除凭证
		function makeAll(){
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="批量注销凭证";
		 diag.URL = '<%=basePath%>pz/goDeleteall.do';
		 diag.Width = 460;
		 diag.Height = 510;
		 diag.CancelEvent = function(){ //关闭事件
					 nextPage(${page.currentPage});
			diag.close();
		 };
		 diag.show();
		}
		
		$("#btn").click(function(){
	    	if($(this).html().indexOf("模糊")>=0){
	    		$(this).empty().html("高级查询");
	    		$("#tr1").hide();
	    		}
	    	else{
	    		$(this).empty().html("模糊查询");
	    		$("#tr1").show();
	    		}
		})
		$("#btn1").click(function(){
	    	if($(this).html().indexOf("现存")>=0){
	    		$(this).empty().html("销毁查询");
	    		$("#simple-table1").hide();
	    		$("#simple-table").show();
	    		}
	    	else{
	    		$(this).empty().html("现存查询");
	    		$("#simple-table1").show();
	    		$("#simple-table").hide();
	    		}
		})
	</script>
	
</body>
</html>