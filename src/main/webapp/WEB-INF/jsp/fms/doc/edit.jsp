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
							<form action="doc/${msg }.do" name="dataForm" id="dataForm"
								class="form-horizontal" method="post"
								enctype="multipart/form-data">
								<input type="text" class="hidden" value="${fmsDocMain.id}"
									name="id" id="fmsDocMainid"> <input type="text"
									class="hidden" name="deletefile">
								<div id="zhongxin"
									style="padding-top: 13px; padding-left: 20px; padding-right: 20px">

									<div class="row">
										<div class="form-group col-xs-12">
											<label class="col-sm-1 control-label" for="classtype">档案类型&nbsp;&nbsp;</label>
											<div class="col-sm-11">
												<select class="form-control" name="classtype" id="classtype"
													onchange="changeClassType()">
													<c:forEach items="${classtypeitem.fmsDataDictItems }"
														var="data">
														<option value="${data.name}"
															<c:if test="${pd.classtype==data.name}">selected</c:if>>${data.value}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<label class="col-sm-1 control-label">题&nbsp;&nbsp;&nbsp;&nbsp;名 &nbsp;&nbsp;&nbsp;&nbsp;</label>
											<div class="col-sm-11">
												<input type="text" name="title" class="form-control "
													id="title" placeholder="题名" value="${fmsDocMain.title}">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<label class="col-sm-1 control-label">提&nbsp;&nbsp;&nbsp;&nbsp;要&nbsp;&nbsp;&nbsp;&nbsp; </label>
											<div class="col-sm-11">
												<input type="text" name="precise" class="form-control"
													placeholder="提要" value="${fmsDocMain.precise}">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<label class="col-sm-1 control-label">主题词&nbsp;&nbsp;&nbsp;&nbsp; </label>
											<div class="col-sm-11">
												<input type="text" name="keyword" class="form-control"
													placeholder="主题词" value="${fmsDocMain.keyword}">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-12">
											<label class="col-sm-1 control-label">附&nbsp;&nbsp;&nbsp;&nbsp;注&nbsp;&nbsp;&nbsp;&nbsp; </label>
											<div class="col-sm-11">
												<input type="text" name="ps" class="form-control"
													placeholder="附注" value="${fmsDocMain.ps}">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-6">
											<label class="col-sm-2 control-label">责任部门</label>
											<div class="col-sm-9">
												<select class="form-control" name="owner">
													<c:forEach items="${pd.zrdepartment }" var="data">
														<option value="${data.DEPARTMENT_ID}"
															<c:if test="${fmsDocMain.ownerDepartment.DEPARTMENT_ID==data.DEPARTMENT_ID}">selected</c:if>>${data.NAME}</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="form-group col-xs-6">
											<label class="col-sm-3 control-label">承办部门</label>
											<div class="col-sm-9">
												<select class="form-control" name="subowner">
													<c:forEach items="${pd.cbdepartment }" var="data">
														<option value="${data.DEPARTMENT_ID}"
															<c:if test="${fmsDocMain.subownerDepartment.DEPARTMENT_ID==data.DEPARTMENT_ID}">selected</c:if>>${data.NAME}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group col-xs-4">
											<label class="col-sm-4 control-label"> <a
												class="btn btn-xs btn-success" title="编辑"
												onclick="editdateItem('${shang.id }')"> <i
													class="ace-icon fa fa-pencil-square-o bigger-120"
													title="编辑">上&nbsp;&nbsp;位&nbsp;&nbsp;类</i>
											</a>
											</label>
											<div class="col-sm-8">
												<select class="form-control" name="superordinateclass"
													onchange="changeddocnum()">
													<c:forEach items="${shang.fmsDataDictItems}" var="data">
														<option value="${data.name}"
															<c:if test="${fmsDocMain.superordinateclassFmsDataDictItem.name==data.name}">selected</c:if>>${data.value}</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="form-group col-xs-4">
											<label class="col-sm-4 control-label"> <a
												class="btn btn-xs btn-success" title="编辑"
												onclick="editdateItem('${zhong.id }')"> <i
													class="ace-icon fa fa-pencil-square-o bigger-120"
													title="编辑">中位类&nbsp;&nbsp;&nbsp;&nbsp;</i>
											</a>
											</label>
											<div class="col-sm-8">
												<select class="form-control" name="medianclass"
													onchange="changeddocnum()">
													<c:forEach items="${zhong.fmsDataDictItems}" var="data">
														<option value="${data.name}"
															<c:if test="${fmsDocMain.medianclassFmsDataDictItem.name==data.name}">selected</c:if>>${data.value}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="form-group col-xs-4">
											<label class="col-sm-4 control-label"> <a
												class="btn btn-xs btn-success" title="编辑"
												onclick="editdateItem('${xia.id }')"> <i
													class="ace-icon fa fa-pencil-square-o bigger-120"
													title="编辑">下位类&nbsp;&nbsp;&nbsp;&nbsp;</i>
											</a>
											</label>
											<div class="col-sm-8">
												<select class="form-control" name="subordinateclass"
													onchange="changeddocnum()">
													<c:forEach items="${xia.fmsDataDictItems}" var="data">
														<option value="${data.name}"
															<c:if test="${fmsDocMain.subordinateclassFmsDataDictItem.name==data.name}">selected</c:if>>${data.value}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
								
									<div class="row">
									<div class="form-group col-xs-4">

										<label class="col-sm-4 control-label"><a
											class="btn btn-xs btn-success" title="编辑"
											onclick="editdateItem('${doctype.id }')"> <i
												class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑">文本类型</i>
										</a></label>
										<div class="col-sm-8">
											<select class="form-control" name="doclevel">
												<c:forEach items="${doctype.fmsDataDictItems}" var="data">
													<option value="${data.name}"
														<c:if test="${fmsDocMain.doclevelFmsDataDictItem.name==data.name}">selected</c:if>>${data.value}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group col-xs-4">
										<label class="col-sm-4 control-label"><a
											class="btn btn-xs btn-success" title="编辑"
											onclick="editdateItem('${source.id }')"> <i
												class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑">文件来源</i>
										</a> </label>
										<div class="col-sm-8">
											<select class="form-control" name="sumnumber">
												<c:forEach items="${source.fmsDataDictItems}" var="data">
													<option value="${data.name}"
														<c:if test="${fmsDocMain.sumnumberFmsDataDictItem.name==data.name}">selected</c:if>>${data.value}</option>
												</c:forEach>
											</select>
										</div>

									</div>
									<div class="form-group col-xs-4">
										<label class="col-sm-4 control-label"><a
											class="btn btn-xs btn-success" title="编辑"
											onclick="editdateItem('${dense.id }')"> <i
												class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑">密&nbsp;&nbsp;&nbsp;&nbsp;级&nbsp;&nbsp;&nbsp;&nbsp;</i>
										</a></label>
										<div class="col-sm-8">
											<select class="form-control" name="secretlevel">
												<c:forEach items="${dense.fmsDataDictItems}" var="data">
													<option value="${data.name}"
														<c:if test="${fmsDocMain.secretlevelFmsDataDictItem.name==data.name}">selected</c:if>>${data.value}</option>
												</c:forEach>
											</select>
										</div>

									</div>
									</div>
									<div class="row">
									<div class="form-group col-xs-4">
										<label class="col-sm-4 control-label"><a
											class="btn btn-xs btn-success" title="编辑"
											onclick="editdateItem('${spec.id }')"> <i
												class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑">规&nbsp;&nbsp;&nbsp;&nbsp;格&nbsp;&nbsp;&nbsp;&nbsp;</i>
										</a></label>
										<div class="col-sm-8">
											<select class="form-control" name="spec">
												<c:forEach items="${spec.fmsDataDictItems}" var="data">
													<option value="${data.name}"
														<c:if test="${fmsDocMain.specFmsDataDictItem.name==data.name}">selected</c:if>>${data.value}</option>
												</c:forEach>
											</select>
										</div>

									</div>
									<div class="form-group col-xs-4">
										<label class="col-sm-4 control-label"><a
											class="btn btn-xs btn-success" title="编辑"
											onclick="editdateItem('${carrier.id }')"> <i
												class="ace-icon fa fa-pencil-square-o bigger-120" title="编辑">载&nbsp;&nbsp;&nbsp;&nbsp;体&nbsp;&nbsp;&nbsp;&nbsp;</i>
										</a></label>
										<div class="col-sm-8">
											<select class="form-control" name="carrier">
												<c:forEach items="${carrier.fmsDataDictItems}" var="data">
													<option value="${data.name}"
														<c:if test="${fmsDocMain.carrierDataDictItem.name==data.name}">selected</c:if>>${data.value}</option>
												</c:forEach>
											</select>
										</div>

									</div>
									<div class="form-group col-xs-4">
										<label class="col-sm-4 control-label">文件份数 </label>
										<div class="col-sm-8">
											<input type="number" name="pages" class="form-control"
												placeholder="文件份数" value="${fmsDocMain.pages}">
										</div>
									</div>
									</div>
									<div class="row">

										<div class="form-group col-xs-4">
										<label class="col-sm-4 control-label">盒&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;&nbsp; </label>
										<div class="col-sm-8">

											<select class="form-control" name="fmsId">
												<c:forEach items="${listDocBox}" var="data">
													<option value="${data.id}"
														<c:if test="${pd.fmsDocBox.id==data.id}">selected</c:if>>${data.name}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="form-group col-xs-4">
										<label class="col-sm-4 control-label">盒内序号 </label>
										<div class="col-sm-8">
											<input type="text" name="sequencenum" class="form-control"
												placeholder="盒内编号" value="${fmsDocMain.sequencenum}">
										</div>
									</div>


									<div class="form-group col-xs-4">
										<label class="col-sm-4 control-label">页&nbsp;&nbsp;&nbsp;&nbsp;数 &nbsp;&nbsp;&nbsp;&nbsp;</label>
										<div class="col-sm-8">
											<input type="number" name="pagination" class="form-control"
												placeholder="页数 " value="${fmsDocMain.pagination}">
										</div>
									</div>
							
									</div>
									<div class="row">
									<div class="form-group col-xs-4">
										<label class="col-sm-4 control-label">附件份数 </label>
										<div class="col-sm-8">
											<input type="number" name="subcopies" class="form-control"
												placeholder="附件份数" value="${fmsDocMain.subcopies}">
										</div>
									</div>


									<div class="form-group col-xs-4">
										<label class="col-sm-4 control-label">档案编号 </label>
										<div class="col-sm-8">
											<input type="text" name="docnum" class="form-control"
												onchange="changeddocnum()" placeholder="档案编号"
												value="${fmsDocMain.docnum}">
										</div>
									</div>
									<div class="form-group col-xs-4">
										<label class="col-sm-4 control-label">文&nbsp;&nbsp;&nbsp;&nbsp;号&nbsp;&nbsp;&nbsp;&nbsp;</label>
										<div class="col-sm-8">
											<input type="text" name="docid" class="form-control"
												placeholder="文号" value="${fmsDocMain.docid}">
										</div>
									</div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<a onclick="addFile()">添加文件</a>
										</div>
									</div>
									<div class="row file"></div>

									<div class="form-group col-xs-12">
										<button type="submit" class="btn btn-default">提交</button>
									</div>

									<table class="table table-striped table-bordered table-hover">

										<thead>
											<tr>
												<th colspan="6">文件</th>
											</tr>
										</thead>
										<c:forEach var="data" items="${fmsDocMain.fmsAddFiles}">
											<tr class="tr${data.id}">
												<td colspan="4">${data.name}</td>
												<td>${data.path}</td>
												<td>${data.createtime}</td>
												<td><a href="doc/download?id=${data.id}">下载</a></td>
												<td><a onclick="deletefile('${data.id}')">删除</a></td>
											</tr>
										</c:forEach>

									</table>
								</div>

								<div id="zhongxin2" class="center" style="display: none">
									<br /> <br /> <br /> <br /> <img
										src="static/images/jiazai.gif" /><br />
									<h4 class="lighter block green"></h4>
								</div>
							</form>

							<input type="text" name="counts" class="form-control hidden"
								value="${counts }">
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

</body>
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function() {
		if ($("#user_id").val() != "") {
			$("#loginname").attr("readonly", "readonly");
			$("#loginname").css("color", "gray");
		}

		$(".removeitem").click(function() {
			$(this).parent().remove();
		});
		changeddocnum();
	});
	
	//修改
	function editdateItem(id){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="资料";
		 diag.URL = '<%=basePath%>' + 'data/goEdit.do?id=' + id;
		diag.Width = 469;
		diag.Height = 510;
		diag.CancelEvent = function() { //关闭事件
			if (diag.innerFrame.contentWindow.document
					.getElementById('zhongxin').style.display == 'none') {

			}
			diag.close();
		};
		diag.show();
	}
	//保存
	function initform() {
		debugger;
		var str = "";
		$(".itemtr").each(
				function(index, elemen) {
					if ($(this).find(".itemname").val() != null
							&& $(this).find(".itemname").val() != "") {
						str = str + $(this).find(".itemname").val() + ",col,"
								+ $(this).find(".itemvalue").val() + ",col,"
								+ $(this).find(".itemsort").val() + ",col,"
								+ $(this).find(".itemtest").val() + ",row,";
					}
				});
		$("#dataitems").val(str);

	}

	function a(e) {
		$(e).parent("tr").remove();

	}

	function changeddocnum() {
		if ("${msg }" == "save") {			
		var str = "0354-" + $("select[name='medianclass']").val() + "."
				+ $("select[name='subordinateclass']").val() + "-"
				+ $("select[name='superordinateclass']").val() + "-"
				+ $("input[name='counts']").val();
		console.log(str);
		$("input[name='docnum']").val(str);
		}

	}
	function deletefile(e) {
		$(".tr" + e).css("background-color", "red");
		$("input[name='deletefile']").val(
				e + "," + $("input[name='deletefile']").val());

	}

	function changeClassType() {

		if ("${msg }" == "save") {
			window.location.href = "doc/goAddDoc.do" + "?classtype="
					+ $('#classtype').val();

		} else {
			window.location.href = "doc/goEditDoc.do" + "?classtype="
					+ $('#classtype').val() + "&fmsid="
					+ $('#fmsDocMainid').val();
		}

	}

	function save() {
		debugger

		initform();
		$("#dataForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}

	function addFile() {
		$(".file").append(
						'<div class="form-group col-xs-8"><label class="col-sm-4 control-label"></label>'
								+ '<div class="col-sm-8"><input type="file" name="files" class="form-control"	placeholder="请选择文件">'
								+'</div></div>');
	}
</script>
</html>