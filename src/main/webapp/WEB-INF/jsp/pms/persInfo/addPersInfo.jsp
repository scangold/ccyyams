<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<style type="text/css">
#table_report td{width:35%;border:none !important;}
#table_report .tdNew{width:15%;}
.date-picker,.datepicker-days{cursor:pointer;}
</style>
<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
</head>
<body>
<table style="width:100%;background: #fff;">
						<tr>
						<td>
						<form action="pms/savePersInfo.do" name="newPersInfoForm" id="newPersInfoForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="USER_ID" id="user_id" value="${pd.USER_ID }"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table" style="background: #fff;">
										<c:if test="${fx != 'head'}">
										<tr>
                                         <td colspan="4" style="border-bottom:2px solid #438eb9 !important;font-size: 16px;">用户信息</td>
										</tr>
										<tr>
										<td  class="tdNew">姓名:</td>
											<td><input type="text" name="NAME" id="NAME"  value="${pd.NAME }"  maxlength="32" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
											<td rowspan="3" class="tdNew"  valign="middle" style="vertical-align:middle">照片：</td>
											<td rowspan="3"  >
											<div id="localImag">
											<img id="preview" src="<%=basePath%>static/images/defaultPhoto.jpg" width="115" height="135" style="display: block; width: 115px; height: 135px;"></div>
											</td>
										</tr>
										</c:if>
										<c:if test="${fx == 'head'}">
											<input name="ROLE_ID" id="ROLE_ID" value="${pd.ROLE_ID }" type="hidden" />
										</c:if>

										<tr>
											<td  class="tdNew">用户名:</td>
											<td><input type="text" name="USERNAME" id="USERNAME" value="${pd.USERNAME }" maxlength="32" placeholder="这里输入用户名" title="用户名" style="width:98%;"/></td>
										
										</tr>
										<tr>
										<td class="tdNew">部门:</td>
											<td>
											<select class="chosen-select form-control"  name="DEPARTMENT_ID" id="DEPARTMENT_ID" data-placeholder="请选择部门" style="vertical-align:top;" style="width:98%;" >
											<c:forEach items="${departmentList}" var="departmenttype">
												<option value="${departmenttype.DEPARTMENT_ID }" >${departmenttype.NAME }</option>
											</c:forEach>
											</select>
											</td>
										</tr>
										<tr>
										<td  class="tdNew">编号:</td>
											<td><input type="text" name="NUMBER" id="NUMBER" value="${pd.NUMBER }" maxlength="32" placeholder="这里输入编号" title="编号" onblur="hasN('${pd.USERNAME }')" style="width:98%;"/></td>
											<td colspan="2"><input type="file" name="files" class="form-control" id="doc"	placeholder="请选择文件" onchange="javascript:setImagePreview();"/></td>
											
										</tr>
										<tr>
											<td  class="tdNew">密码:</td>
											<td><input type="password" name="PASSWORD" id="PASSWORD"  maxlength="32" placeholder="输入密码" title="密码" style="width:98%;"/></td>
											<td  class="tdNew">确认密码:</td>
											<td><input type="password" name="CHKPWD" id="CHKPWD"  maxlength="32" placeholder="确认密码" title="确认密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td class="tdNew">角色:</td>
											<td >
											<select onfocus="this.defaultIndex=this.selectedIndex;" onchange="this.selectedIndex=this.defaultIndex;"   class="chosen-select form-control" name="ROLE_ID" id="ROLE_ID" data-placeholder="请选择角色" style="vertical-align:top;" style="width:98%;" >
											<c:forEach items="${roleList}" var="role">
												 <c:if test="${role.ROLE_NAME =='职工用户'}"><option value="${role.ROLE_ID }" selected>${role.ROLE_NAME }</option></c:if>
											</c:forEach>
											</select>
											</td>
											<td  class="tdNew">手机号:</td>
											<td><input type="number" name="telephone" id="PHONE"  value="${pd.PHONE }"  maxlength="11" placeholder="这里输入手机号" title="手机号" style="width:98%;"/></td>
										</tr>
										<tr>
										<td  class="tdNew">邮箱:</td>
											<td><input type="email" name="EMAIL" id="EMAIL"  value="${pd.EMAIL }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" onblur="hasE('${pd.USERNAME }')" style="width:98%;"/></td>
											
											<td  class="tdNew" >备注:</td>
											<td colspan="3"><input type="text" name="BZ" id="BZ"value="${pd.BZ }" placeholder="这里输入备注" maxlength="64" title="备注" style="width:98%;"/></td>
										</tr>
										<tr>
                                         <td colspan="4" style="border-bottom:2px solid #438eb9  !important;font-size: 16px;">人事信息</td>
										</tr>
											<tr>
											<td  class="tdNew">性别:</td>
											<td>
											<select class="chosen-select form-control" name="sex" id="SEX" data-placeholder="请选择性别" style="vertical-align:top;" style="width:98%;" >
											<option value='男'>男</option>
											<option value='女'>女</option>
											</select>
											</td>
											<td  class="tdNew">名族:</td>
											<td><input type="text" name="nation" id="NATION"value="${pd.NATION }" placeholder="这里输入名族" maxlength="64" title="名族" style="width:98%;"/></td>
										</tr>
										<tr>
											<td  class="tdNew">职务:</td>
											<td>
											<%-- <input type="text" name="PPOST" id="PPOST"  value="${pd.PPOST }" maxlength="32" placeholder="这里输入职务" title="职务"  style="width:98%;"/> --%>
											<select class="chosen-select form-control" name="ppost" id="PPOST"  style="width:98%;" >
											<option value='处级正职'>处级正职</option>
											<option value='处级副职'>处级副职</option>
											<option value='科级正职'>科级正职</option>
											<option value='科级副职' >科级副职</option>
											<option value='科员'>科员</option>
											<option value='办事员'>办事员</option>
											</select>
											</td>
											<td  class="tdNew">职称:</td>
											<td>
											<%-- <input type="text" name="PTITLE" id="PTITLE"value="${pd.PTITLE }" placeholder="这里输入职称" maxlength="64" title="职称" style="width:98%;"/> --%>
											<select class="chosen-select form-control" name="ptitle" id="PTITLE"  style="width:98%;" >
											<option value='工程师'>工程师</option>
											<option value='助理工程师'>助理工程师</option>
											<option value='技术员'>技术员</option>
											<option value='教授级高级工程师'>教授级高级工程师</option>
											<option value='高级工程师'>高级工程师</option>
											</select>
											</td>
										</tr>
											<tr>
											<td  class="tdNew">籍贯:</td>
											<td><input type="text" name="originplace" id="ORIGINPLACE"  value="${pd.ORIGINPLACE }" maxlength="64" placeholder="这里输入籍贯" title="籍贯"style="width:98%;"/></td>
											<td  class="tdNew">政治面貌:</td>
											<td>
											<select class="chosen-select form-control" name="politicalid" id="POLITICALID" data-placeholder="请选择政治面貌" style="vertical-align:top;" style="width:98%;" >											
										    <option value='中共党员'>中共党员</option>
											<option value='共青团员'>共青团员</option>
											<option value='群众'>群众</option> 
											</select>
											</td>
										</tr>
										<tr>
											<td  class="tdNew">入党时间:</td>
											<td><input class="span10 date-picker" name="joinpartyday" id="JOINPARTYDAY"  value="${pd.JOINPARTYDAY}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="入党时间" title="入党时间"/></td>
										  
											<td  class="tdNew">入团时间:</td>
											<td><input class="span10 date-picker" name="joinleagueday" id="JOINLEAGUEDAY"  value="${pd.JOINLEAGUEDAY}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="入团时间" title="入团时间"/></td>
										</tr>
										<tr>
											<td  class="tdNew">婚姻状况:</td>
											<td>
											<select class="chosen-select form-control" name="maritalstatus" id="MARITALSTATUS"  style="vertical-align:top;" style="width:98%;" >
											<option value='已婚'>已婚</option>
											<option value='未婚'>未婚</option>
											</select>
											</td>
											<td  class="tdNew">最高学历:</td>
											<td>
											<select class="chosen-select form-control" name="degree" id="DEGREE"  style="vertical-align:top;" style="width:98%;" >
											 <option value='本科'>本科</option>
											<option value='博士研究生'>博士研究生</option>
											<option value='硕士研究生'>硕士研究生</option>
											<option value='专科'>专科</option>
											
											</select>
										<%-- 	<input type="text" name="DEGREE" id="DEGREE"value="${pd.DEGREE }" placeholder="这里输入最高学历" maxlength="64" title="最高学历" style="width:98%;"/> --%>
											</td>
										</tr>
										<tr>
											<td  class="tdNew">所学专业:</td>
											<td><input type="text" name="major" id="MAJOR"  value="${pd.MAJOR }" maxlength="32" placeholder="这里输入所学专业" title="所学专业" style="width:98%;"/></td>
											<td  class="tdNew">所在学校:</td>
											<td><input type="text" name="school" id="SCHOOL"value="${pd.SCHOOL }" placeholder="这里输入学校" maxlength="64" title="学校" style="width:98%;"/></td>
										</tr>
											<tr>
											<td  class="tdNew">户口所在地:</td>
											<td><input type="text" name="hukou" id="HUKOU"  value="${pd.HUKOU }" maxlength="64" placeholder="这里输入户口所在地" title="户口"  style="width:98%;"/></td>
											<td  class="tdNew">身份证号:</td>
											<td><input type="text" name="idnumber" id="IDNUMBER"value="${pd.IDNUMBER }" placeholder="这里输入身份证号" maxlength="18" title="身份证号" style="width:98%;"/></td>
										</tr>
										
											<tr>
											<td  class="tdNew">在职状态:</td>
											<td>
											<select class="chosen-select form-control" name="hired" id="HIRED"  style="vertical-align:top;" style="width:98%;" >
											<option value='1'>在职</option>
											<option value='0'>离职</option>
											
											</select>
											</td>
										</tr>
										<tr >
											<td style="text-align: center;" colspan="10" >
												<a  class="btn btn-mini btn-primary" onclick="Psave();">保存</a>
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a> 
											</td>
										</tr>
									</table>
						</div>
						<div id="zhongxin2" class="center" style="display: none">
									<br /> <br /> <br /> <br /> <img
										src="static/images/jiazai.gif" /><br />
									<h4 class="lighter block green"></h4>
								</div>			
						</form>
						</td>
						</tr>
					</table>
		<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript">
    $(top.hangge());
  //保存新增的人事信息
	function Psave(){
	//登录名验证
	   if($("#USERNAME").val()=="" || $("#USERNAME").val()=="此用户名已存在!"){
			$("#USERNAME").tips({
				side:3,
	            msg:'输入用户名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USERNAME").focus();
			$("#USERNAME").val('');
			$("#USERNAME").css("background-color","white");
			return false;
		}else{
			$("#USERNAME").val(jQuery.trim($('#USERNAME').val()));
		}
	  //输入编号验证
	  if($("#NUMBER").val()==""){
			$("#NUMBER").tips({
				side:3,
	            msg:'输入编号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#NUMBER").focus();
			return false;
		}else{
			$("#NUMBER").val($.trim($("#NUMBER").val()));
		}
	  //输入密码验证
	  if($("#PASSWORD").val()==""){
			$("#PASSWORD").tips({
				side:3,
	            msg:'输入密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#password").focus();
			return false;
		}
	  //两次密码验证
	  if($("#PASSWORD").val()!=$("#CHKPWD").val()){
			$("#CHKPWD").tips({
				side:3,
	            msg:'两次密码不相同',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#CHKPWD").focus();
			return false;
		}
	  //名字验证
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'输入姓名',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#NAME").focus();
			return false;
		}
		 //身份证号码验证
		if($("#IDNUMBER").val().length != 18 && $("#IDNUMBER").val()==""){
			$("#IDNUMBER").tips({
				side:3,
	            msg:'输入身份证号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#IDNUMBER").focus();
			return false;
		}
	  //电话号码验证
	var myreg = /^(((13[0-9]{1})|159)+\d{8})$/;
		if($("#PHONE").val()==""){
			
			$("#PHONE").tips({
				side:3,
	            msg:'输入手机号',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}else if($("#PHONE").val().length != 11 && !myreg.test($("#PHONE").val())){
			$("#PHONE").tips({
				side:3,
	            msg:'手机号格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#PHONE").focus();
			return false;
		}
		//电子邮箱验证
           if($("#EMAIL").val()==""){
			$("#EMAIL").tips({
				side:3,
	            msg:'输入邮箱',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		}else if(!ismail($("#EMAIL").val())){
			$("#EMAIL").tips({
				side:3,
	            msg:'邮箱格式不正确',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#EMAIL").focus();
			return false;
		} 
        if($("#user_id").val()==""){
   			hasU();
   		}else{
		$("#newPersInfoForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
   		}
		
		/* } */
	}
	function ismail(mail){
		return(new RegExp(/^(?:[a-zA-Z0-9]+[_\-\+\.]?)*[a-zA-Z0-9]+@(?:([a-zA-Z0-9]+[_\-]?)*[a-zA-Z0-9]+\.)+([a-zA-Z]{2,})+$/).test(mail));
		}
	//判断用户名是否存在
	function hasU(){
		var USERNAME = $.trim($("#USERNAME").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasU.do',
	    	data: {USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" == data.result){
					 $("#newPersInfoForm").submit();
						$("#zhongxin").hide();
						$("#zhongxin2").show();
				 }else{
					 $("#USERNAME").css("background-color","#D16E6C");
						setTimeout("$('#USERNAME').val('此用户名已存在!')",500);
					   $("#USERNAME").focus();
				 }
			}
		});
	}
	//判断编码是否存在
	function hasN(USERNAME){
		var NUMBER = $.trim($("#NUMBER").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasN.do',
	    	data: {NUMBER:NUMBER,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#NUMBER").tips({
							side:3,
				            msg:'编号 '+NUMBER+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#NUMBER").val('');
				 }
			}
		});
	}
	//判断邮箱是否存在
	function hasE(USERNAME){
		var EMAIL = $.trim($("#EMAIL").val());
		$.ajax({
			type: "POST",
			url: '<%=basePath%>user/hasE.do',
	    	data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
			dataType:'json',
			cache: false,
			success: function(data){
				 if("success" != data.result){
					 $("#EMAIL").tips({
							side:3,
				            msg:'邮箱 '+EMAIL+' 已存在',
				            bg:'#AE81FF',
				            time:3
				        });
					 $("#EMAIL").val('');
				 }
			}
		});
	}
    $(function(){
    	//下拉框
  	   $('.chosen-select').chosen({ allow_single_deselect: true,width:"98%" }); 
    	//日期框
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		});

    })
    //下面用于图片上传预览功能
        function setImagePreview(avalue) {
            var docObj=document.getElementById("doc");

            var imgObjPreview=document.getElementById("preview");
            if(docObj.files &&docObj.files[0])
            {
//火狐下，直接设img属性
                imgObjPreview.style.display = 'block';
                imgObjPreview.style.width = '115px';
                imgObjPreview.style.height = '135px';
//imgObjPreview.src = docObj.files[0].getAsDataURL();

//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
                imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
            }
            else
            {
//IE下，使用滤镜
                docObj.select();
                var imgSrc = document.selection.createRange().text;
                var localImagId = document.getElementById("localImag");
//必须设置初始大小
                localImagId.style.width = "115px";
                localImagId.style.height = "135px";
//图片异常的捕捉，防止用户修改后缀来伪造图片
                try{
                    localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                }
                catch(e)
                {
                    alert("您上传的图片格式不正确，请重新选择!");
                    return false;
                }
                imgObjPreview.style.display = 'none';
                document.selection.empty();
            }
            return true;
        }

    </script>

	 
</body>
</html>