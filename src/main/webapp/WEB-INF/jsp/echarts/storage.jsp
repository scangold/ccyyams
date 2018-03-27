<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../system/index/top.jsp"%>
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
<script src="plugins/echarts/echarts.min.js"></script>
</head>
<body class="no-skin">
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">
							<div id="lineSta"
								style="width:1000px;height:500px"></div>

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
	<%@ include file="../system/index/foot.jsp"%>
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
	
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		//检索
		function tosearch(){
			top.jzts();
			$("#FILELISTForm").submit();
		}
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');
				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
			
			//复选框全选控制
			var active_class = 'active';
			$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
				var th_checked = this.checked;//checkbox inside "TH" table header
				$(this).closest('table').find('tbody > tr').each(function(){
					var row = this;
					if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
					else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
				});
			});
		});
	</script>
			<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('lineSta'));
	     var searchUrlCount ="http://localhost:8081/CCYYAMS/echarts/test";
	    $.ajax({
	        type: "GET",
	        url: searchUrlCount,
	        dataType: "json",
	        xhrFields: {
	            withCredentials: true,
	            useDefaultXhrHeader: false
	        },
	        crossDomain: true,
	        async: false,
	        success: function (jsonData) {//获取数据总数
	        	var obj=jsonData.pzyear
	        	var dataPie=[];
	        	var Piename=[];
	        	for(var i=0;i<obj.length;i++)
	        		{
	        	var temp=new Object();
	        	temp.name=obj[i].acdoc_year;
	        	temp.value=obj[i].a;
	        	dataPie.push(temp.value);
	        	Piename.push(temp.name);
	        		}
	    		myChart.setOption({
	    			title: {
	    			    text: '每年凭证数'
	    			},
	    			tooltip: {
	    			    trigger: 'axis'
	    			},
	    			legend: {
	    			    data:[ '凭证数']
	    			},
	    			grid: {
	    			    left: '3%',
	    			    right: '4%',
	    			    bottom: '3%',
	    			    containLabel: true
	    			},
	    			xAxis: {
	    			    type: 'category',
	    			    data: Piename
	    			},
	    			yAxis: {
	    			    type: 'value'
	    			},
	    			series: [
	    			    {
	    			        name:'凭证数',
	    			        type:'line',
	    			        step: '凭证数',
	    			        data: dataPie
	    			    }
	    			]
	    		});
	        }, 
	        error: function (er) {
	            alert("基站总数请求失败,请联系管理员！");
	        }
	    });
	    		</script>
</body>
</html>