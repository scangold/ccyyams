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
						<form action="pms/${msg}.do" name="newPersFileForm" id="newPersFileForm" method="post">
						<!-- 新建/更新档案的时候记录人事Pid -->
						<input type="hidden"  name="pId" id="pId" value="${pd.P_ID }"/>
						<!-- 新建档案的时候记录档案盒子id -->
						<input type="hidden"   name="PmsPfileBoxId" id="PmsPfileBoxId" value="${pd.PFILE_ID }"/>
						<!-- 修改档案的时候记录档案id -->
						<input type="hidden"   name="PFile_Id" id="PFile_Id" value="${pd.PFILE_ID }"/>
						<!-- <input  name="pfileTypeId" id="pfileTypeId" value="1"/> -->
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table" style="background: #fff;">
										<c:if test="${fx != 'head'}">
										<tr>
										<td  class="tdNew">档案盒编号:</td>
											<td><input type="text" name="pfileNum" id="pfileNum"  value="${pd.PFILE_NUM }"  maxlength="32" placeholder="这里输入档案盒编号" title="档案盒编号" style="width:98%;"/></td>
											<td  class="tdNew">档案（盒）名称:</td>
											<td><input type="text" name="pfileName" id="pfileName" value="${pd.PFILE_NAME }" maxlength="32" placeholder="这里输入档案（盒）名称" title="档案（盒）名称" style="width:98%;"/></td>
										
											
										</tr>
										</c:if>
<c:if test="${pd.boxornot=='1'}">
										<tr>
											<td class="tdNew">页数:</td>
											<td >
										<input type="number" name="pfilePages" id="pfilePages"  value="${pd.PFILE_PAGES }"  maxlength="11" placeholder="这里输入页数" title="页数" style="width:98%;"/></td>
										<td class="tdNew">档案类型:</td>
											<td>
											<select class="chosen-select form-control"  name="pfileTypeId" id="pfileTypeId" data-placeholder="请选择档案类型" style="vertical-align:top;" style="width:98%;" >
											<c:forEach items="${fileTypeList}" var="filetypelist">
												<option value="${filetypelist.PFILE_TYPE_ID }" >${filetypelist.PFILE_TYPE_NAME }</option>
											</c:forEach>
											</select>
											</td>
											
										</tr>
										
										</c:if>
					
										<tr>
										<td  class="tdNew">备注:</td>
											<td>
											<input name="pfileRemark" id="pfileRemark"  value="${pd.PFILE_REMARK }"   placeholder="这里输入备注" title="备注" style="width:98%;"/></td>
											
										<td  class="tdNew">形成时间:</td>
											<td>
											<input class="span10 date-picker" name="pfileCreatime" id="pfileCreatime"  value="${pd.PFILE_CREATIME}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="请选择形成时间" title="形成时间"/>
											</td>
										</tr>
					<tr>
											<td  class="tdNew">入档时间:</td>
											<td>
											<input class="span10 date-picker" name="pfileLoadtime" id="pfileLoadtime"  value="${pd.PFILE_LOADTIME}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="入档时间" title="入档时间"/>
											</td>
											<td  class="tdNew">档案在库否:</td>
											<td>
											<select class="chosen-select form-control" name="existornot" id="existornot" value="${pd.EXISTORNOT }"  style="vertical-align:top;" style="width:98%;" >
											<option value='1'>是</option>
											<option value='0'>否</option>
											
											</select>
											</td>
										
										</tr>
										
											<tr>
											
										<td  class="tdNew">档案进入方式:</td>
											<td><input type="text" name="receiveHow" id="receiveHow"value="${pd.RECEIVE_HOW }" placeholder="这里输入档案进入方式" maxlength="64" title="档案进入方式" style="width:98%;"/></td>
										<td  class="tdNew">档案移出方式:</td>
											<td><input type="text" name="removeHow" id="removeHow"value="${pd.REMOVE_HOW }" placeholder="这里输入档案移出方式" maxlength="64" title="档案移出方式" style="width:98%;"/></td>
					
											
										</tr>
											<tr>
											<td  class="tdNew">档案进入日期:</td>
											<td>
											<input class="span10 date-picker" name="receiveDate" id="receiveDate"  value="${pd.RECEIVE_DATE}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="档案进入日期" title="档案进入日期"/>
											</td>
											
											<td  class="tdNew">档案移出日期:</td>
											<td>
											<input class="span10 date-picker" name="removeDate" id="removeDate"  value="${pd.REMOVE_DATE}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="档案移出日期" title="档案移出日期"/>
											</td>
										</tr>
											<tr>
											<td  class="tdNew">其他:</td>
											<td><input type="text" name="other" id="other"  value="${pd.OTHER }" maxlength="64" placeholder="这里输入其他" title="其他"style="width:98%;"/></td>
									
										</tr>
										
										
										<tr >
											<td style="text-align: center;" colspan="10" >
												<a  class="btn btn-mini btn-primary" onclick="Fsave();">保存</a>
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
    //保存新增档案信息
    function Fsave(){
    	$("#newPersFileForm").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
    }
  /*   $("#pfileTypeIdSelect").chosen().on("change", function () {
    	$("#pfileTypeId").empty().val($("#pfileTypeIdSelect").val());
    }) */
    $(function(){
    	//下拉框
  	   $('.chosen-select').chosen({ allow_single_deselect: true,width:"98%" }); 
    	//日期框
		$('.date-picker').datepicker({
			autoclose: true,
			todayHighlight: true
		});

    })
    
    </script>

	 
</body>
</html>