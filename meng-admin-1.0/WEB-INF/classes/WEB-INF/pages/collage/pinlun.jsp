<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>页面</title>
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 拼团列表 <span class="c-gray en">&gt;</span> 成员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="1">本页共有:<strong id="size"></strong> 条</span> <span class="r">共有数据：<strong id="total"></strong> 条</span> </div>
<div class="page-container">
    <!-- 条件查询start -->

    <!-- 条件查询end -->
    <div class="mt-20" >
        <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
            <thead>
            <tr class="text-c">
                <th width="120">成员Id</th>
                <th width="120">成员昵称</th>
                <th width="120">成员年龄</th>
                <%--<th width="120">详情</th>--%>
                <th width="75">加入时间</th>
                <th width="75">操作</th>
            </tr>
            </thead>
            <tbody id="goodsList">
            </tbody>
        </table>
        <script type="text/html" id="f1">
            {{each data.list as good}}
            {{each good.employees as employee}}
            <tr>
                <td style="text-align:center;vertical-align:middle;">{{employee.id}}</td>
                <td style="text-align:center;vertical-align:middle;">{{employee.nickname}}</td>
                <td style="text-align:center;vertical-align:middle;">{{employee.age}}</td>
                <%--<td style="text-align:center;vertical-align:middle;" ><div style="width: 220px; overflow:auto;">{{good.content}}</div></td>--%>
                <%--<td style="text-align:center;vertical-align:middle;">--%>
                <%--{{if good.content==NULL}}无{{else}}--%>
                <%--<u style="cursor:pointer" class="text-primary" onclick="layer_show('简介','${path}/page/msg/detail?detail={{good.content}}','800','600')"><font color="#4169e1">查看详情</font></u>--%>
                <%--{{/if}}--%>
                <%--</td>--%>
                <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM employee.gmtDatetime}}</td>
                <td style="text-align:center;vertical-align:middle;">
                    <img src="${path}/resources/static/h-ui/images/validform/iconpic-error.png"
                         onClick="member_stop(this,'{{employee.id}}')" title="删除">

                </td>
            </tr>
            {{/each}}
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
            var   id='${id}';
            var fromList=$("#From").formSerialize();
            var p=$.extend({pageNum: pageNum},{status: status},fromList);
            Project.ajax("/collage/query/collage/list", {id:id,pageNum:pageNum},null,true).ajaxOK(function(data) {
                $("#goodsList").html(template("f1",data));
                $("#page").html(template("f2",data));//作用到分页
                $("#total").html(data.data.total);//作用到统计total
                $("#size").html(data.data.size);//作用到统计每页显示size
            });
        }

        function member_stop(obj,userId){//id为用户的id，obj没用到
            var   id ='${id}';
            layer.confirm('确认要删除该成员吗？',function(index){
                Project.ajax("/collage/delete/employeebyid",{id:id,userId:userId},null,true).ajaxOK(function(data) {
                    layer.msg('成功!',{icon: 6,time:1000});
                    findUser();//刷新
                    window.parent.location.reload();
                });
            });
        }


    </script>
</body>
</html>