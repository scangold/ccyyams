<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>		

<form action="archive/upload" method="post" enctype="multipart/form-data">
  项目id   <input type="text"  name="prjId" value="33038"><br>
checkdetails  <input  name="checkdetails" value="33038"><br>
CheckfileUrl  <input  name="CheckfileUrl" value="33038"><br>
prodepart  <input  name="prodepart" value="prodepart"><br>
rcDepart  <input  name="rcDepart" value="rcDepart"><br>
rcName  <input  name="rcName" value="rcName"><br>
rcProgress  <input  name="rcProgress" value="rcProgress"><br>
rcRemark  <input  name="rcRemark" value="rcRemark"><br>
rcString  <input  name="rcString" value="rcString"><br>
transfname  <input  name="transfname" value="transfname"><br>
file表
VOLUME  <input  name="volume" value="volume"><br>
IFARCHIVE  <input  name="ifarchive" value="5"><br>
fileType  <input  name="fileType" value="fileType"><br>

请选择要上传的文件<input type="file" name="file" >


<input type="submit" value="提交">
</form>
</body>
</html>