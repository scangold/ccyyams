var locat = (window.location + '').split('/');


function sendcheckfile(){

	top.mainFrame.tabAddHandler(id,MENU_NAME,MENU_URL);
	if(MENU_URL != "druid/index.html"){
		jzts();
	}
}






function   chkmaxsms(vobj1,vmax)   {  
  var   str=vobj1.value;  
  var   strlen=str.length;  
   
  if(strlen>vmax)   {  
  alert('字数超过最大数量为'+vmax+'的限制');  
  eval_r(vobj1.value=str.substr(0,vmax));  
  }  
  }  



var isIE=!!window.ActiveXObject;
var isIE6=isIE&&!window.XMLHttpRequest;
var isIE8=isIE&&!!document.documentMode;
var isIE7=isIE&&!isIE6&&!isIE8;

function fileChange(target) {
	var fileSize = 0;
	
	if (isIE && !target.files) {
		var filePath = target.value;
		var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
		if (!fileSystem.FileExists(filePath)) {
			alert("附件不存在，请重新输入！");
			return false;
		}
		var file = fileSystem.GetFile(filePath);
		fileSize = file.Size;
	} else {
		fileSize = target.files[0].size;
	}

	var size = fileSize;
	var maxsize = 1024*1024*1024 ;//1GB
	if (size > maxsize) {
		alert("附件大小不能大于1GB！"+"\n"+" 大于1GB的文件请选择硬盘存储，或使用FTP上传至服务器！");
		target.value = "";
		return false;
	}
	if (size <= 0) {
		alert("附件大小不能为0KB！");
		target.value = "";
		return false;
	}
}




function CurentTime()  
{   
    var now = new Date();  
      
    var year = now.getFullYear();       //年  
    var month = now.getMonth() + 1;     //月  
    var day = now.getDate();            //日  
      
    var hh = now.getHours();            //时  
    var mm = now.getMinutes();          //分  
    var ss = now.getSeconds();           //秒  
      
    var clock = year + "-";  
      
    if(month < 10)  
        clock += "0";  
      
    clock += month + "-";  
      
    if(day < 10)  
        clock += "0";  
          
    clock += day + " ";  
      
    if(hh < 10)  
        clock += "0";  
          
    clock += hh + ":";  
    if (mm < 10) clock += '0';   
    clock += mm + ":";   
       
    if (ss < 10) clock += '0';   
    clock += ss; 
    
    return(clock);   
}  

function CurentDate()  
{   
    var now = new Date();  
      
    var year = now.getFullYear();       //年  
    var month = now.getMonth() + 1;     //月  
    var day = now.getDate();            //日  
      
  
      
    var clock = year + "-";  
      
    if(month < 10)  
        clock += "0";  
      
    clock += month + "-";  
      
    if(day < 10)  
        clock += "0";  
          
    clock += day + " ";  
 
    
    return(clock);   
}  


























