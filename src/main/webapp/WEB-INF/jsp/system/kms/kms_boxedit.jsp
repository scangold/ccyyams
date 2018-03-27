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
							<form action="kms/${msg}.do" name="dataForm" id="dataForm" method="post">
								<input type="text" name="id" class="hidden" id="id" maxlength="32"value="${pd.kfileBox.id}">
								<input type="text" name="pid" class="hidden" id="pid" maxlength="32"value="${pd.pid }">
								<input type="text" name="storageid" class="hidden" id="storageid" value="${pd.kfileBox.storageid}">
								<input type="text" name="sth" class="hidden" id="sth" maxlength="255"value="${pd.kfileBox.sth}">
								
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:100px; text-align: right; padding-top: 8px;">档案盒（夹）名称:</td>
											<td><input type="text" name="kboxname" id="kboxname" value="${pd.kfileBox.kboxname}"
												  maxlength="255" placeholder="这里输入档案盒（夹）的名称"
												title="档案盒名称" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td style="width:100px; text-align: right; padding-top: 8px;">备注:</td>
											<td><input type="text" name="remark" id="remark" value="${pd.kfileBox.remark}"
												  maxlength="255" placeholder="这里输入档案盒备注"
												title="档案盒备注" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td style="width:100px; text-align: right; padding-top: 8px;">责任人:</td>
											<td><input type="text" name="who" id="who" value="${pd.kfileBox.who}"
												  maxlength="16" placeholder="这里输入责任人"
												title="责任人" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td style="width:100px; text-align: right; padding-top: 8px;">原由:</td>
											<td><input type="text" name="how" id="how" value="${pd.kfileBox.how}"
												  maxlength="16" placeholder="这里输入档案盒记录原由或方式"
												title="原由或方式" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td style="width:100px; text-align: right; padding-top: 8px;">时间:</td>
											<td><input type="text" name="fwhen" id="fwhen" disabled="disabled"
												value="<fmt:formatDate value="${pd.kfileBox.fwhen}" pattern="yyyy-MM-dd HH:mm:ss"/>"
												maxlength="7" placeholder="记录时间" title="记录或修改时间" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td style="width:100px; text-align: right; padding-top: 8px;">来源:</td>
											<td><input type="text" name="fwhere" id="fwhere" value="${pd.kfileBox.fwhere}"
												maxlength="255" placeholder="这里输入档案来源单位部门"
												title="来源单位部门" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td style="width:100px; text-align: right; padding-top: 8px;">描述:</td>
											<td><input type="text" name="kboxabout" class="hidden" id="kboxabout" value="${pd.kfileBox.kboxabout}"
												maxlength="255" placeholder="这里输入其他相关内容" 
												title="其他" style="width: 98%;" /></td>
										</tr>																										
										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="save();">保存</a> <a
												class="btn btn-mini btn-danger"
												onclick="top.Dialog.close();">取消</a></td>
										</tr>
										
									</table>
								</div>
								<div id="zhongxin2" class="center" style="display: none">
									<br /> <br /> <br /> <br /> <img
										src="static/images/jiazai.gif" /><br />
									<h4 class="lighter block green"></h4>
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

</body>
<script type="text/javascript">
	$(top.hangge());
	$(document).ready(function() {
		if ($("#user_id").val() != "") {
			$("#loginname").attr("readonly", "readonly");
			$("#loginname").css("color", "gray");
		}
		
		
		 $(".removeitem").click(function(){  
			   $(this).parent().remove();			
			}); 
	});
	//保存
	function initform() {
		debugger;
		var str="";
		$(".itemtr").each(function(index, elemen) {
			if($(this).find(".itemname").val()!=null&&$(this).find(".itemname").val()!=""){
			str=str+$(this).find(".itemname").val()+",col,"+$(this).find(".itemvalue").val()+",col,"+$(this).find(".itemsort").val()+",col,"+$(this).find(".itemtest").val()+  ",row,";
			}
		});
		$("#dataitems").val(str);	
				
	}

	function a(e){
		 $(e).parent("tr").remove(); 

	}
	function additem() {//添加枚举列表选项		
		var tr = ' <tr class="itemtr"><td><input type="text" class="itemname form-control"></td>'
				+ '<td><input type="text" class="itemvalue form-control"></td>'
				+ '<td><input type="number" class="itemsort form-control" value="0"></td>'
				+ '<td><input type="text" class="itemtest form-control"></td><td  onclick="a(this)"><span class="glyphicon glyphicon-remove"></span></td></tr>';

		$("#item").append(tr);

	}


	function save() {
		debugger
		initform();
		$("#dataForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
</script>
</html>