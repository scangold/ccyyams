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
#table_report td{width:35%;border:none !important;}
#table_report .tdNew{width:15%;}
.date-picker,.datepicker-days{cursor:pointer;}
</style>
 <!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<script type="text/javascript" src="static/js/jquery/jquery-3.0.0.min.js"></script>
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
</head>

<body>

<table style="width:100%;background: #fff;">
						<tr>
						<td>
						<form action="" name="newLendForm" id="newLendForm" method="post" >
						<input type="text" name="PFILE_ID" id="PFILE_ID"  value="${pd.PFILE_ID }" style="width:98%;display:none;"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="simple-table"
									class="table table-striped table-bordered table-hover"
									style="margin-top: 5px;">
									<thead>
										<tr>
											<th  class="center">序列</th>
											<th  class="center">借阅名称</th>
											<th  class="center">借阅描述</th>
											<th  class="center">借阅人</th>
											<th  class="center">借阅时间</th>
											<th  class="center">归还人</th>
											<th  class="center">归还时间</th>
										</tr>
									</thead>
									<tbody>
										<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty dataList}">
												<c:if test="${QX.cha == 1 }">
													<c:forEach items="${dataList}" var="data" varStatus="vs">
														<tr>
															<td class='center' style="width: 30px;">${vs.index+1}</td>
															<td class="center">${data.NAME}</td>
															<td class="center">${data.DESCRIBLE}</td>
															<td class="center">${data.BORROW_USER}</td>
															<td class="center">${data.STARTTIME}</td>
															<td class="center">${data.RETURN_USER}</td>
															<td class="center">${data.NOWENDTIME}</td>
														</tr>
													</c:forEach>
												</c:if>
											</c:when>
											<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
										</c:choose>
										
										<tr>
											<td style="text-align: center;" colspan="10" >
												<a  class="btn btn-mini btn-primary" onclick="top.Dialog.close();">确定</a> 
											</td>
										</tr>
								</table>
						</div>
					<div id="zhongxin2" class="center" style="display: none">
						<br /> <br /> <br /> <br /> <img
							src="static/images/jiazai.gif" /><br />
						<h4 class="lighter block green"></h4>
					</div>
				</form>
						</td>
						</tr>
					</table>
		<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>

	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>

    <script type="text/javascript">
    $(top.hangge());
  


	$(document).ready(function(){
 		//下拉框
 	   $('.chosen-select').chosen({ allow_single_deselect: true,width:"98%" }); 
		
 		//日期框
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		});
 	});
	</script>
</body>
</html>