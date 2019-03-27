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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 群管理 <span class="c-gray en">&gt;</span> 用户群列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<!-- 条件查询start -->
	<div class="text-c"> <span class="select-box inline">
		<form id="From">
		<span class="select-box inline">
		<select name="sort" class="select" onchange="findUser()">
			<option value="0">时间倒序</option>
			<option value="1">时间正序</option>
		</select>
		</span>
		&nbsp
		<span class="select-box inline">
		<select name="cityId" class="select" onchange="findUser()" id="cityList">

		</select>
		<script type="text/html" id="f3">
			<option value="">全部城市</option>
			{{each data as good}}
			<option value="{{good.code}}">{{good.name}}</option>
			{{/each}}
		</script>
		</span>
		&nbsp
		&nbsp
		<span class="select-box inline">
		<select name="classifyId" class="select" onchange="findUser()" id="classifyList">

		</select>
		<script type="text/html" id="f4">
			<option value="">全部分类</option>
			{{each data as good}}
			<option value="{{good.id}}">{{good.name}}</option>
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
		<input type="text" name="userId" placeholder=" 群主ID" style="width:7%">
		&nbsp
		<input type="text" name="name" placeholder="群名称" style="width:10%">

		</form>
		<a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
	</div>
	<!-- 条件查询end -->
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong id="total"></strong> 条</span> </div>
	<div class="mt-20" >
		<table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
			<thead>
				<tr class="text-c">
					<%--<th width="25"><input type="checkbox" name="" value=""></th>--%>
					<th width="80">ID</th>
					<th width="75">群主主键</th>
					<th width="120">群头像</th>
					<th width="120">群成员数量</th>
					<th width="120">群名称</th>
					<th width="120">活动场地</th>
					<th width="120">城市</th>
					<th width="120">类型</th>
					<th width="120">群简介</th>
					<th width="75">创建时间</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody id="goodList">
			</tbody>
		</table>
				<script type="text/html" id="f1">
		{{each data.list as good}}
			<tr>
				<%--<td style="text-align:center;vertical-align:middle;"><input type="checkbox" value="" name=""></td>--%>
				<td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
				<td style="text-align:center;vertical-align:middle;"><u style="cursor:pointer" class="text-primary" onclick="member_show(' ','${path}/page/user/chat/room/user/show?id='+'{{good.userId}}','10001','360','400')"><font color="#4169e1">{{good.userId}}</font></u></td>
				<td>{{if good.headPortrait==NULL}}无{{else if good.headPortrait!=NULL}}<a class="sit-preview" href="{{good.headPortrait}}" onMouseOver="biggerr()"><img src="{{good.headPortrait}}" data-preview-url="{{good.headPortrait}}" style="cursor:pointer;width:60px;height:60px;"/></a>{{/if}}</td>
				<td style="text-align:center;vertical-align:middle;">{{good.userNumber}}</td>
				<td style="text-align:center;vertical-align:middle;">{{good.name}}</td>
				<td style="text-align:center;vertical-align:middle;">{{good.exerciseYard}}</td>
				<td style="text-align:center;vertical-align:middle;">{{good.cityName}}</td>
				<td style="text-align:center;vertical-align:middle;">{{good.classifyName}}</td>
				<td style="text-align:center;vertical-align:middle;">
					{{if good.intro==NULL}}无{{else}}
					<u style="cursor:pointer" class="text-primary" onclick="layer_show('简介','${path}/page/msg/detail?detail={{good.intro}}','800','600')"><font color="#4169e1">查看简介</font></u>
					{{/if}}
				</td>
				<%--<td style="text-align:center;vertical-align:middle;">--%>
					<%--{{if good.state==0}}--%>
					<%--{{if good.idfAuditStatus=='NO_SUBMIT_AUDIT'}}<span class="label badge-warning radius">未提交审核</span>--%>
					<%--{{else if good.idfAuditStatus=='PENDING_AUDIT'}}<span class="label badge-primary radius">待审核</span>--%>
					<%--{{else if good.idfAuditStatus=='AUDIT_PASS'}}<span class="label badge-success radius">审核通过</span>--%>
					<%--{{else if good.idfAuditStatus=='NO_AUDIT_PASS'}}<span class="label radius">审核未通过</span>--%>
					<%--{{/if}}--%>
					<%--{{else if good.state==1}}--%>
					<%--<span class="label label-danger radius">已停用</span>--%>
					<%--{{/if}}--%>
				<%--</td>--%>

				<td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.gmtDatetime}}</td>

				<!-- 用户审核 -->
				<td style="text-align:center;vertical-align:middle;">
					<a href="${path}/page/user/chat/room/user/list?roomId={{good.id}}"><font color="#5a98de">成员列表</font></a>
					<%--{{if good.idfAuditStatus=='PENDING_AUDIT' && good.state==0}}<!-- 处于待审核并且state=0 -->--%>
					<%--<a onClick="article_shenhe(this,'{{good.id}}')"  title="审核"><font color="#5a98de">去审核</font></a>--%>
					<%--{{else if good.idfAuditStatus=='NO_AUDIT_PASS'}}<font color="#dcdcdc">未通过</font>--%>
					<%--{{else if good.idfAuditStatus=='AUDIT_PASS'}}<font color="#7fff00">已审和核</font>--%>
					<%--{{else if good.idfAuditStatus=='NO_SUBMIT_AUDIT'}}<font color="#ff7f50">未提交审核</font>--%>
					<%--{{else if good.idfAuditStatus!=NULL && good.state==1}}<font color="red">停用中</font>--%>
					<%--{{/if}}--%>
					&nbsp<!-- 用户停用启用 -->
					<%--<img src="${path}/resources/static/h-ui/images/validform/iconpic-error.png"--%>
						 <%--onClick="member_stop(this,'{{good.id}}')" title="拉黑">--%>
					<%--&nbsp--%>
					<%--<img src="${path}/resources/static/h-ui/images/validform/iconpic-right.png"--%>
						 <%--onClick="member_start(this,'{{good.id}}')" title="启用">--%>
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
    findCity();
	function findCity() {
        Project.ajax("/region/select/region/city/list",null,null,true).ajaxOK(function(data) {
            $("#cityList").html(template("f3",data));//作用到表格
            findClassify();
        });
    }
    function findClassify() {
        Project.ajax("/global/classify/list",null,null,true).ajaxOK(function(data) {
            $("#classifyList").html(template("f4",data));//作用到表格
            findUser();
        });
    }

    function findUser(pageNum){
        var fromList=$("#From").formSerialize();
        var p=$.extend({pageNum: pageNum},fromList);
		Project.ajax("/user/chat/room/admin/list",p,null,true).ajaxOK(function(data) {
			$("#goodList").html(template("f1",data));//作用到表格
			$("#page").html(template("f2",data));//作用到分页
			$("#total").html(data.data.total);//作用到统计total
			$("#size").html(data.data.size);//作用到统计每页显示size
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