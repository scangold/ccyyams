
	
var maphelper = new function() {

	this.init = function() {
		/*
		 * esri.config.defaults.io.proxyUrl =
		 * "http://localhost/DotNet/proxy.ashx";
		 * esriConfig.defaults.io.alwaysUseProxy = false;
		 */
		// 把token字符串替换为你申请的token字符串。
		var token = "RXIRa_3tG41suklB3TPvfwMJHFCDa2p9kVjL90_Zbqnot0YqDfAfpHFkW7S-Luup";
		var initialExtent = new esri.geometry.Extent({
			"xmin" : mapConstant.extent[0],
			"ymin" : mapConstant.extent[1],
			"xmax" : mapConstant.extent[2],
			"ymax" : mapConstant.extent[3],
			"spatialReference" : {
				"wkid" : 4326
			}
		});

		// 创建一个地图对象，设置其容器为mapContainer
		mapConstant.map = new esri.Map("mapContainer", {
			extent : esri.geometry.geographicToWebMercator(initialExtent),
			slider:false,
			maxZoom:15,
			minZoom:0
		});
		 //比例尺  
        var scalebar = new esri.dijit.Scalebar({  
            map: mapConstant.map,//地图对象  
            attachTo: "bottom-left",//控件的位置，左下角  
            scalebarStyle: "ruler",//line 比例尺样式类型  
            scalebarUnit: "metric"//显示地图的单位，这里是km  
        }); 
		// 天地图dlg
		mapConstant.tianDiTuDlgMapLayer = new scgc.layers.SCGISTiledMapServiceLayer(
				mapConstant.SCTileDlgMapUrl,{id:"dlg"});
		dojo.connect(mapConstant.tianDiTuDlgMapLayer, "onTokenExpired",
				function(json) {
					mapConstant.tianDiTuDlgMapLayer.setToken(token);
				});
		
        
		// 天地图dom
		mapConstant.tianDiTuDomgMapLayer = new scgc.layers.SCGISTiledMapServiceLayer(
				mapConstant.SCTileDomMapUrl,{id:"dom"});

		dojo.connect(mapConstant.tianDiTuDomgMapLayer, "onTokenExpired",
				function(json) {
					mapConstant.tianDiTuDomgMapLayer.setToken(token);
				});

		mapConstant.tianDiTuDomgMapLayer.setVisibility(false);
		//mapConstant.map.addLayers([mapConstant.tianDiTuDlgMapLayer,mapConstant.tianDiTuDomgMapLayer]);
		
		
		// 工人图层
		mapConstant.monitor_layer = new esri.layers.GraphicsLayer({
			"id" : "monitor"
		});
		mapConstant.map.addLayer(mapConstant.monitor_layer);
		// 轨迹图层
		mapConstant.track_layer = new esri.layers.GraphicsLayer({
			"id" : "track"
		});
		mapConstant.map.addLayer(mapConstant.track_layer);
		// 业务地图
		var baseMapUrl = new esri.layers.ArcGISDynamicMapServiceLayer(
				mapConstant.baseMapUrl, {
					id : "baseMapUrl"
				});
		mapConstant.map.addLayer(baseMapUrl);
		/*dojo.connect(mapConstant.map,"onExtentChange",showExtent);*/
		//目录数据
		var catologMapLayer = new esri.layers.ArcGISDynamicMapServiceLayer(
				mapConstant.catologMapLayerUrl, {
					id : "catologMapLayerUrl"
				});
		mapConstant.map.addLayer(catologMapLayer);
		if (catologMapLayer.loaded) {
			buildLayerList(catologMapLayer);
			
		} else {
			dojo.connect(catologMapLayer, "onLoad", buildLayerList);
			
		}
		// GeometryService
		mapConstant.GeometryService = new esri.tasks.GeometryService(
				mapConstant.GeometryServerUrl);
		mapConstant.GeometryServiceForRegion = new esri.tasks.GeometryService(
				mapConstant.GeometryServerUrl);
		//高亮显示图层
		mapConstant.highlightLayer = new esri.layers.GraphicsLayer({"id":"highlight"});
		mapConstant.map.addLayer(mapConstant.highlightLayer);
		//隐患点显示图层
		//高亮显示图层
		mapConstant.hazardLayer = new esri.layers.GraphicsLayer({"id":"hazard"});
		mapConstant.map.addLayer(mapConstant.hazardLayer);
		// 激活工具条
		mapConstant.navToolbar = new esri.toolbars.Navigation(mapConstant.map);
		mapConstant.drawToolbar = new esri.toolbars.Draw(mapConstant.map, {
			showTooltips : true
		});
		mapConstant.drawToolbar.pointSymbol = new esri.symbol.SimpleMarkerSymbol(
				esri.symbol.SimpleMarkerSymbol.STYLE_CIRCLE, 10,
				new esri.symbol.SimpleLineSymbol(
						esri.symbol.SimpleLineSymbol.STYLE_SOLID,
						new dojo.Color([ 20, 20, 20 ]), // 颜色
						1 // 像素
				), new dojo.Color([ 20, 20, 20, 0.25 ]) // 颜色和透明度
		);
		mapConstant.drawToolbar.lineSymbol = new esri.symbol.SimpleLineSymbol(
				esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color([ 20,
						20, 20 ]), 2);
		mapConstant.drawToolbar.fillSymbol = new esri.symbol.SimpleFillSymbol(
				esri.symbol.SimpleFillSymbol.STYLE_SOLID,
				new esri.symbol.SimpleLineSymbol(
						esri.symbol.SimpleLineSymbol.STYLE_solid,
						new dojo.Color([ 20, 20, 20 ]), 2), new dojo.Color([
						20, 20, 20, 0.25 ]));
		dojo.connect(mapConstant.drawToolbar, "onDrawEnd", addGraphic);
		//设置鼠标
		mapConstant.map.setMapCursor("url('static/images/cursor1.cur'),auto");
	
		
		//滚轮事件解决IE不能缩放的问题

		if (navigator.userAgent.indexOf("MSIE") >= 0 || !!window.ActiveXObject || "ActiveXObject" in window) { //如果是IE浏览器
		dojo.connect(mapConstant.map, "onMouseWheel", myMouseWheelHandler);
		}
		//showRegionTable();
	}
	function myMouseWheelHandler(event) {
        var zoom=mapConstant.map.getZoom();
		if(event.wheelDelta){//120或者-120
			mapConstant.map.setZoom(zoom+event.wheelDelta/120);
		}
	else if(event.detail){//3或者-3 火狐浏览器
		mapConstant.map.setZoom(zoom+event.wheelDelta/3);
		
	}
		
	}// 显示dlg
	/*function showExtent(extent){
		console.log("extent:"+ extent.xmin+","+extent.ymin+","+extent.xmax+","+extent.ymax);
		}*/
	

	// 加载管线业务图层
	function buildLayerList(layer) {
		//图层管理设置；
		var layerSetting = {
		    view: {
		        showIcon: false
		    },
		    data: {
		        simpleData: {
		            enable: true
		        },
		        key: {
		            title: "title"
		        }
		    },
		    check: {
		        enable: true,
		        chkDisabledInherit: false
		    },
		    callback: {
		        onCheck: getCheckedNodes
		    }
		};
		var node = {};
		var vecLayerNodes = [];
		var layerinfos = layer.layerInfos;
		if (layerinfos != null && layerinfos.length > 0) {
			for (var i = 0, j = layerinfos.length; i < j; i++) {
				var info = layerinfos[i];
				var array =info.name.split("-");
	            var node = new Object();
	            if (info.defaultVisibility) {
	            if (array[0] == "all") {
	                node.id = array[1];
	                node.pId = "-1";
	                node.value = array[2];
	                node.title = array[2];
	                node.name = array[2];
	                node.open = true;
	                node.checked=true;
	            }
	            else if (array[1] == "bb" || array[1] == "aa" || array[1] == "a1" || array[1] == "a2" || array[1] == "a3" || array[1] == "b1") {
	                node.id = array[1];
	                node.pId = array[0];
	                node.value = array[2];
	                node.title = array[2];
	                node.name = array[2];
	                node.open = true;
	                node.checked=true;
	            }
	            else {
	                node.id = info.id;
	                node.pId = array[0];
	                node.value = array[2];
	                node.title = array[2];
	                node.name = array[2];
	                node.checked=true;
	                mapConstant.visibleLayerIDs.push(info.id);
	                mapConstant.layerNames[info.id] = array[2];
	            }
	            vecLayerNodes.push(node);
			}
			}
			//矢量图层管理
	        $.fn.zTree.init($("#layerManagement"), layerSetting, vecLayerNodes);
	        var zTree = $.fn.zTree.getZTreeObj("layerManagement");
	        zTree.setting.check.chkboxType = { "Y": "ps", "N": "ps" };
		}
		function getCheckedNodes() {
			var zTree = $.fn.zTree.getZTreeObj("layerManagement");
		    var checkedNodes = zTree.getCheckedNodes();
			var visible = [];
			 if (checkedNodes.length != 0) {
			        for (var i = 0; i < checkedNodes.length; i++) {
			            if (checkedNodes[i].isParent == false && checkedNodes[i].level != 0) {
			            	visible.push(checkedNodes[i].id);
			            }
			        }
			        mapConstant.visibleLayerIDs = visible;
			 }
			
			 else{
				 mapConstant.visibleLayerIDs = [];
				 visible.push(-1); 
			 }

			
			layer.setVisibleLayers(visible);
		}

	}
	// 地图工具
	$('#mapTools ul li')
			.each(
					function(i) {
						 if (i == 0) {// 全图
							$(this)
									.click(
											function() {
												mapConstant.map
														.setExtent(new esri.geometry.Extent(
																mapConstant.extent[0], mapConstant.extent[1],
																mapConstant.extent[2], mapConstant.extent[3]));
											})
						} else if (i == 1) {// 放大
							$(this)
									.click(
											function() {
												mapConstant.navToolbar
														.activate(esri.toolbars.Navigation.ZOOM_IN);
											})
						} else if (i == 2) {// 缩小
							$(this)
									.click(
											function() {
												mapConstant.navToolbar
														.activate(esri.toolbars.Navigation.ZOOM_OUT);
											})
						} else if (i == 3) {// 前视
							$(this).click(function() {
								mapConstant.navToolbar.zoomToPrevExtent();
							})
						} else if (i == 4) {// 后视
							$(this).click(function() {
								mapConstant.navToolbar.zoomToNextExtent();
							})
						} else if (i == 5) {// 测距
							$(this)
									.click(
											function() {
												mapConstant.drawType = 1;
												mapConstant.drawToolbar
														.activate(esri.toolbars.Draw.POLYLINE);
												mapConstant.map.setMapCursor("url('static/images/cursor2.cur'),auto");
											})
						} else if (i == 6) {// 测面
							$(this)
									.click(
											function() {
												mapConstant.drawType = 1;
												mapConstant.drawToolbar
														.activate(esri.toolbars.Draw.POLYGON);
												mapConstant.map.setMapCursor("url('static/images/cursor2.cur'),auto");
											})
						} else if (i == 7) {// 属性
							$(this)
									.click(
											function() {
												mapConstant.drawType = 2;
												mapConstant.drawToolbar
														.activate(esri.toolbars.Draw.POINT);
												mapConstant.map.setMapCursor("help");
												

											})
						} else if (i == 8) {// 清除
							$(this).click(function() {
								mapConstant.map.setMapCursor("url('static/images/cursor1.cur'),auto");
								mapConstant.drawToolbar.deactivate();
								mapConstant.navToolbar.deactivate();
								mapConstant.map.graphics.clear();
								mapConstant.map.infoWindow.hide();
								mapConstant.highlightLayer.clear();
								mapConstant.track_layer.clear();
								mapConstant.hazardLayer.clear();
								//清除测量结果
								$("#measure").css("display", "none");
								mapConstant.isShow = false;
									


							})
						} 
					});

	function addGraphic(evt) {
		if (mapConstant.drawType == 1) {
			doMeasure(evt);
		} else if (mapConstant.drawType == 2) {
			doAttriQuery(evt);
		} else {
			addRegionReady(evt);
		}
		mapConstant.map.graphics.disableMouseEvents();
		mapConstant.highlightLayer.clear();
	}
	var doAttriQuery = function(evt) {
		$("#zhongxin2").show();//加载图
		mapConstant.map.graphics.remove(mapConstant.highlightGraphic);
		var geometry = evt;
		var symbol = new esri.symbol.SimpleMarkerSymbol(
				esri.symbol.SimpleMarkerSymbol.STYLE_CIRCLE, 10,
				new esri.symbol.SimpleLineSymbol(
						esri.symbol.SimpleLineSymbol.STYLE_SOLID,
						new dojo.Color([ 67, 142, 185 ]), // 颜色
						1 // 像素
				), new dojo.Color([ 67, 142, 185, 0.25 ]) // 颜色和透明度
		);
		var graphic = new esri.Graphic(geometry, symbol);
		// 清除上一次的画图内容
		
		mapConstant.map.graphics.clear();
		mapConstant.map.graphics.add(graphic);
		// 属性查询
		var qGeom, point, pxWidth, padding;
		point = evt;
		pxWidth = mapConstant.map.extent.getWidth() / mapConstant.map.width;
		padding = 10 * pxWidth;
		qGeom = new esri.geometry.Extent({
			"xmin" : point.x - padding,
			"ymin" : point.y - padding,
			"xmax" : point.x + padding,
			"ymax" : point.y + padding,
			"spatialReference" : point.spatialReference
		});
		var layerLists = [];
		var layersQuery = {};
		if(mapConstant.visibleLayerIDs.length>0){
		for (var i = 0; i < mapConstant.visibleLayerIDs.length; i++) {
			layersQuery.id = new esri.tasks.QueryTask(
					mapConstant.catologMapLayerUrl + "/"
							+ mapConstant.visibleLayerIDs[i]);
			layersQuery.name = new esri.tasks.Query();
			layersQuery.name.returnGeometry = true;
			layersQuery.name.outFields = [ "*" ];
			layersQuery.name.geometry = qGeom;
			layersQuery.name.outSpatialReference = mapConstant.map.spatialReference;
			layersQuery.name.where = "1 = 1";
			layerLists.push(layersQuery.id.execute(layersQuery.name));
		}
		var dList = new dojo.DeferredList(layerLists);
		dList.then(handleQueryResults);
		function handleQueryResults(featureSet) {
			if (featureSet.length > 0) {
				var results = [];
				for (var i = 0; i < featureSet.length; i++) {
					if (featureSet[i][1].features.length > 0) {
						var result = {};
						result.id = mapConstant.visibleLayerIDs[i];
						result.content = featureSet[i][1];
						results.push(result);
					}
				}
				if (results.length > 0) {

					var templateInfo = "<div id='divAttributes'><div><select onchange='layerChange(this.options[this.options.selectedIndex].id)' style='width: 100%;text-align:center;'>";
					for (var i = 0; i < results.length; i++) {
						if (i == 0) {
							templateInfo += "<option  id='" + i
									+ "' selected ='selected'>"
									+ mapConstant.layerNames[results[i].id]
									+ "</option>";
						} else {
							templateInfo += "<option  id='" + i + "'>"
									+ mapConstant.layerNames[results[i].id]
									+ "</option>";
						}
					}
					mapConstant.queryResults = results;
					templateInfo += "</select></div><div id='attriContent'></div></div><div id='divBY' style='display:none;'> <button onclick='backToDivAttr()' type='button'"+
								"style='position: relative; width: 50%; left: 25%;'class='btn btn-info'><i class='icon-undo bigger-110'></i> 返回</button></div>";

					mapConstant.map.infoWindow.setTitle("属性查询");
					mapConstant.map.infoWindow.setContent(templateInfo);
					mapConstant.map.infoWindow.resize(300, 275);
					var screenPnt = mapConstant.map.toScreen(evt);
					mapConstant.map.infoWindow.show(screenPnt, mapConstant.map
							.getInfoWindowAnchor(screenPnt));

					layerChange(0);
					$("#zhongxin2").hide();//加载图
					// mapConstant.map.infoWindow.on("hide",hideInfoWindow);

				}
				else{
					alert("无查询结果！");
				}
			}
		}
		}
		else{
			alert("请在图层控制中勾选需要查询的图层！");
		}
	}
	// 测距、测面
	var doMeasure = function(evt) {
		mapConstant.drawToolbar.deactivate();
		mapConstant.map.setMapCursor("url('static/images/cursor1.cur'),auto");		
		var geometry = evt;
		switch (geometry.type) {
		case "polyline":
			var length = geometry.paths[0].length;
			mapConstant.showPt = new esri.geometry.Point(
					geometry.paths[0][length - 1],
					mapConstant.map.spatialReference);
			var lengthParams = new esri.tasks.LengthsParameters();
			lengthParams.lengthUnit = esri.tasks.GeometryService.UNIT_METER;
			lengthParams.polylines = [ geometry ];
			mapConstant.GeometryService.lengths(lengthParams);
			var symbol = new esri.symbol.SimpleLineSymbol(
					esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color([
							67, 142, 185 ]), 3);
			dojo.connect(mapConstant.GeometryService, "onLengthsComplete",
					outputLength);

			break;
		case "polygon":
			mapConstant.showPt = new esri.geometry.Point(geometry.rings[0][0],
					mapConstant.map.spatialReference);
			var areasAndLengthParams = new esri.tasks.AreasAndLengthsParameters();
			areasAndLengthParams.lengthUnit = esri.tasks.GeometryService.UNIT_METER;
			areasAndLengthParams.areaUnit = esri.tasks.GeometryService.UNIT_SQUARE_METERS;

			this.outSR = new esri.SpatialReference({
				wkid : 102113
			});
			mapConstant.GeometryService
					.project(
							[ geometry ],
							this.outSR,
							function(geometry) {
								mapConstant.GeometryService
										.simplify(
												geometry,
												function(simplifiedGeometries) {
													areasAndLengthParams.polygons = simplifiedGeometries;
													areasAndLengthParams.polygons[0].spatialReference = new esri.SpatialReference(
															102113);
													mapConstant.GeometryService
															.areasAndLengths(areasAndLengthParams);

												});
							});
			var symbol = new esri.symbol.SimpleFillSymbol(
					esri.symbol.SimpleFillSymbol.STYLE_SOLID,
					new esri.symbol.SimpleLineSymbol(
							esri.symbol.SimpleLineSymbol.STYLE_SOLID,
							new dojo.Color([ 67, 142, 185 ]), 3),
					new dojo.Color([ 67, 142, 185, 0.25 ]));
		/*	if(outputArea!=undefined||outputArea!=null){
			dojo.disconnect(mapConstant.GeometryService,
					"onAreasAndLengthsComplete", outputArea);
			}*/
			dojo.connect(mapConstant.GeometryService,
					"onAreasAndLengthsComplete", outputAreaAndLength);
			break;
		}
		var graphic = new esri.Graphic(geometry, symbol);
		// 清除上一次的画图内容
		mapConstant.map.graphics.clear();
		mapConstant.map.graphics.add(graphic);
	}

	function outputLength(evtObj) {
		var result = evtObj;
		if (parseInt(String(result.lengths[0])) > 1000) {
			showmeasureInfo(mapConstant.showPt, (result.lengths[0] / 1000)
					.toFixed(3), "千米");
		} else {
			showmeasureInfo(mapConstant.showPt, result.lengths[0].toFixed(3),
					"米");
		}
	}
	;
	function outputAreaAndLength(evtObj) {
		
		var result = evtObj;
		if (parseInt(String(result.areas[0])) > 1000000) {
			showmeasureInfo(mapConstant.showPt, (result.areas[0] / 1000000)
					.toFixed(3), "平方千米");
		} else {
			showmeasureInfo(mapConstant.showPt, result.areas[0].toFixed(3),
					"平方米");
		}
		
	}
	//var isShow = false;
	function showmeasureInfo(showPnt, data, unit) {
		var measureDiv = $("#measure");
		
		var screenPnt = mapConstant.map.toScreen(showPnt);
		measureDiv.css("left", screenPnt.x + "px");
		measureDiv.css("top", screenPnt.y + "px");
		measureDiv.css("position", "absolute");
		measureDiv.css("height", "30px");
		measureDiv.css("background", "#fff");
		measureDiv.css("border", "1px solid");
		measureDiv.css("display", "block");
		measureDiv.css("line-height", "30px");
		mapConstant.isShow = true;
		measureDiv.css("z-index", "999");
		if (unit === "千米") {
			measureDiv.css("width", "104px");
		} else {
			measureDiv.css("width", "150px");
		}
		$("#result").html(data + unit);
		$("#infoclose").click(function() {
			mapConstant.map.graphics.clear();
			measureDiv.css("display", "none");
			mapConstant.isShow = false;
		});

		mapConstant.map.on("pan-start", function() {
			measureDiv.css("display", "none");
		});

		mapConstant.map.on("pan-end", function(panend) {
			if (mapConstant.isShow == true) {
				screenPnt = mapConstant.map.toScreen(showPnt);
				measureDiv.css("left", screenPnt.x-20 + "px");
				measureDiv.css("top", screenPnt.y-20 + "px");
				measureDiv.css("position", "absolute");
				measureDiv.css("height", "30px");
				measureDiv.css("display", "block");
			}
		});
		mapConstant.map.on("zoom-start", function() {
			measureDiv.css("display", "none");
		});
		mapConstant.map.on("zoom-end", function() {
			if (mapConstant.isShow == true) {
				screenPnt = mapConstant.map.toScreen(showPnt);
				measureDiv.css("left", screenPnt.x + "px");
				measureDiv.css("top", screenPnt.y + "px");
				measureDiv.css("position", "absolute");
				measureDiv.css("height", "30px");
				measureDiv.css("display", "block");
			}
		});
	}
	;
	
}
		dojo.ready(maphelper.init); 


function layerChange(evt) {
	mapConstant.map.graphics.clear();
	var templateInfo = "<table style='width:100%;table-layout:fixed;word-break:break-all;'>";
	var highlightSymbol = null;
	for (var j = 0; j < mapConstant.queryResults[evt].content.fields.length; j++) {
		debugger;
		var itemName=mapConstant.queryResults[evt].content.fields[j].name;
		if(itemName!="OBJECTID"&&itemName!="donework"&&itemName!="featureid"&&itemName!="layername"&&itemName!="Enabled"&&itemName!="taskID"){
			if(itemName=="Shape.STLength()"||itemName=="SHAPE_Length"||itemName=="Shape_Length"){itemName="长度";}
			if(itemName=='projectName'){
				debugger;
				templateInfo += "<tr><td style='font-size:16px;text-align:left;width:50%;'>"
					+ itemName
					+ ":</td><td style='text-align:left;width:50%; '><a onclick='queryRelaFiles(\""+mapConstant.queryResults[evt].content.features[0].attributes[mapConstant.queryResults[evt].content.fields[j].prj_id]+"\")'>"
					+ mapConstant.queryResults[evt].content.features[0].attributes[mapConstant.queryResults[evt].content.fields[j].name]
					+ "</a><td></tr>"
			}
			else{
				 /* style='border-bottom:1px dashed  #438eb9;'*/
				templateInfo += "<tr><td style='font-size:16px;text-align:left;width:50%; '>"
					+ itemName
					+ ":</td><td style='text-align:left;width:50%; '>"
					+ mapConstant.queryResults[evt].content.features[0].attributes[mapConstant.queryResults[evt].content.fields[j].name]
					+ "<td></tr>";	
			}
	
		}
	}
	templateInfo+="</table>";
	$("#attriContent").empty().html(templateInfo);
	switch (mapConstant.queryResults[evt].content.geometryType) {
	case "esriGeometryPoint":
		highlightSymbol = new esri.symbol.SimpleMarkerSymbol(
				esri.symbol.SimpleMarkerSymbol.STYLE_SQUARE, // 样式,STYLE_CIRCLE(●),STYLE_CROSS(+),STYLE_DIAMOND(◆),STYLE_SQUARE(■),STYLE_X(X)
				10, // 像素
				new esri.symbol.SimpleLineSymbol(
						esri.symbol.SimpleLineSymbol.STYLE_SOLID, // 样式,STYLE_DASH(破折号),STYLE_DASHDOT(点划线),STYLE_DASHDOTDOT,STYLE_DOT(点),STYLE_NULL,STYLE_SOLID(实线)
						new dojo.Color([ 0, 255, 255 ]), // 颜色
						6 // 像素
				), new dojo.Color([ 0, 255, 255, 0.25 ]) // 颜色和透明度
		);
		;
		break;
	case "esriGeometryPolyline":
		highlightSymbol = new esri.symbol.SimpleLineSymbol(
				esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color([ 0,
						255, 255, 1 ]), 6);
		break;
	case "esriGeometryPolygon":
		highlightSymbol = new esri.symbol.SimpleFillSymbol(
				esri.symbol.SimpleFillSymbol.STYLE_SOLID,
				new esri.symbol.SimpleLineSymbol(
						esri.symbol.SimpleLineSymbol.STYLE_SOLID,
						new dojo.Color([ 67, 142, 185 ]), 3),
				new dojo.Color([ 67, 142, 185, 0.25 ]));
		break;
	}
	
		
	mapConstant.highlightGraphic = new esri.Graphic(
			mapConstant.queryResults[evt].content.features[0].geometry,
			highlightSymbol);
	mapConstant.map.graphics.add(mapConstant.highlightGraphic);
}

function queryRelaFiles(prj_id){
	//alert("将要查询"+prj_id+"相关档案信息！");
	//top.mainFrame.tabAddHandler('prj_relative_files','项目档案信息','archiveapp/viewProRelaFiles.do?prj_id='+prj_id);
	top.mainFrame.tabAddHandler('prj_relative_files','项目档案信息','archiveapp/viewProRelaFiles.do?prj_id='+'1422');
}



