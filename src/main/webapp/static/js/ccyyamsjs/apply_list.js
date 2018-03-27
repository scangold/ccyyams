$(function(){
    var oTable = new apply_TableInit();
    oTable.Init();
    var hisOTable=new historyApply_TableInit();
    hisOTable.Init();
});
//查询历史审批
function historyApply_TableInit() {
    var hisOTableInit = new Object();
    //初始化Table
    hisOTableInit.Init = function() {
        $('#applyHistory_list_table').bootstrapTable({
                url: PipeApi.BaseUrl+'apply/showApplylistPage', //请求后台的URL（*）
                method: 'get', //请求方式（*）
                striped: true, //是否显示行间隔色
                cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true, //是否显示分页（*）
                sortable: true, //是否启用排序
                sortOrder: "desc", //排序方式
                sortName: "APPLY_TIME",//"tasksort",
                queryParams: hisOTableInit.queryParams, //传递参数（*）
                sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
                pageNumber: 1, //初始化加载第一页，默认第一页
                pageSize: 10, //每页的记录行数（*）
                pageList: [0,5,10, 25, 50, 100, 200], //可供选择的每页的行数（*）
                search: true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                strictSearch: true,
                showColumns: true, //是否显示所有的列
                showRefresh: true, //是否显示刷新按钮
                minimumCountColumns: 2, //最少允许的列数
                //clickToSelect: true, //是否启用点击选中行
                //height: 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                //uniqueId: "ID", //每一行的唯一标识，一般为主键列
                showToggle: true, //是否显示详细视图和列表视图的切换按钮
                cardView: false, //是否显示详细视图
                detailView: false, //是否显示父子表
                showExport: true,
                exportDataType: 'all',
                columns: [
                    { field: 'APPLY_ID', title: '编号', align: 'center',sortable:'true' },
                    { field: 'APPLY_WHY', title: '申请原因', align: 'center' ,sortable:'true'},
                    { field: 'APPLY_TIME', title: '申请时间', align: 'center' ,sortable:'true',formatter:PipeApi.DateFormat},
                    { field: 'NAME', title: '申请人', align: 'center' ,sortable:'true'},
                    { field: 'descs', title: '描述', align: 'center' ,sortable:'true'},              
                    { field: 'returntime', title: '归还时间', align: 'center' ,sortable:'true',formatter:PipeApi.DateFormat},              
                    { field: 'filecount', title: '文件数目', align: 'center' ,sortable:'true'},              
                    { field: 'stute', title: '申请状态', align: 'center' ,sortable:'true',formatter:showChangeApplyStutes},
                ],
                onDblClickCell: function (field, value, row, $element) {
                	openWindosMENU("apply_d"+ row.apply_id,"apply_d"+row.APPLY_ID,row.APPLY_ID+"详细信息","apply/showApplyDesc.do?apply_id="+ row.APPLY_ID);
                	return false;
                },
                onLoadSuccess: function(data){  //加载成功时执行  
                	//$("#waitingForApproval").empty().html(data.total);
                  },  
                      
        
            })
           
    };

    //得到查询的参数
    hisOTableInit.queryParams = function(params) {
        var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        		  limit: params.limit,
                  offset: params.offset,
                  sort: params.sort,
                  order: params.order,
                  search:params.search,
                  //stute:1,
                  userid1:$("#so").val().trim(),
                  };
        return temp;
    };
    return hisOTableInit;
};

function apply_TableInit() {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function() {
        $('#apply_list_table').bootstrapTable({
                url: PipeApi.BaseUrl+'apply/showApplylistPage', //请求后台的URL（*）
                method: 'get', //请求方式（*）
                striped: true, //是否显示行间隔色
                cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true, //是否显示分页（*）
                sortable: true, //是否启用排序
                sortOrder: "desc", //排序方式
                sortName: "APPLY_TIME",//"tasksort",
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
                //clickToSelect: true, //是否启用点击选中行
                //height: 500, //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                //uniqueId: "ID", //每一行的唯一标识，一般为主键列
                showToggle: true, //是否显示详细视图和列表视图的切换按钮
                cardView: false, //是否显示详细视图
                detailView: false, //是否显示父子表
                showExport: true,
                exportDataType: 'all',
                columns: [
                    { field: 'APPLY_ID', title: '编号', align: 'center',sortable:'true' },
                    { field: 'APPLY_WHY', title: '申请原因', align: 'center' ,sortable:'true'},
                    { field: 'APPLY_TIME', title: '申请时间', align: 'center' ,sortable:'true',formatter:PipeApi.DateFormat},
                    { field: 'NAME', title: '申请人', align: 'center' ,sortable:'true'},
                    { field: 'descs', title: '描述', align: 'center' ,sortable:'true'},              
                    { field: 'returntime', title: '归还时间', align: 'center' ,sortable:'true',formatter:PipeApi.DateFormat},              
                    { field: 'filecount', title: '文件数目', align: 'center' ,sortable:'true'},              
                    { field: 'stute', title: '申请状态', align: 'center' ,sortable:'true',formatter:showChangeApplyStutes},
                ],
                onDblClickCell: function (field, value, row, $element) {
                	openWindosMENU("apply_d"+ row.apply_id,"apply_d"+row.APPLY_ID,row.APPLY_ID+"详细信息","apply/showApplyDesc.do?apply_id="+ row.APPLY_ID);
                	return false;
                },
                onLoadSuccess: function(data){  //加载成功时执行  
                	$("#waitingForApproval").empty().html(data.total);
                  },  
                      
        
            })
           
    };

    //得到查询的参数
    oTableInit.queryParams = function(params) {
        var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        		  limit: params.limit,
                  offset: params.offset,
                  sort: params.sort,
                  order: params.order,
                  search:params.search,
                  stute:2,
                  userid2:$("#so").val().trim(),
                  };
        return temp;
    };
    return oTableInit;
};
function showChangeApplyStutes(data){
	console.log(typeof(data));	
	if(data==0){
		return '不同意';		
	}else if(data==1){
		return '同意';
	}else if(data==2){
		return '等待';		
	}else if(data==3){
		return '已经归还';		
	}else if(data==null){
		return '等待';		
	}
	
}