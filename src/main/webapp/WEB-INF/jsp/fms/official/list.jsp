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
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />


<link rel="stylesheet"
	href="plugins/zTree/3.3.29/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script src="plugins/echarts/echarts.min.js"></script>
<script src="plugins/echarts/macarons.js"></script>
</head>
<body>
	<div class="container-fluid main-container">
		<div class="row">
			
			<div class="col-xs-2 col-sm-2 ">
				<div class="row " style="padding-top: 10px">
					<div class="col-xs-6 col-sm-6">
						<a id="addparent" href="#" title="增加父节点" onclick="return false;" class="btn btn-xs btn-success"> <i
													class="ace-icon fa fa-pencil-square-o"
													title="增加目录">增加目录</i></a>
					</div>
					<div class="col-xs-6 col-sm-6">
						<a id="addLeaf" href="#" title="增加叶子节点" onclick="return false;" class="btn btn-xs btn-success"><i
													class="glyphicon glyphicon-record"
													title="增加目录">增加文件</i></a>
					</div>
					</div>
					<div class="row " style="padding-top: 10px;padding-bottom: 10px">
					<div class="col-xs-6 col-sm-6">
						<a id="editParent" href="#" title="编辑名称" onclick="return false;" class="btn btn-xs btn-success"><i
													class="glyphicon glyphicon-refresh"
													title="增加目录">编辑目录名称</i></a>
					</div>
					<div class="col-xs-6 col-sm-6">
						<a id="deleteDocBox" href="#" title="删除目录" onclick="return false;" class="btn btn-xs btn-success"><i
													class="glyphicon glyphicon-menu-up"
													title="增加目录">删除目录</i></a>
					</div>
				</div>
				<div class="zTreeDemoBackground left">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
							<div id="userSta"
								style="height: 180px;"></div>
				<div class="right"></div>
			</div>
			<div class="col-xs-10 col-sm-10">
				<iframe name="treeFrame" id="treeFrame" frameborder="0"
					src="<%=basePath%>/doc/list.do?DEPARTMENT_ID=${'' == DEPARTMENT_ID?'0':DEPARTMENT_ID}&currentPage=${null == pd.dnowPage || '' == pd.dnowPage?'1':pd.dnowPage}&isvalid=1"
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
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<script type="text/javascript"
		src="plugins/zTree/3.3.29/js/jquery.ztree.core.js"></script>

	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>

	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('userSta'));

		// 指定图表的配置项和数据
	    var searchUrlCount ="/CCYYAMS/doc/getCountByyear";
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
	        	var FILEYEAR=[];
	        	var count=[];
	        	for(var i=1;i<jsonData.length;i++)
	        		{
	        	var temp=new Object();
	        	temp.FILEYEAR=jsonData[i].FILEYEAR;
	        	temp.count=jsonData[i].count;
	        	FILEYEAR.push(temp.FILEYEAR);
	        	count.push(temp.count);
	        		}
	    		myChart.setOption({
	    		    title: {
	    		        text: '档案数量年份统计表',
	    		    },
	    			tooltip : {
	    		        trigger: 'axis',
	    		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	    		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	    		        }
	    			},
	    		    grid: {
	    		        left: '3%',
	    		        right: '4%',
	    		        bottom: '3%',
	    		        containLabel: true
	    		    },
	    			xAxis : {
	    	            type : 'category',
	    				data : FILEYEAR,
	    	            axisTick: {
	    	                alignWithLabel: true
	    	            }
	    			},
	    			yAxis : [
	    		        {
	    		            type : 'value'
	    		        }
	    		    ],
	    			series : [ {
	    				name : '个数',
	    				type : 'bar',
	    				data : count,
	    			} ]
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
			url : "official/getNodes.do",
			autoParam : [ "id", "id=fmsid", "level=lv" ],
			otherParam : {
				"otherParam" : "id"
			},
			dataFilter : filter
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "id",
				pIdKey : "pId"
				
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
			childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
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
		var now = new Date(), h = now.getHours(), m = now.getMinutes(), s = now
				.getSeconds(), ms = now.getMilliseconds();
		return (h + ":" + m + ":" + s + " " + ms);
	}

	function refreshNode(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"), type = e.data.type, silent = e.data.silent, nodes = zTree
				.getSelectedNodes();
		if (nodes.length == 0) {
			alert("请先选择一个父节点");
		}
		for (var i = 0, l = nodes.length; i < l; i++) {
			zTree.reAsyncChildNodes(nodes[i], type, silent);
			if (!silent)
				zTree.selectNode(nodes[i]);
		}
	}
//---s----------------

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
			
	//--------e----------
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
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
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
	
	function add(e){
		debugger;
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"), isParent = e.data.isParent, nodes = zTree.getSelectedNodes(), treeNode = nodes[0];
		 top.jzts();
		 var  fmsid;
		 
		if (treeNode) {	
				fmsid=treeNode.id;
		}
	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="添加";
		 diag.URL = '<%=basePath%>official/goAddDocBox.do?fmsid='+fmsid;
		 diag.Width = 469;
		 diag.Height = 510;
		 diag.CancelEvent = function(){ //关闭事件
				diag.close();
				zTree.reAsyncChildNodes(null, "refresh")
		 };
		 diag.show();
	}

	
	//删除
	function deleteDocBox(){
		debugger;
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree
		.getSelectedNodes(), treeNode = nodes[0];
	
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;
			}	
	bootbox.confirm("确定要删除吗?", function(result) {
			if(result) {
			
				var url = "<%=basePath%>official/deleteDocBox.do?id="+treeNode.id;
				$.get(url,function(data){
					zTree.reAsyncChildNodes(null, "refresh");
				
				});
			};
		});
	}
	
	function edit() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree
				.getSelectedNodes(), treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;
		}	
		
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="修改";
		 diag.URL = '<%=basePath%>official/goEditDocBox.do?id=' + treeNode.id;
		;
		diag.Width = 469;
		diag.Height = 510;
		diag.CancelEvent = function() { //关闭事件
			diag.close();
			zTree.reAsyncChildNodes(null, "refresh")
		};
		diag.show();

	};
	function goAddDoc() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree
				.getSelectedNodes(), treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;
		}
		siMenu('adddoc', 'adddoc', '添加Doc', 'doc/goAddDoc.do?fmsid='
				+ treeNode.id);
		//跳转
		//window.location.href='doc/goAddDoc.do?fmsid='+treeNode.id;

	};

	function remove(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree
				.getSelectedNodes(), treeNode = nodes[0];
		if (nodes.length == 0) {
			alert("请先选择一个节点");
			return;
		}
		var callbackFlag = $("#callbackTrigger").attr("checked");
		zTree.removeNode(treeNode, callbackFlag);
	};
	function clearChildren(e) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"), nodes = zTree
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
		$.fn.zTree.init($("#treeDemo"), setting);
		$("#addparent").bind("click", {
			isparent : true
		}, add);

		$("#editParent").bind("click", {
			isParent : true
		}, edit);
		$("#addLeaf").bind("click", {
			isParent : true
		}, goAddDoc);

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
		$("#deleteDocBox").bind("click", {			
			silent : true
		}, deleteDocBox);
	});
</script>
</html>
