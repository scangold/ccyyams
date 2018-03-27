<%@page import="com.fh.util.PageData"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	List<PageData> ls = (List<PageData>) request.getAttribute("listfile");
	JSONArray jsonArray = JSONArray.fromObject(ls);
	String str = jsonArray.toString();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">


<!-- jsp文件头和头部 -->
<%@ include file="../index/topcss.jsp"%>
<style type="text/css">
body {
	background-color: #FFFFFF;
}

#apply-left {
	margin-left: 1px;
}

textarea {
	width: 860px;
	height: 100%;
	max-width: 860px;
	max-height: 500px;
}
</style>
<%@ include file="../index/top.jsp"%>
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<script src="static/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="static/ace/css/sweetalert2.min.css">
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<form class="form-horizontal" role="form">
		<div class="main-container" id="main-container">
			<div style="margin-left: 10%; margin-right: 10%; margin-top: 10px">
				<h2 class="center" style="margin: auto; text-align: center;"><b>分发文件</b></h2>
				<br><br>
				<div class="form-group">
					<div class="col-sm-10">
						<label for="lastname">原因：</label> <input type="text"
							id="desc" placeholder="请输入原因">
					</div>
				</div>
			
		
				<table id="table" data-toggle="table" data-height="460"
					data-data='<%=str%>' data-sort-name="name" data-sort-order="desc">
					<thead>
						<tr>
							<th data-field="FILE_ID" data-sortable="true">ID</th>
							<th data-field="FILE_NAME" data-sortable="true">文件名</th>
							<th data-field="FILE_TYPE" data-sortable="true">文件类型</th>
							<th data-field="DATAFORM" data-sortable="true">来源</th>
							<th data-field="PERMISSION_CLASS" data-sortable="true">密集</th>
						</tr>
					</thead>
				</table>
				<div>
					<select id="apply_roleselect">
						<c:forEach var="item" items="${roleList }">
							<option value="${item.ROLE_ID }">${item.ROLE_NAME }</option>
						</c:forEach>
					</select> <select id="apply_Change_user">
						<c:forEach var="item" items="${listuser }">
							<option value="${item.USER_ID }">${item.NAME }</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<br>
		<div>
			<button type="button" class="btn" style="margin-left: 50%">提交</button>
		</div>

	</form>


	<!-- /.main-container -->

	<!-- basic scripts -->

	<!-- 页面底部js¨ -->
	<%@ include file="../index/footjs.jsp"%>
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>

	<!-- 删除时确认窗口 -->
</body>
<script type="text/javascript">
	//$(top.hangge());//关闭加载状态

	$(function() {	
		
		$("#apply_roleselect").on('change',function() {	

			PipeApi.ChangeUserByRoleID($("#apply_roleselect").val(), function(mess) {
				console.log(mess);
				var r= mess.res;
				$("#apply_Change_user").empty();
				for (var int = 0; int < r.length; int++) {
					$("#apply_Change_user").append("<option value='"+r[int].USER_ID+"'>"+r[int].NAME+"</option>");
				}
				},PipeApi.ERROR)
		});
	});
		/* 
		 $.ajax({
		 type: "POST",
		 xhrFields: {
		 withCredentials: true,
		 useDefaultXhrHeader: false
		 },
		 url:"/CCYYAMS/apply/addApplys.do",
		 success:function(res){
		 console.log("success-1");
		 console.log(res);
		 },
		 error: function(){
		
		 console.log("***********************************888");
		 }
		 }); */
        $("button").on('click', function() {
		PipeApi.SaveArchdistribute($("#apply_Change_user").val(), $("#desc").val(), '${ids }', function(mess) {
            console.log("---------------------------------------------------------------------------------------------------");
			console.log(mess);
				 var r= mess.result;
				  var t= mess.desc;
				var e=mess.res;
					if(r==true)
			            {  
			            swal({
								  title:'YES!',
								  text:t,
								  type:'success'
								})
								.then(function(isConfirm) {
                                if (isConfirm === true){window.location.reload()}
                                else{window.location.reload()}	
                                })	
						}
					else
						{
						swal({
								 title: 'NO!',
								 text:t,
								 type:'error'
								})
								.then(function(isConfirm) {
                                if (isConfirm === true){window.location.reload()}
                                else{window.location.reload()}
                                })
							}
						
		}, PipeApi.ERROR);
});
</script>

</html>
