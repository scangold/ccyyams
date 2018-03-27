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
							<form action="official/${msg }.do" name="dataForm" id="dataForm"
								method="post">
								<input type="text" name="fmsId" class="hidden" id="fmsId" value="${pd.fmsid }">
								<div id="zhongxin" style="padding-top: 13px;">						
								<input type="text" name="id" class="hidden" id="id" value="${pd.fmsDocBox.id}">
								<div id="zhongxin" style="padding-top: 13px;">						
								
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">名字:</td>
											<td><input type="text" name="name" id="name" value="${pd.fmsDocBox.name}" 
												  maxlength="32" placeholder="这里输入用户名"
												title="用户名" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">值:</td>
											<td><input type="text" name="value" id="value" value="${pd.fmsDocBox.value}"
												maxlength="32" placeholder="这里输入值"
												title="值" 		style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">描述:</td>
											<td>
											
											<input type="text" name="describe" id="describe"  value="${pd.fmsDocBox.describe}" 
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
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