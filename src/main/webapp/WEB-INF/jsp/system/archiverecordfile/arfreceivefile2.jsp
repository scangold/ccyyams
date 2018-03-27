<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
   Remove this if you use the .htaccess -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="initial-scale=1.0, target-densitydpi=device-dpi" />
<!-- this is for mobile (Android) Chrome -->
<meta name="viewport" content="initial-scale=1.0, width=device-height">
<!--  mobile Safari, FireFox, Opera Mobile  -->
<title>Insert title here</title>
<link rel="stylesheet" href="../static/ace/css/bootstrap.min.css" />
<!--  电子签名 -->
<style type="text/css">
#signatureparent {
	color: darkblue;
	background-color: darkgrey;
	/*max-width:600px;*/
	padding: 5px;
}

/*This is the div within which the signature canvas is fitted*/
#signature {
	border: 2px dotted black;
	background-color: lightgrey;
}

/* Drawing the 'gripper' for touch-enabled devices */
html.touch #content {
	float: left;
	width: 32%;
}

html.touch #scrollgrabber {
	float: right;
	width: 4%;
	margin-right: 2%;
}

html.borderradius #scrollgrabber {
	border-radius: 1em;
}

#tools {
	width: 25px;
}
</style>
</head>
<body>
	
	<form class="form-horizontal" role="form" action="upload2" method="post"
		id="file_file" enctype="multipart/form-data">
		<div class="form-group">
			<label  class="col-sm-2 control-label"><h4>上传电子档案</h4></label>
				
	   	</div>
		<div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">档案盒ID</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" readonly="readonly" name="fileattr3" id="fileattr3" value="${pd.kfboxid} " >
			</div>
		</div>
<!-- 		<div class="form-group">
			<label for="storageIds" class="col-sm-2 control-label">存储详情</label>
			<div class="col-sm-6">
				<select name="storageIds" id="storageIds"
					class="chosen-select form-control col-sm-2 " title="存储详情">

				</select>
			</div>
		</div> -->
		<div class="form-group">
			<label for="checkdetails" class="col-sm-2 control-label">档案路径</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="fileUrl" id="fileUrl" 
					value="d:\科技档案" placeholder="请输入文件存放地址">
			</div>
		</div>
		<div class="form-group">
			<label for="rcName" class="col-sm-2 control-label">接收人名</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" readonly="readonly" name="rcName" id="rcName"
					placeholder="请输入接收者姓名"  value="${sessionUser.NAME}">
			</div>
		</div>
		<div class="form-group">
			<label for="transfname" class="col-sm-2 control-label">移交人</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="transfname" id="transfname"
					placeholder="请输入文件来源">
			</div>
		</div>
		<div class="form-group">
			<label for="prodepart" class="col-sm-2 control-label">移交单位</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="prodepart" id="prodepart"
					placeholder="请输入移交单位">
			</div>
		</div>


		<div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">档案文件</label>
			<div class="col-sm-6">
				<input type="file" name="file" class="form-control" id="file"
					multiple="multiple">
			</div>
		</div>
		<div class="form-group hide">
			<label for="fileType" class="col-sm-2 control-label">fileType隐藏</label>
			<div class="col-sm-6">
				<input type="text" name="fileType" class="form-control" value="5">
			</div>
		</div>
		<div class="form-group hide">
			<label for="ifarchive" class="col-sm-2 control-label">文件类型</label>
			<div class="col-sm-6">
				<select name="ifarchive" id="ifarchive"
					class="chosen-select form-control col-sm-2 " id="ifarchive">
					<option value="5" selected="selected">档案资料</option>
					<option value="4">待分配资料</option>
					<option value="3">收集资料</option>
					<option value="2">过程资料</option>
					<option value="1">成果资料</option>
				</select>
			</div>
		</div>

		<!-- 
		<div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">证明文件</label>
			<div class="col-sm-6">
				<input type="file" name="file" class="form-control"
					multiple="multiple">
			</div>
		</div>
		 -->
		<%-- 
  		 <div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">电子头像</label>
			&nbsp;&nbsp;&nbsp;
			<video id="video" width="240px" height="150px" autoplay></video>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<canvas id="canvas" width="210px" height="150px"></canvas>
		</div>
		<div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">电子签名</label>
			<div class="col-sm-2">
				<div id="signatureparent" style="width:360px !important;">
					<div id="signature"></div>
				</div></div>
				<div class="col-sm-1" style="margin-left: 45px;width: 50px !important;">
				<div id="tools" style="margin-left: 35px"></div>
              <input type="button" value="确定" id="btnTest" style=" margin: 15px 0;"></div>
              <div class="col-sm-2" style="margin-left:45px;">
             <div id="displayarea" style="margin-top: 10px;"></div></div>
				</div>
			
			</div> --%>

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default" onclick="return submitClick();">提交</button>
			</div>
		</div>
	</form>
	<script src="../static/js/jquery/jquery-3.0.0.min.js"></script>
	<script src="../static/ace/js/bootstrap.js"></script>
	<script src="../static/js/common/PipeJsApi.js"></script>
			<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		
		//保存
		function submitClick() {
			var flag = true;
			var rcNametext= document.getElementById("rcName").value;
			var transfnametext= document.getElementById("transfname").value;
			var prodeparttext= document.getElementById("prodepart").value;
			var filetext= document.getElementById("file").value;
/* 			if (rcNametext == "") {
				alert("请输入文件名称！");
				flag = false;
				return false;
			}
			if (transfnametext == "") {
				alert("请输入移交人名！");
				flag = false;
				return false;
			}
			if (prodeparttext == "") {
				alert("请输入移交单位！");
				flag = false;
				return false;
			}
			if (filefile == "") {
				alert("请选择文件！");
				flag = false;
				return false;
			} */
			//$("#FormHandReceive").submit();
			$("#doing1").hide();
			$("#doing2").show();
			
		}
	</script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		(function($) {

			PipeApi.GetProjiecNameAndId(function(mess) {

				for (var int = 0; int < mess.length; int++) {
					$("#prjId").append(
							"<option value='"+mess[int].prjId+"'>"
									+ mess[int].prjName + "</option>");
				}

				console.log(mess);

			}, function(mess) {
				console.log(mess)
			});

			PipeApi.GetRealstorageby("RAID", function(mess) {
				for (var int = 0; int < mess.length; int++) {
					$("#storageIds").append(
							"<option value='"+mess[int].REALSTORAGE_ID+"'>"
									+ mess[int].STORAGE_NAME + "-"
									+ mess[int].STORAGE_TYPENAME + "-"
									+ mess[int].ACTVOLUME + mess[int].UNIT
									+ "</option>");
				}
				console.log("-----11111111111111111111111-------------");

			}, function(mess) {

				console.log("-----22222222222222222222-------------");
			});

			/* 	$.ajax({
					cache : true,
					type : "POST",
					url : ajaxCallUrl,
					data : $('#file_file').serialize(),// 你的formid
					async : false,
					error : function(request) {
						alert("Connection error");
					},
					success : function(data) {
						console.log(data);
					}
				}); 袁大师注释掉的*/

		})(jQuery);
	</script>
	<!-- 	手写板 -->
	<script src="../static/js/signature/modernizr.js"></script>
	<script type="text/javascript">
		jQuery.noConflict()
	</script>
	<script type="text/javascript">
		/*  @preserve
		 jQuery pub/sub plugin by Peter Higgins (dante@dojotoolkit.org)
		 Loosely based on Dojo publish/subscribe API, limited in scope. Rewritten blindly.
		 Original is (c) Dojo Foundation 2004-2010. Released under either AFL or new BSD, see:
		 http://dojofoundation.org/license for more information.
		 */
		(function($) {
			var topics = {};
			$.publish = function(topic, args) {
				if (topics[topic]) {
					var currentTopic = topics[topic], args = args || {};

					for (var i = 0, j = currentTopic.length; i < j; i++) {
						currentTopic[i].call($, args);
					}
				}
			};
			$.subscribe = function(topic, callback) {
				if (!topics[topic]) {
					topics[topic] = [];
				}
				topics[topic].push(callback);
				return {
					"topic" : topic,
					"callback" : callback
				};
			};
			$.unsubscribe = function(handle) {
				var topic = handle.topic;
				if (topics[topic]) {
					var currentTopic = topics[topic];

					for (var i = 0, j = currentTopic.length; i < j; i++) {
						if (currentTopic[i] === handle.callback) {
							currentTopic.splice(i, 1);
						}
					}
				}
			};
		})(jQuery);
	</script>
	<script src="../static/js/signature/jSignature.min.noconflict.js"></script>
	<script type="text/javascript">
		(function($) {

			$(document)
					.ready(
							function() {

								// This is the part where jSignature is initialized.
								var $sigdiv = $("#signature").jSignature({
									'UndoButton' : true
								})

								// All the code below is just code driving the demo. 
								, $tools = $('#tools'), $extraarea = $('#displayarea'), pubsubprefix = 'jSignature.demo.'

								// 点击按钮显示值
								$("#btnTest").bind(
										'click',
										function(e) {
											$extraarea.empty();
											// 取得所画的模板
											var data = $sigdiv.jSignature(
													'getData', 'image')
											// 将取得值设置到文本中
											//$("#memo").val(data.join(','))
											// 将取得的值设置到显示区域
											$.publish(pubsubprefix + data[0],
													data);
											var i = new Image()
											i.src = 'data:' + data[0] + ','
													+ data[1]
											$(i).appendTo($extraarea)
										}).appendTo($tools)

								$('<input type="button" value="重置">').bind(
										'click', function(e) {
											$extraarea.empty();
											$sigdiv.jSignature('reset');
										}).appendTo($tools)

								if (Modernizr.touch) {
									$('#scrollgrabber').height(
											$('#content').height())
								}

							})

		})(jQuery)
	</script>
	<!-- 	之前的 -->

</body>


</html>