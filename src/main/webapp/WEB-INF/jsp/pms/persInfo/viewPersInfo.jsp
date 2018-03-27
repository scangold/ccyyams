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
</style>
<!-- jsp文件头和头部 -->
<%@ include file="../../system/index/top.jsp"%>
</head>
<body>
<table style="width:100%;background: #fff;">
						<tr>
						<td>
						
						<table id="table_report" class="table">
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
											<c:choose>
											<c:when test="${pd.PHOTOPATH ==''||pd.PHOTOPATH ==null}">
											<img id="preview" src="<%=basePath%>static/images/defaultPhoto.jpg" width="115" height="135" style="display: block; width: 115px; height: 135px;">
											</c:when>
											<c:otherwise>
											<img id="preview" src="data:image/jpg;base64,${pd.newpath }" width="115" height="135" style="display: block; width: 115px; height: 135px;">
											</c:otherwise>
											</c:choose>
											</div>
											</td>
										</tr>
										</c:if>

										<tr>
										<td class="tdNew">部门:</td>
											<td>
											<input type="text" name="DEPARTMENT_NAME" id="DEPARTMENT_NAME"  value="${pd.DEPARTMENT_NAME}"  maxlength="32" placeholder="所在部门" title="部门" style="width:98%;"/>
											</td>
											</tr>
											<tr>
											<td  class="tdNew">手机号:</td>
											<td><input type="number" name="PHONE" id="PHONE"  value="${pd.PHONE }"  maxlength="11" placeholder="无" title="手机号" style="width:98%;"/></td>
										    </tr>
											
										<tr>
											<td  class="tdNew">邮箱:</td>
											<td><input type="email" name="EMAIL" id="EMAIL"  value="${pd.EMAIL }" maxlength="32" placeholder="无" title="邮箱"  style="width:98%;"/></td>
										
											<td  class="tdNew">备注:</td>
											<td ><input type="text" name="BZ" id="BZ"value="${pd.BZ }" placeholder="无" maxlength="64" title="备注" style="width:98%;"/></td>
										</tr>
										<tr>
                                         <td colspan="4" style="border-bottom:2px solid #438eb9  !important;font-size: 16px;">人事信息</td>
										</tr>
											<tr>
											<td  class="tdNew">性别:</td>
											<td>
											<input type="text" name="SEX" id="SEX"value="${pd.SEX }" placeholder="性别" maxlength="64" title="性别" style="width:98%;"/>
											</td>
											<td  class="tdNew">名族:</td>
											<td><input type="text" name="NATION" id="NATION"value="${pd.NATION }" placeholder="无" maxlength="64" title="名族" style="width:98%;"/></td>
										</tr>
										
											<tr>
											<td  class="tdNew">籍贯:</td>
											<td><input type="text" name="ORIGINPLACE" id="ORIGINPLACE"  value="${pd.ORIGINPLACE }" maxlength="64" placeholder="无" title="籍贯"style="width:98%;"/></td>
											<td  class="tdNew">政治面貌:</td>
											<td>
											<input type="text" name="POLITICALID" id="POLITICALID"value="${pd.POLITICALID }" placeholder="无" maxlength="64" title="政治面貌" style="width:98%;"/>
											</td>
										</tr>
										<tr>
											<td  class="tdNew">入党时间:</td>
											<td><input class="span10 date-picker" name="JOINPARTYDAY" id="JOINPARTYDAY"  value="${pd.JOINPARTYDAY}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="无" title="入党时间"/></td>
										    <%--  <td><input type="text" name="EMAIL" id="EMAIL"  value="${pd.EMAIL }" maxlength="32" placeholder="这里输入邮箱" title="邮箱" onblur="hasE('${pd.USERNAME }')" style="width:98%;"/></td> --%>
											<td  class="tdNew">入团时间:</td>
											<td><input class="span10 date-picker" name="JOINLEAGUEDAY" id="JOINLEAGUEDAY"  value="${pd.JOINLEAGUEDAY}" type="text" data-date-format="yyyy-mm-dd" style="width: 98%;" placeholder="无" title="入团时间"/></td>
										</tr>
										<tr>
											<td  class="tdNew">婚姻状况:</td>
											<td>
											<input type="text" name="MARITALSTATUS" id="MARITALSTATUS"value="${pd.MARITALSTATUS }" placeholder="无" maxlength="64" title="婚姻" style="width:98%;"/>
			
											</td>
											<td  class="tdNew">最高学历:</td>
											<td><input type="text" name="DEGREE" id="DEGREE"value="${pd.DEGREE }" placeholder="无" maxlength="64" title="最高学历" style="width:98%;"/></td>
										</tr>
										<tr>
											<td  class="tdNew">所学专业:</td>
											<td><input type="text" name="MAJOR" id="MAJOR"  value="${pd.MAJOR }" maxlength="32" placeholder="无" title="所学专业" style="width:98%;"/></td>
											<td  class="tdNew">所在学校:</td>
											<td><input type="text" name="SCHOOL" id="SCHOOL"value="${pd.SCHOOL }" placeholder="无" maxlength="64" title="学校" style="width:98%;"/></td>
										</tr>
											<tr>
											<td  class="tdNew">户口所在地:</td>
											<td><input type="text" name="HUKOU" id="HUKOU"  value="${pd.HUKOU }" maxlength="64" placeholder="无" title="户口"  style="width:98%;"/></td>
											<td  class="tdNew">身份证号:</td>
											<td><input type="text" name="IDNUMBER" id="IDNUMBER"value="${pd.IDNUMBER }"maxlength="18" placeholder="无"  title="身份证号" style="width:98%;"/></td>
										</tr>
										<tr>
											<td  class="tdNew">职务:</td>
											<td><input type="text" name="PPOST" id="PPOST"  value="${pd.PPOST }" maxlength="32" placeholder="无" title="职务"  style="width:98%;"/></td>
											<td  class="tdNew">职称:</td>
											<td><input type="text" name="PTITLE" id="PTITLE"value="${pd.PTITLE }" placeholder="无" maxlength="64" title="职称" style="width:98%;"/></td>
										</tr>
								
										<tr>
											<td style="text-align: center;" colspan="10" >
												<a  class="btn btn-mini btn-primary" onclick="top.Dialog.close();">确定</a>
											</td>
										</tr>
									</table>
									
				
						</td>
						</tr>
					</table>
		<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
    <script type="text/javascript">
    $(top.hangge());
    </script>

	 
</body>
</html>