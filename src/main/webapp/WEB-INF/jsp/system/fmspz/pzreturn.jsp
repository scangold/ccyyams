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
							<form action="pz/returnborrow.do" name="pzborrowForm" id="pzborrowForm"
								method="post">
								<input type="text" name="id" class="hidden" id="id" value="${pd.fmsPZreturn.ID }" style="width:98%;display:none;"/>
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr style="display:none;">
											<td style="width: 79px; text-align: right; padding-top: 13px;">借阅号:</td>
											<td>
											
											<input type="text" name="ID" id="ID"  value="${pd.fmsPZreturn.ID}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr style="display:none;">
											<td style="width: 79px; text-align: right; padding-top: 13px;">借阅凭证号:</td>
											<td>
											
											<input type="text" name="pzboxid" id="pzboxid"  value="${pd.fmsPZreturn.pzboxid}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">借阅时间:</td>
											<td>
											
											<input type="text" name="STARTTIME" id="STARTTIME"  value="${pd.fmsPZreturn.STARTTIME}"
												maxlength="32" placeholder="输入" title="描述" readonly="readonly"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">归还时间:</td>
											<td>
											
											<input type="text" name="ENDTIME" id="ENDTIME"  value="${pd.fmsPZreturn.ENDTIME}"
												maxlength="32" placeholder="输入" title="描述" readonly="readonly"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">借阅人:</td>
											<td>
											
											<input type="text" name="NAME" id="NAME"  value="${pd.fmsPZreturn.NAME}"
												maxlength="32" placeholder="输入" title="描述" readonly="readonly"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">借阅理由:</td>
											<td>
											
											<input type="text" name="DESCRIBLE" id="DESCRIBLE"  value="${pd.fmsPZreturn.DESCRIBLE}"
												maxlength="32" placeholder="输入" title="描述" readonly="readonly"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="save();">归还</a> <a
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
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
    $(function(){

    	//日期框
		$('.date-picker').datepicker({
			initialDate:new Date(),
			autoclose: true,
			todayHighlight: true,
		
		});

    })
    //保存
	function save(){
		$('#pzborrowForm').submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
  }
</script>
</body>
</html>