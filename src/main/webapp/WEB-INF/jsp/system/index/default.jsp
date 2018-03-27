<i><%@page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%> <%@taglib prefix="c"
		uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
		prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	%> <!DOCTYPE html>
	<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@include file="../index/top.jsp"%>
<!-- 百度echarts -->
<style>
.li {
	float: left;
}
</style>
<script src="plugins/echarts/echarts.min.js"></script>
<script src="plugins/echarts/macarons.js"></script>
</head>
<body class="no-skin" style="width: 100%; height: 100%">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">

<!-- 							<div class="alert alert-block alert-success">
								<button type="button" class="close" data-dismiss="alert">
									<i class="ace-icon fa fa-times"></i>
								</button>
								<i class="ace-icon fa fa-check green"></i> 欢迎使用 档案信息化管理系统 CCYY AMS
								1.0 &nbsp;&nbsp; <strong class="green">
									&nbsp;四川省第一测绘工程院 档案信息化管理系统 <a href="http://localhost:8084/CCYYAMS"
									target="_blank"><small>(&nbsp;http://localhost:8084/CCYYAMS&nbsp;)</small></a>

								<i class="ace-icon fa fa-check green"></i> 欢迎使用 &nbsp;&nbsp; <strong class="green">
									&nbsp;四川省第一测绘工程院 档案信息化管理系统 <!-- <a href="http://localhost:8084/CCYYAMS"
									target="_blank"><small>(&nbsp;http://localhost:8084/CCYYAMS&nbsp;)</small></a> 

								</strong>-->

							</div> 


<table>
<tr>
<td>
<h4 style="text-align : center ;font-weight:bold">文书档案年份统计</h4>
</td>
<td>
<h4 style="text-align : center ;font-weight:bold">文书存储分布统计</h4>
</td>
<td>
<h4 style="text-align : center ;font-weight:bold">财务凭证年份统计</h4>
</td>
</tr>
<tr>
<td>
							<div id="userSta"
								style="width: 380px; height: 240px;"></div>
</td>
<td>
							<div id="storageSta"
								style="width: 380px; height: 240px;"></div>
</td>
<td>
							<div id="pz"
								style="width: 380px; height: 240px;"></div>
</td>
</tr>
<tr>
<td>
<h4 style="text-align : center ;font-weight:bold">员工学历分布统计</h4>
</td>
<td>
<h4 style="text-align : center ;font-weight:bold">科技成果年份统计</h4>
</td>
<td>
<h4 style="text-align : center ;font-weight:bold">部门员工分布统计</h4>
</td>
</tr>
<tr>
<td>
							<div id="xueli"
								style="width: 380px; height: 240px;"></div>
</td>
<td>
							<div id="lineSta"
								style="width: 380px; height: 240px;"></div>
</td>
<td>

							<div id="archiveSta"
								style="width: 380px; height: 240px;"></div>
</td>
</tr>
</table>
							<%-- <div id="userSta"
								style="width: 300px; height: 300px;"></div>
							<div id="archiveSta"
								style="width: 300px; height: 300px;"></div>
															<div class="testexcel">
								<dl class="dl-horizontal">
									<dt>
										<a href="<%=basePath%>test/exportDocLogByMouth?dates=2011-12-24"
											target="_blank"> exportDocLogByMouth?dates=2011-12-24 </a>
									</dt>
									<dd>分月文件登记簿a</dd>
								    <dt>
										<a href="<%=basePath%>test/exportDoc"
											target="_blank"> exportDoc </a>
									</dt>
									<dd>文件目录</dd>
									   <dt>
										<a href="<%=basePath%>test/exportDocDeal?id=d775c9d0a20b43048d8e57ed914eb76f"
											target="_blank"> exportDocDeal?id=d775c9d0a20b43048d8e57ed914eb76f </a>
									</dt>
									<dd>分月文件登记簿a</dd>
									<dt>分月文件登记簿.</dt>
									<dd>分月文件登记簿a</dd>
									<dt>分月文件登记簿.</dt>
									<dd>分月文件登记簿a</dd>
								</dl>
							</div>
<%-- 
							
							<div id="storageSta"
								style="width: 300px; height: 400px; float: left; margin-left: 50px"></div>
							<div id="lineSta"
								style="width: 300px; height: 400px; margin-left: 600px"></div>
 --%>

						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
	</script>
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>

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
	var myChart = echarts.init(document.getElementById('pz'), 'macarons');
			 var searchUrlCount ="/CCYYAMS/pz/getCountByyear";
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
	        	temp.name=jsonData[i].ACDOC_YEAR;
	        	temp.value=jsonData[i].count;
	        	alldata.push(temp);
	        	name.push(temp.name);
	        	value.push(temp.value);
/* 	        	$("#zcDL").append('<dt style="width: 240px;text-align : center ;margin-top: 4px;color:#438eb9 ">'+temp.name+':</dt><dd style="text-align : center;max-width: 150px;overflow: hidden;font-size:20px;text-overflow: ellipsis;white-space: nowrap;">'+temp.value+'人</dd>'); */
	        		}
	    		myChart.setOption({
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
	    		    	name : '凭证',
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
		var myChart = echarts.init(document.getElementById('archiveSta'), 'macarons');

		// 指定图表的配置项和数据
			 var searchUrlCount ="/CCYYAMS/pms/getCountByDepartment";
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
	        	for(var i=0;i<jsonData.length;i++)
	        		{
	        	var temp=new Object();
	        	temp.name=jsonData[i].department;
	        	temp.value=jsonData[i].count;
	        	alldata.push(temp);
	        		}
	    		myChart.setOption({
	    			tooltip : {},
	    			series : [ {
	    				name : '各部门人数',
	    				type : 'pie',
	    				radius : '50%',
	    				data :alldata,
	    			} ]
	    		});
	    		
	        }, 
	        error: function (er) {
	            alert("请求失败,请联系管理员！");
	        }
	    });
	</script>
	<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('xueli'));
			 var searchUrlCount ="/CCYYAMS/pms/getCountByDegree";
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
	        	for(var i=0;i<jsonData.length;i++)
	        		{
	        	var temp=new Object();
	        	temp.name=jsonData[i].DEGREE;
	        	temp.value=jsonData[i].count;
	        	alldata.push(temp);
/* 	        	$("#xlDL").append('<dt style="width: 240px;text-align : center ;margin-top: 4px;color:#438eb9 ">'+temp.name+':</dt><dd style="text-align : center;max-width: 150px;overflow: hidden;font-size:20px;text-overflow: ellipsis;white-space: nowrap;">'+temp.value+'人</dd>'); */
	        		}
	    		myChart.setOption({
	    			tooltip : {},
	    			series : [ {
	    				name : '各学历人数',
	    				type : 'pie',
	    				radius : '50%',
	    				data :alldata,
	    			} ]
	    		});
	        }, 
	        error: function (er) {
	            alert("请求失败,请联系管理员！");
	        }
	    });
	</script>

	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('storageSta'), 'macarons');

		// 指定图表的配置项和数据
	 var searchUrlCount ="/CCYYAMS/doc/getCountBycarrier";
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
	        	for(var i=0;i<jsonData.length;i++)
	        		{
	        	var temp=new Object();
	        	temp.name=jsonData[i].carrier;
	        	temp.value=jsonData[i].count;
	        	alldata.push(temp);
	        	name.push(temp.name);
	        		}
	    		myChart.setOption({
	    		title : {
	    			left:'center'
	    		},
	    		tooltip : {
	    			trigger : 'item',
	    			formatter : "{a} <br/>{b} : {c} ({d}%)"
	    		},
	    		legend : {
	    			orient : 'vertical',
	    			left : 'left',
	    			data : name
	    		},
	    		series : [
		    		        {
		    		            name: '存储及数量：',
		    		            type: 'pie',
		    		            radius : ['40%','60%'],
		    		            center: ['50%', '60%'],
		    		            avoidLabelOverlap: false,
		    		            label: {
		    		                normal: {
		    		                    show: false,
		    		                    position: 'center'
		    		                },
		    		                emphasis: {
		    		                    show: true,
		    		                    textStyle: {
		    		                        fontSize: '30',
		    		                        fontWeight: 'bold',
		    		                    }
		    		                }
		    		            },
		    		            labelLine: {
		    		                normal: {
		    		                    show: false
		    		                }
		    		            },
		    		            data:alldata,
		    		        }      
	    			]
	    		});
	        }, 
	        error: function (er) {
	            alert("请求失败,请联系管理员！");
	        }
	    });
	</script>
	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('lineSta'));
		 var searchUrlCount ="/CCYYAMS/kms/getCountAMSYEAR";
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
		        	var value=[];
		        	var name=[];
		        	for(var i=0;i<jsonData.length;i++)
		        		{
		        	var temp=new Object();
		        	temp.name=jsonData[i].YEAR;
		        	temp.value=jsonData[i].count;
		        	value.push(temp.value);
		        	name.push(temp.name);
		        		}
		    		myChart.setOption({
		    			tooltip: {
		    			    trigger: 'axis'
		    			},
		    			legend: {
		    			    data:['科技档案成果']
		    			},
		    			grid: {
		    			    left: '3%',
		    			    right: '4%',
		    			    bottom: '3%',
		    			    containLabel: true
		    			},
		    			xAxis: {
		    			    type: 'category',
		    			    data: name
		    			},
		    			yAxis: {
		    			    type: 'value'
		    			},
		    			series: [
		    			    {
		    			        name:'科技档案成果',
		    			        type:'line',
		    			        step: 'start',
		    			        data: value
		    			    }
		    			]
		    		});
		        }, 
		        error: function (er) {
		            alert("请求失败,请联系管理员！");
		        }
		    });
	</script>
</body>
	</html></i>