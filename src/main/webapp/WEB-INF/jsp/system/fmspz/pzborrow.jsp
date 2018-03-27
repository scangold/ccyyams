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
							<form action="pz/borrowpz.do" name="pzborrowForm" id="pzborrowForm"
								method="post">
								<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report"
										class="table table-striped table-bordered table-hover">
										<tr style="display:none;">
											<td style="width: 79px; text-align: right; padding-top: 13px;">凭证号:</td>
											<td>
											
											<input type="text" name="ac_box_id" id="ac_box_id"  value="${pd.fmsPZBorrow.ac_box_id}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">凭证盒号:</td>
											<td>
											
											<input type="text" name="acdoc_box" id="acdoc_box"  value="${pd.fmsPZBorrow.acdoc_box}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">保管室号:</td>
											<td>
											
											<input type="text" name="acdoc_room" id="acdoc_room"  value="${pd.fmsPZBorrow.acdoc_room}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">保管箱号:</td>
											<td>
											
											<input type="text" name="acdoc_case" id="acdoc_case"  value="${pd.fmsPZBorrow.acdoc_case}"
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">借阅人:</td>
											<td>
											
											<input type="text" name="name" id="name"  value=""
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">借阅理由:</td>
											<td>
											
											<input type="text" name="describle" id="describle"  value=""
												maxlength="32" placeholder="输入" title="描述"
												style="width: 98%;" /></td>
										</tr>
										<tr>
											<td
												style="width: 79px; text-align: right; padding-top: 13px;">归还时间:</td>
											<td>
								<input class="span10 date-picker" name="endtime" id="endtime" type="text" value=""
									data-date-format="yyyy-mm-dd"
									placeholder="归还时间" style="width: 98%;" /></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10"><a
												class="btn btn-mini btn-primary" onclick="save();">借阅</a> <a
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
		if ($("#acdoc_box").val() == "") {
			$("#acdoc_box").tips({
				side : 3,
				msg : '请输入凭证盒号',
				bg : '#AE81FF',
				time : 2
			});
			$("#acdoc_box").focus();
			return false;
		}
		if ($("#name").val() == "") {
			$("#name").tips({
				side : 3,
				msg : '请输入借阅人',
				bg : '#AE81FF',
				time : 2
			});
			$("#name").focus();
			return false;
		}
		if ($("#acdoc_room").val() == "") {
			$("#acdoc_room").tips({
				side : 3,
				msg : '请输入档案室号',
				bg : '#AE81FF',
				time : 2
			});
			$("#acdoc_room").focus();
			return false;
		}
		if ($("#acdoc_case").val() == "") {
			$("#acdoc_case").tips({
				side : 3,
				msg : '请输入保管柜号',
				bg : '#AE81FF',
				time : 2
			});
			$("#acdoc_case").focus();
			return false;
		}
		if ($("#endtime").val() == "") {
			$("#endtime").tips({
				side : 3,
				msg : '请输入归还时间',
				bg : '#AE81FF',
				time : 2
			});
			$("#endtime").focus();
			return false;
		}
		$('#pzborrowForm').submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
  }
</script>
</body>
</html>