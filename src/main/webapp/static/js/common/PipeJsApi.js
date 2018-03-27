Date.prototype.Format = function (fmt) { //author: meizz 
	var o = {
			"M+": this.getMonth() + 1, //月份 
			"d+": this.getDate(), //日 
			"h+": this.getHours(), //小时 
			"m+": this.getMinutes(), //分 
			"s+": this.getSeconds(), //秒 
			"q+": Math.floor((this.getMonth() + 3) / 3), //季度 
			"S": this.getMilliseconds() //毫秒 
	};
	if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}



function openWindosMENU(id,fid,MENU_NAME,MENU_URL){	
	$("#"+id).removeClass();
	$("#"+fid).removeClass();	
	$("#"+fid).attr("class","active open");
	$("#"+id).attr("class","active");
	top.mainFrame.tabAddHandler(id,MENU_NAME,MENU_URL);
	if(MENU_URL != "druid/index.html"){
		jzts();
	}
}
var PipeApi = new function () {
	this.BaseUrl = "/CCYYAMS/";
	var BaseUrl = this.BaseUrl;
	var Token = null;
	CallApi = function (apipath, paras, successcallback, errorcallback, datatype) {
		if (datatype == null) datatype = "json";
		$.ajax({
			type: "POST",
			dataType: datatype,
			data: paras,
			xhrFields: {
				withCredentials: true,
				useDefaultXhrHeader: false
			},
			url: BaseUrl + apipath + "?",
			success:successcallback,
			error: errorcallback
		}
		);
	}
	this.ERROR=function(err){
		
		console.log(err,"请联系管理");
		debugger;

	}
	this.DateFormat = function(fmt) { //author: meizz 	
		if(fmt==null||fmt==""||fmt=="-"){
			return "-";
		}else{ 
			return new Date(fmt).Format("yyyy-MM-dd hh:mm:ss");
		}

	}


	this.SaveApplyStute=function(applyid,stute,userid,desc, successcallback, errorcallback){

		CallApi("apply/saveApplyStute.do",{applyId:applyid,userId2:userid,stute:stute,stuteDesc:desc},successcallback, errorcallback);

	}
	this.ChangeUserByRoleID=function(roleid,successcallback, errorcallback){
		CallApi("user/changeUserByRoleId.do",{roleId:roleid} ,successcallback, errorcallback);

	}
	this.SaveApplyforms=function(applyWhys,returntimes,descsa,fileId,successcallback, errorcallback){
		console.log(descsa);
     	CallApi("apply/addApplys.do",{applyWhy:applyWhys,returntime:returntimes,descs:descsa,fileIds:fileId } ,successcallback, errorcallback);

	}
	this.SaveArchdistribute=function(userId,descs,fileId,successcallback, errorcallback){
     	CallApi("archdistribute/saveArchdistribute.do",{userIds:userId,desc:descs,keywords:fileId } ,successcallback, errorcallback);

	}
	this.GetProjiecNameAndId=function( name,successcallback, errorcallback){
		
     	CallApi("project/getProjiecNameAndId.do",{proname:name},successcallback, errorcallback);
	}

	this.GetRealstorageby=function(storagetypes,successcallback, errorcallback){
		
     	CallApi("archivestorage/getRealstorageby.do",{storagetype:storagetypes},successcallback, errorcallback);
	}
	this.GetRecivebyPageDate=function(keyword,successcallback, errorcallback){
		
		CallApi("archive/getRecivebyPageDate.do",{prjId:keyword},successcallback, errorcallback);
	}

}

