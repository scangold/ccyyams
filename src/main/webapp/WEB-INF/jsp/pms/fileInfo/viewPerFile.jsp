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
						<form name="viewPersFileForm" id="viewPersFileForm" method="post">
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table" style="background: #fff;">
										<c:if test="${fx != 'head'}">
										<tr>
										<td  class="tdNew">档案盒编号:</td>
											<td>
											<input type="text" name="pfileNum" id="pfileNum"  value="${pd.PFILE_NUM }" placeholder="无" title="档案盒编号" style="width:98%;"/>
											</td>
											<td class="tdNew">档案类型:</td>
											<td>
											<input type="text"  value="${pd.PFILE_TYPE_NAME }" placeholder="无" title="档案类型" style="width:98%;"/>
											</td>
										</tr>
										</c:if>

										<tr>
											<td  class="tdNew">档案（盒）名称:</td>
											<td><input type="text" name="pfileName" id="pfileName" value="${pd.PFILE_NAME }" maxlength="32" placeholder="无" title="用户名" style="width:98%;"/></td>
										<td  class="tdNew">形成时间:</td>
											<td>
											
											<input  name="pfileCreatime" id="pfileCreatime"  value="${pd.PFILE_CREATIME}" type="text"  style="width: 98%;" placeholder="无" title="形成时间"/>
											</td>
										</tr>

										<tr>
											<td class="tdNew">页数:</td>
											<td >
										<input type="number" name="pfilePages" id="pfilePages"  value="${pd.PFILE_PAGES }"  maxlength="11" placeholder="无" title="页数" style="width:98%;"/></td>
										
											<td  class="tdNew">备注:</td>
											<td>
											<input type="number" name="pfileRemark" id="pfileRemark"  value="${pd.PFILE_REMARK }"   placeholder="无" title="备注" style="width:98%;"/></td>
										</tr>
										<tr>
											<td  class="tdNew">入档时间:</td>
											<td>
											<input name="pfileLoadtime" id="pfileLoadtime"  value="${pd.PFILE_LOADTIME}" type="text"  style="width: 98%;" placeholder="无" title="入党时间"/>
											</td>
											<td  class="tdNew">档案在库否:</td>
											<td>
											<c:choose>
											<c:when test="${pd.EXISTORNOT=='1'}">
											<input  name="existornot" id="existornot"  value="是" type="text"  style="width: 98%;" placeholder="无" title="档案在库否"/>											
											</c:when>
											<c:otherwise>
											<input  name="existornot" id="existornot"  value="否" type="text"  style="width: 98%;" placeholder="无" title="档案在库否"/>											
											</c:otherwise>
											</c:choose>
											</td>
										
										</tr>
											<tr>
											<td  class="tdNew">档案进入方式:</td>
											<td><input type="text" name="receiveHow" id="receiveHow"value="${pd.RECEIVE_HOW }" placeholder="无" maxlength="64" title="档案进入方式" style="width:98%;"/>
											</td>
											<td  class="tdNew">档案进入日期:</td>
											<td>
											<input name="receiveDate" id="receiveDate"  value="${pd.RECEIVE_DATE}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="无" title="档案进入日期"/>
											</td>
										</tr>
											<tr>
											<td  class="tdNew">档案移出方式:</td>
											<td><input type="text" name="removeHow" id="removeHow"value="${pd.REMOVE_HOW }" placeholder="无" maxlength="64" title="档案移出方式" style="width:98%;"/></td>
					
											<td  class="tdNew">档案移出日期:</td>
											<td>
											<input name="removeDate" id="removeDate"  value="${pd.REMOVE_DATE}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="无" title="档案移出日期"/>
											</td>
										</tr>
											<tr>
											<td  class="tdNew">其他:</td>
											<td><input type="text" name="other" id="other"  value="${pd.OTHER }" maxlength="64" placeholder="无" title="其他"style="width:98%;"/></td>
									
										</tr>
										<tr >
											<td style="text-align: center;" colspan="10" >
												<a  class="btn btn-mini btn-primary" onclick="top.Dialog.close();">确定</a>
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