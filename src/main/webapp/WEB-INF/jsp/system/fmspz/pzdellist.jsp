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
<style type="text/css">



.date-picker, .datepicker-days {
	cursor: pointer;
}

html {
	background: #fff;
}
</style>
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
</head>
<body style="background: #fff;">
	<form action="pz/pzdellist.do" method="post" name="dellistForm" id="dellistForm">
	<div style="border-bottom:2px solid #438eb9  !important;font-size: 18px;height: 60px;line-height: 60px;"><span style='margin-left:20px;font-size:26px;color:#438eb9 '>销毁记录:</span></div>
		<table class='table table-bordered ' id="table_report" style="width: 100%;background: #fff;" border="0">

			<thead>
				<tr>
					<th class="center" style="width:5%">序号</th>
					<th class="center" style='width:10%'>凭证年份</th>
					<th class="center" style="width:10%">凭证月份</th>
					<th class="center" style="width:10%">凭证盒号</th>
					<th class="center" style="width:12%">凭证册号</th>
					<th class="center" style="width:15%">凭证号</th>
					<th class="center" style="width:23%">销毁方式</th>
					<th class="center" style="width:15%">销毁审批人</th>
				</tr>
			</thead>
			<tbody>
			<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty dataList.deletelist}">
												
													<c:forEach items="${dataList.deletelist}" var="data" varStatus="vs">
														<tr>
															<td class='center' style="width: 30px;">${vs.index+1}</td>
<%-- 															<td class="center"><fmt:formatDate value="${data.STARTTIME}" pattern="yyyy-MM-dd"/>
															</td>
															<td class="center"><fmt:formatDate value="${data.ENDTIME}" pattern="yyyy-MM-dd"/></td> --%>
														<td class='center'>${data.acdoc_year}</td>
														<td class='center'>${data.acdoc_month}</td>
														<td class='center'>${data.acdoc_box}</td>
														<td class='center'>${data.acdoc_volume}</td>
														<td class='center'>${data.acdoc_num}</td>
														<td class="center">${data.destroy_how}</td>
														<td class="center">${data.destroy_check}</td>
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
		
						<div class="page-header position-relative" style="width: 100%;background: #fff;">
									<table style="width: 100%;background: #fff;">
									 	<tr>
											<td style="vertical-align: top;"><div class="pagination" style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div></td>
										</tr>
									</table>
								</div>
					
	</form>
	<%@ include file="../../system/index/foot.jsp"%>
		<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
			<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<script type="text/javascript">
    $(top.hangge());  
    $(function(){
    	//日期框
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		});
    })
    </script>


</body>
</html>