<%@page import="com.fh.entity.system.User"%>
<%@page import="com.fh.util.PageData"%>
<%@page import="java.util.List"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	PageData pd = (PageData) request.getAttribute("pd");
	List<PageData> ls = (List<PageData>) pd.get("applyFiles");
	PageData pdas=(PageData)pd.get("apply");
	Boolean b = true;
	Boolean repply = false;
	List<PageData> las = (List<PageData>) pd.get("applyStutes");
	if (las.size() > 0) {
		PageData p = las.get(las.size() - 1);
		if (p.get("stute").equals(1) || p.get("stute").equals(0)||p.get("stute").equals(3)) {

			b = false;
		}
		if(p.get("stute").equals(2) ){
			if(((User)request.getSession().getAttribute("sessionUser")).getUSER_ID().equals(p.get("user_id2"))){
				b = true;
				
			}else{
				b = false;
			}
			
		}
    	if(p.get("stute").equals(1)&&pdas.get("returnTime")!=null){    		
    		
			repply = true;
		}
		

	}

	JSONArray jsonArray = JSONArray.fromObject(ls);
	String str = jsonArray.toString();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<style type="text/css">
.row {
	padding-top: 10px;
}
</style>

<!-- jsp文件头和头部 -->
<%@ include file="../index/topcss.jsp"%>

<script src="static/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="static/ace/css/sweetalert2.min.css">
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container " id="main-container" style="font-family: microsoft yahei;">
		<div class="container">
			<div class="text-center" style="padding:20px 0 25px 0;font-size:20px;">申请详情记录表</div>
			<div class="row">
				<div class="col-xs-6 col-sm-6" id="apply-frame" style="margin-top:15px;">
					<div>
						<span>申请编号：</span>${pd.apply.applyId }</div>
				</div>
				<div class="col-xs-6 col-sm-6" id="apply-frame">
					<div>
						<span>申请人：</span><span style="font-size: 16px; color: #438eb9;margin:0px 10px;">${pd.apply.name }</span>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-12 col-sm-12" id="apply-framegrey">
					<span>申请原因：</span> <span style="font-size: 16px; color: #438eb9;margin:0px 10px;">${pd.apply.applyWhy }</span>
				</div>
			</div>

			<div class="row">
				<div class="col-xs-6 col-sm-6" id="apply-frame">
					<span>申请时间：</span>
					<mark>${pd.apply.applyTime }</mark>
				</div>
				
				<div class="col-xs-6 col-sm-6" id="apply-frame">
				
					<span>归还时间：</span>
					<mark>${pd.apply.returnTime }</mark>
				</div>
				<c:if test="${QX.reapply == 1 }">
		
				<c:if test="<%=repply%>">
					<div class="col-xs-6 col-sm-6" id="apply-frame">
						<button id="reapply" name="${pd.apply.applyId }" class="btn">归还</button>
					</div>
				</c:if>
				</c:if>
				
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12" id="apply-frame">
					<span>详细信息:</span> </em>
					<pre> ${pd.apply.descs }</pre>
					</em>
				</div>

			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12">
					<table id="table" data-toggle="table" data-height=100%
						data-data='<%=str%>' data-sort-name="name" data-sort-order="desc">
						<thead>
							<tr>
								<th data-field="FILE_ID" data-sortable="true">ID</th>
								<th data-field="FILE_NAME" data-sortable="true">文件名</th>
								<th data-field="VOLUME" data-sortable="true">容量大小</th>
								<th data-field="UNIT" data-sortable="true">单位</th>
								<th data-field="FILE_TYPE" data-sortable="true"
									data-formatter="datatyoeformatters">资料类型</th>
								<th data-field="DATAFORM" data-sortable="true">扩展名格式</th>
								<!-- <th data-field="PERMISSION_CLASS" data-sortable="true">密集</th> -->
							</tr>
						</thead>
					</table>

					<%-- 
						<c:forEach var="item" items="${pd.applyFiles }">
							<div class="col-xs-4 col-sm-4" id="apply-frameless">${item.FILE_NAME }</div>
							<div class="col-xs-4 col-sm-4" id="apply-frameless">${item.FILE_TYPE }</div>
							<div class="col-xs-4 col-sm-4" id="apply-frameless">${item.DATAFORM }</div>
						</c:forEach> --%>
				</div>
			</div>
		</div>
		<!-- 审批 -->
		<c:if test="${QX.isAgree == 1 }">
			<c:if test="<%=b%>">
				<div class="container">
					<div style="padding:20px 0 20px 0;font-size:20px; border-bottom: 1px solid #438eb9;">审批</div>
					<div class="row">
						<div class="col-xs-1 col-sm-1">
							<span id="apply-font">意见:</span>
						</div>
						<div class="col-xs-11 col-sm-11" id="apply-rimless">
							<textarea rows="5" cols="100%" id="apply_stute_desc"
								style="width: 100%; height: 100%; max-height: 500px; max-width: 1400px; word-wrap: break-word;"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12" id="apply-rimless">
							<button id="apply_Agree" name="${pd.apply.applyId }" class="btn">同意</button>
							<button id="apply_Disagree" name="${pd.apply.applyId }"
								class="btn">不同意</button>
							<select id="apply_Change_user" style="float: right; height: 33px">

								<c:forEach var="item" items="${listuser }">
									<option value="${item.USER_ID }">${item.NAME }</option>
								</c:forEach>
							</select> <select id="apply_roleselect" style="float: right; height: 33px">
								<c:forEach var="item" items="${roleList }">
									<option value="${item.ROLE_ID }">${item.ROLE_NAME }</option>
								</c:forEach>
							</select>
							<button id="apply_changeToOrther" name="${pd.apply.applyId}"
								class="btn" style="float: right; margin-right: 50px">提交给</button>
						</div>
					</div>
				</div>
			</c:if>
		</c:if>
		<div class="container" style="margin-bottom:80px;">
		<div class="row" style="padding:15px 0 15px 0;font-size:20px; border-top:2px solid #438eb9;margin-top:70px;">审批结果:</div>
			<div class="row" >
				<table class="col-xs-12 col-sm-12 table table-striped  table-bordered">
					<tr>
						<td class="col-xs-2 col-sm-2" id="apply-frame">审批人</td>
						<td class="col-xs-3 col-sm-3" id="apply-frame">审批结果</td>
						<td class="col-xs-3 col-sm-3" id="apply-frame">意见</td>
						<td class="col-xs-2 col-sm-2" id="apply-frame">审批时间</td>
						<td class="col-xs-2 col-sm-2" id="apply-frame">其他</td>
					</tr>
					<c:forEach var="item" items="${pd.applyStutes }" varStatus="i">
						<tr>
							<td class="col-xs-2 col-sm-2" id="apply-bigframe">${item.name }</td>
							<td class="col-xs-3 col-sm-3" id="apply-bigframe">${item.stute==0?'不同意':item.stute==1?'同意':'其他'}</td>
							<td class="col-xs-3 col-sm-3" id="apply-bigframe">${item.stute_desc }</td>
							<td class="col-xs-2 col-sm-2" id="apply-bigframe">${item.stute_time }</td>
							<td class="col-xs-2 col-sm-2" id="apply-bigframe">提交给
								${item.name2 } 审批</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>



	<!-- /.main-container -->

	<!-- basic scripts -->

	<!-- 页面底部js¨ -->
	<%@ include file="../index/footjs.jsp"%>


	<!-- 删除时确认窗口 -->
</body>
<script type="text/javascript">
	//$(top.hangge());//关闭加载状态
</script>
<script src="static/js/ccyyamsjs/apply_Desc.js"></script>
<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
<script type="text/javascript"
	src="plugins/attention/zDialog/zDialog.js">
	
</script>
<script type="text/javascript">
	function datatyoeformatters(column) {
		switch (column) {
		case "1":
			return "成果资料";
			break;
		case "2":
			return "过程资料";
			break;
		case "3":
			return "收集资料";
			break;

		case "4":
			return "待分配资料";
			break;
		case "5":
			return "档案资料";
			break;
		case "6":
			return "未定义";
			break;

		default:
			return "未定义1";
		}
		return null;
	}
</script>
</html>
