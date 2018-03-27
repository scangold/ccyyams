<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/ace/css/bootstrap.min.css" />
</head>
<body  class="no-skin">



			<div class="widget-box">
										<div
											class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
											<h4 class="lighter">第3步：成果接收</h4>
										</div>
			
	  <h4>成果接收上传</h4>
	<form class="form-horizontal" role="form" action="upload"  method="post" id="file_file"
		enctype="multipart/form-data">
		<div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">项目id</label>
			<div class="col-sm-10">
				<select name="prjId" id="prjId"
					class="chosen-select form-control col-sm-2 " id="PRODEPART"
					title="项目id">

				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="storageIds" class="col-sm-2 control-label">存储详情</label>
			<div class="col-sm-10">
				<select name="storageIds" id="storageIds"
					class="chosen-select form-control col-sm-2 " title="存储详情">

				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="checkdetails" class="col-sm-2 control-label">路径</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="checkdetails"
					value="e:\测试" placeholder="请输入文件存放地址">
			</div>
		</div>
		<div class="form-group">
			<label for="rcName" class="col-sm-2 control-label">接收者</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="rcName" value="杨大师"
					placeholder="请输入名字">
			</div>
		</div>
		<div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">来源</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="prodepart"
					placeholder="请输入文件来源">
			</div>
		</div>
		<div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">文件</label>
			<div class="col-sm-10">
				<input type="file" name="file" class="form-control" multiple="multiple">
			</div>
		</div>
		<div class="form-group">
			<label for="ifarchive" class="col-sm-2 control-label">文件类型</label>
			<div class="col-sm-10">
				<select name="ifarchive" id="ifarchive"
					class="chosen-select form-control col-sm-2 " id="ifarchive">
					<option value="5">档案资料</option>
					<option value="4">待分配资料</option>
					<option value="3">收集资料</option>
					<option value="2">过程资料</option>
					<option value="1">成果资料</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" >提交</button>
			</div>
		</div>
	</form>
	
	
	</div>

	
	<script src="../static/js/jquery/jquery-3.0.0.min.js"></script>
	<script src="../static/ace/js/bootstrap.js"></script>
	<script src="../static/js/common/PipeJsApi.js"></script>
	<script type="text/javascript">
	$(top.hangge());//关闭加载状态
		$(function() {	

			PipeApi.GetProjiecNameAndId(function(mess) {
				
				for (var int = 0; int < mess.length; int++) {
					$("#prjId").append("<option value='"+mess[int].prjId+"'>"+mess[int].prjName+"</option>");	
				}
							
				console.log(mess);				
						
								
			}, function(mess) {
				console.log(mess)
			});
			
	    	PipeApi.GetRealstorageby("",function(mess) {				
				for (var int = 0; int < mess.length; int++) {
					$("#storageIds").append("<option value='"+mess[int].realstorageId+"'>"+mess[int].storageTypename+"-"+mess[int].actvolume+mess[int].unit+"</option>");	
				}							
				console.log(mess);							
								
			}, function(mess) {
				console.log(mess)
			});

	    	
	    	$.ajax({
                cache: true,
                type: "POST",
                url:ajaxCallUrl,
                data:$('#file_file').serialize(),// 你的formid
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                   console.log(data);
                }
            });
	    	
		});
		
	</script>
</body>
</html>