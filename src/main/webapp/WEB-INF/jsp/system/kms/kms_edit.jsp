<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
					
					<form action="kms/${msg }.do" name="kmsfileForm" id="kmsfileForm" method="post"
								enctype="multipart/form-data">
<%-- 						<input  name="kfileId" id="kfileId" value="${pd.kmsFile.kfileId}"/>
						<input  name="prjId" id="prjId" value="${pd.kmsFile.prjId}"/>
						<input  name="realstorageId" id="realstorageId" value="${pd.kmsFile.realstorageId}"/>
						<input  name="kfboxid" id="kfboxid" value="${pd.kmsFile.kfboxid}"/> --%>
						<div id="zhongxin">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:70px;text-align: left;padding-top: 13px;">档案ID:</td>
								<td><input type="text" readonly="readonly" name="kfileId" id="kfileId" value="${pd.kmsFile.kfileId}" 
								maxlength="255"  title="档案ID" style="width:98%;"/></td>
								<td style="width:70px;text-align: left;padding-top: 13px;">档案盒ID:</td>
								<td><input type="text" readonly="readonly" name="kfboxid" id="kfboxid" value="${pd.kmsFile.kfboxid}" 
								maxlength="30"  title="档案盒ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: left;padding-top: 13px;">项目ID:</td>
								<td><input type="text" name="prjId" id="prjId" value="${pd.kmsFile.prjId}" 
								maxlength="255" placeholder="这里输入项目ID  int" title="档案名称" style="width:98%;"/></td>
								<td style="width:70px;text-align: left;padding-top: 13px;">存储编号ID:</td>
								<td><input type="text" name="realstorageId" id="realstorageId" value="${pd.kmsFile.realstorageId}"
								maxlength="30" placeholder="这里输入存储ID   int" title="存储编号ID" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: left;padding-top: 13px;">名称:</td>
								<td><input type="text" name="kfileName" id="kfileName" value="${pd.kmsFile.kfileName}" 
								maxlength="255" placeholder="这里输入档案名称   255字" title="档案名称" style="width:98%;"/></td>
								<td style="width:70px;text-align: left;padding-top: 13px;">编号:</td>
								<td><input type="text" name="kfileNum" id="kfileNum" value="${pd.kmsFile.kfileNum}" 
								maxlength="30" placeholder="这里输入档案编号    30字int" title="档案编号" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: left;padding-top: 13px;">项目:</td>
								<td><input type="text" name="prjNameInput" id="prjNameInput" value="${pd.kmsFile.prjNameInput}" 
								maxlength="255" placeholder="这里输入项目名称   255字" title="项目名称" style="width:98%;"/></td>
								<td style="width:70px;text-align: left;padding-top: 13px;">测区:</td>
								<td><input type="text" name="cequname" id="cequname" value="${pd.kmsFile.cequname}" 
								maxlength="510" placeholder="这里输入测区名称   510字" title="测区名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: left;padding-top: 13px;">类型:</td>
								<td><input type="text" name="typeId" id="typeId" value="${pd.kmsFile.typeId}" 
								maxlength="10" placeholder="这里输入档案类型" title="档案类型" style="width:98%;"/></td>
								<td style="width:70px;text-align: left;padding-top: 13px;">时间:</td>
								<td><input type="text" name="createtime" id="createtime" class="span10 date-picker"
								value="<fmt:formatDate value="${pd.kmsFile.createtime}" type="both" pattern="yyyy-MM-dd"/>" type="text" data-date-format="yyyy-mm-dd"
								maxlength="20" type="text" placeholder="这里输入成档时间" title="成档时间" style="width:98%;"/>
								</td>
							</tr>
							<tr>
								<td style="width:70px;text-align: left;padding-top: 13px;">页数:</td>
								<td><input type="text" name="page" id="page" value="${pd.kmsFile.page}" 
								maxlength="10" placeholder="这里输入档案页数" title="档案页数" style="width:98%;"/></td>
								<td style="width:70px;text-align: left;padding-top: 13px;">密级:</td>
								<td><input type="text" name="miji" id="miji" value="${pd.kmsFile.miji}" 
								maxlength="10" placeholder="这里输入档案密级" title="密级" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: left;padding-top: 13px;">期限:</td>
								<td><input type="text" name="kfileLimit" id="kfileLimit" value="${pd.kmsFile.kfileLimit}" 
								maxlength="10" placeholder="这里输入档案的保存期限" title="保存期限" style="width:98%;"/></td>
								<td style="width:70px;text-align: left;padding-top: 13px;">位置:</td>
								<td><input type="text" name="storageplace" id="storageplace" value="${pd.kmsFile.storageplace}" 
								maxlength="30" placeholder="这里输入档案保存位置" title="保存位置" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: left;padding-top: 13px;">目录:</td>
								<td ><input type="text" name="mulu" id="mulu" value="${pd.kmsFile.mulu}" 
								placeholder="这里输入档案的详细目录" title="目录" style="width:98%;"/></td>
								<td style="width:70px;text-align: left;padding-top: 13px;">备注:</td>
								<td><input type="text" name="remark" id="remark" value="${pd.kmsFile.remark}" 
								placeholder="这里输入档案相关备注" title="备注" style="width:98%;"/></td>
							</tr>
							<tr>
				
								<td style="width:70px;text-align: left;padding-top: 13px;">是否在档:</td>
								<td><select name="ifexist" id="ifexist" value="${pd.kmsFile.ifexist}" 
								placeholder="这里选择是否存在" title="是否存在" style="width:98%;" >
								<option value='1'>是</option>
								<option value='0'>否</option>
								</select>
								
								</td>
								<td style="width:70px;text-align: left;padding-top: 13px;">备份:</td>
								<td><input type="text" name="copystatus" id="copystatus" value="${pd.kmsFile.copystatus}" 
								maxlength="64" placeholder="这里输入备份情况" title="备份情况" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: left;padding-top: 13px;">移交部门:</td>
								<td><input type="text" name="yjbumenInput" id="yjbumenInput" value="${pd.kmsFile.yjbumenInput}" 
								maxlength="30" placeholder="这里输入移交部门" title="移交部门" style="width:98%;"/></td>
								<td style="width:70px;text-align: left;padding-top: 13px;">接收部门:</td>
								<td><input type="text" name="bumenInput" id="bumenInput" value="${pd.kmsFile.bumenInput}" 
								maxlength="30" placeholder="选择" title="接收部门" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: left;padding-top: 13px;">移交人:</td>
								<td><input type="text" name="yijiaorenInput" id="yijiaorenInput" value="${pd.kmsFile.yijiaorenInput}" 
								maxlength="10" placeholder="这里输入移交人" title="移交人" style="width:98%;"/></td>
								<td style="width:70px;text-align: left;padding-top: 13px;">接收人:</td>
								<td><input type="text" name="jieshourenInput" id="jieshourenInput" value="${pd.kmsFile.jieshourenInput}" 
								maxlength="10" placeholder="选择" title="接收人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:70px;text-align: left;padding-top: 13px;">移交时间:</td>
								<td><input type="text" name="yijiaoTime" id="yijiaoTime" class="span10 date-picker"
								
								value="<fmt:formatDate value="${pd.kmsFile.yijiaoTime}" type="both" pattern="yyyy-MM-dd"/>" type="text" data-date-format="yyyy-mm-dd"
								maxlength="50" placeholder="选择" title="移交时间" style="width:98%;"/></td>
								<td style="width:70px;text-align: left;padding-top: 13px;">接收时间:</td>
								<td><input type="text" name="jieshouTime" id="jieshouTime" class="span10 date-picker"
								value="<fmt:formatDate value="${pd.kmsFile.jieshouTime}" type="both" pattern="yyyy-MM-dd"/>" type="text" data-date-format="yyyy-mm-dd"
								maxlength="50" placeholder="选择" title="接收时间" style="width:98%;"/></td>
							</tr>
							
							<tr>
								<td class="center" colspan="10">
									<div class="row file"></div>
									<a class="btn btn-mini btn-primary" onclick="addFile();">添加电子科技档案</a>
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						<table>
							<thead>
								<tr>
									<th >电子科技档案</th>
								</tr>
							</thead>
							
							<c:forEach items='${pd.kmsFile.kmsAddFiles}' var='data' >
							<tr class='tr${data.id}'>
									<td>${data.name}</td>
									<td>${data.path}</td>
									<td>${data.createtime}</td>
									<td><a href='kms/download?id=${data.id}'>下载</a></td>
									<td><a onclick="deletefile('${data.id}')">删除</a></td>
								</tr> -
							</c:forEach>

						</table>
						
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
						
					</form>
	
					<div id="zhongxin2" class="center" style="display:none"><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
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


	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
	    $(function(){
	    	//下拉框
	  	    $('.chosen-select').chosen({ allow_single_deselect: true,width:"98%" }); 
	    	//日期框
			$('.date-picker').datepicker({
				autoclose: true,
				todayHighlight: true
			});
	    })
	    
		function addFile() {
			$(".file").append(
			'<div class="form-group col-xs-s"><label class="col-sm-4 control-label"></label>'
			+ '<div class="col-sm-8"><input type="file" name="files" class="form-control"	placeholder="请选择文件">'
			+'</div></div>');
		}

		function deletefile(e) {
			$(".tr" + e).css("background-color", "red");
			$("input[name='deletefile']").val(
			e + "," + $("input[name='deletefile']").val());

		}
		//保存
		function save(){
			$("#kmsfileForm").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
			
		}
		</script>
</body>
</html>