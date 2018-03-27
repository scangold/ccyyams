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
						<form action="project/selectall.do" method="post" name="prjForm" id="prjForm">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
										<span class="input-icon">
											<input type="text" placeholder="这里输入关键词" class="nav-search-input" id="nav-search-input" autocomplete="off" name="keywords" value="${pd.keywords }" placeholder="这里输入关键词"/>
											<i class="ace-icon fa fa-search nav-search-icon"></i>
										</span>
									</div>
								</td>
								<c:if test="${QX.cha == 1 }">
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
								<%-- <td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="最近登录开始"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="最近登录结束"/></td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="ROLE_ID" id="role_id" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
									<option value=""></option>
									<option value="">全部</option>
				                    <option>项目范围ID</option>
									<option>项目类型</option>
									<option>项目名称</option>
									<option>项目来源</option>
									<option>项目负责人</option>
									<option>项目密级</option>
									<option>项目实施单位</option>
									<option>项目开始时间</option>
									<option>项目结束时间</option>
									<option>项目进度</option>
									<option>项目备注</option>
									<option>用户ID</option>
									<option>年份</option>
									<option>保存期限</option>
									<option>项目密级</option>
									<option>项目索取号</option>
								  	</select>
								</td> --%>
							</tr>
						</table>
						<!-- 检索  -->

						<table id="project-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<!-- <th class="center" style="width:50px;">页面序号</th> -->
									<!-- <th class="center">项目范围ID</th> -->
									<th class="center">项目ID</th>
									<th class="center">项目名称</th>
									<th class="center">项目来源</th>
									<th class="center">项目类型</th>
									<th class="center">项目负责人</th>
									<th class="center">项目实施单位</th>
									<!-- <th class="center">项目开始时间</th>
									<th class="center">项目结束时间</th>
									<th class="center">项目进度</th> -->
									<th class="center">项目备注</th>
									<!-- <th class="center">用户ID</th> -->
									<th class="center">年份</th>
									<th class="center">保存期限</th>
									<th class="center">项目密级</th>
									<!-- <th class="center">项目索取号</th> -->
									<th class="center">操作</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty varList}">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center'>
												<label class="pos-rel"><input type='checkbox' id="ids-${var.PRJ_ID}" name='ids' value="${var.PRJ_ID}" class="ace"  onclick="selectitem(this);" />
												<span class="lbl"></span></label>
											</td>
											<%-- <td class='center' style="width: 30px;">${vs.index+1}</td> --%>
											<%-- <td class='center'>${var.COVERAGE_ID}</td> --%>
											<td class='center'>${var.PRJ_ID}</td>
											<td class='center'><a onclick="viewProject('${var.PRJ_ID}')" style="cursor:pointer;">${var.PRJ_NAME}</a></td>
											<td class='center'>${var.PRJ_ORIGIN}</td>
											<td class='center'>${var.PRJTYPE}</td>
											<td class='center'>${var.PRJ_LEADER}</td>
											<td class='center'>${var.PRJ_DEPART}</td>
											<!-- <td class='center'>${var.PRJ_STARTTIME}</td>
											<td class='center'>${var.PRJ_ENDTIME}</td>
											<td class='center'>${var.PRJ_PROGRESS}</td> -->
											<td class='center'>${var.PRJ_REMARK}</td>
											<%-- <td class='center'>${var.USER_ID}</td> --%>
											<td class='center'>${var.YEAR}</td>
											<td class='center'>${var.RECORD_LIMIT}</td>
											<td class='center'>${var.SECURITY_CLASS}</td>
											<%-- <td class='center'>${var.PRO_NUM}</td> --%>
											
											<td class="center" width="75px">
												<c:if test="${QX.edit != 1 && QX.del != 1 }">
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="ace-icon fa fa-lock" title="无权限"></i></span>
												</c:if>
												<div class="hidden-sm hidden-xs btn-group">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="编辑" onclick="editPRJ('${var.PRJ_ID}');">
														<i class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑"></i>
													</a>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<a class="btn btn-xs btn-danger" onclick="deleteP('${var.PRJ_ID }','${var.PRJ_NAME }');">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
													</c:if>
												</div>
												<div class="hidden-md hidden-lg">
													<div class="inline pos-rel">
														<button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
															<i class="ace-icon fa fa-cog icon-only bigger-110"></i>
														</button>
														<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
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
															<li>
																<a style="cursor:pointer;" onclick="editPRJ('${var.PRJ_ID}');" class="tooltip-success" data-rel="tooltip" title="修改">
																	<span class="green">
																		<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
															<c:if test="${QX.del == 1 }">
															<li>
																<a style="cursor:pointer;" onclick="deleteP('${user.USER_ID }','${user.USERNAME }');" class="tooltip-error" data-rel="tooltip" title="删除">
																	<span class="red">
																		<i class="ace-icon fa fa-trash-o bigger-120"></i>
																	</span>
																</a>
															</li>
															</c:if>
														</ul>
													</div>
												</div>
											</td>
										</tr>
										
									</c:forEach>
									
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						
						
						<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;">
									<c:if test="${QX.add == 1 }">
									<a class="btn btn-sm btn-success" onclick="addP();">新增</a>
									</c:if>
									<c:if test="${QX.del == 1 }">
									<a class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a>
									</c:if>
								</td>
								<td style="vertical-align:top;">
								<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">
								${page.pageStr}</div></td>
								
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
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
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
		$(top.hangge());//关闭加载状态

		

			
		//检索
		function tosearch(){
			top.jzts();
			$("#prjForm").submit();
		}
		$(function() {
			//日期框
			$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
			});
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
			$('#project-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
		
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
					 
						 nextPage( ${page.currentPage} );
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function deleteP(prjId,msg){
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>project/deleteP.do?PRJ_ID="+prjId+"&tm="+new Date().getTime();
					$.get(url,function(data){
					
						top.jzts();
						document.location.reload();
					});
				};
			});
		}
				
		//修改
function editPRJ(prj_id){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="资料";
	 diag.URL = '<%=basePath%>project/goEditproject.do?PRJ_ID='+prj_id;
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
		
		//批量操作-删除
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++){
					  if(document.getElementsByName('ids')[i].checked){
					  	if(str=='') str += document.getElementsByName('ids')[i].value;
					  	else str += ',' + document.getElementsByName('ids')[i].value;
					  }
					}
					if(str==''){
						bootbox.dialog({
							message: "<span class='bigger-110'>您没有选择任何内容!</span>",
							buttons: 			
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
						});
						$("#zcheckbox").tips({
							side:1,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>fhbutton/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
									 nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		};
		
		//导出excel
		function toExcel(){
			var lastLoginStart = $("#lastLoginStart").val();
			var lastLoginEnd = $("#lastLoginEnd").val();
			window.location.href='<%=basePath%>fhbutton/excel.do';
		}
		
		function viewProject(prj_id){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="资料";
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