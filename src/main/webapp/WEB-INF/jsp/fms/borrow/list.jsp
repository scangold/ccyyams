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
							<form action="borrow/list.do" method="post" name="borrowForm"
								id="borrowForm">
								<table style="margin-top: 5px;">
									<tr>
										<td>
											<div class="nav-search">
												<span class="input-icon"> <input
													class="nav-search-input" autocomplete="off"
													id="nav-search-input" type="text" name="keywords"
													value="${pd.keywords }" placeholder="这里输入关键词" /> <i
													class="ace-icon fa fa-search nav-search-icon"></i>
												</span>
											</div>
										</td>
								<%-- 
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="最近登录开始"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" name="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="最近登录结束"/></td>
 --%>
										<td style="vertical-align: top; padding-left: 2px;">
										<select
											class="chosen-select form-control" name="isvalid"
											id="isvalid" data-placeholder="请选择状态"
											style="vertical-align: top; width: 120px;">										     	
												<option value="">全部</option>
												<c:forEach items="${isreturn.fmsDataDictItems}" var="data">
													 <option value="${data.name }"<c:if test="${pd.isvalid==data.name}">selected</c:if> >${data.value }</option>										
												</c:forEach>
										</select></td>
										<c:if test="${QX.cha == 1 }">
											<td style="vertical-align: top; padding-left: 2px;"><a
												class="btn btn-light btn-xs" onclick="searchs();" title="检索"><i
													id="nav-search-icon"
													class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
											<%-- <c:if test="${QX.toExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td></c:if>
								<c:if test="${QX.FromExcel == 1 }"><td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="ace-icon fa fa-cloud-upload bigger-110 nav-search-icon blue"></i></a></td></c:if>
 --%>
										</c:if>
									</tr>
								</table>
								<!-- 检索  -->

								<table id="simple-table"
									class="table table-striped table-bordered table-hover"
									style="margin-top: 5px;">
									<thead>
										<tr>
											<th>序列</th>
											<th>借阅人</th>
											<th>描述</th>
											<th>开始时间</th>
											<th>结束时间</th>										
											<th>操作</th>
										</tr>
									</thead>		
									<tbody>
										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty dataList}">
												<c:if test="${QX.cha == 1 }">
													<c:forEach items="${dataList}" var="data" varStatus="vs">
														<tr>
															<td class='center' style="width: 30px;"><a	href="borrow/goView.do?id=${data.ID}">${vs.index+1}</a></td>
															<td class="center"><a	href="borrow/goView.do?id=${data.ID}">${data.NAME}</a></td>
															<td class="center">${data.DESCRIBLE}</td>
															<td class="center">${data.STARTTIME}</td>														
															<td class="center">${data.ENDTIME}</td>
															<td class="center">													
															<c:if test="${QX.del == 1 && data.ISVALID == 1 }">
																<a class="btn btn-xs glyphicon glyphicon-ok" title="归还"
																	onclick="del('${data.ID }')"> 
																	<i class=""
																	title="归还"></i>
																</a>
															</c:if>
															<c:if test="${QX.del == 1 && data.ISVALID == 0 }">																
																	<p
																>已经归还</p>																
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
											<c:if
													test="${QX.add == 1 }">
													<a class="btn btn-mini btn-success" onclick="add();">新增</a>
												</c:if></td>
											<td style="vertical-align: top;"><div class="pagination"
													style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
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
</body>

<script type="text/javascript">
$(top.hangge());

//检索
function searchs(){
	top.jzts();
	$("#borrowForm").submit();
}





//修改
function edit(id){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="资料";
	 diag.URL = '<%=basePath%>data/goEdit.do?id='+id;
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

//修改
function del(id){	

		bootbox.confirm("确定已经归还了吗?", function(result) {
			if(result) {
				top.jzts();
				var url = "<%=basePath%>borrow/returndoc.do?id="+id+"&tm="+new Date().getTime();
				$.get(url,function(data){
					nextPage(${page.currentPage});
				});
			};
		});
	}
$(function() {
	//日期框
	$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		
});


		
</script>
</html>
