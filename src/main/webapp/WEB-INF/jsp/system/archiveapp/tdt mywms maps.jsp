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
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>

<link rel="stylesheet"
	href="https://js.arcgis.com/3.16/dijit/themes/claro/claro.css">
<link rel="stylesheet"
	href="https://js.arcgis.com/3.16/esri/css/esri.css">
<style>
html, body, #map {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
}
</style>
<script src="https://js.arcgis.com/3.16/"></script>
<script src="https://js.arcgis.com/3.16compact/"></script>

<script>
	var map, wmtsLayer;
	require(
			[ "esri/map", "esri/layers/WMTSLayer", "esri/layers/WMTSLayerInfo",
					"esri/geometry/Extent", "esri/layers/TileInfo",
					"esri/SpatialReference", "dojo/parser",
					
			"esri/layers/WMSLayer", "esri/layers/WMSLayerInfo",
			"esri/geometry/Extent", "dojo/_base/array", "dojo/dom","dojo/dom-construct", 

					"dijit/layout/BorderContainer", "dijit/layout/ContentPane",
					"dojo/domReady!" ],
			function(  Map, WMTSLayer, WMTSLayerInfo, Extent, TileInfo, WMSLayer, WMSLayerInfo, array, dom, domConst,
					SpatialReference, parser) {
				parser.parse();

				var bounds = new Extent({
					"xmin" : -180,
					"ymin" : -90,
					"xmax" : 180,
					"ymax" : 90,
					"spatialReference" : {
						"wkid" : 4326
					}
				});
				map = new Map("map", {
					extent : bounds
				});

				var tileInfo2 = new TileInfo({
					"dpi" : 0,
					"format" : "image/png",
					"compressionQuality" : 0,
					"spatialReference" : new SpatialReference({
						"wkid" : 4326
					}),
					"rows" : 256,
					"cols" : 256,
					"origin" : {
						"x" : -180,
						"y" : 90
					},
					"lods" : [ {
						"level" : 3,
						"scale" : 73957338.8625,
						"resolution" : 0.17578125
					}, {
						"level" : 4,
						"scale" : 36978669.43125,
						"resolution" : 0.087890625
					}, {
						"level" : 5,
						"scale" : 18489334.715625,
						"resolution" : 0.0439453125
					}, {
						"level" : 6,
						"scale" : 9244667.3578125,
						"resolution" : 0.02197265625
					}, {
						"level" : 7,
						"scale" : 4622333.67890625,
						"resolution" : 0.010986328125
					}, {
						"level" : 8,
						"scale" : 2311166.83945312,
						"resolution" : 0.0054931640625
					}, {
						"level" : 9,
						"scale" : 1155583.41972656,
						"resolution" : 0.00274658203125
					}, {
						"level" : 10,
						"scale" : 577791.70986328,
						"resolution" : 0.001373291015625
					}, {
						"level" : 11,
						"scale" : 288895.85493164,
						"resolution" : 0.0006866455078125
					}, {
						"level" : 12,
						"scale" : 144447.92746582,
						"resolution" : 0.00034332275390625
					}, {
						"level" : 13,
						"scale" : 72223.96373291,
						"resolution" : 0.000171661376953125
					}, {
						"level" : 14,
						"scale" : 36111.98186646,
						"resolution" : 8.58306884765625E-05
					}, {
						"level" : 15,
						"scale" : 18055.99093323,
						"resolution" : 4.291534423828125E-05
					}, {
						"level" : 16,
						"scale" : 9027.99546661,
						"resolution" : 2.1457672119140625E-05
					}, {
						"level" : 17,
						"scale" : 4513.99773331,
						"resolution" : 1.0728836059570313E-05
					}, {
						"level" : 18,
						"scale" : 2256.99886665,
						"resolution" : 5.3644180297851562E-06
					}, {
						"level" : 19,
						"scale" : 1128.49943333,
						"resolution" : 2.6822090148925781E-06
					}, {
						"level" : 20,
						"scale" : 564.24971666,
						"resolution" : 1.3411045074462891E-06
					} ]
				});
				var tileExtent2 = new Extent(-179.99999, -89.99999, 179.99999,
						89.99999, new SpatialReference({
							wkid : 4326
						}));
				var layerInfo2 = new WMTSLayerInfo(
						{
							tileInfo : tileInfo2,
							fullExtent : tileExtent2,
							initialExtent : tileExtent2,
							identifier : "defaultLayer",
							tileMatrixSet : "urn:ogc:def:wkss:OGC:1.0:GlobalCRS84Pixel",
							format : "png",
							style : "_null"
						});

				var resourceInfo = {
					version : "1.0.0",
					layerInfos : [ layerInfo2 ],
					copyright : "open layer"
				};

				var options = {
					serviceMode : "KVP",
					resourceInfo : resourceInfo,
					layerInfo : layerInfo2
				};

				wmtsLayer = new WMTSLayer(
						"http://www.scgis.net.cn/imap/iMapServer/defaultRest/services/NewTianditudlg/WMTS",
						options);
				map.addLayer(wmtsLayer);
				
				
				//add wms
				var wmslayer = new WMSLayerInfo({
					name : '0',
					title : '五万图幅'
				});

				var wmsresourceInfo = {
					extent : new Extent(-126.40869140625, 31.025390625,
							-109.66552734375, 41.5283203125, {
								wkid : 4326
							}),
					layerInfos : [ wmslayer ]
				};
				var wmsLayer = new WMSLayer("http://localhost:6080/arcgis/services/my/MYFIRST/MapServer/WMSServer",
						{
							resourceInfo : wmsresourceInfo,
							visibleLayers : [ '0' ]
						});
				map.addLayers([ wmsLayer ]);

			});
</script>


</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">

		<a>成果范围地图展示</a>
		<div id="map" data-dojo-type="dijit.layout.ContentPane"
			data-dojo-props="region:'center'" style="overflow:hidden;"></div>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>

	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
	</script>


</body>
</html>