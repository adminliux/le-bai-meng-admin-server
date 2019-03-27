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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 活动管理 <span class="c-gray en">&gt;</span> 活动列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<!-- 条件查询start -->
	<form id="From">
	<div class="text-c">

		&nbsp开始时间：
		<input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="startDate" style="width: 10%; height: 30px" placeholder="开始时间" />
		&nbsp修改时间
		<input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="gmtDatetime" style="width: 10%; height: 30px" placeholder="结束时间" />

		<input type="text" name="id" placeholder="id" style="width:7%">
		&nbsp
		<input type="text" name="title" placeholder="标题" style="width:7%">


		</from>
		<a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
	</div>
	<!-- 条件查询end -->
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong id="total"></strong> 条</span> </div>
	<div class="mt-20" >
		<table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
			<thead>
				<tr class="text-c">
					<th width="25"></th>
					<th width="100">活动ID</th>
					<th width="120">活动标题</th>
					<th width="120">活动主图</th>
				    <th width="120">开始时间</th>
					<th width="120">结束时间</th>
					<th width="120">报名选项</th>
					<th width="120">活动详情</th>
					<th width="120">作品数</th>
					<th width="120">报名人数</th>
					<th width="120">活动状态</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody id="goodList">
			</tbody>
		</table>
				<script type="text/html" id="f1">
		{{each data.data as good}}
			<tr>
				<td style="text-align:center;vertical-align:middle;"><button type="button" class="btn btn-success" onclick="xuanzhe({{good.id}})">确认选择</button></td>
				<td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
				<td style="text-align:center;vertical-align:middle;">
					{{good.name}}
				</td>
				<td>{{if good.previewImg==NULL}}无{{else if good.previewImg!=NULL}}<a class="sit-preview" href="{{good.img_url}}" onMouseOver="biggerr()"><img src="{{good.img_url}}" data-preview-url="{{good.img_url}}" style="cursor:pointer;width:60px;height:60px;"/></a>{{/if}}</td>
				<td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.startDate}}</td>
				<td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.endDate}}</td>
				<td style="text-align:center;vertical-align:middle;">详细</td>
				<td style="text-align:center;vertical-align:middle;">活动详情</td>
				<td style="text-align:center;vertical-align:middle;">{{good.activityManSum}}</td>
				<td style="text-align:center;vertical-align:middle;">{{good.vedioSum}}</td>
				<td style="text-align:center;vertical-align:middle;">
				{{if good.status=="1"}}
					<span class="label badge-warning radius">即将开始</span>
				{{else if good.status=='2'}}
					<span class="label badge-primary radius">正在进行</span>
				{{else if good.status=='3'}}
					<span class="label badge-success radius">已结束</span>
				{{else if good.status=='3'}}
					<span class="label badge-success radius">撤销活动</span>
				{{/if}}

				</td>

				<!-- 用户审核 -->
				<td style="text-align:center;vertical-align:middle;">
					<img src="${path}/resources/static/h-ui/images/validform/iconpic-error.png"
						 onClick="member_stop(this,'{{good.id}}')" title="加入待审核">

				</td>
			</tr>
		{{/each}}
		</script>
		
	</div>

	<!-- 分页 -->
	<div class="pagination alternate" align="center">
		<ul id="page"></ul>
	</div>

<script type="text/html" id="f2">
	<!-- 分页 -->
	{{if data.prePage==0}}
	<li class="disabled"><a>上一页</a></li>
	{{else}}
	<li class="disabled"><a onclick="findUser({{data.prePage}})">上一页</a></li>
	{{/if}}
		{{each data.navigatepageNums as n}}
	<li class="active"> <a onclick="findUser({{n}})">{{n}}</a> </li>
		{{/each}}
	{{if data.nextPage==0}}
	<li class="disabled"><a>下一页</a></li>
	{{else}}
	<li class="disabled"><a onclick="findUser({{data.nextPage}})">下一页</a></li>
	{{/if}}
</script>

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
    findUser();
    function findUser(pageNum){
        var fromList=$("#From").formSerialize();
        var p=$.extend({pageNum: pageNum},fromList);

		Project.ajax("/activity/query/activity/by/keys",null,{},true).ajaxOK(function(data) {
			$("#goodList").html(template("f1",data));//作用到表格
			$("#page").html(template("f2",data));//作用到分页
			$("#total").html(data.data.total);//作用到统计total
			$("#size").html(data.data.size);//作用到统计每页显示size
			biggerr();//初始页
			// 面调用图片悬浮放大方法
		});
    }


    function member_stop(obj,id){//id为用户的id，obj没用到
        layer.confirm('确认要把该视频加入待审核状态吗？',function(index){
            var status ='AUDIT';//启用用户
            Project.ajax("/video/update",{id:id,status:status},null,true).ajaxOK(function(data) {
                    layer.msg('成功!',{icon: 6,time:1000});
                    findUser();//刷新
            });
        });
    }

	/*
	 * 用户-启用
	 * obj：无效
	 * id：用户id
	 * **/
	function member_start(obj,id){//id为用户的id，obj没用到
		layer.confirm('确认要启用该用户吗？',function(index){
			layer.msg('已启用!',{icon: 6,time:1000});
			var state ='0';//启用用户
			Project.ajax("/api/user/updateState",{id:id,state:state}).ajaxOK(function(data) {
                findUser();//刷新
			});
		});
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

    function xuanzhe(id) {
        window.location.href='${path}/page/recommend/add?relationId='+id+'&type=${type}';
    }
	</script>

</body>
</html>