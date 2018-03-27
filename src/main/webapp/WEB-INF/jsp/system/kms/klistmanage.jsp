<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<!-- jsp文件头和头部 -->
<%@ include file="../index/topcss.jsp"%>


<!-- Le styles -->
<link href="static/ccyyamscss/bootstrap/bootstrap-combined.min.css" rel="stylesheet">
<link href="static/ccyyamscss/bootstrap/bootstrap-table.css" rel="stylesheet">

<!-- 日期框 -->
<!-- 提示框插件 -->
<script src="static/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="static/ace/css/sweetalert2.min.css">

</head>
<body class="no-skin">

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
			
				<div class="page-header">
					<h3>
						科技档案管理 <small>案卷及电子档案</small>
					</h3>
				</div>

				
				<div class="tabbable" id="tabs-858000">
					<ul class="nav nav-tabs">
						<li class="active">
							<a href="#panel-17288" data-toggle="tab">案卷</a>
						</li>
						<li>
							<a href="#panel-14573" data-toggle="tab">电子档案</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-17288">
							<form>
								<fieldset>
									<legend>案卷信息填写</legend> 
									<div class="row-fluid">
										<div class="span6">
											<div class="row-fluid">
												<div class="span4">
													 <span class="label">项目名称</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">测区名称</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">项目类型</span>
													 <input type="text" /> 
												</div>
											</div>
											<div class="row-fluid">
												<div class="span4">
													 <span class="label">移交人名</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">移交部门</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">移交时间</span>
													 <input type="text" /> 
												</div>
											</div>
											<div class="row-fluid">
												<div class="span4">
													 <span class="label">接收人名</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">接收部门</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">接收时间</span>
													 <input type="text" /> 
												</div>
											</div>
											<div class="row-fluid">
												<div class="span4">
													 <span class="label">档盒编号</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">档盒名称</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">库存位置</span>
													 <input type="text" /> 
												</div>
											</div>
											<div class="row-fluid">
												<div class="span4">
													 <span class="label">归档编号</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">卷内序号</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">档案页数</span>
													 <input type="text" /> 
												</div>
											</div>
											<div class="row-fluid">
												<div class="span4">
													 <span class="label">形成时间</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">文件字号</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">卷内目录</span>
													 <input type="text" /> 
												</div>
											</div>
											<div class="row-fluid">
												<div class="span4">
													 <span class="label">档案备注</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">入库序号</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label"></span>
													 <input type="text" /> 
												</div>
											</div>
											<div class="row-fluid">
												<div class="span4">
													 <span class="label"></span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">保存期限</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">档案密级</span>
													 <input type="text" /> 
												</div>
											</div>
										</div>
										<div class="span6">
											
										</div>
									</div>
									<button type="submit" class="btn">案卷接收完成</button>
							 	</fieldset>
				 			</form>
						</div>

						<div class="tab-pane" id="panel-14573">
							<form>
								<fieldset>
									<legend>电子档案接收信息填写</legend> 
									<div class="row-fluid">
										<div class="span6">
											<div class="row-fluid">
												<div class="span4">
													 <span class="label">存放路径</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">数据格式</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">数据大小</span>
													 <input type="text" /> 
												</div>
											</div>
									
											<div class="row-fluid">
												<div class="span4">
													 <span class="label">载体类别</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">备份情况</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">数量</span>
													 <input type="text" /> 
												</div>
											</div>
										</div>
										<div class="span6">
											<div class="row-fluid">
												<div class="span4">
													 <span class="label">文件分类</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">保存期限</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">文字标签</span>
													 <input type="text" /> 
												</div>
											</div>
											<div class="row-fluid">
												<div class="span4">
													 <span class="label">文字标签</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">文字标签</span>
													 <input type="text" /> 
												</div>
												<div class="span4">
													 <span class="label">文字标签</span>
													 <input type="text" /> 
												</div>
											</div>
										</div>
									</div>
									<button type="submit" class="btn">接收完成</button>
							 	</fieldset>
				 			</form>
									 
				 
						</div>
						
					</div>
				</div>
				
				<form action="kms/searchkms.do" method="post" name="kmsSearchForm" id="kmsSearchForm" class="form-search">
					<input class="input-medium search-query" type="text" />
					<button type="submit" onclick="searchs();" class="btn">查找</button>
				</form>
				
				<table class="table">
			</div>
		</div>
	</div>
	<!-- /.main-container -->


<%@ include file="../index/footjs.jsp"%>
</body>

<script type="text/javascript">
$(top.hangge());//关闭加载状态


//检索
function searchs(){
	top.jzts();
	$("#userForm").submit();
}

//新增
function add(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="新增";
	 diag.URL = '<%=basePath%>user/goAddU.do';
	 diag.Width = 469;
	 diag.Height = 510;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location=self.location",100);
			 }else{
				 nextPage(${page.currentPage});
			 }
		}
		diag.close();
	 };
	 diag.show();
}

//修改
function editUser(user_id){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="资料";
	 diag.URL = '<%=basePath%>user/goEditU.do?USER_ID='+user_id;
	 diag.Width = 469;
	 diag.Height = 510;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			nextPage(${page.currentPage});
		}
		diag.close();
	 };
	 diag.show();
}
</script>

<!-- 下拉框 -->
<script src="static/ace/js/chosen.jquery.js"></script>
<!-- 汉化bootstrap table -->
<script src="static/ace/js/dist/bootstrap-table-zh-CN.js"></script>

</html>
