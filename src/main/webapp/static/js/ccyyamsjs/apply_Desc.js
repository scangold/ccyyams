$(function() {



	$("#reapply").on('click', function() {
		
		PipeApi.SaveApplyStute($(this).attr("name"), "3", "","归还", function(mess) {
			var r= mess.result;
			var t= mess.desc;
			var e= mess.res;
			if(r==true)
			{

				window.location.reload()
			}
			else
			{
				swal(
						'NO!',
						t,
						'error'
				)
								.then(function(isConfirm) {
                                if (isConfirm === true){window.location.reload()}
                                else{window.location.reload()}
                                })
			}
		}, PipeApi.ERROR)
	});
	

	$("#apply_Agree").on('click', function() {
		
		PipeApi.SaveApplyStute($(this).attr("name"), "1", "",$("#apply_stute_desc").val(), function(mess) {
			var r= mess.result;
			var t= mess.desc;
			var e= mess.res;
			if(r==true)
	            {

						window.location.reload()
				}
			else
				{
				swal(
						  '同意成功但未分发',
						  t,
						  'warning'
						)
								.then(function(isConfirm) {
                                if (isConfirm === true){window.location.reload()}
                                else{window.location.reload()}
                                })
					}
		}, PipeApi.ERROR)
	});
	$("#apply_Disagree").on('click', function() {
		PipeApi.SaveApplyStute($(this).attr("name"), "0", "",$("#apply_stute_desc").val(), function(mess) {
			var r= mess.result;
			var t= mess.desc;
			var e= mess.res;
			if(r==true)
	            {

						window.location.reload()
				}
			else
				{
				swal(
						  'NO!',
						  t,
						  'error'
						)
								.then(function(isConfirm) {
                                if (isConfirm === true){window.location.reload()}
                                else{window.location.reload()}
                                })
					}

		}, PipeApi.ERROR)
	});
	$("#apply_changeToOrther").on('click',function() {
				PipeApi.SaveApplyStute($(this).attr("name"), "2", $(
				"#apply_Change_user").val(),$("#apply_stute_desc").val(), function(mess) {
					var r= mess.result;
					var t= mess.desc;
					var e= mess.res;
					if(r==true)
			            {

								window.location.reload()
						}
					else
						{
						swal(
								  'NO!',
								  t,
								  'error'
								)
								.then(function(isConfirm) {
                                if (isConfirm === true){window.location.reload()}
                                else{window.location.reload()}
                                })
							}

				}, PipeApi.ERROR)
			});
	$("#apply_roleselect").on('change',function() {	

		PipeApi.ChangeUserByRoleID($("#apply_roleselect").val(), function(mess) {
			console.log(mess);
			var r= mess.res;
			$("#apply_Change_user").empty();
			for (var int = 0; int < r.length; int++) {
				$("#apply_Change_user").append("<option value='"+r[int].USER_ID+"'>"+r[int].NAME+"</option>");
			}

		},PipeApi.ERROR)
	});
	
});



function apply_TableInit_desc() {

	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function() {
		$('#apply_file_list_table').bootstrapTable({
			//url: PipeApi.BaseUrl+'apply/showApplylistPage', //请求后台的URL（*）
			data:datas,
			method: 'get', //请求方式（*）
			// toolbar: '#toolbar_m1', //工具按钮用哪个容器
			striped: true, //是否显示行间隔色
			cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination: true, //是否显示分页（*）
			sortable: true, //是否启用排序
			sortOrder: "asc", //排序方式
			// sortName: "apply_time",//"tasksort",
			// queryParams: oTableInit.queryParams, //传递参数（*）
			sidePagination: "client", //分页方式：c客户端分页，server服务端分页（*）
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
			          { field: 'apply_id', title: '编号', align: 'center',sortable:'true' },
			          { field: 'apply_why', title: '申请原因', align: 'center' ,sortable:'true'},
			          { field: 'apply_time', title: '申请时间', align: 'center' ,sortable:'true',formatter:PipeApi.DateFormat},
			          { field: 'user_id_name', title: '申请人', align: 'center' ,sortable:'true'},
			          { field: 'descs', title: '描述', align: 'center' ,sortable:'true'},              
			          { field: 'returntime', title: '归还时间', align: 'center' ,sortable:'true',formatter:PipeApi.DateFormat},              
			          { field: 'filecount', title: '文件数目', align: 'center' ,sortable:'true'},              
			          { field: 'stutes', title: '申请状态', align: 'center' ,sortable:'true',formatter:showChangeApplyStutes},
			          ] ,
			          onDblClickCell: function (field, value, row, $element) {
			        	  openWindosMENU("apply_d"+ row.apply_id,"apply_d"+row.apply_id,row.apply_id+"详细信息","apply/showApplyDesc.do?apply_id="+ row.apply_id);
			        	  return false;
			          }


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