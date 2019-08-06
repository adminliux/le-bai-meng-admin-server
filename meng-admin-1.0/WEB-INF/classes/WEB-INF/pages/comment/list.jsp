<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户主页面</title>
    <%@include file="../base/header.jsp"%>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 消息管理 <span class="c-gray en">&gt;</span> 消息列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
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
		<select name="type" class="select" onchange="findUser()">
			<option value="">全部</option>
			<option value="VIDEO">视频评论</option>
            <option value="COURSE">课程评论</option>
			<option value="PIAZZA">广场评论</option>
		</select>
		</span>
		&nbsp

		&nbsp日期范围：
		<input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="startDate" style="width: 10%; height: 30px" placeholder="开始时间" />
		-
		<input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="endDate" style="width: 10%; height: 30px" placeholder="结束时间" />
		视频/课程/广场ID<input type="text" name="relaId" placeholder="id" style="width:7%">
		&nbsp
		<input type="text" name="userId" placeholder="用户ID" style="width:7%">

		</form>
		<a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
        <a class="btn btn-success" onclick="newMes()"><i class="Hui-iconfont">&#xe665;</i> 发布评论</a>
    </div>
    <!-- 条件查询end -->
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong id="total"></strong> 条</span> </div>
    <div class="mt-20" >
        <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap;table-layout:fixed;" >
            <thead>
            <tr class="text-c">
                <th width="80">ID</th>
                <th width="75">用户ID</th>
                <th width="120">类型</th>
                <th width="220">内容</th>
                <th width="100">视频/广场ID</th>
                <th width="75">详情</th>
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
                <td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
                <td style="text-align:center;vertical-align:middle;"><u style="cursor:pointer" class="text-primary" onclick="member_show(' ','${path}/page/user/chat/room/user/show?id='+'{{good.userId}}','10001','360','400')"><font color="#4169e1">{{good.userId}}</font></u></td>
                <td style="text-align:center;vertical-align:middle;">{{if good.type=="VIDEO"}}视频{{else if good.type=="COURSE"}}课程{{else if good.type=="PIAZZA"}}广场{{else}}其他{{/if}}</td>
                <td style="text-align:center;vertical-align:middle;" ><div style="width: 220px; overflow:auto;">{{good.myStr}}</div></td>
                <td style="text-align:center;vertical-align:middle;" ><div style="width: 220px; overflow:auto;">{{good.relaId}}</div></td>
                <td style="text-align:center;vertical-align:middle;">
                    {{if good.content==NULL}}无{{else}}
                    <u style="cursor:pointer" class="text-primary" onclick="layer_show('简介','${path}/page/msg/content?id={{good.id}}','800','600')"><font color="#4169e1">查看详情</font></u>
                    {{/if}}
                </td>

                <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.createDate}}</td>

                <td style="text-align:center;vertical-align:middle;">

                    <img src='${path}/resources/static/h-ui/images/validform/iconpic-error.png' title='删除' onClick="deleComment('{{good.id}}','{{good.type}}')" />
                    <img src='${path}/resources/static/h-ui/images/validform/iconpic-warning.png' title='修改' onclick="update('{{good.id}}','{{good.type}}')" />
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
//            var fromList=$("#From").formSerialize();
//            var p=$.extend({pageNum: pageNum},fromList);
          //  alert(JSON.stringify(p))
            var sort = $("select[name=sort]").val();
            var type = $("select[name=type]").val();
            var startDate = $("input[name=startDate]").val();
            var endDate = $("input[name=endDate]").val();
            var relaId = $("input[name=relaId]").val();
            var userId = $("input[name=userId]").val();
            Project.ajax("/comment/list/all",{sort:sort,type:type,startDate:startDate,endDate:endDate,relaId:relaId,userId:userId,pageSize:20,pageNum:pageNum}).ajaxOK(function(data) {
                $("#goodList").html(template("f1",data));//作用到表格
                $("#page").html(template("f2",data));//作用到分页
                $("#total").html(data.data.total);//作用到统计total
                $("#size").html(data.data.size);//作用到统计每页显示size

                // 面调用图片悬浮放大方法
            });
        }

        function deleComment(id,type){

            Project.ajax("/comment/dele",{id:id,type:type}).ajaxOK(function(data) {
                layer.msg(data.msg,{icon: 5,time:3000});
                findUser();//刷新
            },true);
        }


        function update(id,type){
            layer_show("修改评论","${path}/page/comment/update?id="+id+"&type="+type,600,360);
        }

        function newMes() {
            layer_show("新增评论","${path}/page/comment/add",1000,660);
        }

        /**
         * 弹出用户信息悬浮框
         * */
        function member_show(title,url,id,w,h){
            layer_show(title,url,w,h);
        }


    </script>


</body>
</html>