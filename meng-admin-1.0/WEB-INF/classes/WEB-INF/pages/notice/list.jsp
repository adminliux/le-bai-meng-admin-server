<%@ page language="java" contentType="text/html; charset=utf-8"
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 广播管理 <span class="c-gray en">&gt;</span> 广播列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<!-- 条件查询start -->
	<div class="text-c"> <span class="select-box inline">
		<form id="From">
		<span class="select-box inline">
		<select name="type" class="select" onchange="findUser()">
			<option value="">全部</option>
			<option value="SYSTEM">后台发布</option>
			<option value="USER">用户发布</option>h.,
		</select>
		</span>
		&nbsp

		<span class="select-box inline">
		<select name="classify" class="select" onchange="findUser()" id="classifyList">

		</select>
		<script type="text/html" id="f4">
			<option value="">全部</option>
			{{each data as good}}
			<option>{{good}}</option>
			{{/each}}
		</script>
		</span>
		&nbsp
		&nbsp日期范围：
		<input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="startTime" style="width: 10%; height: 30px" placeholder="开始时间" />
		-
		<input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="endTime" style="width: 10%; height: 30px" placeholder="结束时间" />
		<input type="text" name="id" placeholder="id" style="width:7%">
		&nbsp
		<input type="text" name="publishUserId" placeholder="发布人ID" style="width:7%">
		&nbsp
		<input type="text" name="title" placeholder="标题" style="width:7%">
		</form>
		<a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
	</div>
	<!-- 条件查询end -->
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong id="total"></strong> 条</span> </div>
	<div class="mt-20" >
		<table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap;table-layout:fixed;" >
			<thead>
				<tr class="text-c">
					<th width="80">ID</th>
					<th width="150">排序</th>
					<th width="75">评论</th>
					<th width="75">发布人ID</th>
					<th width="75">发布类型</th>
					<th width="120">图片</th>
					<th width="850">视频</th>
					<th width="180">标题</th>
					<th width="75">分类</th>
					<th width="120">创建时间</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody id="goodList">
			</tbody>
		</table>
				<script type="text/html" id="f1">
		{{each data.list as good}}
			<tr>
				<td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
				<td style="text-align:center;vertical-align:middle;"><input value="{{good.sort}}" onchange="updateSort(this.value,{{good.id}})" n /></td>
				<td style="text-align:center;vertical-align:middle;">
					<u style="cursor:pointer" class="text-primary" onclick="layer_show('详情','${path}/page/notice/pinlun?id={{good.id}}','800','600')"><font color="#4169e1">查看评论</font></u>
				</td>
				<td style="text-align:center;vertical-align:middle;"><u style="cursor:pointer" class="text-primary" onclick="member_show(' ','${path}/page/user/chat/room/user/show?id='+'{{good.publishUserId}}','10001','360','400')"><font color="#4169e1">{{good.publishUserId}}</font></u></td>
				<td style="text-align:center;vertical-align:middle;">{{if good.publishUserId==null}}后台发布{{else}}用户发布{{/if}}</td>

				<%--<td style="text-align:center;vertical-align:middle;"><u style="cursor:pointer" class="text-primary" onclick="member_show(' ','${path}/page/notice/imgs?id='+'{{good.id}}','10001','360','400')"><font color="#4169e1">查看</font></u></td>--%>
				<td>{{if good.bannerImages==NULL}}无{{else if good.bannerImages!=NULL}}<a class="sit-preview" href="{{good.bannerImages}}" onMouseOver="biggerr()"><img src="{{good.bannerImages}}" data-preview-url="{{good.bannerImages}}" style="cursor:pointer;width:60px;height:60px;"/></a>{{/if}}</td>
				<td style="text-align:center;vertical-align:middle;"><u style="cursor:pointer" class="text-primary" onclick="member_show(' ','${path}/page/video/*jsp?address='+'{{good.videoSrc}}','10001','360','400')"><font color="#4169e1">{{good.videoSrc}}</font></u></td>
				<td style="text-align:center;vertical-align:middle;" >{{good.title}}</td>
				<td style="text-align:center;vertical-align:middle;" >{{good.classify}}</td>
				<td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.gmtDatetime}}</td>
				<td style="text-align:center;vertical-align:middle;">
					<a onclick="updateStatus({{good.id}})"><font color="red">待审核</font></a>
					<a href="${path}/page/notice/update?id={{good.id}}"><font color="#7fff00">修改</font></a>
					<a onclick="deleteMsg({{good.id}})"><font color="#5a98de">删除</font></a>
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

    findClassify();
    function findClassify() {
        var name="NOTICE_CLASS";
        Project.ajax("/global/config/find",{name:name},null,true).ajaxOK(function(data) {
            $("#classifyList").html(template("f4",data));//作用到表格
            findUser();
        });
    }

    function findUser(pageNum){
        var fromList=$("#From").formSerialize();
        var status="SHOW";
        var p=$.extend({pageNum: pageNum},{status: status},fromList);
		Project.ajax("/notice/qcb/admin/page",p,null,true).ajaxOK(function(data) {
			$("#goodList").html(template("f1",data));//作用到表格
			$("#page").html(template("f2",data));//作用到分页
			$("#total").html(data.data.total);//作用到统计total
			$("#size").html(data.data.size);//作用到统计每页显示size
			biggerr();//初始页
			// 面调用图片悬浮放大方法
		});
    }

    function updateSort(sort,id) {
        Project.ajax("/notice/qcb/update",{id:id,sort:sort},null,true).ajaxOK(function(data) {
            layer.msg('成功!',{icon: 6,time:1000});
            findUser();//刷新
        });
    }

    function deleteMsg(id){
        Project.ajax("/notice/qcb/delete",{id:id},null,true).ajaxOK(function(data) {
            findUser();
        },true);
    }

    function updateStatus(id){
        var status="HIDE";
        Project.ajax("/notice/qcb/update/status",{id:id,status:status},null,true).ajaxOK(function(data) {
            findUser();
        },true);
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