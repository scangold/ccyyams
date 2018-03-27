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
	<form action="pz/pzborrow.do" method="post" name="pzborrowForm" id="pzborrowForm">
	<div style="border-bottom:2px solid #438eb9  !important;font-size: 18px;height: 60px;line-height: 60px;"><span style='margin-left:20px;font-size:26px;color:#438eb9 '>借阅信息:</span></div>
				<table style="width: 100%; margin-top:10px;" border="0">
								<tr>
						<td style="width: 10%;">
						
						 <select class="chosen-select form-control" value="${pd.isvalid }" name="isvalid" id="isvalid"  style="vertical-align:top;margin-bottom: 10px;margin-left: 3px;" >
											
											 <option value="" <c:if test="${pd.isvalid==null||pd.isvalid==''}">selected</c:if> >全部</option>
											  <option value="1" <c:if test="${pd.isvalid=='1'}">selected</c:if>>已借阅</option>
											 <option value="0" <c:if test="${pd.isvalid=='0'}">selected</c:if>>未借阅</option>

											</select>
											
						</td>									
							<c:if test="${QX.cha == 1 }">
											<td style="vertical-align:top;padding-left:5px"><a
												class="btn btn-light btn-xs" style="margin-top: 3px;margin-left: 3px;" onclick="tosearch()"
												title="检索"><i id="nav-search-icon"
													class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
										</c:if>
					</tr>
					</table>
		<table class='table table-bordered ' id="table_report" style="width: 100%;background: #fff;" border="0">
			<thead>
				<tr>
				    <th class="center" style="width:2%"></th>
					<th class="center" style="width:5%">序号</th>
					<th class="center" style='width:10%'>凭证盒号</th>
					<th class="center" style="width:10%">凭证存放室</th>
					<th class="center" style="width:12%">凭证存放柜</th>
					<th class="center" style="width:8%">借阅状态</th>
					<th class="center" style="width:5%">操作</th>
				</tr>
			</thead>
			<tbody>
			<!-- 开始循环 -->
										<c:choose>
											<c:when test="${not empty dataList.borrowlist}">
												
													<c:forEach items="${dataList.borrowlist}" var="data" varStatus="vs">
														<tr>
														<td class='center'><label class="pos-rel">
														<c:if test="${data.isvalid == 0 }">
														<input type='checkbox' name='ids' value="${data.ac_box_id}" class="ace" onchange="changeids('${data.ac_box_id }')"/>														
														</c:if>
														<c:if test="${data.isvalid == 1 }">
														<input type='checkbox' name='ids' value="${data.ac_box_id}" disabled="disabled" class="ace" onchange="changeids('${data.ac_box_id }')"/>														
														</c:if>
														<span class="lbl"></span>
														</label></td>
														<td class='center' style="width: 30px;">${vs.index+1}</td>
														<td class='center'>${data.acdoc_box}</td>
														<td class='center'>${data.acdoc_room}</td>
														<td class='center'>${data.acdoc_case}</td>
														<c:if test="${data.isvalid == 1 }">
														<td class='center'>已借出</td>
														</c:if>
														<c:if test="${data.isvalid == 0 }">
														<td class='center'>未借出</td>
														</c:if>
												<td class="center" width="75px">
												<div class="hidden-sm hidden-xs btn-group">
												<c:if test="${data.isvalid == 0 }">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-success" title="借阅" onclick="borrowFILE('${data.ac_box_id}');">
														<i class="ace-icon fa fa-repeat bigger-120" title="借阅"></i>
													</a>
													</c:if>
													</c:if>
													<c:if test="${data.isvalid == 1 }">
													<c:if test="${QX.edit == 1 }">
													<a class="btn btn-xs btn-pink" title="归还" onclick="returnborrow('${data.ac_box_id}');">
														<i class="ace-icon fa fa-mail-forward bigger-120" title="归还"></i>
													</a>
													</c:if>
													</c:if>
												</div>
											</td>
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
									 			<td style="vertical-align: top;">
													<a class="btn btn-mini btn-success" onclick="makeAll();">借阅</a>
												</td>
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
	//检索
	function tosearch(){
		top.jzts();
		$("#pzborrowForm").submit();
	}
    $(function(){
    	//日期框
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		});
    })
    		//借阅凭证return
		function borrowFILE(ac_box_id){
			$(top.hangge());
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="借阅";
			 diag.URL = '<%=basePath%>pz/goBorrow.do?acboxid='+ac_box_id;
			 diag.Width = 430;
			 diag.Height = 450;
			 diag.CancelEvent = function(){ //关闭事件
				 nextPage(${page.currentPage});
				diag.close();
			 };
			 diag.show();
		}
    
	var ids="${data.ac_box_id}";
	function changeids(e){

		if(ids.indexOf(e)>-1){
			ids=ids.replace(e+",","")		
		}else{
			ids=ids+e+","
		}
		$(".ids").val(ids);
		console.log(e+" ids------------------"+ids);			
	}
    		//批量借阅凭证
		function makeAll(){
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="批量注销凭证";
		 diag.URL = '<%=basePath%>pz/goborrowall.do?ids='+ids;
		 diag.Width = 550;
		 diag.Height = 510;
		 diag.CancelEvent = function(){ //关闭事件
					 nextPage(${page.currentPage});
			diag.close();
		 };
		 diag.show();
		}
    		
		//归还凭证
		function returnborrow(ac_box_id){
			bootbox.confirm("确定要归还吗?",function(result){
				if(result) {
			$(top.hangge());
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="归还";
			 diag.URL = '<%=basePath%>pz/goreturn.do?acboxid='+ac_box_id;
			 diag.CancelEvent = function(){ //关闭事件
				 nextPage(${page.currentPage});
				diag.close();
			 };
			 diag.show();
				};
			});
		}
    </script>


</body>
</html>