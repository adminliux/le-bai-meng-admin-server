<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>课程列表</title>
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
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>大学管理<span
        class="c-gray en">&gt;</span> 大学列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <!-- 条件查询start -->
    <form id="From">
        <div class="text-c">

            &nbsp大学名称
            <input type="text" name="unName" style="width:7%">
            &nbsp&nbsp ID
            <input type="text" name="id" style="width:7%">
            <a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
            <a class="btn btn-success" onclick="initSortIndex()"><i class="Hui-iconfont">&#xe665;</i> 初始化排序索引</a>
            <br/>
            </from>

        </div>
        <!-- 条件查询end -->
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="1">本页共有:<strong id="size"></strong> 条</span> <span
                class="r">共有数据：<strong id="total"></strong> 条</span></div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
                <thead>
                <tr class="text-c">
                    <th width="80">id</th>
                    <th width="75">操作</th>
                    <th width="75">排序</th>
                    <th width="120">大学名称</th>
                    <th width="120">封面图</th>
                    <th width="120">创建时间</th>
                    <th width="120">课程</th>
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
                    <td style="text-align:center;vertical-align:middle;">
                        <button type="button" class="btn btn-success"
                                onclick="member_up(this,'{{good.id}})','{{good.sort}}">上移
                        </button>
                        <button type="button" class="btn btn-success"
                                onclick="member_down(this,'{{good.id}})','{{good.sort}}')">下移
                        </button>
                    </td>
                    <td style="text-align:center;vertical-align:middle;">{{good.sort}}</td>
                    <td style="text-align:center;vertical-align:middle;">{{good.unName}}</td>
                    <td>{{if good.unLook==NULL}}无{{else if good.unLook!=NULL}}<a class="sit-preview"
                                                                                 href="{{good.unLook}}"
                                                                                 onMouseOver="biggerr()"><img
                            src="{{good.unLook}}" data-preview-url="{{good.unLook}}"
                            style="cursor:pointer;width:60px;height:60px;"/></a>{{/if}}
                    </td>
                    <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.gmtDatetime}}</td>
                    <td style="text-align:center;vertical-align:middle;">
                        <u style="cursor:pointer" class="text-primary"
                           onclick="layer_show('课程详情','${path}/page/unversity/list/course?id={{good.id}}','800','600')"><font
                                color="#4169e1">查看</font></u>
                    </td>

                    <td style="text-align:center;vertical-align:middle;">
                        <button type="button" class="btn btn-success"
                                onclick="layer_show('修改大学','${path}/page/unversity/update/un?id={{good.id}}','800','600')">
                            修改
                        </button>
                        <button type="button" class="btn btn-success" onclick="drops({{good.id}})">删除</button>
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
            <li class="active"><a onclick="findUser({{n}})">{{n}}</a></li>
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
        <script type="text/javascript" src="${path}/resources/jquery.tablednd.js"></script>
        <script type="text/javascript">
            findUser();

            function findUser(pageNum) {
                if (pageNum == null) {
                    pageNum = 1;
                }
                var fromList = $("#From").formSerialize();
                var p = $.extend({pageNum: pageNum}, fromList);
                Project.ajax("/unversity/find/unversity", p, null, true).ajaxOK(function (data) {
                    $("#goodList").html(template("f1", data));//作用到表格
                    $("#page").html(template("f2", data));//作用到分页
                    $("#total").html(data.data.total);//作用到统计total
                    $("#size").html(data.data.size);//作用到统计每页显示size
                    biggerr();//初始页
                    // 面调用图片悬浮放大方法
                    $("table").tableDnD({
                        onDragClass: 'highlight',
                        onDrop: function (table, row) {
                            alert(1)
                        },
                        onTop: function (table, row) {
                            alert(1)
                        }
                    });
                });
            }

            function drops(id) {
                if (id == null) {
                    layer.msg('请检查该记录是否存在!', {icon: 5, time: 1000});
                    return false;
                }
                if (id == 1) {
                    layer.msg('不能删除此大学!', {icon: 5, time: 1000});
                    return false;
                }
                layer.confirm('确认要删除该大学吗？', function (index) {
                    Project.ajax("/unversity/delete", {id: id}, null, true).ajaxOK(function (data) {
                        layer.msg('已删除!', {icon: 5, time: 1000});
                        findUser();//刷新
                    });
                });
            }

            function member_up(obj, id, sort) {
                var flag = 0;
                if (sort == 1) {
                    layer.msg('该位置已是最顶部了，不能上移!', {icon: 6, time: 1000});
                    return false;
                }
                Project.ajax("/unversity/move", {id: id, flag: flag}, null, true).ajaxOK(function (data) {
                    layer.msg('成功!', {icon: 6, time: 1000});
                    findUser();//刷新
                });
            }

            function member_down(obj, id, sort) {
                var flag = 1;
                Project.ajax("/unversity/move", {id: id, flag: flag}, null, true).ajaxOK(function (data) {
                    layer.msg('成功!', {icon: 6, time: 1000});
                    findUser();//刷新
                });
            }


            /**
             * 弹出用户信息悬浮框
             * */
            function member_show(title, url, id, w, h) {
                layer_show(title, url, w, h);
            }


            //图片悬浮事件处理
            function biggerr() {
                jQuery(".sit-preview").smartImageTooltip({
                    previewTemplate: "simple",
                    imageWidth: "350px"
                });
            }

            function xuanzhe(id) {
                window.location.href = '${path}/page/advertisement/add?relationId=' + id;
            }

            function initSortIndex() {
                Project.ajax("/live/sore/init/index", true).ajaxOK(function (data) {
                    layer.msg(data['msg'], {icon: 6, time: 1000});
                    findUser();//刷新
                });
            }
        </script>

</body>
</html>