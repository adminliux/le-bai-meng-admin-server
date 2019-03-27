﻿<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- 引入tag.jsp -->
	<%@include file="../public/tag.jsp"%>
	<!DOCTYPE html>
<html lang="en">
<head>
	<title>用户主页面</title>
<!-- 引入css -->
<link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/style.css" />
	<!-- 分页样式css -->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/matrix-style.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/css/bootstrap.min.css" />
<!-- 引入图片悬浮css -->
<link rel="stylesheet" id="spi-render-css-css" href="${path}/resources/imgshow/css/render.css?ver=3.5.2" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="${path}/resources/imgshow/css/default.include.b2676e.css" media="all" />
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程管理 <span class="c-gray en">&gt;</span>  获取在线人数统计结果 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<!-- 条件查询start -->
	<div class="text-c"> <span class="select-box inline">

		<form id="From">

		<span class="select-box inline">时间间隔
		<select name="type" class="select" onchange="findUser()">
			<option value="">1分钟</option>
			<option value="1">5分钟</option>
			<option value="2">10分钟</option>
		</select>
		</span>
		&nbsp日期范围：
		<input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="stDate" style="width: 30%; height: 30px" placeholder="开始时间" />
		-
		<input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" name="edDate" style="width: 30%; height: 30px" placeholder="结束时间" />
		&nbsp
		<input type="text" name="roomId" placeholder="房间ID" style="width:7%">
		<a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
		</form>
		<br>
		<font color="red">时间相同返回当天数据,时间间隔大于7天,则返回从开始天数开始连续7天的数据</font>
	</div>
	<!-- 条件查询end -->
	<div class="mt-20" >
		<table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
			<thead>
				<tr class="text-c">
					<%--<th width="25"><input type="checkbox" name="" value=""></th>--%>
					<th width="80">人数列表</th>
				</tr>
			</thead>
			<tbody id="goodList">
			</tbody>
		</table>
				<script type="text/html" id="f1">
		{{each data as good}}
			<tr>
				<%--<td style="text-align:center;vertical-align:middle;"><input type="checkbox" value="" name=""></td>--%>
				<td style="text-align:center;vertical-align:middle;">{{good}}</td>
			</tr>
		{{/each}}
		</script>
		
	</div>

<script type="text/javascript" src="${path}/resources/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${path}/resources/lib/layer/2.1/layer.js"></script> 
<script type="text/javascript" src="${path}/resources/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="${path}/resources/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${path}/resources/static/h-ui/js/H-ui.js"></script> 
<script type="text/javascript" src="${path}/resources/static/h-ui.admin/js/H-ui.admin.js"></script>


<script src="${path}/resources/js/jquery.js"></script>
<script src="${path}/resources/js/template.js"></script>
<script src="${path}/resources/js/common.js"></script>
<script src="${path}/resources/js/promise.min.js"></script>
<script src="${path}/resources/js/project.js"></script>
<script src="${path}/resources/js/jquery.common.js"></script>
<!-- 图片悬浮js -->
<script type="text/javascript" src="${path}/resources/imgshow/js/async-share.js?ver=3.5.2"></script>
<script type="text/javascript" src="${path}/resources/imgshow/js/default.include-footer.304291.js"></script>
<!-- 日期控件 -->
<script type="text/javascript" src="${path}/resources/datePicker/WdatePicker.js"></script>
<script type="text/javascript">
    function findUser(){
        var fromList=$("#From").formSerialize();
		Project.ajax("/gotye/get/play/user/stati",fromList,null,true).ajaxOK(function(data) {
			$("#goodList").html(template("f1",data));//作用到表格
			biggerr();//初始页
			// 面调用图片悬浮放大方法
		});
    }

	/*
	* 审核用户
	* obj：无效
	* id:用户id
	* */
	function article_shenhe(obj,id){//id为用户的id，obj没用到
        layer_show("修改密码","${path}/page/user/no/through?id="+id,600,360);
	}

	/**
	 * 弹出用户信息悬浮框
	 * */
    function member_show(title,url,id,w,h){
        layer_show(title,url,w,h);
    }


	//图片悬浮事件处理
	function biggerr() {
		jQuery(".sit-preview").smartImageTooltip({
			previewTemplate : "simple",
			imageWidth : "350px"
		});
	}
	</script>

</body>
</html>