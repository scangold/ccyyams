var mapConstant;
mapConstant={
		   SCTileDlgMapUrl:"http://www.scgis.net.cn/imap/iMapServer/DefaultRest/services/SCTileMap/mapserver",
		   SCTileDomMapUrl:"http://www.scgis.net.cn/iMap/iMapServer/DefaultRest/services/newtianditudom/mapserver",
		   //dynamicMapLayerUrl:"http://218.89.185.162:19901/arcgis/rest/services/Pipeline/pxpopeline/MapServer", 
		   baseMapUrl:"http://218.89.185.162:25401/arcgis/rest/services/fileManage/chinaBoua/MapServer",
		   catologMapLayerUrl:"http://218.89.185.162:25401/arcgis/rest/services/fileManage/catolog/MapServer",
		   GeometryServerUrl:"http://218.89.185.162:25401/arcgis/rest/services/Utilities/Geometry/GeometryServer",
		   queryResults:null,//查询结果
		   GeometryService:null,
		   tianDiTuDlgMapLayer:null,
		   tianDiTuDomgMapLayer:null,
		   monitor_layer:null,
		  
		   layerNames:[],//对应图层名称
		   visibleLayerIDs:[],
		   queryResults:{},//保存查询结果
		   highlightGraphic:null,//高亮显示查询结果
		   highlightLayer:null,//高亮显示图层
		   onMouseOverEvents:null,
		   navToolbar:null,//导航工具条
		   drawToolbar:null,//测距测面等工具条
		   showPt: null,//测量工具停止时最后一个坐标点
		   drawType:null,//1:代表测量 2代表属性查询 3代表增加片区
		   map:null,
		   extent:[93.86341402406167,25.58469666348623,113.76028902406102,35.007952696668426],//龙泉驿地图显示范围
		   layer_loaded:false,// 判断图层控制器是否打开
		   worker_loaded:true,//判断人员是否加载
		   isFullscreen:false//判断是否全屏显示
		}




dojo.require("esri.map");
dojo.require("esri.toolbars.navigation");
dojo.require("dijit.Toolbar");
dojo.require("dijit.layout.BorderContainer");
dojo.require("dijit.layout.ContentPane");
dojo.require("esri.layers.WebTiledLayer");
dojo.require("esri.layers.ArcGISDynamicMapServiceLayer");
dojo.require("esri.layers.WMSLayer");
dojo.require("esri.dijit.InfoWindowLite");
dojo.require("esri.InfoTemplate");
dojo.require("esri.layers.FeatureLayer");
dojo.require("esri.toolbars.draw");
dojo.require("dijit.dijit");
dojo.require("esri.dijit.Measurement");
dojo.require("dijit.WidgetSet");
 /*图层控制*/
dojo.require("dijit.layout.AccordionContainer");
dojo.require("esri.dijit.Legend");
dojo.require("esri.arcgis.utils");
dojo.require("dijit.form.CheckBox");

dojo.require("esri.geometry.normalizeUtils");
dojo.require("esri.tasks.BufferParameters");
dojo.require("esri.config");
dojo.require("dojo._base.array");
dojo.require("esri.dijit.Scalebar");

/*dojo.require("esri.layers.WMTSLayerInfo");
dojo.require("esri.layers.WMTSLayer");
dojo.require("esri.layers.TileInfo");
dojo.require("esri.SpatialReference");*/
