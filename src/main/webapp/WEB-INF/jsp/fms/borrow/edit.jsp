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
<link rel="stylesheet"
	href="static/ace/css/css/bootstrap-datetimepicker.min.css" />
<style type="text/css">
.date-picker, .datepicker-days {
	cursor: pointer;
}
</style>
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
							<form action="borrow/${msg }.do" name="dataForm" id="dataForm"
								method="post">						
								<div class="form-group">
   									 <label for="name">借阅人</label>
  								     <input class="form-control"  id="name"	name="name" placeholder="名称">   
 								 </div>
                   				<div class="form-group ">
                 			       <label for="describle">描述</label>
                     			   <input type="text" class="form-control" id="describle"  name="describle"   placeholder="描述">
  								</div>
 							    <div class="form-group hidden">
  				 					 <label for="ids">ids</label>
   									 <input value="${pd.ids}" name="ids" id="ids">   					
  							  </div>
        
                 			 <div class="form-group ">
 	               				   <label for="date">归还时间</label>
 	                				<input name="endtime" class="span10 date-picker"  id="date" type="text" readonly="readonly" value=""
									data-date-format="yyyy-mm-dd"
									placeholder="归还时间" />
 							 </div>	
							<div class="form-group "><input type="submit"></div>
						</form>
						<table id="simple-table"
								class="table table-striped table-bordered table-hover"
								style="margin-top: 5px;">
								<thead>
									<tr>
										<th>序号</th>
										<th>文号</th>
										<th>题名</th>
										<th>提要</th>
										<th>主题词</th>
										<th>类型</th>
										<th>责任者</th>
									</tr>
								</thead>
								<tbody>
									<!-- 开始循环 -->
									<c:choose>
										<c:when test="${not empty fmsDocMains}">
											<c:forEach items="${fmsDocMains}" var="data" varStatus="vs">
												<tr>
													<td class='center' style="width: 30px;">${vs.index+1}</td>
													<td class="center"><a href="doc/view.do?fmsid=${data.ID}">${data.docid}</a></td>
													<td class="center">${data.TITLE}</td>
													<td class="center">${data.PRECISE}</td>
													<td class="center">${data.KEYWORD}</td>
													<td class="center">${data.ISVALID}</td>
													<td class="center">${data.CREATETIME}</td>
													<td class="center">${data.UPDATETIME}</td>
												</tr>
											</c:forEach>
										</c:when>
									</c:choose>
							</table>

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
		
		$('#datetimepicker').datetimepicker();
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






</script>

</body>

</html>