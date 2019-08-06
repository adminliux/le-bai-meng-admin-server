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
</head>
<body>
<nav class="breadcrumb">
     <i class="Hui-iconfont">&#xe67f;</i> 首页
     <span class="c-gray en">&gt;</span>课程管理
     <span  class="c-gray en">&gt;</span>学员列表
     <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                               href="javascript:location.replace(location.href);" title="刷新">
         <i  class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <!-- 条件查询start -->
    <form id="From">
           课程ID
           <input placeholder="课程ID" name="liveCourseId"  id="liveCourseId">
         课程名称 <input placeholder="课程名称" name="name">
         用户ID <input placeholder="用户ID" name="userId">
         用户昵称<input placeholder="用户昵称" name="nickname">
        <a class="btn btn-success" onclick="findUser()"><i class="Hui-iconfont">&#xe665;</i> 查询</a>
    </form>

</div>
<!-- 条件查询end -->
<div class="cl pd-5 bg-1 bk-gray mt-20"><span class="1">本页共有:<strong id="size"></strong> 条</span> <span
        class="r">共有数据：<strong id="total"></strong> 条</span></div>
<div class="mt-20">
    <table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
        <thead>
        <tr class="text-c">
            <%--<th width="25"><input type="checkbox" name="" value=""></th>--%>
             <th width="80">ID</th>
              <th width="80">课程ID</th>
             <th width="75">报名时间</th>
             <th width="120">用户ID</th>
             <th width="120">用户昵称</th>
             <th width="120">课程名称</th>
             <th width="120">课程类别</th>
             <th width="120">课程状态</th>
             <th width="120">课程当前价格</th>
             <th width="120">购买价格</th>
        </tr>
        </thead>
        <tbody id="goodList">
        </tbody>
    </table>
    <script type="text/html" id="f1">
        {{each data.list as good}}
        <tr>
            <td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
            <td style="text-align:center;vertical-align:middle;">   {{if good.course== null}}无{{else if good.course.id == null }} 无{{else}}{{good.course.id}}{{/if}}</td>
            <td style="text-align:center;vertical-align:middle;">{{$timestampFormatYMDHM good.gmtDatetime}}</td>
            <td style="text-align:center;vertical-align:middle;">{{good.user.id}}</td>
            <td style="text-align:center;vertical-align:middle;">{{good.user.nickname}}</td>
            <td style="text-align:center;vertical-align:middle;">   {{if good.course== null}}无{{else if good.course.name == null }} 无{{else}}{{good.course.name}}{{/if}}</td>
            <td style="text-align:center;vertical-align:middle;">   {{if good.course== null}}无{{else if good.course.classifyId == 1 }}模特
                {{else if good.course.classifyId == 2 }}瑜伽{{else if good.course.classifyId == 3 }}声乐{{else if good.course.classifyId == 4 }}模特{{else if good.course.classifyId == 5 }}其他{{/if}}</td>
            <td style="text-align:center;vertical-align:middle;">
                {{if good.course== null}}无
                {{ else if good.course.status=="TRAILER"}}
                <span class="label badge-warning radius">未开播</span>
                {{else if good.course.status=='DIRECT_SEEDING'}}
                <span class="label badge-primary radius">直播中</span>
                {{else if good.course.status=='REVIEW'}}
                <span class="label badge-success radius">已结束</span>
                {{/if}}
            </td>

            <td style="text-align:center;vertical-align:middle;">{{if good.course== null}}无{{else if good.course.name == null }} 无{{else}}{{good.course.price}}{{/if}}</td>
            <td style="text-align:center;vertical-align:middle;">{{good.buyPrice}}</td>
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
<%@include file="../base/footer.jsp" %>
<script type="text/javascript">
    var pageNum = cm.getParam("pageNum");
    //findClassify();


    function findClassify() {
        Project.ajax("/global/classify/list").ajaxOK(function (data) {
            $("#classifyList").html(template("f4", data));//作用到表格
            findUser();
        });
    }
    findUser();
    function findUser(pageNum) {
        if (pageNum == null) {
            pageNum = 1;
        }
        var liveCourseId = "${courseId}";
        if(liveCourseId !=null&&liveCourseId !=""){
            $("#liveCourseId").val(liveCourseId);
        }
        var fromList = $("#From").formSerialize();
        var p = $.extend({pageNum: pageNum}, fromList);
        Project.ajax("/live/course/enroll/admin/page", p).ajaxOK(function (data) {
            $("#goodList").html(template("f1", data));//作用到表格
            $("#page").html(template("f2", data));//作用到分页
            $("#total").html(data.data.total);//作用到统计total
            $("#size").html(data.data.size);//作用到统计每页显示size
            biggerr();//初始页
            // 面调用图片悬浮放大方法
        });
    }

    function member_stop(obj, id) {//id为用户的id，obj没用到
        var remarks = prompt("请输入失败原因:", "");
        var status = 'NOT_PASS';
        Project.ajax("/video/update", {
            id: id,
            status: status,
            remarks: remarks
        }).ajaxOK(function (data) {
            layer.msg('成功!', {icon: 6, time: 1000});
            findUser();//刷新
        });
        <%--layer.confirm('确认要把该视频加入待审核状态吗？',function(index){--%>
        <%--layer.msg('已停用!',{icon: 6,time:1000});--%>
        <%--layer_show("拉黑原因","${path}/page/video/update?id="+id+"&pageNum="+pageNum,600,360);--%>
        <%--});--%>
    }


    function member_start(obj, id) {//id为用户的id，obj没用到
        layer.confirm('确认审核通过吗？', function (index) {
            var status = 'AUDITED';//启用用户
            Project.ajax("/video/update", {id: id, status: status}).ajaxOK(function (data) {
                layer.msg('成功!', {icon: 6, time: 1000});
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
</script>

</body>
</html>