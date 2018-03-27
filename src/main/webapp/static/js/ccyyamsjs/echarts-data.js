
$(function(){


});

function bar() {

	var myChart = echarts.init(document.getElementById('main1'));
	
	myChart.setOption({
		title: {
	        text: '制作总量和其他组成类型',
	        subtext: 'From ExcelHome'
	    },
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {           
	            type : 'shadow'       
	        },
	        formatter: function (params) {
	            var tar = params[1];
	            return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value;
	        }
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis: {
	        type : 'category',
	        splitLine: {show:false},
	        data : ['总量','类型1','类型2','类型3','类型4','类型5']
	    },
	    yAxis: {
	        type : 'value'
	    },
	    series: [
	        {
	            name: '辅助',
	            type: 'bar',
	            stack:  '总量',
	            itemStyle: {
	                normal: {
	                    barBorderColor: 'rgba(0,0,0,0)',
	                    color: 'rgba(0,0,0,0)'
	                },
	                emphasis: {
	                    barBorderColor: 'rgba(0,0,0,0)',
	                    color: 'rgba(0,0,0,0)'
	                }
	            },
	            data: [0, 1700, 1400, 1200, 300, 0]
	        },
	        {
	            name: '生活费',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'inside'
	                }
	            },
	            data:[2900, 1200, 300, 200, 900, 300]
	        }
	    ]
	});
	 /*var searchUrlCount ="/CCYYAMS/statistics/getAllProject";
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
	        	var count=[];
	        	count.push(jsonData.projectCount);
	        	
	    		myChart.setOption({
	    		    title: {
	    		        text: '制作各类文件总量'
	    		    },
	    		    tooltip: {},
	    		    legend: {
	    		        data:['总量']
	    		    },
	    		    xAxis:{
	    		        data: ['总量']
	    		    },
	    		    yAxis: {},
	    		    series: [{
	    		        name: '总量',
	    		        type: 'bar',
	    		        data: count
	    		    }]
	    		});
	        }, 
	        error: function (er) {
	            alert("基站总数请求失败,请联系管理员！");
	        }
	    });*/


}	
	
function pie() {
	
	var myChart = echarts.init(document.getElementById('main1'));
	
	 var searchUrlCount ="/CCYYAMS/statistics/getProjectFilelist";
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
	        	var Piename=[];
	        	for(var i=0;i<jsonData.length;i++)
	        		{
	        	var temp=new Object();
	        	temp.name=jsonData[i].PRJ_NAME;
	        	temp.value=jsonData[i].counts;
	        	dataPie.push(temp);
	        	Piename.push(temp.name);
	        		}
	    		myChart.setOption({
	    		    title : {
	    		        text: '分类文件数量展示',
	    		        x:'center'
	    		    },
	    		    tooltip : {
	    		        trigger: 'item',
	    		        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    		    },
	    		    series : [
                           
	    		        {
	    		            name: '文件名字：',
	    		            type: 'pie',
	    		            radius : ['60%','80%'],
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
	    		            data:dataPie,
	    		            itemStyle: {
	    		                emphasis: {
	    		                    shadowBlur: 10,
	    		                    shadowOffsetX: 0,
	    		                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	    		                }
	    		            }
	    		        }
	    		    ]
	    		});
	        }, 
	        error: function (er) {
	            alert("基站总数请求失败,请联系管理员！");
	        }
	    });


}	


function line() {
var myChart = echarts.init(document.getElementById('main1'));
var option = {
title: {
    text: 'Step Line'
},
tooltip: {
    trigger: 'axis'
},
legend: {
    data:['Step Start', 'Step Middle', 'Step End']
},
grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
},
xAxis: {
    type: 'category',
    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
},
yAxis: {
    type: 'value'
},
series: [
    {
        name:'Step Start',
        type:'line',
        step: 'start',
        data:[120, 132, 101, 134, 90, 230, 210]
    },
    {
        name:'Step Middle',
        type:'line',
        step: 'middle',
        data:[220, 282, 201, 234, 290, 430, 410]
    },
    {
        name:'Step End',
        type:'line',
        step: 'end',
        data:[450, 432, 401, 454, 590, 530, 510]
    }
]
};
myChart.setOption(option);
}


function bar1() {

	var myChart = echarts.init(document.getElementById('main1'));
	
	 

	 var searchUrlCount ="/CCYYAMS/statistics/getProjectFilelist";
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
	        	var Piename=[];
	        	for(var i=0;i<jsonData.length;i++)
	        		{
	        	var temp=new Object();
	        	temp.name=jsonData[i].PRJ_NAME;
	        	temp.value=jsonData[i].counts;
	        	dataPie.push(temp.value);
	        	Piename.push(temp.name);
	        		}
	    		myChart.setOption({
	    		    title: {
	    		        text: '各个项目展示'
	    		    },
	    		    tooltip: {
	    		    	trigger: 'item'
	    		    },
	    		    calculable : true,
	    	        grid: {
	    	            top: '12%',
	    	            left: '1%',
	    	            right: '10%',
	    	            containLabel: true
	    	        },
	    		    xAxis:[{
	    		    	type : 'category',
	    		        data: Piename
	    		    }],
	    		    yAxis: [{
	                    type : 'value',
	                    name : '数量',
	                    	
	    		    }],
	    	        dataZoom: [
	    	                   {
	    	                       show: true,
	    	                       start: 94,
	    	                       end: 100
	    	                   },
	    	                   {
	    	                       type: 'inside',
	    	                       start: 94,
	    	                       end: 100
	    	                   },
	    	                   {
	    	                       show: true,
	    	                       yAxisIndex: 0,
	    	                       filterMode: 'empty',
	    	                       width: 30,
	    	                       height: '80%',
	    	                       showDataShadow: false,
	    	                       left: '93%'
	    	                   }
	    	               ],
	    		    series: [{
	    		        name: '项目',
	    		        type: 'bar',
	    		        data: dataPie
	    		    }]
	    		});
	        }, 
	        error: function (er) {
	            alert("基站总数请求失败,请联系管理员！");
	        }
	    });


}



function outputhuabei() {
	var myChart = echarts.init(document.getElementById('main'));
	var option = {
		    title: {
		        text: '华北地区的制作量'
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data: ['第一类工程', '第二类工程','第三类工程','第四类工程','第五类工程']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis:  {
		        type: 'value'
		    },
		    yAxis: {
		        type: 'category',
		        data: ['第一季度','第二季度','第三季度','第四季度']
		    },
		    series: [
		        {
		            name: '第一类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [320, 302, 301,320]
		        },
		        {
		            name: '第二类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [120, 132,210,500]
		        },
		        {
		            name: '第三类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [220, 182,330,310]
		        },
		        {
		            name: '第四类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [150, 212,330, 410]
		        },
		        {
		            name: '第五类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [820, 832,1330, 1320]
		        }
		    ]
		};
	myChart.setOption(option);
}


function outputhuadong() {
	var myChart = echarts.init(document.getElementById('main'));
	var option = {
		    title: {
		        text: '华东地区的制作量'
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data: ['第一类工程', '第二类工程','第三类工程','第四类工程','第五类工程']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis:  {
		        type: 'value'
		    },
		    yAxis: {
		        type: 'category',
		        data: ['第一季度','第二季度','第三季度','第四季度']
		    },
		    series: [
		        {
		            name: '第一类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [320,302,301,500]
		        },
		        {
		            name: '第二类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [200,132,210,500]
		        },
		        {
		            name: '第三类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [220, 182,150,310]
		        },
		        {
		            name: '第四类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [300, 212,330, 410]
		        },
		        {
		            name: '第五类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [820, 832,1330, 1320]
		        }
		    ]
		};
	myChart.setOption(option);
}


function outputhuazhong() {
	var myChart = echarts.init(document.getElementById('main'));
	var option = {
		    title: {
		        text: '华中地区的制作量'
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data: ['第一类工程', '第二类工程','第三类工程','第四类工程','第五类工程']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis:  {
		        type: 'value'
		    },
		    yAxis: {
		        type: 'category',
		        data: ['第一季度','第二季度','第三季度','第四季度']
		    },
		    series: [
		        {
		            name: '第一类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [400, 100, 301,320]
		        },
		        {
		            name: '第二类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [240, 200,210,500]
		        },
		        {
		            name: '第三类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [100, 300,330,310]
		        },
		        {
		            name: '第四类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [100, 400,330, 410]
		        },
		        {
		            name: '第五类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [700, 500,1330, 1320]
		        }
		    ]
		};
	myChart.setOption(option);
}



function outputhuanan() {
	var myChart = echarts.init(document.getElementById('main'));
	var option = {
		    title: {
		        text: '华南地区的制作量'
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data: ['第一类工程', '第二类工程','第三类工程','第四类工程','第五类工程']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis:  {
		        type: 'value'
		    },
		    yAxis: {
		        type: 'category',
		        data: ['第一季度','第二季度','第三季度','第四季度']
		    },
		    series: [
		        {
		            name: '第一类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [200, 188, 301,320]
		        },
		        {
		            name: '第二类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [120, 132,340,400]
		        },
		        {
		            name: '第三类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [120, 320,330,310]
		        },
		        {
		            name: '第四类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [150, 212,440,500]
		        },
		        {
		            name: '第五类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [720, 700,1330, 1500]
		        }
		    ]
		};
	myChart.setOption(option);
}



function outputdongbei() {
	var myChart = echarts.init(document.getElementById('main'));
	var option = {
		    title: {
		        text: '东北地区的制作量'
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data: ['第一类工程', '第二类工程','第三类工程','第四类工程','第五类工程']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis:  {
		        type: 'value'
		    },
		    yAxis: {
		        type: 'category',
		        data: ['第一季度','第二季度','第三季度','第四季度']
		    },
		    series: [
		        {
		            name: '第一类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [200, 188, 301,320]
		        },
		        {
		            name: '第二类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [120, 132,340,400]
		        },
		        {
		            name: '第三类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [120, 320,330,310]
		        },
		        {
		            name: '第四类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [150, 212,440,500]
		        },
		        {
		            name: '第五类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [720, 700,1330, 1500]
		        }
		    ]
		};
	myChart.setOption(option);
}



function outputxinan() {
	var myChart = echarts.init(document.getElementById('main'));
	var option = {
		    title: {
		        text: '西南地区的制作量'
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data: ['第一类工程', '第二类工程','第三类工程','第四类工程','第五类工程']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis:  {
		        type: 'value'
		    },
		    yAxis: {
		        type: 'category',
		        data: ['第一季度','第二季度','第三季度','第四季度']
		    },
		    series: [
		        {
		            name: '第一类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [200, 188, 301,320]
		        },
		        {
		            name: '第二类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [120, 132,340,400]
		        },
		        {
		            name: '第三类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [120, 320,330,310]
		        },
		        {
		            name: '第四类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [150, 212,440,500]
		        },
		        {
		            name: '第五类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [720, 700,1330, 1500]
		        }
		    ]
		};
	myChart.setOption(option);
}



function outputxibei() {
	var myChart = echarts.init(document.getElementById('main'));
	var option = {
		    title: {
		        text: '西北地区的制作量'
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data: ['第一类工程', '第二类工程','第三类工程','第四类工程','第五类工程']
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis:  {
		        type: 'value'
		    },
		    yAxis: {
		        type: 'category',
		        data: ['第一季度','第二季度','第三季度','第四季度']
		    },
		    series: [
		        {
		            name: '第一类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [200, 188, 301,320]
		        },
		        {
		            name: '第二类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [120, 132,340,400]
		        },
		        {
		            name: '第三类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [120, 320,330,310]
		        },
		        {
		            name: '第四类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [150, 212,440,500]
		        },
		        {
		            name: '第五类工程',
		            type: 'bar',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'insideRight'
		                }
		            },
		            data: [720, 700,1330, 1500]
		        }
		    ]
		};
	myChart.setOption(option);
}


function total() {
	var myChart = echarts.init(document.getElementById('main1'));
	 var searchUrlCount ="/CCYYAMS/apply/getApplyStutecount";
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
	        	temp.value=jsonData[i].count;
	        	dataPie.push(temp);
	        		}
	    		myChart.setOption({
	    		    title: {
	    		        text: '申请情况'
	    		    },
	    		    tooltip: {},
	    		    legend: {
	    		        data:['数量']
	    		    },
	    		    xAxis:{
	    		        data: ['待批申请','申请通过','转批申请','归还']
	    		    },
	    		    yAxis: {},
	    		    series: [{
	    		        name: '数量',
	    		        type: 'bar',
	    		        barWidth:220,
	    		        data: dataPie
	    		    }]
	    		});
	        }, 
	        error: function (er) {
	            alert("基站总数请求失败,请联系管理员！");
	        }
	    });

}


function team1() {
	var myChart = echarts.init(document.getElementById('main1'));
	myChart.setOption({
	    title: {
	        text: '一中队'
	    },
	    tooltip: {},
	    legend: {
	        data:['数量']
	    },
	    xAxis:{
	        data: ['制作数量','制作面积','档案数量','人数']
	    },
	    yAxis: {},
	    series: [{
	        name: '数量',
	        type: 'bar',
	        barWidth:220,
	        data: [310,3000,21,40]
	    }]
	});
}

function team2() {
	var myChart = echarts.init(document.getElementById('main1'));
	myChart.setOption({
	    title: {
	        text: '二中队'
	    },
	    tooltip: {},
	    legend: {
	        data:['数量']
	    },
	    xAxis:{
	        data: ['制作数量','制作面积','档案数量','人数']
	    },
	    yAxis: {},
	    series: [{
	        name: '数量',
	        type: 'bar',
	        barWidth:220,
	        data: [152,2000,15,35]
	    }]
	});
}

function team3() {
	var myChart = echarts.init(document.getElementById('main1'));
	myChart.setOption({
	    title: {
	        text: '三中队'
	    },
	    tooltip: {},
	    legend: {
	        data:['数量']
	    },
	    xAxis:{
	        data: ['制作数量','制作面积','档案数量','人数']
	    },
	    yAxis: {},
	    series: [{
	        name: '数量',
	        type: 'bar',
	        barWidth:220,
	        data: [200,2300,20,38]
	    }]
	});
}

function team4() {
	var myChart = echarts.init(document.getElementById('main1'));
	myChart.setOption({
	    title: {
	        text: '四中队'
	    },
	    tooltip: {},
	    legend: {
	        data:['数量']
	    },
	    xAxis:{
	        data: ['制作数量','制作面积','档案数量','人数']
	    },
	    yAxis: {},
	    series: [{
	        name: '数量',
	        type: 'bar',
	        barWidth:220,
	        data: [330,2600,22,34]
	    }]
	});
}

function team5() {
	var myChart = echarts.init(document.getElementById('main1'));
	myChart.setOption({
	    title: {
	        text: '五中队'
	    },
	    tooltip: {},
	    legend: {
	        data:['数量']
	    },
	    xAxis:{
	        data: ['制作数量','制作面积','档案数量','人数']
	    },
	    yAxis: {},
	    series: [{
	        name: '数量',
	        type: 'bar',
	        barWidth:220,
	        data: [320,2300,31,33]
	    }]
	});
}

function team6() {
	var myChart = echarts.init(document.getElementById('main1'));
	myChart.setOption({
	    title: {
	        text: '六中队'
	    },
	    tooltip: {},
	    legend: {
	        data:['数量']
	    },
	    xAxis:{
	        data: ['制作数量','制作面积','档案数量','人数']
	    },
	    yAxis: {},
	    series: [{
	        name: '数量',
	        type: 'bar',
	        barWidth:220,
	        data: [330,2300,31,40]
	    }]
	});
}

function team7() {
	var myChart = echarts.init(document.getElementById('main1'));
	myChart.setOption({
	    title: {
	        text: '七中队'
	    },
	    tooltip: {},
	    legend: {
	        data:['数量']
	    },
	    xAxis:{
	        data: ['制作数量','制作面积','档案数量','人数']
	    },
	    yAxis: {},
	    series: [{
	        name: '数量',
	        type: 'bar',
	        barWidth:220,
	        data: [220,3400,33,37]
	    }]
	});
}

function team8() {
	var myChart = echarts.init(document.getElementById('main1'));
	myChart.setOption({
	    title: {
	        text: '八中队'
	    },
	    tooltip: {},
	    legend: {
	        data:['数量']
	    },
	    xAxis:{
	        data: ['制作数量','制作面积','档案数量','人数']
	    },
	    yAxis: {},
	    series: [{
	        name: '数量',
	        type: 'bar',
	        barWidth:220,
	        data: [170,2000,20,30]
	    }]
	});
}

function team9() {
	var myChart = echarts.init(document.getElementById('main1'));
	myChart.setOption({
	    title: {
	        text: '九中队'
	    },
	    tooltip: {},
	    legend: {
	        data:['数量']
	    },
	    xAxis:{
	        data: ['制作数量','制作面积','档案数量','人数']
	    },
	    yAxis: {},
	    series: [{
	        name: '数量',
	        type: 'bar',
	        barWidth:220,
	        data: [220,1400,35,35]
	    }]
	});
}


function team10() {
	var myChart = echarts.init(document.getElementById('main1'));
	myChart.setOption({
	    title: {
	        text: '十中队'
	    },
	    tooltip: {},
	    legend: {
	        data:['数量']
	    },
	    xAxis:{
	    	type : 'category',
	        data: ['制作数量','制作面积','档案数量','人数'],
        axisTick: {
            alignWithLabel: true
        }
	    },
	    yAxis: {},
	    series: [{
	        name: '数量',
	        type: 'bar',
	        barWidth:220,
	        data: [300,3000,35,35]
	    }]
	});
}