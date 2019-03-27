<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>用户主页面</title>
    <!-- 引入css -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/lib/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/static/h-ui.admin/css/style.css"/>
    <!-- 分页样式css -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/matrix-style.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/bootstrap.min.css"/>
    <!-- 引入图片悬浮css -->
    <link rel="stylesheet" id="spi-render-css-css" href="${path}/resources/imgshow/css/render.css?ver=3.5.2"
          type="text/css" media="all"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/imgshow/css/default.include.b2676e.css" media="all"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/page/paging.css"/>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 广场管理 <span
        class="c-gray en">&gt;</span> 广场列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <!-- 条件查询start -->
    <form id="From">
        <div class="text-c">

            <input type="text" name="piazzaId" placeholder="广场Id" style="width:7%">
            &nbsp
            <input type="text" name="title" placeholder="内容" style="width:10%">
            &nbsp
            </from>
            <a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 搜索</a>
        </div>
        <!-- 条件查询end -->
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="1">本页共有:<strong id="size"></strong> 条</span> <span
                class="r">共有数据：<strong id="total"></strong> 条</span></div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-bg table-hover" >
                <thead>
                <tr class="text-c">
                    <%--<th width="25"><input type="checkbox" name="" value=""></th>--%>
                    <th width="200">广场ID</th>
                    <th width="120">广场内容</th>
                    <th width="120" >广场主图</th>
                    <th width="120">发布用户</th>
                    <th width="120">点赞数</th>
                    <th width="120">送花数</th>
                    <th width="120">发布时间</th>
                    <th width="120">操作</th>
                </tr>
                </thead>
                <tbody id="goodList">
                </tbody>
            </table>
            <script type="text/html" id="f1">
                {{each data as good}}
                <tr>
                    <td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
                    <td style="text-align:center;vertical-align:middle;">{{good.title}}</td>
                    <td style="text-align:center;vertical-align:middle;"> <button type="button" class="btn btn-success" onclick="showPic({{good.address}})">详情</button>
                    </td>
                    <td style="text-align:center;vertical-align:middle;">{{good.user.nickname}}</td>
                    <td style="text-align:center;vertical-align:middle;">{{good.praise}}</td>
                    <td style="text-align:center;vertical-align:middle;">{{good.giveSum}}</td>
                    <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.gmtDatetime}}</td>
                    <td style="text-align:center;vertical-align:middle;">
                        <button type="button" class="btn btn-success" onclick="layer_show('详情','${path}/page/piazza/update?id={{good.id}}','800','600')">修改</button>
                         <button type="button" class="btn btn-success" onclick="toTop({{good.id}})">置顶</button>
                    <button type="button" class="btn btn-success" onclick="down({{good.id}})">删除</button></td>
                    </td>
                </tr>
                {{/each}}
            </script>

        </div>

        <!-- 分页 -->
        <div class="pagination alternate" align="center">
            <ul id="page"></ul>
        </div>

        <div id="pageTool"></div>

        <%--<script type="text/html" id="f2">
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
        </script>--%>

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


        <script type="text/javascript" src="${path}/resources/page/jquery-1.11.2.js"></script>
        <script type="text/javascript" src="${path}/resources/page/query.js"></script>
        <script type="text/javascript" src="${path}/resources/page/paging.js"></script>

        <script type="text/javascript">
            findClassify();
            function findClassify() {
                var data = findUser(1);
                test(data.count, 1);
            }
            function toTop(id) {
                layer.confirm('确认要置顶吗？', function (index){
                    Project.ajax("/piazza/top",{id:id},null,true).ajaxOK(function(data) {
                        findUser();
                        layer.msg('成功!', {icon: 6, time: 1000});
                    },true);
                });
            }
            function  down(id) {
                layer.confirm('确认要删除吗？', function (index) {
                    $.ajax({
                        type: 'POST',
                           url: 'https://api.ibailemeng.com/api/json/piazza/delete',
                       // url:'http://localhost:8090/meng-api-1.0/api/json/piazza/delete',
                        data: {piazzaId:id},
                        async: true,
                        success: function (data) {
                            findUser();
                            layer.msg('成功!', {icon: 6, time: 1000});
                        }
                    });

                });
            }
            function showPic(address){
                layer_show('详情','${path}/page/piazza/showpic?address='+address,'1500','800');
            }

            function findUser(pageNow) {
                var datas = "";
                var title=$("input[name=title]").val();
                var piazzaId=$("input[name=piazzaId]").val();
                $.ajax({
                    type: 'POST',
                     url: 'https://api.ibailemeng.xyz/api/json/piazza/piazzalist',
                   //  url:'http://localhost:8090/meng-api-1.0/api/json/piazza/piazzalist',
                    data: {"pageNow": pageNow, "pageSize": 20,"piazzaId":piazzaId,"title":title},
                    async: false,
                    success: function (data) {
                        var jsonObj = JSON.parse(data);
                        datas = jsonObj;
                        console.log(jsonObj);
                        $("#goodList").html(template("f1", jsonObj));//作用到表格
                        /*$("#page").html(template("f2", jsonObj));//作用到分页*/
                        $("#total").html(jsonObj.count);//作用到统计total
                        $("#size").html(jsonObj.size);//作用到统计每页显示size
                        /*biggerr();//初始页*/
                    }
                });
                return datas;

            }
            function test(c, pageNow) {

                $('#pageTool').Paging({
                    pagesize: 20, count: c, callback: function (page, size, count) {
                        findUser(page);
                    }
                });
            }

            function updateSort(sort, id) {
                Project.ajax("/video/update", {id: id, sort: sort}, null, true).ajaxOK(function (data) {
                    layer.msg('成功!', {icon: 6, time: 1000});
                    findUser();//刷新
                });
            }

            function updatePraiseSum(praiseSum, id) {
                Project.ajax("/video/update", {id: id, praiseSum: praiseSum}, null, true).ajaxOK(function (data) {
                    layer.msg('成功!', {icon: 6, time: 1000});
                    findUser();//刷新
                });
            }

            /*
             * 用户-启用
             * obj：无效
             * id：用户id
             * **/
            function member_start(obj, id) {//id为用户的id，obj没用到
                layer.confirm('确认要启用该用户吗？', function (index) {
                    layer.msg('已启用!', {icon: 6, time: 1000});
                    var state = '0';//启用用户
                    Project.ajax("/api/user/updateState", {id: id, state: state}).ajaxOK(function (data) {
                        findUser();//刷新
                    });
                });
            }

            /**
             * 弹出用户信息悬浮框
             * */
            function member_show(title, url, id, w, h) {
                layer_show(title, url, w, h);
            }

        </script>
</body>
</html>