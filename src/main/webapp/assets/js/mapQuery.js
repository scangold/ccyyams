
//重置项目名
    $("#resetProjectName").click(function(){
    	$("#projectName").val("");
    	$("#viewProNameResult").hide();//隐藏查询结果
    	
    })
    //根据项目名称查询
    $("#searchProjectName").click(function(){
    	$("#viewProNameResult").hide();//隐藏查询结果
    	$("#zhongxin2").show();//加载图
    	
       var projectName=$("#projectName").val().replace(/^\s+|\s+$/gm,'');
       if(projectName!=""&&projectName!=null){
    		mapConstant.map.graphics.remove(mapConstant.highlightGraphic);
    		var symbol = new esri.symbol.SimpleMarkerSymbol(
    				esri.symbol.SimpleMarkerSymbol.STYLE_CIRCLE, 10,
    				new esri.symbol.SimpleLineSymbol(
    						esri.symbol.SimpleLineSymbol.STYLE_SOLID,
    						new dojo.Color([ 67, 142, 185 ]), // 颜色
    						1 // 像素
    				), new dojo.Color([ 67, 142, 185, 0.25 ]) // 颜色和透明度
    		);

    		var layerLists = [];
    		var layersQuery = {};
    		for (var i = 0; i < mapConstant.visibleLayerIDs.length; i++) {
    			layersQuery.id = new esri.tasks.QueryTask(
    					mapConstant.catologMapLayerUrl + "/"
    							+ mapConstant.visibleLayerIDs[i]);
    			layersQuery.name = new esri.tasks.Query();
    			layersQuery.name.returnGeometry = true;
    			layersQuery.name.outFields = [ "*" ];
    			layersQuery.name.outSpatialReference = mapConstant.map.spatialReference;
    			layersQuery.name.where = "projectName like'%"+projectName+"%'";
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
    				$("#viewProNameResult table tbody").empty();
    				var html="";
    				if (results.length > 0) {
    					mapConstant.queryResults=results;
    					for(var i=0;i<results.length;i++){
    					 html+="<tr ondblclick=viewTr('"+i+"') title='双击查看范围' style='cursor:pointer;'>";
                		 html+="<td class='center'>"+mapConstant.layerNames[results[i].id]+"</td>";
                		 html+="<td class='center '>"+results[i].content.features.length+"</td>";
                		 html+="<td class='center hidden-480'><a class='btn btn-xs btn-info' title='详情' onclick=viewTr('"+i+"')><i class='ace-icon fa fa-search bigger-80' style='line-height:12px;color:white;' title='详情'></i></a></td>";
                		 html+="</tr>";	
    					}
    					$("#viewProNameResult table tbody").append(html);
    				}
    				else{
    					html+="<tr><td colspan='10' class='center'>没有相关数据</td></tr>";
    	        		$("#viewProNameResult table tbody").append(html);
    				}
    				$("#viewProNameResult").show();//显示查询结果
    				$("#zhongxin2").hide();//隐藏加载图
    			}
    		} 
       }
       else{
    	   $("#projectName").tips({
				side:1,
	            msg:'请输入项目名',
	            bg:'#AE81FF',
	            time:2
	        });
       }
    })
    //查询详情
    function viewTr(id){
	id = parseInt(id);
	var highlightSymbol = new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color([255, 255, 0]), 3);
	var symbol = new esri.symbol.SimpleFillSymbol(esri.symbol.SimpleFillSymbol.STYLE_SOLID, new esri.symbol.SimpleLineSymbol(esri.symbol.SimpleLineSymbol.STYLE_SOLID, new dojo.Color([255, 255, 255, 0.35]), 1), new dojo.Color([255, 0, 255, 0.35]));
	mapConstant.highlightLayer.clear();
	
	 var infoTemplate = new esri.InfoTemplate();
	    infoTemplate.setTitle("属性信息");
	    infoTemplate.setContent("<b>项目名称: </b>${projectName}<br/>"
	                             + "<b>项目时间: </b>${projectTime}<br/>");
	    mapConstant.map.infoWindow.resize(245, 125);    
	for (var i = 0; i < mapConstant.queryResults[id].content.features.length; i++) {
		var l = mapConstant.queryResults[id].content.features[i];
		//高亮显示
        var graphic = l;
        graphic.setInfoTemplate(infoTemplate);
        graphic.setSymbol(symbol);
        mapConstant.highlightLayer.add(graphic);
	}
	// 居中显示查询结果
	var ext = getFeatureSetExtent(mapConstant.queryResults[id].content);
	mapConstant.map.setExtent(ext.expand(2.5));
     }
   

  
    function getFeatureSetExtent(features) {
        var resultUnionExtent;
        if (features.geometryType === "esriGeometryPoint") {
            //if geometry, convert points to multipoint to get extent
            var multipoint = new esri.geometry.Multipoint();
            for (var i = 0, il = features.length; i < i1; i++) {
                multipoint.addPoint(features[i].geometry);
            }
            resultUnionExtent = multipoint.getExtent();
        }
        else {
            //else call getExtent method on geometry
            for (var i = 0; i < features.features.length; i++) {
                if (i == 0) {
                    resultUnionExtent = features.features[i].geometry.getExtent();
                }
                else {
                    resultUnionExtent = resultUnionExtent.union(features.features[i].geometry.getExtent());
                }
            }
        }
        return resultUnionExtent;
    }
    
    