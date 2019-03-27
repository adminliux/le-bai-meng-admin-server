<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>评论审核</title>
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>课程管理<span class="c-gray en">&gt;</span> 评论审核<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <!-- 条件查询start -->
    <form id="From">
        <div class="text-c">
		<span class="select-box inline">
		<select name="status" class="select" onchange="findUser()">
			<option value="AUDITED">已审核</option>
            <option value="AUDIT">未审核</option>
		</select>
		</span>
		</span>
        &nbsp日期范围：
        <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="startTime" style="width: 10%; height: 30px" placeholder="开始时间" />
        -
        <input type="text" class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="endTime" style="width: 10%; height: 30px" placeholder="结束时间" />
        <input type="text" name="id" placeholder="id" style="width:7%">
        &nbsp
        <input type="text" name="userId" placeholder="视频Id" style="width:7%">
        &nbsp
        <input type="text" name="videoId" placeholder="视频Id" style="width:7%">
        &nbsp
        <input type="text" name="content" placeholder="内容" style="width:10%">
        </from>
        <a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
        </div>

    <!-- 条件查询end -->
    <div class="mt-20" >
        <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
            <thead>
            <tr class="text-c">
                <th>ID</th>
                <th width="120">用户ID</th>
                <th width="120">视频ID</th>
                <th width="120">点赞数量</th>
                <th width="120">评论内容</th>
                <th width="75">评论时间</th>
                <th width="75">操作</th>
            </tr>
            </thead>
            <tbody id="goodsList">
            </tbody>
        </table>
        <script type="text/html" id="f1">
            {{each data.list as good}}
            <tr>
                <td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
                <td style="text-align:center;vertical-align:middle;">{{good.userId}}</td>
                <td style="text-align:center;vertical-align:middle;">{{good.videoId}}</td>
                <td style="text-align:center;vertical-align:middle;">{{good.praiseSum}}</td>
                <td style="text-align:center;vertical-align:middle;" ><div style="width: 220px; overflow:auto;">{{good.content}}</div></td>

                <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.gmtDatetime}}</td>
                <td style="text-align:center;vertical-align:middle;">
                    {{if good.status=="AUDITED"}}
                    <img src="${path}/resources/static/h-ui/images/validform/iconpic-error.png"
                         onClick="member_stop(this,'{{good.id}}')" title="删除">
                    {{else good.status=="AUDIT"}}
                    <img src="${path}/resources/static/h-ui/images/validform/iconpic-error.png"
                         onClick="member_stop(this,'{{good.id}}')" title="删除">
                    <img src="${path}/resources/static/h-ui/images/validform/iconpic-right.png" onClick="member_yes(this,'{{good.id}}')" title="通过">
                    {{/if}}

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
        /**
         * pageNum:起始页
         * pageSize:每页显示多少条数据
         * */
        findUser();
        function findUser(pageNum){
            var fromList=$("#From").formSerialize();
            var p=$.extend({pageNum: pageNum},fromList);
            Project.ajax("/live/course/comment/page", p,null,true).ajaxOK(function(data) {
                $("#goodsList").html(template("f1",data));
                $("#page").html(template("f2",data));//作用到分页
                updateType();
            });
        }

        function updateType(){
            var type="LCOMMENT";
            Project.ajax("/record/view/already", {type:type},null,true).ajaxOK(function(data) {

            });
        }

        function member_stop(obj,id){//id为用户的id，obj没用到
            layer.confirm('确认要删除该评论吗？',function(index){
                Project.ajax("/live/course/comment/delete",{id:id},null,true).ajaxOK(function(data) {
                    layer.msg('成功!',{icon: 6,time:1000});
                    findUser();//刷新
                });
            });
        }

        function member_yes(obj,id){//id为用户的id，obj没用到
            var status ='AUDITED';
            Project.ajax("/live/course/comment/update",{id:id,status:status},null,true).ajaxOK(function(data) {
                layer.msg('成功!',{icon: 6,time:1000});
                findUser();//刷新
            });
        }

    </script>
</body>
</html>