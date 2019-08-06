<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>课程小节列表查看</title>
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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 课程管理 <span
        class="c-gray en">&gt;</span> 直播小节列表 <a class="btn btn-success radius r"
                                                style="line-height:1.6em;margin-top:3px"
                                                href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <!-- 条件查询start -->
    <form id="From">
        <input type="text" name="title" placeholder="名称" style="width:10%">

        <a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
        <a class="btn btn-success" href="javascript:toAdd()">添加小节</a>
    </form>
</div>
<!-- 条件查询end -->
<div class="cl pd-5 bg-1 bk-gray mt-20"><span class="1">本页共有:<strong id="size"></strong> 条</span> <span
        class="r">共有数据：<strong id="total"></strong> 条</span></div>
<div class="mt-20">
    <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
        <thead>
        <tr class="text-c">
            <th width="80">ID</th>
            <th width="80">推流地址</th>
            <th width="80">拉流地址</th>
            <th width="80">拉流地址(RTMP)</th>
            <th width="120">开始时间</th>
            <th width="120">结束时间</th>
            <th width="120">直播名称</th>
            <th width="120">大课程ID</th>
            <th width="120">直播类别</th>
            <th width="120">直播状态</th>
            <th width="120">价格</th>
            <th width="120">预览图</th>
            <th width="120">录播地址</th>
            <th width="120">直播开始时间</th>
            <th width="120">直播结束时间</th>
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
                <a onclick="layer.msg('{{good.pushUrl}}')">查看</a>
            </td>
            <td style="text-align:center;vertical-align:middle;">
                <a onclick="layer.msg('{{good.pullUrl}}')">查看</a>
            </td>
            <td style="text-align:center;vertical-align:middle;">
                <a onclick="layer.msg('{{good.pullRtmpUrl}}')">查看</a>
            </td>
            <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.gmtDatetime}}</td>
            <td style="text-align:center;vertical-align:middle;">{{ $timestampFormatYMDHM good.uptDatetime}}</td>
            <td style="text-align:center;vertical-align:middle;">{{good.title}}</td>
            <td style="text-align:center;vertical-align:middle;">{{good.courseId}}</td>
            <td style="text-align:center;vertical-align:middle;">
                {{if good.type=="1"}}
                <span class="label badge-warning radius">普通课程</span>
                {{else if good.type=='2'}}
                <span class="label badge-primary radius">轮播课程</span>
                {{else}}
                <span class="label badge-success radius">无</span>
                {{/if}}
            </td>
            <td style="text-align:center;vertical-align:middle;">
                {{if good.status=="1"}}
                <span class="label badge-warning radius">直播中</span>
                {{else if good.status=='2'}}
                <span class="label badge-primary radius">下线</span>
                {{else if good.status=='3'}}
                <span class="label badge-success radius">结束</span>
                {{else}}
                <span class="label badge-success radius">无</span>
                {{/if}}
            </td>
            <td style="text-align:center;vertical-align:middle;">
                {{if good.price != null }}
                <span class="label badge-warning radius">{{good.price}}</span>
                {{else}}
                <span class="label badge-success radius">无</span>
                {{/if}}
            </td>
            <td>{{if good.previewImg==NULL}}无{{else if good.previewImg!=NULL}}<a class="sit-preview"
                                                                                 href="{{good.previewImg}}"
                                                                                 onMouseOver="biggerr()"><img
                    src="{{good.previewImg}}" data-preview-url="{{good.previewImg}}"
                    style="cursor:pointer;width:60px;height:60px;"/></a>{{/if}}
            </td>
            <td style="text-align:center;vertical-align:middle;">{{if good.address==NULL}}暂无录播信息{{else if
                good.address!=NULL}}<u style="cursor:pointer" class="text-primary"
                                       onclick="member_show('','${path}/page/video/detail?address='+'{{good.address}}','10001','1060','800')"><font
                        color="#4169e1">查看详情</font></u>{{/if}}
            </td>
            <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.beginTime}}</td>
            <td style="text-align:center;vertical-align:middle;">{{ $timestampFormatYMDHM good.endTime}}</td>
            <td><a onclick="member_stop('{{good.id}}')">删除</a>/<a onclick="toEDIT('{{good.id}}')">修改</a></td>
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
<script type="text/javascript">
    findClassify();

    function findClassify() {
        Project.ajax("/global/classify/list").ajaxOK(function (data) {
            $("#classifyList").html(template("f4", data));//作用到表格
            findUser();
        });
    }

    var courseId = cm.getParam("courseId");

    function findUser(pageNum) {
        var fromList = $("#From").formSerialize();
        var p = $.extend({pageNum: pageNum}, fromList);
        p.courseId = courseId;
        Project.ajax("/course/detial/pages", p).ajaxOK(function (data) {
            $("#goodList").html(template("f1", data));//作用到表格
            $("#page").html(template("f2", data));//作用到分页
            $("#total").html(data.data.total);//作用到统计total
            $("#size").html(data.data.size);//作用到统计每页显示size
            biggerr();//初始页
            // 面调用图片悬浮放大方法
        });
    }

    <%--function member_stop(obj,id){//id为用户的id，obj没用到--%>
    <%--layer.confirm('确认要把该视频加入待审核状态吗？',function(index){--%>
    <%--layer.msg('已停用!',{icon: 6,time:1000});--%>
    <%--var state ='1';//停用用户--%>
    <%--layer_show("拉黑原因","${path}/page/user/fill/state?id="+id,600,360);--%>
    <%--});--%>
    <%--}--%>

    function member_stop(id) {
        layer.confirm('确认要删除吗？', function () {
            Project.ajax("/course/detial/delete", {id: id}).ajaxOK(function (data) {
                layer.msg('成功!', {icon: 6, time: 1000});
                findUser();//刷新
            });
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


    //图片悬浮事件处理
    function biggerr() {
        jQuery(".sit-preview").smartImageTooltip({
            previewTemplate: "simple",
            imageWidth: "350px"
        });
    }

    function xuanzhe(id) {
        window.location.href = '${path}/page/recommend/add?relationId=' + id + '&type=${type}';
    }

    function toEDIT(id) {
        window.location.href = '${path}/page/live/course/small/details?id=' + id;
    }

    function toAdd(bigId) {
        bigId = bigId || courseId;
        location.href = "${path}/page/live/course/small/details?bigId=" + bigId;
    }
</script>

</body>
</html>