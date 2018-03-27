<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

							<form action="user/${msg }.do" name="userForm" id="userForm"
								method="post">
								<div id="zhongxin" style="padding-top: 13px;">
									<div class="container">
										<div class="row">
											<div class="col-sm-10">
												<span>借阅人：</span><h4 ><strong>${fmsBorrow.name }</strong></h4>
											</div>
												<div class="col-sm-2">
												<a href="borrow/list.do"  class="btn btn-default btn-sm"> 返回列表</a>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-10">
											</div>										
											<div class="col-sm-2">													
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<span>描述：</span><p><span>${fmsBorrow.describle }</span></p>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-10">
											</div>										
											<div class="col-sm-2">
													
											</div>
										</div>

										<div class="row">
											<div class="col-sm-6">
												<label>开始时间</label><span> <fmt:formatDate value="${fmsBorrow.starttime }" pattern="yyyy-MM-dd"/></span>
											</div>
											<div class="col-sm-6">
												<label>结束时间</label> <span> <fmt:formatDate value="${fmsBorrow.starttime }" pattern="yyyy-MM-dd"/></span>
											</div>
										</div>
										<div class="row">
			
											<div class="col-sm-6">
												<label>归还时间</label> <span><fmt:formatDate value="${fmsBorrow.nowendtime }" pattern="yyyy-MM-dd"/></span>
											</div>
												<div class="col-sm-6">
												<c:if test="${fmsBorrow.isvalid == 1 }" >
														<a class="btn btn-xs glyphicon glyphicon-ok" title="归还"
																	onclick="del('${fmsBorrow.id }')"> 
																	<i class=""
																	title="归还">归还</i></a>											
												</c:if>
												</div>
										</div>

									
									<table id="simple-table"
									class="table table-striped table-bordered table-hover"
									style="margin-top: 5px;">
									<thead>
										<tr>
											<th>序号</th>
											<th>文号</th>
											<th>题名</th>
											<th>提要</th>
											<th>主题词</th>
										</tr>
									</thead>
									<tbody>
										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty fmsBorrow.fmsDocMains}">
												<c:forEach items="${fmsBorrow.fmsDocMains}" var="data"
													varStatus="vs">
													<tr>
														<td class='center' style="width: 30px;">${vs.index+1}</td>
														<td class="center"><a
															href="doc/view.do?fmsid=${data.id}">${data.docid}</a></td>
														<td class="center">${data.title}</td>
														<td class="center">${data.precise}</td>
														<td class="center">${data.keyword}</td>
																				</tr>
												</c:forEach>
											</c:when>
										</c:choose>
								</table>
								</div>
								</div>

								
							</form>
						</div>
					
					
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>

	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
     <!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<script type="text/javascript">
	$(top.hangge());
	//修改
	function del(id){	
			bootbox.confirm("确定已经归还了吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>borrow/returndoc.do?id="+id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						location.reload();
					});
				};
			});
		}
	</script>
</body>

</html>