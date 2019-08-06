<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!-- 引入tag.jsp -->
<%@include file="../public/tag.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../base/header.jsp" %>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理<span
        class="c-gray en">&gt;</span> 明星列表<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                             href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<table class="table table-border table-bordered table-bg table-hover" style="white-space: nowrap">
    <thead>
    <tr class="text-c">
        <%--<th width="25"><input type="checkbox" name="" value=""></th>--%>
        <th width="80">id</th>
        <th width="75">排名</th>
        <th width="120">昵称</th>
        <th width="120">角色</th>
        <th width="120">手机号</th>
        <th width="120">注册时间</th>
        <th width="75">操作</th>
    </tr>
    </thead>
    <tbody id="goodList">
    </tbody>
</table>
<script type="text/html" id="f1">
    {{each data.list as good}}
    <tr>
        <td style="text-align:center;vertical-align:middle;">{{good.id}}</td>
        <td style="text-align:center;vertical-align:middle;">{{good.sort}}</td>
        <td style="text-align:center;vertical-align:middle;">{{if good.user ==
            null}}无{{else}}{{good.user.nickname}}{{/if}}
        </td>
        <td style="text-align:center;vertical-align:middle;">{{if good.user == null}}无{{else if
            good.user.type=="USER"}}用户{{else if good.user.type=="TEACHER"}}老师{{/if}}
        </td>
        <td style="text-align:center;vertical-align:middle;">{{if good.user ==
            null}}无{{else}}{{good.user.phoneNumber}}{{/if}}
        </td>
        <td style="text-align:center;vertical-align:middle;">{{if good.user == null}}无{{else}}{{$timestampFormatYMDHM
            good.user.gmtDatetime}}{{/if}}
        </td>

        <td style="text-align:center;vertical-align:middle;">
            <img src="${path}/resources/static/h-ui/images/bin/up.png"
                 onClick="member_up(this,'{{good.id}}','{{good.sort}}')" title="上移">
            <img src="${path}/resources/static/h-ui/images/bin/down.png"
                 onClick="member_down(this,'{{good.id}}','{{good.sort}}')" title="下移">
            <a onClick="article_shenhe(this,'{{good.id}}')" title="删除"><font color="#5a98de">删除</font></a>
        </td>

    </tr>
    {{/each}}
</script>
<!-- 分页 -->
<div class="pagination alternate" align="center">
    <ul id="page"></ul>
</div>
<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
    <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;添加&nbsp;&nbsp;"
           onclick="member_show(' ','${path}/page/user/addstar','10001','1260','400')">
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
    findUser();

    function findUser(pageNum) {
        Project.ajax("/star/order/admin/page", null).ajaxOK(function (data) {
            $("#goodList").html(template("f1", data));//作用到表格
        });
    }

    function member_up(obj, id, sort) {
        var flag = 0;
        if (sort == 1) {
            layer.msg('该位置已是最顶部了，不能上移!', {icon: 6, time: 1000});
            return false;
        }
        Project.ajax("/star/order/move", {id: id, flag: flag}).ajaxOK(function (data) {
            layer.msg('成功!', {icon: 6, time: 1000});
            findUser();//刷新
        });
    }

    function member_down(obj, id, sort) {
        var flag = 1;
        Project.ajax("/star/order/move", {id: id, flag: flag}).ajaxOK(function (data) {
            layer.msg('成功!', {icon: 6, time: 1000});
            findUser();//刷新
        });
    }

    function article_shenhe(obj, id) {
        Project.ajax("/star/order/delete", {id: id}).ajaxOK(function (data) {
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
</script>
</body>
</html>
