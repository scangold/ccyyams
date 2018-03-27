<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>

<style type="text/css">
#dialog-add, #dialog-message, #dialog-comment {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	z-index: 99999999;
	display: none;
}

.commitopacity {
	position: absolute;
	width: 100%;
	height: 10000px;
	background: #7f7f7f;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	top: 0px;
	z-index: 99999;
}

.commitbox {
	width: 100%;
	margin: 0px auto;
	position: absolute;
	top: 120px;
	z-index: 99999;
}

.commitbox_inner {
	width: 96%;
	height: 255px;
	margin: 6px auto;
	background: #efefef;
	border-radius: 5px;
}

.commitbox_top {
	width: 100%;
	height: 253px;
	margin-bottom: 10px;
	padding-top: 10px;
	background: #FFF;
	border-radius: 5px;
	box-shadow: 1px 1px 3px #e8e8e8;
}

.commitbox_top textarea {
	width: 95%;
	height: 195px;
	display: block;
	margin: 0px auto;
	border: 0px;
}

.commitbox_cen {
	width: 95%;
	height: 40px;
	padding-top: 10px;
}

.commitbox_cen div.left {
	float: left;
	background-size: 15px;
	background-position: 0px 3px;
	padding-left: 18px;
	color: #f77500;
	font-size: 16px;
	line-height: 27px;
}

.commitbox_cen div.left img {
	width: 30px;
}

.commitbox_cen div.right {
	float: right;
	margin-top: 7px;
}

.commitbox_cen div.right span {
	cursor: pointer;
}

.commitbox_cen div.right span.save {
	border: solid 1px #c7c7c7;
	background: #6FB3E0;
	border-radius: 3px;
	color: #FFF;
	padding: 5px 10px;
}

.commitbox_cen div.right span.quxiao {
	border: solid 1px #f77400;
	background: #f77400;
	border-radius: 3px;
	color: #FFF;
	padding: 4px 9px;
}
</style>

</head>
<body>

	<div class="main-container" id="main-container">
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
					
					
					
						<!-- /接收第1步   成果详情检查-->
						<div class="col-xs-12">
							<div class="span12">
								<div class="widget-box">
									<div
										class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
										<h4 class="lighter">第1步：成果详情检查</h4>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<div class="step-content row-fluid position-relative">
												<div id="zhongxin">
													<textarea name="CONTENT" id="CONTENT" style="display:none"></textarea>
													<input type="hidden" name="TYPE" id="TYPE" value="1" /> <input
														type="hidden" name="isAll" id="isAll" value="no" />
													<table style="width:100%;" id="xtable">

														<tr>
															<td><input type="text" name="TITLE" id="TITLE"
																value="" placeholder="请选输入检查文件信息" style="width:95%" /></td>
														</tr>

														<tr>
															<td style="text-align: center;padding-top: 5px;"><a
																class="btn btn-mini btn-primary" onclick="sendEm();">第二步完成</a>
																<label style="float:left;padding-left: 32px;"><input
																	name="form-field-radio" id="form-field-radio1"
																	onclick="setType('1');" checked="checked" type="radio"
																	value="icon-edit" class="ace"><span class="lbl">纯文本</span></label>
																<label style="float:left;padding-left: 5px;"><input
																	name="form-field-radio" id="form-field-radio2"
																	onclick="setType('2');" type="radio" value="icon-edit"
																	class="ace" /><span class="lbl">带标签</span></label> <label
																style="float:left;padding-left: 15px;"><input
																	name="form-field-checkbox" type="checkbox"
																	id="allusers" onclick="isAll();" class="ace" /><span
																	class="lbl">全体用户</span></label></td>
														</tr>
													</table>
												</div>
												<div id="zhongxin1" class="center" style="display:none">
													<br />
													<img src="static/images/jzx.gif" id='msg' /><br />
													<h4 class="lighter block green" id='msg'>正在发送...</h4>
													<strong id="second_shows" class="red">6秒</strong>后关闭
												</div>
											</div>
										</div>
										<!--/widget-main-->
									</div>
									<!--/widget-body-->
								</div>
							</div>
						</div>
						<!-- /接收第1步 -->



						<!-- /接收第2步 -->
						<div class="col-xs-12">
							<div class="span12">
								<div class="widget-box">
									<div
										class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
										<h4 class="lighter">第2步：存储介质注册</h4>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<div class="step-content row-fluid position-relative">
												<div id="zhongxin">
													<textarea name="CONTENT" id="CONTENT" style="display:none"></textarea>
													<input type="hidden" name="TYPE" id="TYPE" value="1" /> <input
														type="hidden" name="isAll" id="isAll" value="no" />
													<table style="width:100%;" id="xtable">

														<tr>
															<td><input type="text" name="TITLE" id="TITLE"
																value="" placeholder="请选择已注册存储介质（即存储硬盘、光盘或成果案卷盒等存储介质） 否则注册新介质" style="width:95%" /></td>
														</tr>

														<tr>
															<td style="text-align: center;padding-top: 5px;"><a
																class="btn btn-mini btn-primary" onclick="sendEm();">第二步完成</a>
																<label style="float:left;padding-left: 32px;"><input
																	name="form-field-radio" id="form-field-radio1"
																	onclick="setType('1');" checked="checked" type="radio"
																	value="icon-edit" class="ace"><span class="lbl">纯文本</span></label>
																<label style="float:left;padding-left: 5px;"><input
																	name="form-field-radio" id="form-field-radio2"
																	onclick="setType('2');" type="radio" value="icon-edit"
																	class="ace" /><span class="lbl">带标签</span></label> <label
																style="float:left;padding-left: 15px;"><input
																	name="form-field-checkbox" type="checkbox"
																	id="allusers" onclick="isAll();" class="ace" /><span
																	class="lbl">全体用户</span></label></td>
														</tr>
													</table>
												</div>
												<div id="zhongxin2" class="center" style="display:none">
													<br />
													<img src="static/images/jzx.gif" id='msg' /><br />
													<h4 class="lighter block green" id='msg'>正在发送...</h4>
													<strong id="second_shows" class="red">6秒</strong>后关闭
												</div>
											</div>
										</div>
										<!--/widget-main-->
									</div>
									<!--/widget-body-->
								</div>
							</div>
						</div>
						<!-- /接收第2步 -->



						<!-- /接收第3步 -->
						<div class="col-xs-12">
							<div class="span12">
								<div class="widget-box">
									<div
										class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
										<h4 class="lighter">第3步：成果接收</h4>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<div class="step-content row-fluid position-relative">
												<div id="zhongxin">
													<textarea name="CONTENT" id="CONTENT" style="display:none"></textarea>
													<input type="hidden" name="TYPE" id="TYPE" value="1" /> <input
														type="hidden" name="isAll" id="isAll" value="no" />
													<table style="width:100%;" id="xtable">

														<tr>
															<td><input type="text" name="TITLE" id="TITLE"
																value="" placeholder="即将成果文件存储到已注册存储介质" style="width:95%" /></td>
														</tr>

														<tr>
															<td style="text-align: center;padding-top: 5px;"><a
																class="btn btn-mini btn-primary" onclick="sendEm();">第二步完成</a>
																<label style="float:left;padding-left: 32px;"><input
																	name="form-field-radio" id="form-field-radio1"
																	onclick="setType('1');" checked="checked" type="radio"
																	value="icon-edit" class="ace"><span class="lbl">纯文本</span></label>
																<label style="float:left;padding-left: 5px;"><input
																	name="form-field-radio" id="form-field-radio2"
																	onclick="setType('2');" type="radio" value="icon-edit"
																	class="ace" /><span class="lbl">带标签</span></label> <label
																style="float:left;padding-left: 15px;"><input
																	name="form-field-checkbox" type="checkbox"
																	id="allusers" onclick="isAll();" class="ace" /><span
																	class="lbl">全体用户</span></label></td>
														</tr>
													</table>
												</div>
												<div id="zhongxin2" class="center" style="display:none">
													<br />
													<img src="static/images/jzx.gif" id='msg' /><br />
													<h4 class="lighter block green" id='msg'>正在发送...</h4>
													<strong id="second_shows" class="red">6秒</strong>后关闭
												</div>
											</div>
										</div>
										<!--/widget-main-->
									</div>
									<!--/widget-body-->
								</div>
							</div>
						</div>
						<!-- /接收第3步 -->

						<!-- /接收第4步 -->
						<div class="col-xs-12">
							<div class="span12">
								<div class="widget-box">
									<div
										class="widget-header widget-header-blue widget-header-flat wi1dget-header-large">
										<h4 class="lighter">第4步：测绘产品入库交付记录 成果接收登记</h4>
									</div>
									<div class="widget-body">
										<div class="widget-main">
											<div class="step-content row-fluid position-relative">
												<div id="zhongxin">
													<textarea name="CONTENT" id="CONTENT" style="display:none"></textarea>
													<input type="hidden" name="TYPE" id="TYPE" value="1" /> <input
														type="hidden" name="isAll" id="isAll" value="no" />
													<table style="width:100%;"  id="xtable">
														
														<tr>
															<td>1序号（接收序号）</td>
															<td>2接收时间（年月日据按钮点击时间自动写入）</td>
															<td>3测区名称（项目名称）</td>
															<td>4资料名称（总文件夹名称）</td>

														</tr>
														<tr>
															<td><input  type="text" name="INPUT1"
																value="" placeholder="1序号（单击完成自动输入接收序号）" style="width:98%" /></td>
															<td><input type="text" name="INPUT2"
																value="" placeholder="2接收时间（单击完成自动输入）" style="width:98%" /></td>
															<td><input type="text" name="INPUT3"
																value="" placeholder="3测区名称（需单独建表 下拉选择+手动输入）" style="width:98%" /></td>
															<td><input type="text" name="INPUT4"
																value="" placeholder="4资料名称（单击完成自动输入总文件夹名称）" style="width:98%" /></td>
														</tr>													
														<tr>
															<td>11移交单位部门  可提供下拉框+手动输入</td>
															<td>12移交人 可提供下拉框+手动输入</td>
															<td>13接收单位部门  提供下拉框+手动输入</td>
															<td>14接收人 自动输入系统用户名称）</td>
														</tr>
														<tr>
															<td><input  type="text" name="INPUT11"
																value="" placeholder="11移交单位部门  可提供下拉框+手动输入" style="width:98%" /></td>
															<td><input type="text" name="INPUT12"
																value="" placeholder="12移交人 可提供下拉框+手动输入" style="width:98%" /></td>
															<td><input type="text" name="INPUT13"
																value="" placeholder="13接收单位部门  提供下拉框+手动输入" style="width:98%" /></td>
															<td><input type="text" name="INPUT14"
																value="" placeholder="14接收人 自动输入系统用户名称" style="width:98%" /></td>
														</tr>												
														<tr>
															<td>21成果类型 下拉框（电子、模拟）</td>
															<td>22成果统计单位 下拉框（T/G/M/K/B/个/张/件/盒）</td>
															<td>23成果文件大小 int</td>
															<td>24成果文件数量 int</td>
														</tr>	
														<tr>
															<td><input  type="text" name="INPUT21"
																value="" placeholder="21成果类型（电子、模拟） 下拉框" style="width:98%" /></td>
															<td><input type="text" name="INPUT22"
																value="" placeholder="22成果统计单位 下拉框（T/G/M/K/B/个/张/件/盒）" style="width:98%" /></td>
															<td><input type="text" name="INPUT23"
																value="" placeholder="23成果文件大小 int" style="width:98%" /></td>
															<td><input type="text" name="INPUT24"
																value="" placeholder="24成果文件数量 int" style="width:98%" /></td>
														</tr>										
														<tr>
															<td>31接收成果详细清单（转录到成果文件表中）</td>
															<td>32（清单转录到成果文件表、状态转录到成果项目表）</td>
														</tr>
														<tr>
															<td style="text-align: center;padding-top: 5px;"><a
																class="btn btn-mini btn-primary" onclick="receivefirst();">第一步完成</a>
																</td>
														</tr>
													</table>
												</div>
												<div id="zhongxin1" class="center" style="display:none">
													<br />
													<img src="static/images/jzx.gif" id='msg' /><br />
													<h4 class="lighter block green" id='msg'>正在保存接收信息...</h4>
													<strong id="second_shows" class="red">5秒</strong>后关闭
												</div>
											</div>
										</div>
										<!--/widget-main-->
									</div>
									<!--/widget-body-->
								</div>
							</div>
						</div>
						<!-- /接收第4步 -->



					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 编辑框-->
	<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>
		/plugins/ueditor/";
	</script>
	<script type="text/javascript" charset="utf-8"
		src="plugins/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="plugins/ueditor/ueditor.all.js"></script>
	<!-- 编辑框-->

	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/toolEmail.js"></script>
	<script type="text/javascript">
		$(top.hangge());
	</script>
</body>
</html>