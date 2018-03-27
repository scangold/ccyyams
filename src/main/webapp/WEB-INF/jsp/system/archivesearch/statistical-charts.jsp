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
<%@ include file="../index/top.jsp"%>
<!-- 百度echarts -->
<script src="plugins/echarts/echarts.min.js"></script>
<script src="static/js/echart-map/china.js"></script>
<style>
.li {
	float: left;
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
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">

							<div class="navbar-collapse collapse">
								<ul class="nav navbar-nav">
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false" style="font-family: '微软雅黑'">中队成果<span
											class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a href="javascript:;" onclick="total()">申请文件情况</a></li>
											<li><a href="javascript:;" onclick="team1()">一中队</a></li>
											<li><a href="javascript:;" onclick="team2()">二中队</a></li>
											<li><a href="javascript:;" onclick="team3()">三中队</a></li>
											<li><a href="javascript:;" onclick="team4()">四中队</a></li>
											<li><a href="javascript:;" onclick="team5()">五中队</a></li>
											<li><a href="javascript:;" onclick="team6()">六中队</a></li>
											<li><a href="javascript:;" onclick="team7()">七中队</a></li>
											<li><a href="javascript:;" onclick="team8()">八中队</a></li>
											<li><a href="javascript:;" onclick="team9()">九中队</a></li>
											<li><a href="javascript:;" onclick="team10()">十中队</a></li>
										</ul></li>
								</ul>
								<ul class="nav navbar-nav">
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false" style="font-family: '微软雅黑'">制作类型<span
											class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a href="javascript:;" onclick="bar();">第一类</a></li>
											<li><a href="javascript:;" onclick="pie();">第二类</a></li>
											<li><a href="javascript:;" onclick="bar1();">第三类</a></li>
										</ul></li>
								</ul>
							</div>
							<br> <br>
							<div id="main1"
								style="width: 1200px; height: 700px; margin: 0 auto;"></div>
							<script type="text/javascript">
								var myChart = echarts.init(document.getElementById('main1'));
								var option = {
									title : {
										text : '各中队提交情况'
									},
									color : [ '#3398DB' ],
									tooltip : {
										trigger : 'axis',
										axisPointer : { // 坐标轴指示器，坐标轴触发有效
											type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
										}
									},
									legend : {
										data : [ '数量' ]
									},
									xAxis : {
										type : 'category',
										data : [ '一中队', '二中队', '三中队', '四中队',
												'五中队', '六中队', '七中队', '八中队',
												'九中队', '十中队' ]
									},
									yAxis : [ {
										type : 'value'
									} ],
									series : [ {
										name : '数量',
										type : 'bar',
										data : [ 310, 152, 200, 330, 320, 330,
												220, 170, 220, 300 ]
									} ]
								};
								myChart.setOption(option);
							</script>
							<div class="navbar-collapse collapse">
								<ul class="nav navbar-nav">
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false" style="font-family: '微软雅黑'">制作地点<span
											class="caret"></span></a>
										<ul class="dropdown-menu" style="width: 260px;">
											<li class="li"><a href="javascript:;" onclick="mapbj();">北京</a></li>
											<li class="li"><a href="javascript:;" onclick="mapsh();">上海</a></li>
											<li class="li"><a href="javascript:;" onclick="mapxa();">陕西</a></li>
											<li class="li"><a href="javascript:;" onclick="mapsc();">四川</a></li>
											<li class="li"><a href="javascript:;"
												onclick="maphlj();">黑龙江</a></li>
											<li class="li"><a href="javascript:;" onclick="mapsx();">山西</a></li>
											<li class="li"><a href="javascript:;"
												onclick="mapnmg();">内蒙古</a></li>
											<li class="li"><a href="javascript:;" onclick="mapln();">辽宁</a></li>
											<li class="li"><a href="javascript:;" onclick="mapjl();">吉林</a></li>
											<li class="li"><a href="javascript:;" onclick="maphb();">河北</a></li>
											<li class="li"><a href="javascript:;" onclick="mapjs();">江苏</a></li>
											<li class="li"><a href="javascript:;" onclick="mapzj();">浙江</a></li>
											<li class="li"><a href="javascript:;" onclick="mapah();">安徽</a></li>
											<li class="li"><a href="javascript:;" onclick="mapfj();">福建</a></li>
											<li class="li"><a href="javascript:;" onclick="mapjx();">江西</a></li>
											<li class="li"><a href="javascript:;" onclick="mapsd();">山东</a></li>
											<li class="li"><a href="javascript:;"
												onclick="maphn1();">河南</a></li>
											<li class="li"><a href="javascript:;"
												onclick="maphb1();">湖北</a></li>
											<li class="li"><a href="javascript:;"
												onclick="maphn2();">湖南</a></li>
											<li class="li"><a href="javascript:;" onclick="mapgd();">广东</a></li>
											<li class="li"><a href="javascript:;" onclick="mapgx();">广西</a></li>
											<li class="li"><a href="javascript:;" onclick="maphn();">海南</a></li>
											<li class="li"><a href="javascript:;" onclick="mapgz();">贵州</a></li>
											<li class="li"><a href="javascript:;" onclick="mapyn();">云南</a></li>
											<li class="li"><a href="javascript:;" onclick="mapxz();">西藏</a></li>
											<li class="li"><a href="javascript:;" onclick="mapcq();">重庆</a></li>
											<li class="li"><a href="javascript:;" onclick="mapgs();">甘肃</a></li>
											<li class="li"><a href="javascript:;" onclick="mapqh();">青海</a></li>
											<li class="li"><a href="javascript:;" onclick="mapnx();">宁夏</a></li>
											<li class="li"><a href="javascript:;" onclick="mapxj();">新疆</a></li>
											<li class="li"><a href="javascript:;" onclick="maptj();">天津</a></li>
											<li class="li"><a href="javascript:;" onclick="mapam();">澳门</a></li>
											<li class="li"><a href="javascript:;" onclick="mapxg();">香港</a></li>
											<li class="li"><a href="javascript:;" onclick="">台湾</a></li>
											<li class="li"><a href="javascript:;" onclick="mapqg();">全国</a></li>
										</ul></li>
								</ul>
								<ul class="nav navbar-nav">
									<li class="dropdown"><a class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false" style="font-family: '微软雅黑'">制作量<span
											class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a href="javascript:;" onclick="outputhuabei()">华北地区</a></li>
											<li><a href="javascript:;" onclick="outputhuadong()">华东地区</a></li>
											<li><a href="javascript:;" onclick="outputhuazhong()">华中地区</a></li>
											<li><a href="javascript:;" onclick="outputhuanan()">华南地区</a></li>
											<li><a href="javascript:;" onclick="outputdongbei()">东北地区</a></li>
											<li><a href="javascript:;" onclick="outputxinan()">西南地区</a></li>
											<li><a href="javascript:;" onclick="outputxibei()">西北地区</a></li>
										</ul></li>
								</ul>
							</div>

							<div id="main"
								style="width: 1200px; height: 800px; margin: 0 auto;"></div>
							<script type="text/javascript">
								var myChart = echarts.init(document
										.getElementById('main'));
								var option = {
									tooltip : {
										trigger : 'item',
										formatter : '{b}'
									},
									series : [ {
										name : '中国',
										type : 'map',
										mapType : 'china',
										selectedMode : 'multiple',
										label : {
											normal : {
												show : true,
											},
											emphasis : {
												show : true,
											}
										},
										itemStyle : {
											normal : {
												borderColor : '#F5FFFA',
												show : true,
											},
											emphasis : {
												show : true,
											}
										},
										data : [ {
											name : '四川',
											selected : true
										} ]
									} ]
								};
								myChart.setOption(option);
							</script>
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
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
	</script>
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
	<script src="static/js/ccyyamsjs/echarts-map.js"></script>
	<script src="static/js/ccyyamsjs/echarts-data.js"></script>
</body>
</html>