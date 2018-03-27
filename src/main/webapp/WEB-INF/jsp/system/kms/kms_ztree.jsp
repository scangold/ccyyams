<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<link rel="stylesheet" href="plugins/zTree/3.3.29/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script src="plugins/echarts/echarts.min.js"></script>
<script src="plugins/echarts/macarons.js"></script>
</head>	
<body>
	
	<div class="container-fluid main-container">
		<div class="row">
			<div class="col-xs-4 col-sm-3 sidebar-offcanvas">
				<hr color="#CCCCCC" >
				<div class="row">
					<div class="col-xs-4 col-sm-3">
						<a id="addparent" href="#" class="btn btn-sm btn-success"   title="增加档案盒或卷" onclick="return false;">+卷</a> 
					</div>
					<div class="col-xs-4 col-sm-3">
						<a id="editParent" href="#" class="btn btn-sm btn-success" title="编辑盒或卷名称" onclick="return false;">..卷</a> 
					</div>
					<div class="col-xs-4 col-sm-3">
						<a id="addLeaf" href="#" class="btn btn-sm btn-success" title="增加档案" onclick="return false;">新增科技档案</a> 
					</div>
					<td style="vertical-align:top;">
					<c:if test="${QX.add == 1 }">

					</c:if>
				</td>
<!-- 					<div class="col-xs-4 col-sm-3">
						<a id="editParent" href="#" class="btn btn-xs btn-success" title="删除档案盒或卷" onclick="return false;">-卷</a> 
					</div> -->
					<!-- 
					<div class="col-xs-4 col-sm-3">
						<a id="addLeaf" href="#" class="btn btn-xs btn-success" title="增加批量档案" onclick="return false;">++档案</a> 
					</div> -->
					<!-- 					
					<div class="col-xs-4 col-sm-3">
						<a id="deleteKBox" href="#" class="btn btn-xs btn-success"  title="删除档案" onclick="return false;">-档</a> 
					</div>
					 -->
				</div>
<!-- 				<hr color="#CCCCCC" >
				 -->
				
<%-- 				<td style="vertical-align:top;">
					<c:if test="${QX.add == 1 }">
					<a id="addeleupload" href="#" class="btn btn-sm btn-success" title="增加档案" onclick="return false;">上传电子档案</a> 
					</c:if>
				</td> --%>
		<%-- 		<td style="vertical-align:top;">
					<c:if test="${QX.add == 1 }">
					<a class="btn btn-sm btn-success" onclick="upload('${KFILE_ID}');">上传电子档案</a>
					</c:if>
				</td> --%>
				
				<hr color="#CCCCCC" >
				<div class="zTreeDemoBackground left">
					<ul id="kboxtree" class="ztree"></ul>
				</div>
				<hr color="#CCCCCC" >
							<div id="text"
								style="width: 260px; height: 180px;"></div>
			</div>
			<div class="col-xs-8 col-sm-9 ">
				<iframe name="treeFrame" id="treeFrame" frameborder="0"
					src="<%=basePath%>kms/listkfile.do?currentPage=${null == pd.dnowPage || '' == pd.dnowPage?'1':pd.dnowPage}"
					style="margin: 0 auto; width: 100%; height: 100%;"></iframe>
			</div>
			<!-- /.page-content -->
		</div>

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-content -->
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!--页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<script type="text/javascript" src="plugins/zTree/3.3.29/js/jquery.ztree.core.js"></script>
	<!--删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!--日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>

</body>
	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('text'), 'macarons');

		// 指定图表的配置项和数据
			 var searchUrlCount ="/CCYYAMS/kms/getCountKMSYEAR";
	    $.ajax({
	        type: "POST",
	        url: searchUrlCount,
	        dataType: "json",
	        xhrFields: {
	            withCredentials: true,
	            useDefaultXhrHeader: false
	        },
	        crossDomain: true,
	        async: false,
	        success: function (jsonData) {//获取数据总数
	        	var alldata=[];
		        var name=[];
		        var value=[];
		        	for(var i=0;i<jsonData.length;i++)
		        		{
		        	var temp=new Object();
		        	temp.name=jsonData[i].jst;
		        	temp.value=jsonData[i].count;
		        	alldata.push(temp);
		        	name.push(temp.name);
		        	value.push(temp.value);
	        		}
	    		myChart.setOption({
	    		    title: {
	    		        text: '档案数量按月统计表',
	    		    },
	    			tooltip : {
	    		        trigger: 'axis',
	    		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	    		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	    		        }
	    			},
	    		    xAxis: {
	    		        type: 'category',
	    		        data: name,
	    	            axisTick: {
	    	                alignWithLabel: true
	    	            }
	    		    },
	    		    grid: {
	    		        left: '3%',
	    		        right: '4%',
	    		        bottom: '3%',
	    		        containLabel: true
	    		    },
	    		    yAxis: {
	    		        type: 'value'
	    		    },
	    		    series: [{
	    		    	name : '数量',
	    		        data: value,
	    		        type: 'bar'
	    		    }]
	    		});
	    		
	        }, 
	        error: function (er) {
	            alert("请求失败,请联系管理员！");
	        }
	    });
	</script>
<script type="text/javascript">
	$(top.hangge());
	

	
	//跳转页面
	function siMenu(id,fid,MENU_NAME,MENU_URL){

		top.mainFrame.tabAddHandler(id,MENU_NAME,MENU_URL);
		
	}

	//检索
	function searchs() {
		top.jzts();
		$("#userForm").submit();
	}
	var setting = {
		view : {
			selectedMulti : false
		},
		async : {
			enable : true,
			url : "kms/listFileBox.do",
			autoParam : [ "id", "id=pid" ],
			otherParam : {
				"otherParam" : "id"
			},
			dataFilter : filter
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pid"
				
			}

		},
		edit : {
			enable : true,
			showRemoveBtn : false,
			showRenameBtn : false			
		},
		callback : {
			beforeClick : beforeClick,
			beforeAsync : beforeAsync,
			onAsyncError : onAsyncError,
			onAsyncSuccess : onAsyncSuccess,
			beforeDrag: beforeDrag,
			beforeDrop: beforeDrop
			
		}
	};

	function filter(treeId, parentNode, childNodes) {
		if (!childNodes)
			return null;
		for (var i = 0, l = childNodes.length; i < l; i++) {
			childNodes[i].name = childNodes[i].kboxname.replace(/\.n/g, '.');
		}
		return childNodes;
	}
	function beforeClick(treeId, treeNode) {
		if (!treeNode.isParent) {
			alert("请选择父节点");
			return false;
		} else {
			return true;
		}
	}
	var log, className = "dark";
	function beforeAsync(treeId, treeNode) {
		className = (className === "dark" ? "" : "dark");
		showLog("[ " + getTime() + " beforeAsync ]&nbsp;&nbsp;&nbsp;&nbsp;"
				+ ((!!treeNode && !!treeNode.name) ? treeNode.name : "root"));
		return true;
	}
	function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus,
			errorThrown) {
		showLog("[ " + getTime() + " onAsyncError ]&nbsp;&nbsp;&nbsp;&nbsp;"
				+ ((!!treeNode && !!treeNode.name) ? treeNode.name : "root"));
	}
	function onAsyncSuccess(event, treeId, treeNode, msg) {
		showLog("[ " + getTime() + " onAsyncSuccess ]&nbsp;&nbsp;&nbsp;&nbsp;"
				+ ((!!treeNode && !!treeNode.name) ? treeNode.name : "root"));
	}

	function showLog(str) {
		if (!log)
			log = $("#log");
		log.append("<li class='"+className+"'>" + str + "</li>");
		if (log.children("li").length > 8) {
			log.get(0).removeChild(log.children("li")[0]);
		}
	}
	function getTime() {
		var now = new Date(), 
		h = now.getHours(), 
		m = now.getMinutes(), 
		s = now.getSeconds(), 
		ms = now.getMilliseconds();
		return (h + ":" + m + ":" + s + " " + ms);
	}

	function refreshNode(e) {
		var zTree = $.fn.zTree.getZTreeObj("kboxtree"), 
		type = e.data.type, 
		silent = e.data.silent, 
		nodes = zTree.getSelectedNodes();
		if (nodes.length == 0) {
			alert("请先选择一个父节点");
		}
		for (var i = 0, l = nodes.length; i < l; i++) {
			zTree.reAsyncChildNodes(nodes[i], type, silent);
			if (!silent)
				zTree.selectNode(nodes[i]);
		}
	}


	function beforeDrag(treeId, treeNodes) {
		for (var i=0,l=treeNodes.length; i<l; i++) {
			if (treeNodes[i].drag === false) {
				return false;
			}
		}
		return true;
	}
	function beforeDrop(treeId, treeNodes, targetNode, moveType) {
		return targetNode ? targetNode.drop !== false : true;
	
	}
			
	
	var log, className = "dark";
	function beforeDrag(treeId, treeNodes) {
		return false;
	}
	function beforeRemove(treeId, treeNode) {
		className = (className === "dark" ? "" : "dark");
		showLog("[ " + getTime() + " beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; "
				+ treeNode.name);
		return confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
	}
	function onRemove(e, treeId, treeNode) {
		showLog("[ " + getTime() + " onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; "
				+ treeNode.name);
	}
	function beforeRename(treeId, treeNode, newName) {
		if (newName.length == 0) {
			alert("节点名称不能为空.");
			var zTree = $.fn.zTree.getZTreeObj("kboxtree");
			setTimeout(function() {
				zTree.editName(treeNode)
			}, 10);
			return false;
		}
		return true;
	}
	function showLog(str) {
		if (!log)
			log = $("#log");
		log.append("<li class='"+className+"'>" + str + "</li>");
		if (log.children("li").length > 8) {
			log.get(0).removeChild(log.children("li")[0]);
		}
	}
	function getTime() {
		var now = new Date(), h = now.getHours(), m = now.getMinutes(), s = now
				.getSeconds(), ms = now.getMilliseconds();
		return (h + ":" + m + ":" + s + " " + ms);
	}

	var newCount = 1;
	
	//增加档案盒
	function addKBox(e){
		debugger;
		var zTree = $.fn.zTree.getZTreeObj("kboxtree"), isParent = e.data.isParent, nodes = zTree.getSelectedNodes(), treeNode = nodes[0];
		 top.jzts();
		var  pid;
		if (treeNode) {	
			pid=treeNode.id;
		}
	    var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="添加";
			diag.URL = '<%=basePath%>kms/goAddKBox.do?pid='+pid;
			diag.Width = 469;
			diag.Height = 510;
		    diag.CancelEvent = function(){ //关闭事件
			diag.close();
			zTree.reAsyncChildNodes(null, "refresh")};
		 	diag.show();
	}
	
	//删除
	function deleteKBox(){
		debugger;
		var zTree = $.fn.zTree.getZTreeObj("kboxtree"), 
			nodes = zTree.getSelectedNodes(), 
			treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;}	
		bootbox.confirm("确定要删除吗?", function(result) {
			if(result) {
				var url = "<%=basePath%>kms/deleteKBox.do?id="+treeNode.id;
				$.get(url,function(data){
					zTree.reAsyncChildNodes(null, "refresh");
				});
			};
		});
	}
	//编辑档案盒节点
	function editKBox() {
		var zTree = $.fn.zTree.getZTreeObj("kboxtree"), 
		nodes = zTree.getSelectedNodes(), 
		treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;
		}	
		
		var diag = new top.Dialog();
		diag.Drag=true;
		diag.Title ="修改";
		diag.URL = '<%=basePath%>kms/goEditKBox.do?id=' + treeNode.id ;
		diag.Width = 469;
		diag.Height = 510;
		diag.CancelEvent = function() { //关闭事件
			diag.close();
			zTree.reAsyncChildNodes(null, "refresh")
		};
		diag.show();

	};
	//增加档案
	function goAddKFile() {
		var zTree = $.fn.zTree.getZTreeObj("kboxtree"), 
		nodes = zTree.getSelectedNodes(), 
		treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;
		}
		siMenu('addkfile', 'addkfile', '+科技档案', 'kms/goAddKFile.do?kfboxid=' + treeNode.id);

	};
	//增加电子档案
	function addeleupload() {
		var zTree = $.fn.zTree.getZTreeObj("kboxtree"), 
		nodes = zTree.getSelectedNodes(), 
		treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("请先选择一个档案盒节点");
			return;
		}
		siMenu('eleupload', 'eleupload', '上传电子档案', 'archive/goArfreceivefilePage2.do?kfboxid=' + treeNode.id);
	};
	//移除
	function remove(e) {
		var zTree = $.fn.zTree.getZTreeObj("kboxtree"), 
		nodes = zTree.getSelectedNodes(), 
		treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;
		}
		var callbackFlag = $("#callbackTrigger").attr("checked");
		zTree.removeNode(treeNode, callbackFlag);
	};
	//移除子
	function clearChildren(e) {
		var zTree = $.fn.zTree.getZTreeObj("kboxtree"), nodes = zTree
				.getSelectedNodes(), treeNode = nodes[0];
		if (nodes.length == 0 || !nodes[0].isParent) {
			alert("请先选择一个父节点");
			return;
		}
		zTree.removeChildNodes(treeNode);
	};
	$(document).ready(function() {
		debugger;
		var hmainT = document.getElementById("treeFrame");
		var bheightT = document.documentElement.clientHeight;
		hmainT.style.width = '100%';
		hmainT.style.height = (bheightT - 26) + 'px';
		$.fn.zTree.init($("#kboxtree"), setting);
		$("#addparent").bind("click", {
			isparent : true
		}, addKBox);
		$("#editParent").bind("click", {
			isParent : true
		}, editKBox);
		$("#addLeaf").bind("click", {
			isParent : true
		}, goAddKFile);
		$("#addeleupload").bind("click", {
			isParent : true
		}, addeleupload);
		$("#refreshNode").bind("click", {
			type : "refresh",
			silent : false
		}, refreshNode);
		$("#refreshNodeSilent").bind("click", {
			type : "refresh",
			silent : true
		}, refreshNode);
		$("#addNode").bind("click", {
			type : "add",
			silent : false
		}, refreshNode);
		$("#addNodeSilent").bind("click", {
			type : "add",
			silent : true
		}, refreshNode);
		$("#deleteKBox").bind("click", {			
			silent : true
		}, deleteKBox);
	});

	
</script>

</html>

