
$(function(){


});

function mapbj() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/beijing.js', function () {
		chart.setOption({
	        title: {
	            text: '北京测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '北京',
	            type: 'map',
	            mapType: '北京', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '海淀区', value:10},
	                    {name: '朝阳区', value: 15},
	                    {name: '丰台区', value: 20},
	                    {name: '延庆县', value: 12},
	                    {name: '密云县', value: 5},
	                    {name:'房山区',value:3},
	                    {name:'顺义区',value:1},
	                  ],
	        }]
		});
})	
}


function mapsh() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/shanghai.js', function () {
		chart.setOption({
	        title: {
	            text: '上海测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '上海',
	            type: 'map',
	            mapType: '上海', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '黄浦区', value:10},
	                    {name: '嘉定区', value: 15},
	                    {name: '浦东新区', value: 20},
	                    {name: '徐汇区', value: 12},
	                    {name: '金山区', value: 5},
	                    {name:'青浦区',value:3},
	                    {name:'崇明县',value:1},
	                  ],
	        }]
		});
})	
}


function mapxa() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/shanxi.js', function () {
		chart.setOption({
	        title: {
	            text: '陕西测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '陕西',
	            type: 'map',
	            mapType: '陕西', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '咸阳市', value:10},
	                    {name: '西安市', value: 15},
	                    {name: '延安市', value: 20},
	                    {name: '汉中市', value: 12},
	                    {name: '宝鸡市', value: 5},
	                    {name:'榆林市',value:3},
	                    {name:'商洛市',value:1},
	                  ],
	        }]
		});
})	
}


function mapsc() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/sichuan.js', function () {
		 var searchUrlCount ="http://localhost:8084/CCYYAMS/statistics/getProjectFilelist";
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
		        	var dataPie=[];
		        	for(var i=0;i<jsonData.length;i++)
		        		{
		        	var temp=new Object();
		        	temp.name=jsonData[i].PRJ_NAME;
		        	temp.value=jsonData[i].counts;
		        	dataPie.push(temp);
		        		}
	chart.setOption({
        title: {
            text: '四川测试地图',
        },
        tooltip: {
            trigger: 'item',
            formatter: '{b}<br/>{c} (数量)'
        },
        toolbox: {
            show: true,
            orient: 'vertical',
            left: 'right',
            top: 'center',
        },
        visualMap: {
            min: 1,
            max: 20,
            text:['High','Low'],
            realtime: false,
            calculable: true,
            inRange: {
                color: ['lightskyblue','yellow', 'orangered']
            }
        },
        series:[{
        	
        	name: '四川',
            type: 'map',
            mapType: '四川', // 自定义扩展图表类型
            itemStyle:{
                normal: {
                    borderColor: '#F5FFFA',
                    
                },
                emphasis: {
                    
                }
            },
            data:dataPie,
            nameMap:{
            	'成都市':'空白区、08更新',
            	'乐山市':'空白区',
            	'内江市':'##未知项目##06更新_1：5万矢量地形数据DLG更新到成都出片数据20060921',
            	'绵阳市':'5万DLG更新',
            	'巴中市':'##未知项目##06更新_IMAGES（选埋照片）',
            	'达州市':'1：5万地形图',
            	'攀枝花市':'1：5万更新'
            }
        }]
	});
	        }, 
	        error: function (er) {
	            alert("基站总数请求失败,请联系管理员！");
	        }
	    });
})
}

function maphlj() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/heilongjiang.js', function () {
		chart.setOption({
	        title: {
	            text: '黑龙江测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '黑龙江',
	            type: 'map',
	            mapType: '黑龙江', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '大庆市', value:10},
	                    {name: '齐齐哈尔市', value: 15},
	                    {name: '哈尔滨市', value: 20},
	                    {name: '伊春市', value: 12},
	                    {name: '鸡西市', value: 5},
	                    {name:'佳木斯市',value:3},
	                    {name:'大兴安岭地区',value:1},
	                  ],
	        }]
		});
})	
}

function mapsx() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/shanxi1.js', function () {
		chart.setOption({
	        title: {
	            text: '山西测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '山西',
	            type: 'map',
	            mapType: '山西', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '临汾市', value:10},
	                    {name: '吕梁市', value: 15},
	                    {name: '太原市', value: 20},
	                    {name: '阳泉市', value: 12},
	                    {name: '晋中市', value: 5},
	                    {name:'大同市',value:3},
	                    {name:'运城市',value:1},
	                  ],
	        }]
		});
})	
}
 
function mapnmg() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/neimenggu.js', function () {
		chart.setOption({
	        title: {
	            text: '内蒙古测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '内蒙古',
	            type: 'map',
	            mapType: '内蒙古', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '鄂尔多斯市', value:10},
	                    {name: '呼伦贝尔市', value: 15},
	                    {name: '呼和浩特市', value: 20},
	                    {name: '赤峰市', value: 12},
	                    {name: '兴安盟', value: 5},
	                    {name:'阿拉善盟',value:3},
	                    {name:'锡林郭勒盟',value:1},
	                  ],
	        }]
		});
})	
}

function mapln() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/liaoning.js', function () {
		chart.setOption({
	        title: {
	            text: '辽宁测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '辽宁',
	            type: 'map',
	            mapType: '辽宁', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '铁岭市', value:10},
	                    {name: '大连市', value: 15},
	                    {name: '沈阳市', value: 20},
	                    {name: '本溪市', value: 12},
	                    {name: '锦州市', value: 5},
	                    {name:'盘锦市',value:3},
	                    {name:'葫芦岛市',value:1},
	                  ],
	        }]
		});
})	
}

function mapjl() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/jilin.js', function () {
		chart.setOption({
	        title: {
	            text: '吉林测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '吉林',
	            type: 'map',
	            mapType: '吉林', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '四平市', value:10},
	                    {name: '吉林市', value: 15},
	                    {name: '长春市', value: 20},
	                    {name: '通化市', value: 12},
	                    {name: '松原市', value: 5},
	                    {name:'白城市',value:3},
	                    {name:'延边朝鲜族自治州',value:1},
	                  ],
	        }]
		});
})	
}

function maphb() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/hebei.js', function () {
		chart.setOption({
	        title: {
	            text: '河北测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '河北',
	            type: 'map',
	            mapType: '河北', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '唐山市', value:10},
	                    {name: '张家口市', value: 15},
	                    {name: '石家庄市', value: 20},
	                    {name: '秦皇岛市', value: 12},
	                    {name: '邢台市', value: 5},
	                    {name:'廊坊市',value:3},
	                    {name:'沧州市',value:1},
	                  ],
	        }]
		});
})	
}

function mapjs() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/jiangsu.js', function () {
		chart.setOption({
	        title: {
	            text: '江苏测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '江苏',
	            type: 'map',
	            mapType: '江苏', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '徐州市', value:10},
	                    {name: '扬州市', value: 15},
	                    {name: '南京市', value: 20},
	                    {name: '苏州市', value: 12},
	                    {name: '连云港市', value: 5},
	                    {name:'无锡市',value:3},
	                    {name:'盐城市',value:1},
	                  ],
	        }]
		});
})	
}

function mapzj() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/zhejiang.js', function () {
		chart.setOption({
	        title: {
	            text: '浙江测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '浙江',
	            type: 'map',
	            mapType: '浙江', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '绍兴市', value:10},
	                    {name: '宁波市', value: 15},
	                    {name: '杭州市', value: 20},
	                    {name: '温州市', value: 12},
	                    {name: '丽水市', value: 5},
	                    {name:'湖州市',value:3},
	                    {name:'台州市',value:1},
	                  ],
	        }]
		});
})	
}

function mapah() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/anhui.js', function () {
		chart.setOption({
	        title: {
	            text: '安徽测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '安徽',
	            type: 'map',
	            mapType: '安徽', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '黄山市', value:10},
	                    {name: '六安市', value: 15},
	                    {name: '合肥市', value: 20},
	                    {name: '安庆市', value: 12},
	                    {name: '马鞍山市', value: 5},
	                    {name:'淮北市',value:3},
	                    {name:'淮南市',value:1},
	                  ],
	        }]
		});
})	
}

function mapfj() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/fujian.js', function () {
		chart.setOption({
	        title: {
	            text: '福建测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '福建',
	            type: 'map',
	            mapType: '福建', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '厦门市', value:10},
	                    {name: '泉州市', value: 15},
	                    {name: '福州市', value: 20},
	                    {name: '漳州市', value: 12},
	                    {name: '南平市', value: 5},
	                    {name:'三明市',value:3},
	                    {name:'龙岩市',value:1},
	                  ],
	        }]
		});
})	
}

function mapjx() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/jiangxi.js', function () {
		chart.setOption({
	        title: {
	            text: '江西测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '江西',
	            type: 'map',
	            mapType: '江西', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '九江市', value:10},
	                    {name: '吉安市', value: 15},
	                    {name: '南昌市', value: 20},
	                    {name: '景德镇市', value: 12},
	                    {name: '抚州市', value: 5},
	                    {name:'新余市',value:3},
	                    {name:'鹰潭市',value:1},
	                  ],
	        }]
		});
})	
}

function mapsd() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/shandong.js', function () {
		chart.setOption({
	        title: {
	            text: '山东测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '山东',
	            type: 'map',
	            mapType: '山东', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '济宁市', value:10},
	                    {name: '烟台市', value: 15},
	                    {name: '济南市', value: 20},
	                    {name: '青岛市', value: 12},
	                    {name: '日照市', value: 5},
	                    {name:'聊城市',value:3},
	                    {name:'枣庄市',value:1},
	                  ],
	        }]
		});
})	
}

function maphb1() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/hubei.js', function () {
		chart.setOption({
	        title: {
	            text: '湖北测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '湖北',
	            type: 'map',
	            mapType: '湖北', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '十堰市', value:10},
	                    {name: '荆州市', value: 15},
	                    {name: '武汉市', value: 20},
	                    {name: '宜昌市', value: 12},
	                    {name: '黄石市', value: 5},
	                    {name:'恩施土家族苗族自治州',value:3},
	                    {name:'天门市',value:1},
	                  ],
	        }]
		});
})	
}

function mapgd() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/guangdong.js', function () {
		chart.setOption({
	        title: {
	            text: '广东测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '广东',
	            type: 'map',
	            mapType: '广东', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '佛山市', value:10},
	                    {name: '珠海市', value: 15},
	                    {name: '深圳市', value: 20},
	                    {name: '汕头市', value: 12},
	                    {name: '东莞市', value: 5},
	                    {name:'茂名市',value:3},
	                    {name:'清远市',value:1},
	                  ],
	        }]
		});
})	
}

function maphn() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/hainan.js', function () {
		chart.setOption({
	        title: {
	            text: '海南测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '海南',
	            type: 'map',
	            mapType: '海南', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '文昌市', value:10},
	                    {name: '三沙市', value: 15},
	                    {name: '海口市', value: 20},
	                    {name: '三亚市', value: 12},
	                    {name: '临高县', value: 5},
	                    {name:'琼中黎族苗族自治县',value:3},
	                    {name:'乐东黎族自治县',value:1},
	                  ],
	        }]
		});
})	
}

function maphn1() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/henan.js', function () {
		chart.setOption({
	        title: {
	            text: '河南测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '河南',
	            type: 'map',
	            mapType: '河南', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '平顶山市', value:10},
	                    {name: '洛阳市', value: 15},
	                    {name: '郑州市', value: 20},
	                    {name: '开封市', value: 12},
	                    {name: '信阳市', value: 5},
	                    {name:'南阳市',value:3},
	                    {name:'安阳市',value:1},
	                  ],
	        }]
		});
})	
}

function maphn2() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/hunan.js', function () {
		chart.setOption({
	        title: {
	            text: '湖南测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '湖南',
	            type: 'map',
	            mapType: '湖南', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '常德市', value:10},
	                    {name: '怀化市', value: 15},
	                    {name: '长沙市', value: 20},
	                    {name: '衡阳市', value: 12},
	                    {name: '张家界市', value: 5},
	                    {name:'永州市',value:3},
	                    {name:'岳阳市',value:1},
	                  ],
	        }]
		});
})	
}

function mapgx() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/guangxi.js', function () {
		chart.setOption({
	        title: {
	            text: '广西测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '广西',
	            type: 'map',
	            mapType: '广西', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '玉林市', value:10},
	                    {name: '桂林市', value: 15},
	                    {name: '南宁市', value: 20},
	                    {name: '北海市', value: 12},
	                    {name: '百色市', value: 5},
	                    {name:'来宾市',value:3},
	                    {name:'贺州市',value:1},
	                  ],
	        }]
		});
})	
}

function mapgz() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/guizhou.js', function () {
		chart.setOption({
	        title: {
	            text: '贵州测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '贵州',
	            type: 'map',
	            mapType: '贵州', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '遵义市', value:10},
	                    {name: '安顺市', value: 15},
	                    {name: '贵阳市', value: 20},
	                    {name: '铜仁市', value: 12},
	                    {name: '黔西南布依族苗族自治州', value: 5},
	                    {name:'毕节市',value:3},
	                    {name:'黔东南苗族侗族自治州',value:1},
	                  ],
	        }]
		});
})	
}

function mapyn() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/yunnan.js', function () {
		chart.setOption({
	        title: {
	            text: '云南测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '云南',
	            type: 'map',
	            mapType: '云南', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '丽江市', value:10},
	                    {name: '大理白族自治州', value: 15},
	                    {name: '昆明市', value: 20},
	                    {name: '普洱市', value: 12},
	                    {name: '西双版纳傣族自治州', value: 5},
	                    {name:'保山市',value:3},
	                    {name:'文山壮族苗族自治州',value:1},
	                  ],
	        }]
		});
})	
}

function mapxz() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/xizang.js', function () {
		chart.setOption({
	        title: {
	            text: '西藏测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '西藏',
	            type: 'map',
	            mapType: '西藏', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '林芝市', value:10},
	                    {name: '日喀则市', value: 15},
	                    {name: '拉萨市', value: 20},
	                    {name: '山南地区', value: 12},
	                    {name: '昌都市', value: 5},
	                    {name:'那曲地区',value:3},
	                    {name:'阿里地区',value:1},
	                  ],
	        }]
		});
})	
}

function mapcq() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/chongqing.js', function () {
		chart.setOption({
	        title: {
	            text: '重庆测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '重庆',
	            type: 'map',
	            mapType: '重庆', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '合川区', value:10},
	                    {name: '渝北区', value: 15},
	                    {name: '沙坪坝区', value: 20},
	                    {name: '江津区', value: 12},
	                    {name: '长寿区', value: 5},
	                    {name:'武隆县',value:3},
	                    {name:'万州区',value:1},
	                  ],
	        }]
		});
})	
}

function mapgs() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/gansu.js', function () {
		chart.setOption({
	        title: {
	            text: '甘肃测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '甘肃',
	            type: 'map',
	            mapType: '甘肃', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '甘南藏族自治州', value:10},
	                    {name: '武威市', value: 15},
	                    {name: '兰州市', value: 20},
	                    {name: '庆阳市', value: 12},
	                    {name: '天水市', value: 5},
	                    {name:'酒泉市',value:3},
	                    {name:'张掖市',value:1},
	                  ],
	        }]
		});
})	
}

function mapqh() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/qinghai.js', function () {
		chart.setOption({
	        title: {
	            text: '青海测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '青海',
	            type: 'map',
	            mapType: '青海', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '海南藏族自治州', value:10},
	                    {name: '玉树藏族自治州', value: 15},
	                    {name: '西宁市', value: 20},
	                    {name: '海东市', value: 12},
	                    {name: '海西蒙古族藏族自治州', value: 5},
	                    {name:'果洛藏族自治州',value:3},
	                    {name:'海北藏族自治州',value:1},
	                  ],
	        }]
		});
})	
}

function mapnx() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/ningxia.js', function () {
		chart.setOption({
	        title: {
	            text: '宁夏测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '宁夏',
	            type: 'map',
	            mapType: '宁夏', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '中卫市', value:10},
	                    {name: '银川市', value: 20},
	                    {name: '吴忠市', value: 5},
	                    {name:'石嘴山市',value:3},
	                    {name:'固原市',value:1},
	                  ],
	        }]
		});
})	
}

function mapxj() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/xinjiang.js', function () {
		chart.setOption({
	        title: {
	            text: '新疆测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '新疆',
	            type: 'map',
	            mapType: '新疆', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '和田地区', value:10},
	                    {name: '哈密地区', value: 15},
	                    {name: '乌鲁木齐市', value: 20},
	                    {name: '喀什地区', value: 12},
	                    {name: '吐鲁番地区', value: 5},
	                    {name:'塔城地区',value:3},
	                    {name:'阿勒塔地区',value:1},
	                  ],
	        }]
		});
})	
}

function maptj() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/tianjin.js', function () {
		chart.setOption({
	        title: {
	            text: '天津测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '天津',
	            type: 'map',
	            mapType: '天津', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '河北区', value:10},
	                    {name: '武清区', value: 15},
	                    {name: '河西区', value: 20},
	                    {name: '西青区', value: 12},
	                    {name: '宁河县', value: 5},
	                    {name:'静海县',value:3},
	                    {name:'宝坻区',value:1},
	                  ],
	        }]
		});
})	
}

function mapam() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/aomen.js', function () {
		chart.setOption({
	        title: {
	            text: '澳门测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '澳门',
	            type: 'map',
	            mapType: '澳门', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '大堂區', value:10},
	                    {name: '嘉模堂區', value: 15},
	                    {name: '花地瑪堂區', value: 20},
	                    {name: '風順堂區', value: 12},
	                    {name: '花王堂區', value: 5},
	                    {name:'望德堂區',value:3},
	                    {name:'路氹填海區',value:1},
	                  ],
	        }]
		});
})	
}

function mapxg() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/xianggang.js', function () {
		chart.setOption({
	        title: {
	            text: '香港测试地图',
	        },
	        tooltip: {
	            trigger: 'item',
	            formatter: '{b}<br/>{c} (数量)'
	        },
	        toolbox: {
	            show: true,
	            orient: 'vertical',
	            left: 'right',
	            top: 'center',
	        },
	        visualMap: {
	            min: 1,
	            max: 20,
	            text:['High','Low'],
	            realtime: false,
	            calculable: true,
	            inRange: {
	                color: ['lightskyblue','yellow', 'orangered']
	            }
	        },
	        series:[{
	        	
	        	name: '香港',
	            type: 'map',
	            mapType: '香港', // 自定义扩展图表类型
	            itemStyle:{
	                normal: {
	                    borderColor: '#F5FFFA',
	                    
	                },
	                emphasis: {
	                    
	                }
	            },
	            data:[
	                    {name: '東區', value:10},
	                    {name: '中西區', value: 15},
	                    {name: '灣仔區', value: 20},
	                    {name: '南區', value: 12},
	                    {name: '油尖旺區', value: 5},
	                    {name:'深水埗區',value:3},
	                    {name:'大埔區',value:1},
	                  ],
	        }]
		});
})	
}



function mapqg() {
	var chart = echarts.init(document.getElementById('main'));
	$.get('static/js/echart-map/china.js', function () {
		chart.setOption({
        tooltip: {
            trigger: 'item',
            formatter: '{b}'
        },
        series: [
            {
                name: '中国',
                type: 'map',
                mapType: 'china',
                selectedMode : 'multiple',
                label:{
                normal: {
                        show: true,
                    },
                emphasis: {
                        show: true,
                    }
                },
                itemStyle: {
                    normal: {
                        borderColor: '#F5FFFA',
                        show: true,
                    },
                    emphasis: {
                        show: true,
                    }
                },
                data:[
                    {name:'四川', selected:true}
                ]
            }
        ]
    });
	})
}