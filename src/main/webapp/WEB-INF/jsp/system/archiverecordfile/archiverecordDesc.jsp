<%@page import="com.fh.util.PageData"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONArray"%>
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

<style type="text/css">
.row {
	padding-top: 10px;
}
</style>

<!-- jsp文件头和头部 -->
<%@ include file="../index/topcss.jsp"%>

<script src="static/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="static/ace/css/sweetalert2.min.css">
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container " id="main-container">

		<div class="container">
			<h2 class="text-center">分发记录详细信息</h2>
			<div class="row">
				<div class="col-md-6">
					<label class="control-label">分发序列id: </label> <span>
						${pd.archDistribute.DISTRIBUTE_ID}</span>
				</div>
				<div class="col-md-6">
					<label class="control-label">来源 : </label> <span><c:if
							test="${pd.archDistribute. APPLY_ID==null}">
		                 管理员分发
		        </c:if> <c:if test="${pd.archDistribute. APPLY_ID!=null}">
							<a
								href="/CCYYAMS/apply/showApplyDesc.do?apply_id=${pd.archDistribute.APPLY_ID}">员工申请
							</a>
						</c:if></span>
				</div>
				<div class="col-md-6">
					<label class="control-label">操作人员 :</label><span>${pd.archDistribute.name2}</span>
				</div>
				<div class="col-md-4">
					<label class="control-label">接收者 :</label><span>${pd.archDistribute.name}</span>
				</div>
				<div class="col-md-2"><a href="/CCYYAMS/excel/distributeExport?id=${pd.archDistribute.DISTRIBUTE_ID}">导出excel</a></div>
				<hr>
				<div class="col-md-12">
				<span>
				<label class="control-label">分发备注或申请原因: </label> <span>
					<c:if test="${pd.archDistribute.APPLY_ID==null}">
		 			   ${pd.archDistribute.DISTRIBUTE_REMARK}		 
		   			 </c:if>
					<c:if test="${pd.archDistribute.APPLY_ID!=null}">	
		    			${pd.apply.applyWhy}
		 		 </c:if>
		
		 	 </span>
				</div>

				<!-- 文件列表 -->
			</div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>fileId</th>
						<th>文件名</th>
						<th>消息</th>
						<th>目录</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${pd.listf}">
						<tr class="showfiletr${item.stute}">
							<td>${item.FILE_ID }</td>
							<td>${item.FILE_NAME }</td>
							<td>${item.mess }</td>
							<td>${item.FILE_URL }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>


	<!-- /.main-container -->

	<!-- basic scripts -->

	<!-- 页面底部js¨ -->
	<%@ include file="../index/footjs.jsp"%>


	<!-- 删除时确认窗口 -->
</body>
<script type="text/javascript">
	$(top.hangge());//关闭加载状态
</script>
<script src="static/js/ccyyamsjs/apply_Desc.js"></script>
<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
<script type="text/javascript"
	src="plugins/attention/zDialog/zDialog.js">	
</script>

</html>
