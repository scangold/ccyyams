$(function(){
    var oTable = new check_TableInit();
    oTable.Init();
});
function check_TableInit() {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function() {
        $('#arproject-table').bootstrapTable({
                url: "/CCYYAMS/project/showprojectlistpage", //请求后台的URL（*）
                method: 'get', //请求方式（*）
                striped: true, //是否显示行间隔色
                cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true, //是否显示分页（*）
                sortable: true, //是否启用排序
                sortOrder: "desc", //排序方式
                sortName: "PRJ_ID",//"tasksort",
                queryParams: oTableInit.queryParams, //传递参数（*）
                sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1, //初始化加载第一页，默认第一页
                pageSize: 10, //每页的记录行数（*）
                pageList: [0,5,10, 25, 50, 100, 200], //可供选择的每页的行数（*）
                search: true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true, //是否显示所有的列
                showRefresh: true, //是否显示刷新按钮
                minimumCountColumns: 2, //最少允许的列数
                clickToSelect: true, //是否启用点击选中行
                showToggle: true, //是否显示详细视图和列表视图的切换按钮
                cardView: false, //是否显示详细视图
                detailView: false, //是否显示父子表
                showExport: true,
                exportDataType: "all",
				columns : [{field : "PRJ_ID",title : "项目ID", align: "center",sortable:"true"}, 
				{field : "PRJ_NAME",title : "项目名称", align: "center",sortable:"true"}, 
				{field : "PRJ_ORIGIN",title : "项目来源", align: "center",sortable:"true"}, 
				{field : "COVERAGE_ID",title : "项目区域", align: "center",sortable:"true"}, 
				{field : "PRJTYPE",title : "项目类型", align: "center",sortable:"true"} ],
                onClickRow: function(row, $element) {
                    //$element是当前tr的jquery对象
                    $element.css("background-color", "green");
                    document.GetElementById("projectinput").value=row.PRJ_ID;
                },//单击row事件
            })
           
    };

    //得到查询的参数
    oTableInit.queryParams = function(params) {
        var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        		  limit: params.limit,
                  offset: params.offset,
                  sort: params.sort,
                  order: params.order,
                  search:params.search};
        return temp;
    };
    return oTableInit;
};

		