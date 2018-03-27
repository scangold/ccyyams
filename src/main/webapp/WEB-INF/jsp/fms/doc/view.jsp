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
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr><c:if test="${fmsDocMain.isvalid !=0}"> 
										<td> <a id="remove">删除</a> </td>
										<td><a href="doc/goEditDoc.do?fmsid=${fmsDocMain.id }">修改</a></td>
										<td><a href="test/exportDocDeal?id=${fmsDocMain.id}">导出</a></td>
										</c:if>
										<td></td>
										<td> <c:if test="${fmsDocMain.isvalid ==0}"> 已经删除</c:if> 
										 <c:if test="${fmsDocMain.isvalid ==1}"> 正常</c:if>
										 <c:if test="${fmsDocMain.isvalid ==2}"> 已借出</c:if></td>
										
										
										<td><a href="doc/list.do" class="btn btn-default btn-sm">返回</a></td>
										</tr>

										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">文号:</td>
											<td><input type="text" value="${fmsDocMain.docid }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>

											<td
												style="width: 79px; text-align: right; padding-top: 13px;">盒名:</td>
											<td><input type="text"
												value="${fmsDocMain.fmsDocBox.name }" maxlength="64"
												style="width: 98%;" disabled="disabled" /></td>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">盒内序号:</td>
											<td><input type="text"
												value="${fmsDocMain.sequencenum }" maxlength="64"
												style="width: 98%;" disabled="disabled" /></td>
										</tr>
										<tr>
											<td colspan="2"></td>

											<td
												style="width: 79px; text-align: right; padding-top: 13px;">记录者:</td>
											<td><input type="text" value="${fmsDocMain.user.NAME }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>

											<td
												style="width: 79px; text-align: right; padding-top: 13px;">记录时间:</td>
											<td><input type="text"
												value="<fmt:formatDate value='${fmsDocMain.createtime }'  pattern='yyyy-MM-dd'/>"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">标题:</td>
											<td colspan="5"><input type="text" id="loginname"
												value="${fmsDocMain.title }" maxlength="32" title="用户名"
												style="width: 98%;" disabled="disabled" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">提要</td>
											<td colspan="5"><input type="text"
												"  value="${fmsDocMain.precise }" maxlength="32" title="编号"
												style="width: 98%;" disabled="disabled" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">主题词
												:</td>
											<td colspan="5"><input type="text" id="name"
												value="${fmsDocMain.keyword }" maxlength="32"
												placeholder="这里输入姓名" title="姓名" style="width: 98%;"
												disabled="disabled" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">附注:</td>
											<td colspan="5"><input type="text"
												value="${fmsDocMain.ps }" maxlength="32" title="手机号"
												style="width: 98%;" disabled="disabled" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">文件来源:</td>
											<td><input type="text"
												value="${fmsDocMain.sumnumberFmsDataDictItem.value }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">责任部门:</td>
											<td><input type="email"
												value="${fmsDocMain.ownerDepartment.NAME }" maxlength="32"
												title="邮箱" style="width: 98%;" disabled="disabled" /></td>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">承办部门:</td>
											<td><input type="email"
												value="${fmsDocMain.subownerDepartment.NAME }"
												maxlength="32" title="邮箱" style="width: 98%;"
												disabled="disabled" /></td>
										</tr>

										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">
												上位类 :</td>
											<td><input type="text"
												value="${fmsDocMain.superordinateclassFmsDataDictItem.value }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">中位类
												:</td>
											<td><input type="text"
												value="${fmsDocMain.medianclassFmsDataDictItem.value }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>

											<td
												style="width: 79px; text-align: right; padding-top: 13px;">下位类
												:</td>
											<td><input type="text"
												value="${fmsDocMain.specFmsDataDictItem.value }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">文本类型
												:</td>
											<td><input type="text"
												value="${fmsDocMain.doclevelFmsDataDictItem.value }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>


										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">密级:</td>
											<td><input type="text"
												value="${fmsDocMain.secretlevelFmsDataDictItem.value }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>

											<td
												style="width: 79px; text-align: right; padding-top: 13px;">规格:</td>
											<td><input type="text"
												value="${fmsDocMain.specFmsDataDictItem.value }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>

											<td
												style="width: 79px; text-align: right; padding-top: 13px;">载体:</td>
											<td><input type="text"
												value="${fmsDocMain.carrierDataDictItem.value }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">文件份数:</td>
											<td><input type="text" value="${fmsDocMain.pages }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>



											<td
												style="width: 79px; text-align: right; padding-top: 13px;">页数:</td>
											<td><input type="text" value="${fmsDocMain.pagination }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>

											<td
												style="width: 79px; text-align: right; padding-top: 13px;">附件份数
												:</td>
											<td><input type="text" value="${fmsDocMain.subcopies }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">档案编号:</td>
											<td><input type="text" value="${fmsDocMain.docnum }"
												maxlength="64" style="width: 98%;" disabled="disabled" /></td>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">盒号:</td>
											<td><input type="text"
												value="${fmsDocMain.fmsDocBox.id }" maxlength="64"
												style="width: 98%;" disabled="disabled" /></td>
										</tr>


									</table>
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th colspan="6"> 文件</th>
											</tr>
										</thead>
										<c:forEach var="data" items="${fmsDocMain.fmsAddFiles}">
											<tr>
												<td colspan="4">${data.name}</td>
												<td>${data.path}</td>
												<td>${data.createtime}</td>
												<td><a href="doc/download?id=${data.id}">下载</a></td>
											</tr>
										</c:forEach>
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
	<script type="text/javascript">
	$(function(){
		$("#remove").click(function() {
			$.get("doc/deleteDoc?id=${fmsDocMain.id }",function(data,status){				
				window.location.href="doc/view?fmsid=${fmsDocMain.id }";	
			}
			);
				
		});
		
		
	})
	</script>
</body>

</html>