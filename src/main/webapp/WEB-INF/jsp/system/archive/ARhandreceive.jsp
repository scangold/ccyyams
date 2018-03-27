<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/ace/css/bootstrap.min.css" />

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
<body class="no-skin">

	<h4 class="lighter" face="微软雅黑">第3步：成果接收</h4>

	<form class="form-horizontal" role="form" action="uploadArcRcByhand"
		method="post" id="FormHandReceive" enctype="multipart/form-data">

		<div class="form-group">
			<label for="receivetemp" class="col-sm-2 control-label">接收临时ID</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="receivetemp"
					readonly="readonly" value="${pd.RctempId}" placeholder="接收临时ID">
			</div>
		</div>
		<div class="form-group">
			<label for="prjId" class="col-sm-2 control-label">项目ID</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="prjId"
					readonly="readonly" value="${pd.PRJ_ID}" placeholder="项目ID">
			</div>
		</div>
		<div class="form-group">
			<label for="prjName" class="col-sm-2 control-label">项目名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="prjName"
					readonly="readonly" value="${pd.PRJ_NAME}" placeholder="项目名称">
			</div>
		</div>
		<div class="form-group">
			<label for="registerId" class="col-sm-2 control-label">存储注册ID</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="registerId"
					readonly="readonly" value="${pd.registerid}" placeholder="存储注册ID">
			</div>
		</div>
		<div class="form-group">
			<label for="storageId" class="col-sm-2 control-label">存储ID</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="storageId"
					readonly="readonly" value="${pd.STORAGE_ID}" placeholder="存储ID">
			</div>
		</div>
		<div class="form-group">
			<label for="storageTypename" class="col-sm-2 control-label">存储设备</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="storageTypename"
					readonly="readonly" value="${pd.arstoragename}"
					placeholder="存储设备名称">
			</div>
		</div>
		<div class="form-group">
			<label for="rcName" class="col-sm-2 control-label">接收人</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="rcName"
					readonly="readonly" value="${pd.USERNAME}" placeholder="接收人姓名">
			</div>
		</div>
		<div class="form-group">
			<label for="userId" class="col-sm-2 control-label">接收人ID</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="userId"
					readonly="readonly" value="${pd.USER_IDstr}" placeholder="接收人ID">
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="fileUrl" class="col-sm-2 control-label">成果文件的地址</label>
			</td>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="fileUrl" name="fileUrl"
					readonly="readonly" value="${pd.FILE_URL}" placeholder="成果文件夹的相对地址">
			</div>
			<div style="font-size: 24px; color: #FF9966">*必填</div>
		</div>
		
		
		<div class="form-group">
			<label for="transfname" class="col-sm-2 control-label">移交人</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="transfname" id="transfname"
				 placeholder="输入移交人姓名">
			</div>
			<div style="font-size: 24px; color: #FF9966">*必填</div>
		</div>
		<div class="form-group">
			<label for="prodepart" class="col-sm-2 control-label">移交单位</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="prodepart" id="prodepart"
					 placeholder="输入移交人单位">
			</div>
			<div style="font-size: 24px; color: #FF9966">*必填</div>
		</div>


		<div class="form-group">
			<label for="fileName" class="col-sm-2 control-label">成果名称</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="fileName" id="fileName"
					placeholder="请输入成果名称" onkeyup="javascript:chkmaxsms(this,'99')">
			</div>
			<div style="font-size: 24px; color: #FF9966">*必填</div>
		</div>

		<div class="form-group">
			<label for="ifdigit" class="col-sm-2 control-label">电子或模拟数据</label>
			<div class="col-sm-6">
				<select name="ifdigit" id="ifdigit"
					class="chosen-select form-control col-sm-2 ">
					<option value="1">电子数据</option>
					<option value="2">模拟数据</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="dataform" class="col-sm-2 control-label">文件扩展名</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="dataform" id="dataform"
					placeholder="请输入相关文件扩展名" onkeyup="javascript:chkmaxsms(this,'99')">
			</div>
		</div>


		<div class="form-group">
			<label for="volume" class="col-sm-2 control-label">文件容量值</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="volume" id="volume"
					placeholder="请输入文件容量值" onkeyup="value=value.replace(/[^\d\.]/g,'')" maxlength="100">
			</div>
			<div style="font-size: 24px; color: #FF9966">*必填</div>
		</div>


		<div class="form-group">
			<label for="unit" class="col-sm-2 control-label">容量单位</label>
			<div class="col-sm-6">
				<select name="unit" id="unit"
					class="chosen-select form-control col-sm-2 ">
					<option value="KB">KB</option>
					<option value="MB">MB</option>
					<option value="GB">GB</option>
					<option value="TB">TB</option>
					<option value="字节">字节</option>
					<option value="盒">盒</option>
					<option value="张">张</option>
					<option value="页">页</option>
					<option value="份">份</option>
					<option value="单位">单位</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="ifarchive" class="col-sm-2 control-label">是否成果</label>
			<div class="col-sm-6">
				<select name="ifarchive" id="ifarchive"
					class="chosen-select form-control col-sm-2 ">
					<option value="1">成果</option>
					<option value="5">档案</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="fileType" class="col-sm-2 control-label">资料类型</label>
			<div class="col-sm-6">
				<select name="fileType" id="fileType"
					class="chosen-select form-control col-sm-2 ">
					<option value="4">待分类资料</option>
					<option value="1">成果</option>
					<option value="2">过程资料</option>
					<option value="3">收集资料</option>
					<option value="5">档案</option>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label for="scale" class="col-sm-2 control-label">比例尺</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="scale" id="scale"
					placeholder="输入比例尺 ,如“1:2000”"
					onkeyup="value=value.replace(/[^\d\：\:]/g,'')" maxlength="50">
			</div>
		</div>

		<div class="form-group">
			<label for="permissionClass" class="col-sm-2 control-label">文件密级</label>
			<div class="col-sm-6">
				<select name="permissionClass" id="permissionClass"
					class="chosen-select form-control col-sm-2 ">
					<option value="公开">公开</option>
					<option value="国内">国内</option>
					<option value="内部">内部</option>
					<option value="秘密">秘密</option>
					<option value="机密">机密</option>
					<option value="绝密">绝密</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label for="creationdate" class="col-sm-2 control-label">文件创建日期</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="creationdate" id="creationdate"
					placeholder="输入成果文件的创建日期，如“2008-01-03”"
					onkeyup="value=value.replace(/[^\d\-\-]/g,'')" maxlength="20">
			</div>
		</div>

		<div class="form-group">

			<label for="coverage" class="col-sm-2 control-label">测区</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="coverage" id="coverage"
					 placeholder="输入覆盖区域或地点名称"
					onkeyup="javascript:chkmaxsms(this,'255')">
			</div>
		</div>

		<div class="form-group">
			<label for="year" class="col-sm-2 control-label">年份</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="year"  id="year"
					value="CurentDate();">
			</div>
		</div>

		<div class="form-group">
			<label for="detail" class="col-sm-2 control-label">清单详情目录</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="5" cols="100%" id="detail"
					name="detail" placeholder="输入详情目录，限制输入1024字"
					onkeyup="javascript:chkmaxsms(this,'1024')"></textarea>
			</div>
			<div style="font-size: 24px; color: #FF9966">*必填</div>
		</div>

		<div class="form-group">
			<label for="fileRemark" class="col-sm-2 control-label">文件备注</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="5" cols="100%" id="fileRemark"
					name="fileRemark" placeholder="输入文件备注，限制输入255字"
					onkeyup="javascript:chkmaxsms(this,'255')"></textarea>
			</div>
		</div>






		<div class="form-group">
			<label for="rcRemark" class="col-sm-2 control-label">接收备注</label>
			<div class="col-sm-6">
				<textarea class="form-control" rows="5" cols="100%" id="rcRemark"
					name="rcRemark" placeholder="输入接收备注 限制输入255字"
					onkeyup="javascript:chkmaxsms(this,'255')"></textarea>
			</div>
		</div>

		<div class="form-group">
			<label for="file" class="col-sm-2 control-label">文件</label>
			<div class="col-sm-6">
				<input type="file" name="file"  id="file" class="form-control" placeholder="支持1GB以内压缩包文件上传；超过1GB请提交接收表单后，用FTP上传。"
					onchange="fileChange(this);" multiple="multiple" accept=".zip">
			</div>
		</div>

		<div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">电子头像</label>
			&nbsp;&nbsp;&nbsp;
			<video id="video" width="240px" height="150px" autoplay></video>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<canvas id="canvas" width="210px" name="rcRemark" height="150px"></canvas>
			<input type="text" name="photograph" id="DigitalImage" readonly="readonly">
		</div>

		<div class="form-group">
			<label for="firstname" class="col-sm-2 control-label">电子签名</label>
			<div class="col-sm-2">
				<div id="signatureparent" style="width: 360px !important;">
					<div id="signature"></div>
				</div>
			</div>
			<div class="col-sm-1"
				style="margin-left: 45px; width: 50px !important;">
				<div id="tools" style="margin-left: 35px;"></div>
				<input type="button" value="确定" id="btnTest" style="margin: 15px 0;">
			</div>
			<div class="col-sm-2" style="margin-left: 45px; margin-top: 10px;">
				<div id="displayarea"></div>
			</div>

		</div>
		<div class="form-group">
			<input type="text" name="autograph" id="DigitalSig" readonly="readonly"
				style="margin-left: 300px;">
		</div>

		<div class="form-group" >
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" onclick="return submitClick();" class="btn btn-default" 
				value="提交"/>
			</div>
		</div>

	</form>
	<script src="../static/js/jquery/jquery-3.0.0.min.js"></script>
	<script src="../static/ace/js/bootstrap.js"></script>
	<script src="../static/js/common/PipeJsApi.js"></script>

	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script src="../static/js/ccyyamsjs/archive.js"></script>
	<!-- 汉化bootstrap table -->
	<script src="static/ace/js/dist/bootstrap-table-zh-CN.js"></script>

	
		<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		
		//保存
		function submitClick() {
			var flag = true;
			var fileNametext= document.getElementById("fileName").value;
			var prodeparttext= document.getElementById("prodepart").value;
			var transfnametext= document.getElementById("transfname").value;
			var dataformtext= document.getElementById("dataform").value;
			var volumetext= document.getElementById("volume").value;
			var detailtext= document.getElementById("detail").value;
			if (fileNametext == "") {
				alert("请输入文件名称！");
				flag = false;
				return false;
			}
			if (prodeparttext == "") {
				alert("请输入移交单位名称！");
				flag = false;
				return false;
			}
			if (transfnametext == "") {
				alert("请输入移交人名称！");
				flag = false;
				return false;
			}
			if (dataformtext == "") {
				alert("请输入数据格式！");
				flag = false;
				return false;
			}
			if (volumetext == "") {
				alert("请输入容量大小！");
				flag = false;
				return false;
			}
			if (detailtext == "") {
				alert("请输入详情目录清单！");
				flag = false;
				return false;
			}
			     alert("不可为空");
			//$("#FormHandReceive").submit();
			$("#doing1").hide();
			$("#doing2").show();
			
		}
	</script>
	
	<!-- 	手写板 -->
	<script src="../static/js/signature/modernizr.js"></script>
	<script type="text/javascript">jQuery.noConflict()</script>
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
		        var currentTopic = topics[topic],
		        args = args || {};
		
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
		        "topic": topic,
		        "callback": callback
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
	(function($){
	
	$(document).ready(function() {
		
		// This is the part where jSignature is initialized.
		var $sigdiv = $("#signature").jSignature({'UndoButton':true})
		
		// All the code below is just code driving the demo. 
		, $tools = $('#tools')
		, $extraarea = $('#displayarea')
		, pubsubprefix = 'jSignature.demo.'
		
		// 点击按钮显示值
		$("#btnTest").bind('click', function(e){
			$extraarea.empty();
			// 取得所画的模板
			var data = $sigdiv.jSignature('getData', 'image');
			// 将取得值设置到文本中
			$("#DigitalSig").val(data.join(','));
			// 将取得的值设置到显示区域
			$.publish(pubsubprefix + data[0], data);
			var i = new Image()
			i.src = 'data:' + data[0] + ',' + data[1]
			$(i).appendTo($extraarea)
		}).appendTo($tools)
	
		$('<input type="button" value="重置">').bind('click', function(e){
			$extraarea.empty();
			$("#DigitalSig").empty();
			$sigdiv.jSignature('reset');
		}).appendTo($tools)
		
		if (Modernizr.touch){
			$('#scrollgrabber').height($('#content').height())		
		}
		
	})
	
	})(jQuery)
	</script>
	<!-- 摄像头 -->
	<script type="text/javascript">
		// Put event listeners into place
		window.addEventListener("DOMContentLoaded", function() {
			// Grab elements, create settings, etc.
			var canvas = document.getElementById("canvas"), context = canvas
					.getContext("2d"), //getContext唯一合法值2d
			video = document.getElementById("video"), videoObj = {
				"video" : true,
				"audio" : true
			}, errBack = function(error) {
				console.log("Video capture error: ", error.code);
			};

			// Put video listeners into place
			//navigator.getUserMedia =  navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
			if (navigator.getUserMedia) { // Standard 如果用户允许打开摄像头
				//stream为读取的视频流
				navigator.getUserMedia(videoObj, function(stream) {
					video.src = stream;
					video.play();
				}, errBack);
			} else if (navigator.webkitGetUserMedia) { // WebKit-prefixed  根据不同的浏览器写法不同
				navigator.webkitGetUserMedia(videoObj, function(stream) {
					video.src = window.webkitURL.createObjectURL(stream);
					video.play();
				}, errBack);
			} else if (navigator.mozGetUserMedia) { // Firefox-prefixed
				navigator.mozGetUserMedia(videoObj, function(stream) {
					video.src = window.URL.createObjectURL(stream);
					video.play();
				}, errBack);
			}
			/*  document.getElementById("snap").addEventListener("click", function () {
			     context.drawImage(video, 0, 0,320, 240);
			 }); */
			video.addEventListener("dblclick", function() {
				context.drawImage(video, 0, 0, 210, 150);
				document.getElementById("DigitalImage").value=canvas.toDataURL();
				//var data = canvas.toDataURL(); 
				//alert(data);

			});
		}, false);
	</script>



</body>
</html>